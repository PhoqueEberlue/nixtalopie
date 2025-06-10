{ pkgs, ...}: {
  plugins = {
    dap-virtual-text.enable = true;

    # Debugger interface
    dap-ui = {
      enable = true;
      
      settings = {
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

    dap = {
      enable = true;

      adapters = {
        executables = {
          lldb = { 
            command = "${pkgs.lldb}/bin/lldb-dap"; 
          }; 
          # gdb = {
          #   command = "${pkgs.gdb}/bin/gdb";
          #   args = [ "--interpreter=dap" "--eval-command" "set print pretty on" ];
          # };
        };
      };  

      configurations = rec {
        c = [
          {
            name = "LLDB Debugger";
            type = "lldb";
            request = "launch";
            program = "\${command:pickFile}";
            sourcePath = "\${workspaceFolder}";
            debuggerRoot = "\${workspaceFolder}";
            stopOnEntry = false;
            args.__raw = ''function() return vim.split(vim.fn.input("Args: "), " ") end'';
          }
        ];
        # c = [
        #   {
        #     name = "Launch";
        #     type = "gdb";
        #     request = "launch";
        #     program = "\${command:pickFile}";
        #     cwd = "\${workspaceFolder}";
        #     stopAtBeginningOfMainSubprogram = false;
        #   }
        # ];
        cpp = c;
        rust = c;
      };
    };
  }; 

  # Allow DAP UI to automatically open and close when possible
  extraConfigLua = ''
    require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
    require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
    require('dap').listeners.before.event_exited['dapui_config'] = function() require('dapui').close(); vim.cmd("NvimTreeResize 30"); end
    '';
}
