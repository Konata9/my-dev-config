-- Groups of mini.nvim plugins needed
return {
  { 'echasnovski/mini.cursorword',  version = false, config = true },
  {
    'echasnovski/mini.statusline',
    version = false,
    dependecies = {
      "nvim-tree/nvim-web-devicons"
    },
    config = true
  },
  { 'echasnovski/mini.hipatterns',  version = false, config = true },
  { 'echasnovski/mini.tabline',     version = false, config = true },
  { 'echasnovski/mini.trailspace',  version = false, config = true },
  { 'echasnovski/mini.indentscope', version = false, config = true },
  { 'echasnovski/mini.animate',     version = false, config = true },
}
