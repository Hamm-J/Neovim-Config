local setup, gitsigns = pcall(require, "gitsigns")

if not setup then
	return
end

gitsigns.setup({
	numhl = false, -- color line number with git status
})
