cat >> ~/.zshrc <<'EOF'
export PATH=/home/gui/.opencode/bin:$PATH
function opencode() {
  if [[ "$1" == "serve" ]] && [[ "$*" != *"--port"* ]]; then
    command opencode serve --port 4097 "${@:2}"
  else
    command opencode "$@"
  fi
}
EOF
