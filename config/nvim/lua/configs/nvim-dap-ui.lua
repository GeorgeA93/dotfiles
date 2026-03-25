local dapui = require "dapui"
local dap = require "dap"

dapui.setup()

-- auto open/close UI with debug sessions
dap.listeners.after.event_initialized["dapui_config"] = function()
  local ok = pcall(dapui.open)
  if not ok then
    -- re-initialize if buffers were invalidated (e.g. by :Bdelete)
    dapui.setup()
    dapui.open()
  end
end

dap.listeners.before.event_terminated["dapui_config"] = function()
  pcall(dapui.close)
end

dap.listeners.before.event_exited["dapui_config"] = function()
  pcall(dapui.close)
end
