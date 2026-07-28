local palette = require("gruber-black.palette")
local config = require("gruber-black.config")

local colors = palette.colors
local opts = config.options

local M = {}

local function bg(color)
    if opts.transparent then
        return "none"
    end
    return color
end

function M.load()
    local set_hl = vim.api.nvim_set_hl

    vim.g.colors_name = "gruber-black"

    vim.cmd.highlight("clear")
    if vim.fn.has("syntax_on") then
        vim.cmd.syntax("reset")
    end

    -----------------------
    -- Editor Highlights --
    -----------------------
    set_hl(0, "Normal", { fg = colors.fg, bg = bg(colors.bg) })
    set_hl(0, "Variable", { link = "Normal" })
    set_hl(0, "Identifier", { link = "Normal" })
    set_hl(0, "Operator", { link = "Normal" })

    set_hl(0, "Type", { fg = colors.accent3 })

    set_hl(0, "Special", { fg = colors.accent2 })
    set_hl(0, "Function", { link = "Special" })
    set_hl(0, "Constant", { link = "Special" })

    set_hl(0, "Comment", { fg = colors.light_gray, italic = opts.italic_comments })
    set_hl(0, "String", { fg = colors.string, italic = opts.italic_strings })
    set_hl(0, "Character", { link = "String" })

    ---------------------
    -- Language Syntax --
    ---------------------
    set_hl(0, "Keyword", { fg = colors.accent1, bold = opts.bold })
    set_hl(0, "Conditional", { link = "Keyword" })
    set_hl(0, "Define", { link = "Keyword" })
    set_hl(0, "Exception", { link = "Keyword" })
    set_hl(0, "Include", { link = "Keyword" })
    set_hl(0, "Label", { link = "Keyword" })
    set_hl(0, "Macro", { link = "Keyword" })
    set_hl(0, "PreProc", { link = "Keyword" })
    set_hl(0, "Repeat", { link = "Keyword" })
    set_hl(0, "Statement", { link = "Keyword" })

    -----------------
    -- Diagnostics --
    -----------------
    set_hl(0, "Error", { fg = colors.error })
    set_hl(0, "Warning", { fg = colors.warning })
    set_hl(0, "Hint", { fg = colors.hint })
    set_hl(0, "Info", { fg = colors.info })

    set_hl(0, "OkMsg", { fg = colors.accent1 })
    set_hl(0, "ModeMsg", { fg = colors.accent1 })
    set_hl(0, "MoreMsg", { fg = colors.accent2 })
    set_hl(0, "Question", { link = "Normal" })

    set_hl(0, "WarningMsg", { link = "Warning" })
    set_hl(0, "ErrorMsg", { link = "Error" })
    set_hl(0, "StderrMsg", { link = "Error" })

    set_hl(0, "DiagnosticError", { link = "Error" })
    set_hl(0, "DiagnosticSignError", { link = "Error" })
    set_hl(0, "DiagnosticWarn", { link = "Warning" })
    set_hl(0, "DiagnosticSignWarn", { link = "Warning" })
    set_hl(0, "DiagnosticHint", { link = "Hint" })
    set_hl(0, "DiagnosticSignHint", { link = "Hint" })
    set_hl(0, "DiagnosticInfo", { link = "Info" })
    set_hl(0, "DiagnosticSignInfo", { link = "Info" })

    set_hl(0, 'DiagnosticVirtualTextError', { link = "Error" })
    set_hl(0, 'DiagnosticVirtualTextWarn', { link = "Warning" })
    set_hl(0, 'DiagnosticVirtualTextHint', { link = "Hint" })
    set_hl(0, 'DiagnosticVirtualTextInfo', { link = "Info" })

    set_hl(0, "Added", { fg = colors.string })
    set_hl(0, "Changed", { fg = colors.warning })
    set_hl(0, "Removed", { fg = colors.error })

    ---------------
    -- Neovim UI --
    ---------------
    local cursor_color
    if opts.colored_cursor == true then
        cursor_color = colors.accent1
    else
        cursor_color = colors.fg
    end

    set_hl(0, "Cursor", { bg = cursor_color, fg = colors.bg })
    set_hl(0, "CursorLine", { bg = colors.dark_gray })
    set_hl(0, "CursorLineNr", { fg = colors.accent1 })
    set_hl(0, "LineNr", { fg = colors.light_gray })

    set_hl(0, "StatusLine", { bg = colors.dark_gray, fg = colors.fg })
    set_hl(0, "StatusLineNC", { link = "StatusLine" })
    set_hl(0, "StatusLineTerm", { link = "StatusLine" })
    set_hl(0, "StatusLineTermNC", { link = "StatusLine" })

    set_hl(0, "TabLine", { bg = bg(colors.bg), fg = colors.fg })
    set_hl(0, "TabLineSel", { bg = bg(colors.bg), fg = colors.accent1, bold = opts.bold })
    set_hl(0, "TabLineFill", { link = "TabLine" })

    set_hl(0, "NormalFloat", { bg = colors.dark_gray, fg = colors.fg })
    set_hl(0, "FloatBorder", { link = "NormalFloat" })
    set_hl(0, "FloatShadow", { link = "NormalFloat" })
    set_hl(0, "FloatShadowThrough", { link = "NormalFloat" })
    set_hl(0, "FloatTitle", { link = "NormalFloat" })
    set_hl(0, "Pmenu", { link = "NormalFloat" })
    set_hl(0, "PmenuSel", { bg = colors.accent1, fg = colors.bg })

    set_hl(0, "Directory", { link = "Keyword" })

    set_hl(0, "Search", { bg = colors.light_gray, fg = colors.bg })
    set_hl(0, "CurSearch", { bg = colors.accent1, fg = colors.bg })
    set_hl(0, "IncSearch", { link = "Search" })

    set_hl(0, "Visual", { bg = colors.gray })
    set_hl(0, "MatchParen", { bg = colors.light_gray })

    set_hl(0, "SignColumn", { bg = colors.bg })

    set_hl(0, "EndOfBuffer", { fg = colors.dark_gray })
    set_hl(0, "WinSeparator", { fg = colors.gray })

    set_hl(0, "Folded", { bg = colors.dark_gray, fg = colors.light_gray })
    set_hl(0, "FoldColumn", { bg = colors.bg, fg = colors.light_gray })

    set_hl(0, "NonText", { fg = colors.dark_gray })
    set_hl(0, "Whitespace", { fg = colors.dark_gray })
    set_hl(0, "ColorColumn", { bg = colors.dark_gray })

    set_hl(0, "ComplHintMore", { link = "Normal" })
    set_hl(0, "QuickFixLine", { link = "Normal" })

    ----------------
    -- Treesitter --
    ----------------
    -- Keywords --
    set_hl(0, "@constructor", { link = "Keyword" })

    set_hl(0, "@keyword", { link = "Keyword" })
    set_hl(0, "@keyword.conditional", { link = "Keyword" })
    set_hl(0, "@keyword.exception", { link = "Keyword" })
    set_hl(0, "@keyword.import", { link = "Keyword" })
    set_hl(0, "@keyword.return", { link = "Keyword" })

    set_hl(0, "@keyword.function", { link = "Function" })

    set_hl(0, "@label", { link = "Keyword" })

    -- Types --
    set_hl(0, "@type", { link = "Type" })
    set_hl(0, "@type.builtin", { link = "Type" })
    set_hl(0, "@type.definition", { link = "Type" })

    -- LSP Semantic Types --
    set_hl(0, "@lsp.type.type", { link = "Type" })
    set_hl(0, "@lsp.type.class", { link = "Type" })
    set_hl(0, "@lsp.type.struct", { link = "Type" })
    set_hl(0, "@lsp.type.enum", { link = "Type" })

    -- Functions --
    set_hl(0, "@function", { link = "Function" })
    set_hl(0, "@function.call", { link = "Function" })
    set_hl(0, "@function.method", { link = "Function" })
    set_hl(0, "@function.method.call", { link = "Function" })
    set_hl(0, "@function.builtin", { link = "Function" })

    -- Constants --
    set_hl(0, "@constant", { link = "Constant" })
    set_hl(0, "@constant.builtin", { link = "Constant" })
    set_hl(0, "@constant.macro", { link = "Constant" })

    set_hl(0, "@boolean", { link = "Constant" })

    set_hl(0, "@number", { link = "Normal" })
    set_hl(0, "@number.float", { link = "Normal" })

    -- Variables --
    set_hl(0, "@variable", { link = "Normal" })
    set_hl(0, "@variable.builtin", { link = "Normal" })
    set_hl(0, "@variable.member", { link = "Normal" })
    set_hl(0, "@variable.parameter", { link = "Normal" })
    set_hl(0, "@variable.parameter.builtin", { link = "Normal" })

    set_hl(0, "@property", { link = "Normal" })

    -- Strings --
    set_hl(0, "@character", { link = "String" })

    set_hl(0, "@string", { link = "String" })
    set_hl(0, "@string.escape", { link = "String" })
    set_hl(0, "@string.regexp", { link = "String" })
    set_hl(0, "@string.special", { link = "String" })

    -- Miscellaneous --
    set_hl(0, "@module", { link = "Special" })
    set_hl(0, "@module.builtin", { link = "Special" })
    set_hl(0, "@namespace", { link = "Special" })

    set_hl(0, "@tag", { link = "Keyword" })
    set_hl(0, "@tag.builtin", { link = "Keyword" })

    set_hl(0, "@attribute.builtin", { link = "Special" })
    set_hl(0, "@tag.attribute", { link = "Special" })

    set_hl(0, "@operator", { link = "Normal" })

    set_hl(0, "@punctuation.bracket", { link = "Normal" })
    set_hl(0, "@punctuation.delimiter", { link = "Normal" })
    set_hl(0, "@punctuation.special", { link = "Normal" })

    -- Comments --
    set_hl(0, "@comment", { link = "Comment" })
    set_hl(0, "@comment.documentation", { link = "Comment" })

    -- Markup --
    set_hl(0, "@markup", { link = "Normal" })

    set_hl(0, "@markup.heading", { link = "Keyword" })

    set_hl(0, "@markup.link", { link = "Special" })
    set_hl(0, "@markup.link.label", { fg = colors.accent1 })
    set_hl(0, "@markup.link.url", { link = "String" })
    set_hl(0, "@markup.list", { fg = colors.accent1 })

    set_hl(0, "@markup.quote", { link = "Special" })

    set_hl(0, "@markup.raw", { link = "String" })

    -- Language overrides --
    -- C
    set_hl(0, "cTypedef", { link = "Keyword" })
    set_hl(0, "cStructure", { link = "Keyword" })
    set_hl(0, "@lsp.type.property.c", { link = "Normal" })

    -- Lua
    set_hl(0, "@keyword.function.lua", { link = "Keyword" })

    -- Go
    set_hl(0, "@property.go", { link = "Special" })
end

return M
