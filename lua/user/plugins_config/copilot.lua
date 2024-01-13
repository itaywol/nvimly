local status_ok, copilot = pcall(require, "copilot")
if not status_ok then
    return
end

local status_ok, copilot_cmp = pcall(require, "copilot_cmp")
if not status_ok then
    return
end

copilot.setup(
  {
    suggestion = { enabled = false },
    panel = { enabled = false },
  }
)
copilot_cmp.setup()

