-- This will run last in the setup process.

-- === Background transparency ===
local function make_transparent()
  local groups = {
    "Normal", "NormalNC", "NormalFloat", "FloatBorder",
    "SignColumn", "LineNr", "CursorLineNr", "CursorLine",
    "VertSplit", "WinSeparator", "EndOfBuffer",
    "StatusLine", "StatusLineNC", "TabLine", "TabLineFill", "TabLineSel",
    "Pmenu", "PmenuSbar", "PmenuThumb", "PmenuSel",
    "MsgArea", "QuickFixLine", "Directory", "ColorColumn",
    "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
    "NvimTreeNormal", "NvimTreeNormalNC",
    "ToggleTermNormal", "ToggleTermBorder",
    "WhichKeyFloat", "WhichKeyBorder",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
  end
end

make_transparent() -- apply now, at startup

-- and re-apply whenever the colorscheme changes later
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = make_transparent,
})
