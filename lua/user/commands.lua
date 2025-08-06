-- NeoVim folders.
vim.api.nvim_create_user_command("Cfg", ":cd " .. vim.fn.stdpath("config") .. "<BAR>:e init.lua", {})
vim.api.nvim_create_user_command("Data", ":cd " .. vim.fn.stdpath("data"), {})
-- Computer-specific folders.
vim.api.nvim_create_user_command("Gitdir", ":cd ~/Documents/GitHub/", {})
vim.api.nvim_create_user_command("Cpp", ":cd ~/Documents/GitHub/cpp_projects/", {})
vim.api.nvim_create_user_command("CppGame", ":cd ~/Documents/GitHub/cpp_projects/physics_test/<BAR>:e src/main.cpp", {})
vim.api.nvim_create_user_command("Capstone", ":cd ~/Documents/GitHub/Capstone_Dungeon_Chef/<BAR>:e dungeon-chef/character-actors/actor_character.gd", {})
vim.api.nvim_create_user_command("Notes", ":cd ~/Documents/Obsidian/main<BAR>:e Todo.md", {})
