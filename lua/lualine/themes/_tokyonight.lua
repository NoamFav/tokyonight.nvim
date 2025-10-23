local M = {}

---@param style? string
function M.get(style)
  local colors, config = require("tokyonight.colors").setup({
    style = style,
  })

  local hl = {}

  hl.normal = {
    a = { bg = colors.blue, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.blue },
    c = { bg = "none", fg = colors.fg_sidebar }, -- Make the center part transparent
  }

  hl.inactive = {
    a = { bg = "none", fg = colors.blue }, -- Transparent inactive section
    b = { bg = "none", fg = colors.fg_gutter, gui = "bold" },
    c = { bg = "none", fg = colors.fg_gutter },
  }
  -- Modify for other modes if needed
  hl.insert = {
    a = { bg = colors.green, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.green },
    c = { bg = "none", fg = colors.fg_sidebar }, -- Transparent in insert mode
  }

  hl.command = {
    a = { bg = colors.yellow, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.yellow },
    c = { bg = "none", fg = colors.fg_sidebar },
  }

  hl.visual = {
    a = { bg = colors.magenta, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.magenta },
    c = { bg = "none", fg = colors.fg_sidebar },
  }

  hl.replace = {
    a = { bg = colors.red, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.red },
    c = { bg = "none", fg = colors.fg_sidebar },
  }

  hl.terminal = {
    a = { bg = colors.green1, fg = colors.black },
    b = { bg = colors.fg_gutter, fg = colors.green1 },
    c = { bg = "none", fg = colors.fg_sidebar },
  }

  if config.lualine_bold then
    for _, mode in pairs(hl) do
      mode.a.gui = "bold"
    end
  end
  return hl
end

return M
