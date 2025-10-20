{ ... }: {
  extraConfigLua = ''
    -- mini-move config
    require('mini.move').setup({
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = '<M-h>',
        down = '<M-t>',
        up = '<M-n>',
        right = '<M-s>',

        -- Move current line in Normal mode
        line_left = '<M-h>',
        line_down = '<M-t>',
        line_up = '<M-n>',
        line_right = '<M-s>',
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    })
  '';
}
