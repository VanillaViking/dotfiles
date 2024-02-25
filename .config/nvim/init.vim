let mapleader =" "

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif


execute pathogen#infect()
syntax on
filetype plugin indent on


set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

filetype plugin on
set number relativenumber

set guifont=Source\ Code\ Pro:h11

command! -narg=1 B :G checkout -b ashwin/<q-args>

let g:gitgutter_map_keys = 0

let g:markdown_fenced_languages = ['rust','c', 'json', 'html', 'bash=sh']

let g:blamer_enabled = 0
let g:blamer_delay = 500
let g:blamer_relative_time = 1

let g:neovide_transparency=0.9
let g:transparency = 0.8
let g:neovide_refresh_rate= 120
let g:neovide_scroll_animation_length = 0.15
let g:neovide_background_color = '#05112e'.printf('%x', float2nr(255 * g:transparency))
let g:neovide_cursor_trail_size = 0.01
let g:neovide_cursor_vfx_mode = ""
let g:neovide_hide_mouse_when_typing = v:true
let g:neovide_cursor_antialiasing = v:false
let g:neovide_cursor_animate_in_insert_mode = v:true
let g:neovide_cursor_animation_length = 0.1
let g:neovide_scale_factor = 1.0
let g:neovide_floating_blur_amount_x = 2.0
let g:neovide_floating_blur_amount_y = 2.0

set background=dark

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

:nnoremap <leader>eb :vsplit ~/.zshrc<cr>
:nnoremap <leader>e3 :vsplit ~/.config/i3/config<cr>
:nnoremap <leader>en :vsplit ~/notes/index.md<cr>

set conceallevel=2

set formatoptions-=cro 

nnoremap S :%s//g<Left><Left>
vnoremap S :%s//g<Left><Left>

nmap <leader>v "+p
nmap Y "+y

" nmap <C-p> :Files<CR>
" nmap <leader>p :Ag<CR>

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)
nmap gh? <Plug>(GitGutterPreviewHunk)

nmap ghn <Plug>(GitGutterNextHunk)
nmap ghp <Plug>(GitGutterPrevHunk)
command P !~/.scripts/push.sh

" copy full path of current buffer
command! CP let @+ = expand('%:p')

command Dir cd %:p:h | let @+ = getcwd()

map <leader><leader> <Esc>/<?><Enter>d3l
map <leader>/ i<?><Esc>

map <silent> e <Plug>CamelCaseMotion_iw

" latex stuf
let g:livepreview_previewer = 'zathura'
let g:livepreview_use_biber = 1
let g:livepreview_cursorhold_recompile = 0
" map <leader>8 0y$i\begin{<Esc>A}<Enter><Esc>p0i\end{<Esc>A}<Esc>kA<Enter>

map <C-f> :NERDTreeFind<CR>
command F NERDTreeToggle


let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
nmap <leader>z yy:!nohup zathura '<C-r>"' &<CR>

nmap <leader>os :ObsidianSearch<CR>

autocmd BufWritePost *.typ :!typst compile %

noremap <C-k> <C-w><C-k>
noremap <C-j> <C-w><C-j>
noremap <C-h> <C-w><C-h>
noremap <C-l> <C-w><C-l>

command H wincmd H

nnoremap <leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout = 1

" Debugger
nnoremap <leader>dt :lua require("dapui").toggle()<CR>
nnoremap <leader>dk :DapTerminate<CR>
nnoremap <leader>db :DapToggleBreakpoint<CR>
nnoremap <leader>dc :DapContinue<CR>
nnoremap <leader>dr :lua require("dapui").open({reset = true})<CR>
nnoremap <leader>di :DapStepInto<CR>
nnoremap <leader>do :DapStepOver<CR>

noremap <C-S-k> <C-w>K
noremap <C-S-j> <C-w>J
noremap <C-S-h> <C-w>H
noremap <C-S-l> <C-w>L

nnoremap <leader>j J
nnoremap <leader>k K

nnoremap J <C-d>zz
nnoremap K <C-u>zz

noremap <leader>h gT
noremap <leader>l gt

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gv :call CocAction('jumpDefinition', 'split')<CR>
nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-diagnostic-next)
nmap <silent> gp <Plug>(coc-diagnostic-prev)

" goto file in md formats
" nmap <leader>f _f(lgfs

" nmap <leader>a yiw<C-f>ma<C-r>"/<C-r>".md<CR>:q<CR>ysiw]f]a()<Esc>hpa/<Esc>pa.md<Esc>

nmap <leader>c :CocCommand<CR>

nnoremap <leader>q :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>af  <Plug>(coc-fix-current)


" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-i> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-i> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-i> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

map L $
map H _

function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

let g:word_count=wordcount().words
function WordCount()
    if has_key(wordcount(),'visual_words')
        let g:word_count=wordcount().visual_words."/".wordcount().words " count selected words
    else
        let g:word_count=wordcount().cursor_words."/".wordcount().words " or shows words 'so far'
    endif
    return g:word_count
endfunction


set statusline=%{StatuslineGit()}
set statusline+=\ %f%m
set statusline+=\ %=col:%c
set statusline+=\ wc:%{WordCount()}

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=1000

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


:lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    disable = {"markdown"},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    }

}
EOF


:lua << EOF
require('rose-pine').setup({
	--- @usage 'auto'|'main'|'moon'|'dawn'
	variant = 'auto',
	--- @usage 'main'|'moon'|'dawn'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = false,

	--- @usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		background_nc = '_experimental_nc',
		panel = 'surface',
		panel_nc = 'base',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},

	-- Change specific vim highlight groups
	-- https://github.com/rose-pine/neovim/wiki/Recipes
	highlight_groups = {
		ColorColumn = { bg = 'rose' },

		-- Blend colours against the "base" background
		CursorLine = { bg = 'foam', blend = 10 },
		StatusLine = { fg = 'love', bg = 'love', blend = 10 },
                StatusLineNC = { fg = "subtle", bg = "surface" },
                SignColumn = { bg = 'NONE' },
                TabLineFill = { bg = 'NONE' },

                TelescopeBorder = { fg = "highlight_high", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "base" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
		TelescopeSelection = { fg = "text", bg = "base" },
		TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
	}
})
EOF

:lua << EOF
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>p', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
EOF

syntax enable
colorscheme rose-pine
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
" hi StatusLine ctermbg=0F202C guibg=#0F202C
hi StatusLineNC ctermbg=NONE guibg=NONE
hi ErrorMsg ctermbg=NONE guibg=NONE
hi TabLine ctermbg=NONE guibg=NONE
hi TabLineSel ctermbg=NONE guibg=NONE
hi TabLineFill ctermbg=NONE guibg=NONE

" DEBUGGER
:lua << EOF
function mysplit (inputstr, sep)
        if sep == nil then
                sep = "%s"
        end
        local t={}
        for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
                table.insert(t, str)
        end
        return t
end

require("dapui").setup()
require("nvim-dap-virtual-text").setup()

local dap = require("dap")
dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/home/vanilla/.config/nvim/codelldb/extension/adapter/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "codelldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function()
      return mysplit(vim.fn.input('Args: '))
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

EOF

" Obsidian
:lua << EOF
require("obsidian").setup({
  -- A list of workspace names, paths, and configuration overrides.
  -- If you use the Obsidian app, the 'path' of a workspace should generally be
  -- your vault root (where the `.obsidian` folder is located).
  -- When obsidian.nvim is loaded by your plugin manager, it will automatically set
  -- the workspace to the first workspace in the list whose `path` is a parent of the
  -- current markdown file being edited.
  workspaces = {
    {
      name = "personal",
      path = "~/Documents/vault",
    },
  },

  -- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
  -- 'workspaces'. For example:
  -- dir = "~/vaults/work",

  -- Optional, if you keep notes in a specific subdirectory of your vault.

  -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
  -- levels defined by "vim.log.levels.*".
  log_level = vim.log.levels.INFO,

  daily_notes = {
    -- Optional, if you keep daily notes in a separate directory.
    folder = "notes/",
    -- Optional, if you want to change the date format for the ID of daily notes.
    date_format = "%Y-%m-%d",
    -- Optional, if you want to change the date format of the default alias of daily notes.
    alias_format = "%B %-d, %Y",
    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
    template = nil
  },

  -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
  completion = {
    -- Set to false to disable completion.
    nvim_cmp = false,
    -- Trigger completion at 2 chars.
    min_chars = 2,
  },

  -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
  -- way then set 'mappings = {}'.
  mappings = {
    -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
    ["gf"] = {
      action = function()
        return require("obsidian").util.gf_passthrough()
      end,
      opts = { noremap = false, expr = true, buffer = true },
    },
    -- Toggle check-boxes.
    ["<leader>ch"] = {
      action = function()
	vim.cmd.normal(vim.api.nvim_replace_termcodes("$F(df)", true, true, true))
        return require("obsidian").util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  },

  -- Where to put new notes. Valid options are
  --  * "current_dir" - put new notes in same directory as the current buffer.
  --  * "notes_subdir" - put new notes in the default notes subdirectory.
  new_notes_location = "notes_subdir",

  -- Optional, customize how names/IDs for new notes are created.
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will be given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return suffix
  end,

  -- Optional, customize how wiki links are formatted.
  ---@param opts {path: string, label: string, id: string|?}
  ---@return string
  wiki_link_func = function(opts)
    if opts.id == nil then
      return string.format("[[%s]]", opts.label)
    elseif opts.label ~= opts.id then
      return string.format("[[%s|%s]]", opts.id, opts.label)
    else
      return string.format("[[%s]]", opts.id)
    end
  end,

  -- Optional, customize how markdown links are formatted.
  ---@param opts {path: string, label: string, id: string|?}
  ---@return string
  markdown_link_func = function(opts)
    return string.format("[%s](%s)", opts.label, opts.path)
  end,

  -- Either 'wiki' or 'markdown'.
  preferred_link_style = "wiki",

  -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
  ---@return string
  image_name_func = function()
    -- Prefix image names with timestamp.
    return string.format("%s-", os.time())
  end,

  -- Optional, boolean or a function that takes a filename and returns a boolean.
  -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
  disable_frontmatter = false,

  -- Optional, alternatively you can customize the frontmatter data.
  ---@return table
  note_frontmatter_func = function(note)
    -- Add the title of the note as an alias.
    if note.title then
      note:add_alias(note.title)
    end

    local out = { id = note.id, aliases = note.aliases, tags = note.tags }

    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end

    return out
  end,

  -- Optional, for templates (see below).
  -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  -- URL it will be ignored but you can customize this behavior here.
  ---@param url string
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.fn.jobstart({"open", url})  -- Mac OS
    -- vim.fn.jobstart({"xdg-open", url})  -- linux
  end,

  -- Optional, set to true if you use the Obsidian Advanced URI plugin.
  -- https://github.com/Vinzent03/obsidian-advanced-uri
  use_advanced_uri = false,

  -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
  open_app_foreground = false,

  picker = {
    -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
    name = "telescope.nvim",
    -- Optional, configure key mappings for the picker. These are the defaults.
    -- Not all pickers support all mappings.
    mappings = {
      -- Create a new note from your query.
      new = "<C-x>",
      -- Insert a link to the selected note.
      insert_link = "<C-l>",
    },
  },

  -- Optional, sort search results by "path", "modified", "accessed", or "created".
  -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
  -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
  sort_by = "modified",
  sort_reversed = true,

  -- Optional, determines how certain commands open notes. The valid options are:
  -- 1. "current" (the default) - to always open in the current window
  -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
  -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
  open_notes_in = "current",

  -- Optional, configure additional syntax highlighting / extmarks.
  -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
  ui = {
    enable = true,  -- set to false to disable all additional syntax features
    update_debounce = 200,  -- update delay after a text change (in milliseconds)
    -- Define how various check-boxes are displayed
    checkboxes = {
      -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
      [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
      ["x"] = { char = "", hl_group = "ObsidianDone" },
      [">"] = { char = "", hl_group = "ObsidianRightArrow" },
      ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
      -- Replace the above with this if you don't have a patched font:
      -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
      -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

      -- You can also add more custom ones...
    },
    -- Use bullet marks for non-checkbox lists.
    bullets = { char = "•", hl_group = "ObsidianBullet" },
    external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    -- Replace the above with this if you don't have a patched font:
    -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
    reference_text = { hl_group = "ObsidianRefText" },
    highlight_text = { hl_group = "ObsidianHighlightText" },
    tags = { hl_group = "ObsidianTag" },
    hl_groups = {
      -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
      ObsidianTodo = { bold = true, fg = "#f78c6c" },
      ObsidianDone = { bold = true, fg = "#89ddff" },
      ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
      ObsidianTilde = { bold = true, fg = "#ff5370" },
      ObsidianBullet = { bold = true, fg = "#89ddff" },
      ObsidianRefText = { underline = true, fg = "#c792ea" },
      ObsidianExtLinkIcon = { fg = "#c792ea" },
      ObsidianTag = { italic = true, fg = "#89ddff" },
      ObsidianHighlightText = { bg = "#75662e" },
    },
  },

  -- Specify how to handle attachments.
  attachments = {
    -- The default folder to place images in via `:ObsidianPasteImg`.
    -- If this is a relative path it will be interpreted as relative to the vault root.
    -- You can always override this per image by passing a full path to the command instead of just a filename.
    img_folder = "assets/imgs",  -- This is the default
    -- A function that determines the text to insert in the note when pasting an image.
    -- It takes two arguments, the `obsidian.Client` and a plenary `Path` to the image file.
    -- This is the default implementation.
    ---@param client obsidian.Client
    ---@param path Path the absolute path to the image file
    ---@return string
    img_text_func = function(client, path)
      local link_path
      local vault_relative_path = client:vault_relative_path(path)
      if vault_relative_path ~= nil then
        -- Use relative path if the image is saved in the vault dir.
        link_path = vault_relative_path
      else
        -- Otherwise use the absolute path.
        link_path = tostring(path)
      end
      local display_name = vim.fs.basename(link_path)
      return string.format("![%s](%s)", display_name, link_path)
    end,
  },

  -- Optional, set the YAML parser to use. The valid options are:
  --  * "native" - uses a pure Lua parser that's fast but potentially misses some edge cases.
  --  * "yq" - uses the command-line tool yq (https://github.com/mikefarah/yq), which is more robust
  --    but much slower and needs to be installed separately.
  -- In general you should be using the native parser unless you run into a bug with it, in which
  -- case you can temporarily switch to the "yq" parser until the bug is fixed.
  yaml_parser = "native",
})

EOF

" :lua << EOF
"  -- Set up nvim-cmp.
"   local cmp = require'cmp'

"   cmp.setup({
"     snippet = {
"       -- REQUIRED - you must specify a snippet engine
"       expand = function(args)
"         vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
"         -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
"         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
"         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
"       end,
"     },
"     window = {
"       -- completion = cmp.config.window.bordered(),
"       -- documentation = cmp.config.window.bordered(),
"     },
"     mapping = cmp.mapping.preset.insert({
"       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
"       ['<C-f>'] = cmp.mapping.scroll_docs(4),
"       ['<C-Space>'] = cmp.mapping.complete(),
"       ['<C-e>'] = cmp.mapping.abort(),
"       ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
"     }),
"     sources = cmp.config.sources({
"       { name = 'nvim_lsp' },
"       { name = 'vsnip' }, -- For vsnip users.
"       -- { name = 'luasnip' }, -- For luasnip users.
"       -- { name = 'ultisnips' }, -- For ultisnips users.
"       -- { name = 'snippy' }, -- For snippy users.
"     }, {
"       { name = 'buffer' },
"     })
"   })

"   -- Set configuration for specific filetype.
"   cmp.setup.filetype('gitcommit', {
"     sources = cmp.config.sources({
"       { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
"     }, {
"       { name = 'buffer' },
"     })
"   })

"   -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
"   cmp.setup.cmdline({ '/', '?' }, {
"     mapping = cmp.mapping.preset.cmdline(),
"     sources = {
"       { name = 'buffer' }
"     }
"   })

"   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
"   cmp.setup.cmdline(':', {
"     mapping = cmp.mapping.preset.cmdline(),
"     sources = cmp.config.sources({
"       { name = 'path' }
"     }, {
"       { name = 'cmdline' }
"     })
"   })

"   -- Set up lspconfig.
"   local capabilities = require('cmp_nvim_lsp').default_capabilities()
"   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.

" -- Setup language servers.
" local lspconfig = require('lspconfig')
" lspconfig.pyright.setup {}
" lspconfig.tsserver.setup {}
" lspconfig.rust_analyzer.setup {
"   -- Server-specific settings. See `:help lspconfig-setup`
"   settings = {
"     ['rust-analyzer'] = {},
"   },
" }


" -- Global mappings.
" -- See `:help vim.diagnostic.*` for documentation on any of the below functions
" vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
" vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
" vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
" vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

" -- Use LspAttach autocommand to only map the following keys
" -- after the language server attaches to the current buffer
" vim.api.nvim_create_autocmd('LspAttach', {
"   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
"   callback = function(ev)
"     -- Enable completion triggered by <c-x><c-o>
"     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

"     -- Buffer local mappings.
"     -- See `:help vim.lsp.*` for documentation on any of the below functions
"     local opts = { buffer = ev.buf }
"     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
"     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
"     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
"     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
"     vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
"     vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
"     vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
"     vim.keymap.set('n', '<space>wl', function()
"       print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
"     end, opts)
"     vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
"     vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
"     vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
"     vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
"     vim.keymap.set('n', '<space>f', function()
"       vim.lsp.buf.format { async = true }
"     end, opts)
"   end,
" })
" EOF

" let g:solarized_visibility="high"
" let g:solarized_diffmode="high"
set background=dark
