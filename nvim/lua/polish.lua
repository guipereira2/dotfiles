local reload_timer = vim.uv.new_timer()
reload_timer:start(200, 200, vim.schedule_wrap(function()
  if vim.fn.getcmdwintype() == "" then vim.cmd "silent! checktime" end
end))
