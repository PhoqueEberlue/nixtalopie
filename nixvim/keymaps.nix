{...}: {
  keymaps = [
    {
      key = ";";
      action = ":";
      options = {
        noremap = true;
        silent = false;
        desc = "command mode";
      };
    }
    {
      mode = "x";
      key = ";";
      action = "<Esc>:%s/\\%V";
      options = {
        noremap = true;
        silent = false;
        desc = "alternative to visual + command mode so it opens a strict selection instead of a line by line selection";
      };
    }
    {
      key = "x";
      action = "R";
      mode = [ "n" "v" "s" "o"];
      options = {
        noremap = true;
        desc = "Activate replace mode";
      };
    }
    {
      key = "<Tab>";
      action = "<C-PageDown>";
      options = {
        noremap = true;
        desc = "Tab next in normal mode";
      };
    }
    {
      key = "l";
      action = "n";
      options = {
        noremap = true;
        desc = "Search next occurrence in normal mode";
      };
    }
    {
      key = "L";
      action = "N";
      options = {
        noremap = true;
        desc = "Search previous occurrence in normal mode";
      };
    }
    {
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        noremap = true;
        desc = "Navigate to the left window";
      };
    }
    {
      key = "<C-t>";
      action = "<C-w>j";
      options = {
        noremap = true;
        desc = "Navigate to the bottom window";
      };
    }
    {
      key = "<C-n>";
      action = "<C-w>k";
      options = {
        noremap = true;
        desc = "Navigate to the top window";
      };
    }
    {
      key = "<C-s>";
      action = "<C-w>l";
      options = {
        noremap = true;
        desc = "Navigate to the right window";
      };
    }
    {
      key = "<C-r>";
      action = "<C-I>";
      options = {
        noremap = true;
        desc = "Jump forward in the jumplist";
      };
    }
    {
      key = "<C-c>";
      action = "<C-O>";
      options = {
        noremap = true;
        desc = "Jump backward in the jumplist";
      };
    }
    {
      key = "h";
      mode = [ "n" "v" "s" "o"];
      action = "h";
      options = {
        noremap = true;
        desc = "Move left";
      };
    }
    {
      key = "t";
      mode = [ "n" "v" "s" "o"];
      action = "j";
      options = {
        noremap = true;
        desc = "Move down";
      };
    }
    {
      key = "n";
      mode = [ "n" "v" "s" "o"];
      action = "k";
      options = {
        noremap = true;
        desc = "Move up";
      };
    }
    {
      key = "s";
      mode = [ "n" "v" "s" "o"];
      action = "l";
      options = {
        noremap = true;
        desc = "Move right";
      };
    }
    {
      key = "H";
      mode = [ "n" "v" "s" "o"];
      action = "H";
      options = {
        noremap = true;
        desc = "Go to the top of the screen";
      };
    }
    {
      key = "S";
      mode = [ "n" "v" "s" "o"];
      action = "L";
      options = {
        noremap = true;
        desc = "Go to the bottom of the screen";
      };
    }
    {
      key = "T";
      mode = [ "n" "v" "s" "o"];
      action = "G";
      options = {
        noremap = true;
        desc = "Go to the end of the file";
      };
    }
    {
      key = "N";
      mode = [ "n" "v" "s" "o"];
      action = "gg";
      options = {
        noremap = true;
        nowait = true;
        desc = "Go to the beginning of the file";
      };
    }
    {
      key = "c";
      mode = [ "n" "v" "s" "o"];
      action = "b";
      options = {
        noremap = true;
        desc = "Move to previous word";
      };
    }
    {
      key = "C";
      mode = [ "n" "v" "s" "o"];
      action = "B";
      options = {
        noremap = true;
        desc = "Move to previous WORD";
      };
    }
    {
      key = "r";
      mode = [ "n" "v" "s" "o"];
      action = "e";
      options = {
        noremap = true;
        desc = "Move to the end of the current word";
      };
    }
    {
      key = "R";
      mode = [ "n" "v" "s" "o"];
      action = "E";
      options = {
        noremap = true;
        desc = "Move to the end of the current WORD";
      };
    }
    {
      key = "m";
      mode = [ "n" "v" "s" "o"];
      action = "^";
      options = {
        noremap = true;
        desc = "Move to the beginning of the line";
      };
    }
    {
      key = "z";
      mode = [ "n" "v" "s" "o"];
      action = "$";
      options = {
        noremap = true;
        desc = "Move to the end of the line";
      };
    }
    {
      key = "f";
      mode = [ "n" "v" "s" "o"];
      action = "t";
      options = {
        noremap = true;
        desc = "Till character forward";
      };
    }
    {
      key = "F";
      mode = [ "n" "v" "s" "o"];
      action = "T";
      options = {
        noremap = true;
        desc = "Till character backward";
      };
    }
    {
      key = "w";
      mode = [ "n" "v" "s" "o"];
      action = "%";
      options = {
        noremap = true;
        desc = "Go to matching bracket";
      };
    }
    {
      key = "o";
      action = "o";
      options = {
        noremap = true;
        desc = "Insert line below";
      };
    }
    {
      key = "O";
      action = "O";
      options = {
        noremap = true;
        desc = "Insert line above";
      };
    }
    {
      key = "e";
      action = "i";
      options = {
        noremap = true;
        desc = "Enter insert mode";
      };
    }
    {
      key = "E";
      action = "I";
      options = {
        noremap = true;
        desc = "Enter insert mode at the beginning of the line";
      };
    }
    {
      key = "u";
      action = "a";
      options = {
        noremap = true;
        desc = "Enter append mode";
      };
    }
    {
      key = "U";
      action = "A";
      options = {
        noremap = true;
        desc = "Enter append mode at the end of the line";
      };
    }
    {
      key = "j";
      mode = [ "n" "v" "s" "o"];
      action = "y";
      options = {
        noremap = true;
        desc = "Yank text";
      };
    }
    {
      key = "J";
      action = "Y";
      options = {
        noremap = true;
        desc = "Yank entire line";
      };
    }
    {
      key = "k";
      action = "p";
      options = {
        noremap = true;
        desc = "Paste after";
      };
    }
    {
      key = "K";
      action = "P";
      options = {
        noremap = true;
        desc = "Paste before";
      };
    }
    {
      key = "i";
      action = "d";
      options = {
        noremap = true;
        desc = "Delete";
      };
    }
    {
      key = "I";
      action = "D";
      options = {
        noremap = true;
        desc = "Delete to end of line";
      };
    }
    {
      key = "a";
      action = "x";
      options = {
        noremap = true;
        desc = "Delete character";
      };
    }
    {
      key = "A";
      action = "X";
      options = {
        noremap = true;
        desc = "Delete character before cursor";
      };
    }
    {
      key = "p";
      action = "u";
      options = {
        noremap = true;
        desc = "Undo";
      };
    }
    {
      key = "P";
      action = "<C-r>";
      options = {
        noremap = true;
        desc = "Redo";
      };
    }
    {
      key = "y";
      action = "r";
      options = {
        noremap = true;
        desc = "Replace character";
      };
    }
    {
      key = "Y";
      action = "R";
      options = {
        noremap = true;
        desc = "Replace in replace mode";
      };
    }
    {
      key = "b";
      action = "v";
      options = {
        noremap = true;
        desc = "Visual mode";
      };
    }
    {
      key = "B";
      action = "V";
      options = {
        noremap = true;
        desc = "Visual line mode";
      };
    }
    {
      key = "q";
      action = "c";
      options = {
        noremap = true;
        desc = "Change";
      };
    }
    {
      key = "Q";
      action = "C";
      options = {
        noremap = true;
        desc = "Change to column";
      };
    }
    {
      key = "<Esc>";
      action = "<C-\\><C-n>";
      mode = [ "t" ];
      options = {
        noremap = true;
        desc = "Escape terminal mode";
      };
    }
    {
      key = ",";
      action = "\"";
      mode = [ "n" "v" "s" "o"];
      options = {
        noremap = true;
        desc = "Access registers";
      };
    }
    # Seems not to work anymore on nixos?
    # {
    #   key = "<leader>w";
    #   action = ":w !sudo -S tee % > /dev/null";
    #   options = {
    #     desc = "Saves current file as root";
    #   };
    # }
    # --------------------------- DAP-UI keymaps ---------------------------
    {
      mode = "n";
      key = "<A-a>";
      action = ":DapToggleBreakpoint<cr>";
      options = {
        silent = true;
        desc = "Toggle Breakpoint";
      };
    }
    {
      mode = "n";
      key = "<A-,>";
      action = ":DapContinue<cr>";
      options = {
        silent = true;
        desc = "Continue";
      };
    }
    {
      mode = "n";
      key = "<leader>da";
      action = "<cmd>lua require('dap').continue({ before = get_args })<cr>";
      options = {
        silent = true;
        desc = "Run with Args";
      };
    }
    {
      mode = "n";
      key = "<A-.>";
      action = ":DapStepInto<cr>";
      options = {
        silent = true;
        desc = "Step into";
      };
    }
    {
      mode = "n";
      key = "<A-e>";
      action = ":DapStepOut<cr>";
      options = {
        silent = true;
        desc = "Step Out";
      };
    }
    {
      mode = "n";
      key = "<A-p>";
      action = ":DapStepOver<cr>";
      options = {
        silent = true;
        desc = "Step Over";
      };
    }
    {
      mode = "n";
      key = "<A-y>";
      action = ":DapTerminate<cr>";
      options = {
        silent = true;
        desc = "Terminate";
      };
    }
    {
      mode = ["n" "i"];
      key = "<A-o>";
      action = ''<cmd>lua require("dapui").eval(vim.fn.input("expr: "))<CR>'';
      options = {
        silent = true;
        desc = "Eval";
      };
    }
    {
      mode = "v";
      key = "<A-o>";
      action = ''<cmd>lua require("dapui").eval()<CR>'';
      options = {
        silent = true;
        desc = "Eval";
      };
    }
    # {
    #   mode = "n";
    #   key = "<leader>dC";
    #   action = "<cmd>lua require('dap').run_to_cursor()<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Run to cursor";
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "<leader>dg";
    #   action = "<cmd>lua require('dap').goto_()<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Go to line (no execute)";
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "<leader>dj";
    #   action = "\n        <cmd>lua require('dap').down()<cr>\n      ";
    #   options = {
    #     silent = true;
    #     desc = "Down";
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "<leader>dk";
    #   action = "<cmd>lua require('dap').up()<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Up";
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "<leader>dl";
    #   action = "<cmd>lua require('dap').run_last()<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Run Last";
    #   };
    # } 
    # {
    #   mode = "n";
    #   key = "<leader>dp";
    #   action = "<cmd>lua require('dap').pause()<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Pause";
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "<leader>dr";
    #   action = ":DapToggleRepl<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Toggle REPL";
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "<leader>ds";
    #   action = "<cmd>lua require('dap').session()<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Session";
    #   };
    # } 
    # {
    #   mode = "n";
    #   key = "<leader>du";
    #   action = "<cmd>lua require('dapui').toggle()<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Dap UI";
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "<leader>dw";
    #   action = "<cmd>lua require('dap.ui.widgets').hover()<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Widgets";
    #   };
    # }
    # {
    #   mode = ["n" "v"];
    #   key = "<leader>de";
    #   action = "<cmd>lua require('dapui').eval()<cr>";
    #   options = {
    #     silent = true;
    #     desc = "Eval";
    #   };
    # }
    # {
    #   mode = "n";
    #   key = "<leader>df";
    #   action = "<CMD>lua require('dap.ext.vscode').load_launchjs()<CR><CMD>Telescope dap configurations<CR>";
    #   options = {desc = "Debug Configurations";};
    # }
  ];

  extraConfigLua = ''
    vim.keymap.set("n", "d", function()
      local col = vim.fn.col(".")
      local line = vim.api.nvim_get_current_line()
      local new_line = line:sub(1, col-1) .. tostring(math.random(0,9)) .. line:sub(col+1)
      vim.api.nvim_set_current_line(new_line)
    end)
    
    vim.keymap.set("n", "D", function()
      vim.api.nvim_put({tostring(math.random(0,9))}, "c", true, true)
    end)
    '';
}

