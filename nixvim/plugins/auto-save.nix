{...}: {
  plugins.auto-save = {
    enable = true;
    luaConfig.post = ''
      local group = vim.api.nvim_create_augroup('autosave', {})
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AutoSaveWritePost',
        group = group,
        callback = function(opts)
          if opts.data.saved_buffer ~= nil then
            local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
              vim.notify('AutoSave: saved ' .. filename .. ' at ' .. vim.fn.strftime('%H:%M:%S'), vim.log.levels.INFO)
          end
        end,
      })
    '';

    settings = {
      debounce_delay = 500;
    };
  };

  # Can't make it work... I'm supposed to use pattern instead of event but event is mandatory it seems
  # autoGroups = {
  #   autosave = {};
  # };

  # autoCmd = [
  #   {
  #     group = "autosave";
  #     event = "AutoSaveWritePost";
  #     callback = ''
  #       function(opts)
  #         if opts.data.saved_buffer ~= nil then
  #           local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
  #           vim.notify('AutoSave: saved ' .. filename .. ' at ' .. vim.fn.strftime('%H:%M:%S'), vim.log.levels.INFO)
  #         end
  #       end
  #     '';
  #     desc = "Send a notification each time autosave gets triggered";
  #   }
  # ];
}
