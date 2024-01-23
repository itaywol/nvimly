local status_ok, tmux = pcall(require, "vim-tmux-navigator")
if not status_ok then
	return
end

tmux.setup()
