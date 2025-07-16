-- ~/.config/nvim/lua/plugins/conform.lua
-- This file extends the default conform.nvim configuration provided by LazyVim

-- Define the conditional logic in a local function for reusability
local function get_astyle_or_clang_format(bufnr)
  local filename = vim.api.nvim_buf_get_name(bufnr)
  -- Return empty table immediately if buffer has no associated file
  if not filename or filename == "" then
    return {}
  end

  local target_base_dirs = {
    "/home/euripedes/projetos/espressif/",
  }

  local use_astyle = false
  for _, dir in ipairs(target_base_dirs) do
    -- vim.startswith() checks if the filename begins with the specified directory path
    -- It requires Neovim 0.8+ (which LazyVim typically uses)
    if vim.startswith(filename, dir) then
      use_astyle = true
      break -- Found a match, no need to check further
    end
  end

  if use_astyle then
    -- Optional: Add a print statement for debugging when this config is activated
    return {
      { "astyle" },
    }
  else
    return { "clang-format" } -- Requires clang-format to be installed and configured
  end
end

return {
  -- Ensure we are modifying the correct plugin
  "stevearc/conform.nvim",

  -- The 'opts' table merges with the default LazyVim options for conform.nvim
  opts = {
    -- The 'formatters_by_ft' table defines which formatters run for specific filetypes.
    -- We override the entries for 'c' and 'cpp'.
    formatters_by_ft = {
      c = get_astyle_or_clang_format,
      cpp = get_astyle_or_clang_format,
    },
    astyle = {
      args = {
        "--style=otbs",
        "--attach-namespaces",
        "--attach-classes",
        "--indent=spaces=4",
        "--convert-tabs",
        "--align-reference=name",
        "--keep-one-line-statements",
        "--pad-header",
        "--pad-oper",
        "--unpad-paren",
        "--max-continuation-indent=120",
      },
    },

    -- You might want to configure format_on_save if not done elsewhere
    -- This example setup enables formatting on save using conform.nvim,
    -- with a fallback to LSP formatting if conform fails or takes too long.
    -- format_on_save = {
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
}
