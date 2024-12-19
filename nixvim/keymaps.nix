{...} : {
  keymaps = [
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
    # Seems not to work anymore on nixos?
    # {
    #   key = "<leader>w";
    #   action = ":w !sudo -S tee % > /dev/null";
    #   options = {
    #     desc = "Saves current file as root";
    #   };
    # }
  ];
}

