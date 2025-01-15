{ pkgs, ...}: {
  plugins.dap = {
    enable = true;

    extensions = {
      dap-virtual-text.enable = true;

      dap-ui = {
        enable = true;
        # Define interface layouts
        layouts = [
          {
            elements = [
              {
                id = "scopes";
                size = 0.25;
              }
              {
                id = "breakpoints";
                size = 0.25;
              }
              {
                id = "stacks";
                size = 0.25;
              }
              # {
              #  id = "watches";
              #  size = 0.25;
              # }
            ];
            position = "left";
            size = 60;
          }
          {
            elements = [
              {
                id = "repl";
                size = 1.0;
              }
              {
                id = "console";
                size = 0.5;
              }
            ];
            position = "bottom";
            size = 15;
          }
        ];
        mappings = {
          edit = "e";
          expand = [ "<CR>" "<2-LeftMouse>" ];
          open = "o";
          remove = "d";
          repl = "r";
          toggle = "t";
        };
      };
    };

    adapters = {
      executables = { 
        lldb = { 
          command = "${pkgs.lldb}/bin/lldb-dap"; 
          args = [ "" ];
        }; 
      };
    };  

    configurations = rec {
      c = [
        {
          name = "LLDB Debugger";
          type = "lldb";
          request = "launch";
          program = "\${command:pickFile}";
          cwd = "\${workspaceFolder}";
          stopOnEntry = false;
          args = [ "" ];
        }
      ];
      cpp = c;
      rust = c;
    };
  };

  keymaps = [
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

  # Allow DAP UI to automatically open and close when possible
  extraConfigLua = ''
    require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
    require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
    require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close
  '';
}
