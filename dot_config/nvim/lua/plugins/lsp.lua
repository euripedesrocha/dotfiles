vim.api.nvim_create_user_command("LspLogClear", function()
  local lsplogpath = vim.fn.stdpath("state") .. "/lsp.log"
  local file = io.open(lsplogpath, "w")
  if file then
    file:close()
    vim.notify("LSP Log cleared.", vim.log.levels.INFO)
  else
    vim.notify("Clearing LSP Log failed.", vim.log.levels.WARN)
  end
end, { nargs = 0 })
--

local function is_espressif_project()
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":p") -- Get full path
  local home = vim.fn.expand("~")
  local espressif_path = vim.fn.fnamemodify(home .. "/projetos/espressif", ":p") -- Full path

  local result = vim.startswith(cwd, espressif_path)

  return result
end

local is_espressif = is_espressif_project()

return {
  { "mason-org/mason.nvim", version = "^1.0.0" },
  { "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          -- mason = not is_espressif,
          cmd = is_espressif and {
            "/home/euripedes/.espressif/tools/esp-clang/esp-18.1.2_20240912/esp-clang/bin/clangd",
            "--query-driver=**",
            "--enable-config",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--malloc-trim",
          } or {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          }, -- default clangd command
        },
      },
    },
  },
}
