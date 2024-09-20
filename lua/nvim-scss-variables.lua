return {
  setup = function()
    function ReplaceColorsWithVariables()
      local results = vim.fn.systemlist({
        "rg",
        "-N",
        "--trim",
        "--no-filename",
        "--no-heading",
        "^\\s?+[\\$].+: #",
        "-g",
        "*.scss"
      })

      for i, v in ipairs(results) do
        local str = vim.split(v, ': ');
        vim.api.nvim_command("%s/^\\([^\\$]\\+\\)" .. string.gsub(str[2], ';', '') .. "/\\1" .. str[1] .. "/e")
      end
    end

    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.scss",
      callback = ReplaceColorsWithVariables
    })
  end
}
