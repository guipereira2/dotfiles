local reload_timer = vim.uv.new_timer()
reload_timer:start(500, 500, vim.schedule_wrap(function()
  if vim.fn.getcmdwintype() == "" then vim.cmd "silent! checktime" end
end))
