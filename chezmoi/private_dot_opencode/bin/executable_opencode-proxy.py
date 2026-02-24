#!/home/gui/miniconda3/bin/python3
"""
Proxy async para o opencode server.
Corrige:
 1. GET /project e /project/current: troca "worktree":"/" → "worktree":"/home/gui"
 2. Requests com ?directory=/ → ?directory=/home/gui
Suporta SSE (server-sent events) via aiohttp.
"""
import asyncio
import aiohttp
from aiohttp import web
import os
import sys
import urllib.parse

BACKEND = "http://127.0.0.1:4096"
HOME_DIR = os.path.expanduser("~")  # /home/gui

SKIP_REQ_HEADERS = {"host", "transfer-encoding", "content-length"}
SKIP_RESP_HEADERS = {"transfer-encoding", "content-encoding"}

async def proxy(request: web.Request) -> web.StreamResponse:
    # Reescrever ?directory=/ → ?directory=/home/gui
    params = dict(request.query)
    if params.get("directory") == "/":
        params["directory"] = HOME_DIR
    new_qs = urllib.parse.urlencode(params)
    target_url = f"{BACKEND}{request.path}" + (f"?{new_qs}" if new_qs else "")

    req_headers = {k: v for k, v in request.headers.items()
                   if k.lower() not in SKIP_REQ_HEADERS}
    body = await request.read()

    is_project_route = request.path in ("/project", "/project/current")

    async with aiohttp.ClientSession() as session:
        try:
            resp = await session.request(
                method=request.method,
                url=target_url,
                headers=req_headers,
                data=body or None,
                allow_redirects=False,
                timeout=aiohttp.ClientTimeout(total=None),
            )
        except Exception as e:
            return web.Response(status=502, text=str(e))

        content_type = resp.headers.get("Content-Type", "")
        is_sse = "text/event-stream" in content_type
        is_json = "application/json" in content_type

        # Fix worktree em respostas JSON do projeto
        if is_json and is_project_route:
            raw = await resp.read()
            text = raw.decode("utf-8")
            text = text.replace('"worktree":"/"', f'"worktree":"{HOME_DIR}"')
            text = text.replace('"worktree": "/"', f'"worktree": "{HOME_DIR}"')
            encoded = text.encode("utf-8")
            resp_headers = {k: v for k, v in resp.headers.items()
                            if k.lower() not in SKIP_RESP_HEADERS | {"content-type", "content-length"}}
            return web.Response(
                status=resp.status,
                body=encoded,
                content_type="application/json",
                headers=resp_headers,
            )

        # SSE e tudo mais: streaming transparente
        resp_headers = {k: v for k, v in resp.headers.items()
                        if k.lower() not in SKIP_RESP_HEADERS}
        stream = web.StreamResponse(status=resp.status, headers=resp_headers)
        if is_sse:
            stream.headers["X-Accel-Buffering"] = "no"
        await stream.prepare(request)
        async for chunk in resp.content.iter_any():
            try:
                await stream.write(chunk)
            except Exception:
                break
        return stream


async def main():
    port = int(sys.argv[1]) if len(sys.argv) > 1 else 4095
    app = web.Application()
    app.router.add_route("*", "/{path_info:.*}", proxy)
    runner = web.AppRunner(app)
    await runner.setup()
    site = web.TCPSite(runner, "127.0.0.1", port)
    await site.start()
    print(f"Proxy opencode: 127.0.0.1:{port} → {BACKEND}", flush=True)
    await asyncio.Event().wait()

if __name__ == "__main__":
    asyncio.run(main())
