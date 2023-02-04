copy = "/mnt/c/windows/system32/clip.exe"
paste = "/home/n/n/c/config/nvim/wsl_paste.sh"
vim.g.clipboard = {
    name = 'wsl',
    copy =  { ["+"] = { copy }, ["*"] = { copy } },
    paste = { ["+"] = { paste }, ["*"] = { paste } },
    cache_enabled = true
}
