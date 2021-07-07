-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/enricofadly/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/enricofadly/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/enricofadly/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/enricofadly/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/enricofadly/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["JABS.nvim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/JABS.nvim"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/asyncrun.vim"
  },
  ["bracey.vim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/bracey.vim"
  },
  ["coc-fzf"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/coc-fzf"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/coc.nvim"
  },
  ["codi.vim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/codi.vim"
  },
  ["far.vim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/far.vim"
  },
  fzf = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["is.vim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/is.vim"
  },
  neoformat = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/neoformat"
  },
  ["nvim-reload"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/nvim-reload"
  },
  ["nvim-scrollview"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/nvim-scrollview"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/registers.nvim"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/targets.vim"
  },
  vim = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim"
  },
  ["vim-airline"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-airline"
  },
  ["vim-airline-themes"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-airline-themes"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-easyescape"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-easyescape"
  },
  ["vim-easymotion"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-easymotion"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-floaterm"
  },
  ["vim-json"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-json"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-mundo"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-mundo"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vinegar"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-vinegar"
  },
  ["vim-win"] = {
    loaded = true,
    path = "/home/enricofadly/.local/share/nvim/site/pack/packer/start/vim-win"
  }
}

time([[Defining packer_plugins]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: ".v:exception | echom "Please check your config for correctness" | echohl None')
end
