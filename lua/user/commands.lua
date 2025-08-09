local user_command = vim.api.nvim_create_user_command

-- NeoVilm folders.
user_command("Cfg", ":cd " .. vim.fn.stdpath("config") .. "<BAR>:e init.lua", {})
user_command("Data", ":cd " .. vim.fn.stdpath("data"), {})
user_command("Wez", ":cd ~<BAR>:e .wezterm.lua", {})
-- Computer-specific folders.
user_command("Gitdir", ":cd ~/Documents/GitHub/", {})
user_command("Cpp", ":cd ~/Documents/GitHub/cpp_projects/", {})
user_command("CppGame", ":cd ~/Documents/GitHub/cpp_projects/physics_test/<BAR>:e src/main.cpp", {})
user_command("Capstone", ":cd ~/Documents/GitHub/Capstone_Dungeon_Chef/<BAR>:e dungeon-chef/character-actors/actor_character.gd", {})
user_command("Notes", ":cd ~/Documents/Obsidian/main<BAR>:e Todo.md", {})
user_command("Typst", ":cd ~/Documents/typst<BAR>:enew", {})
