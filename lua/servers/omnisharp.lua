return function(capabilities)
  vim.lsp.config("omnisharp", {
    capabilities = capabilities,
    cmd = { "omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
    root_markers = { "*.sln", "*.csproj", ".git" },
    settings = {
      FormattingOptions = {
        EnableEditorConfigSupport = true,
        OrganizeImports = true,
      },
      RoslynExtensionsOptions = {
        EnableAnalyzersSupport = true,
        EnableImportCompletion = true,
      },
    },
  })
end
