{ ... }: {
  extraConfigLua = ''
    -- venn.nvim: enable or disable keymappings
    function _G.Toggle_venn()
        local venn_enabled = vim.inspect(vim.b.venn_enabled)
        if venn_enabled == "nil" then
            vim.b.venn_enabled = true
            vim.cmd[[setlocal ve=all]]
            -- draw a line on HJKL keystokes. Apparently I should disable noremap for those to work
            vim.api.nvim_buf_set_keymap(0, "n", "S", "<C-v>s:VBox<CR>", {noremap = false})
            vim.api.nvim_buf_set_keymap(0, "n", "N", "<C-v>n:VBox<CR>", {noremap = false})
            vim.api.nvim_buf_set_keymap(0, "n", "T", "<C-v>t:VBox<CR>", {noremap = false})
            vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = false})
            -- draw a box by pressing "f" with visual selection
            vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
            print("Venn enabled")
        else
            vim.cmd[[setlocal ve=none]]
            vim.api.nvim_buf_del_keymap(0, "n", "S")
            vim.api.nvim_buf_del_keymap(0, "n", "N")
            vim.api.nvim_buf_del_keymap(0, "n", "T")
            vim.api.nvim_buf_del_keymap(0, "n", "H")
            vim.api.nvim_buf_del_keymap(0, "v", "f")
            vim.b.venn_enabled = nil
            print("Venn disabled")
        end
    end
    -- toggle keymappings for venn using "b"
    vim.api.nvim_set_keymap('n', 'b', ":lua Toggle_venn()<CR>", { noremap = true})
    '';
}
