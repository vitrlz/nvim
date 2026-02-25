-- download do lazyvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim" if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "failed to clone lazy.nvim:\n", "errormsg" },
      { out, "warningmsg" },
      { "\npress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- plugins 
require("lazy").setup("plugins")
require("vim-options")

-- Função para criar a janela flutuante
local function open_floating_terminal()
  -- Define o tamanho (80% da tela)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- Cria o buffer
  local buf = vim.api.nvim_create_buf(false, true)
  
  -- Configura a janela
  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
  })

  -- Abre o terminal
  vim.cmd('terminal powershell.exe')
  vim.cmd('startinsert') -- Inicia em modo de inserção
end

-- Cria o comando e mapeamento
vim.api.nvim_create_user_command('Floaterm', open_floating_terminal, {})
vim.keymap.set('n', '<space>tt', '<CMD>Floaterm<CR>', { desc = 'Open Floating Terminal' })
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { desc = "Voltar para modo Normal" })
vim.keymap.set('t', '<C-h>', [[<C-\><C-n><C-w>q]], { desc = "Fechar terminal flutuante" })
vim.keymap.set('n', '<C-h>', '<C-w>q', { desc = "Fechar janela" })

-- Ao sair do terminal, fecha a janela automaticamente
vim.api.nvim_create_autocmd("TermClose", {
  callback = function()
    vim.api.nvim_command("bdelete!")
  end
})

