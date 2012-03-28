" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" My current plugin list:
" --------------------------------
" ack - 0.3.1 - http://www.vim.org/scripts/script.php?script_id=2572
" nerdtree - 4.1.0 - http://www.vim.org/scripts/script.php?script_id=1658
" bufexplorer - 7.2.8 - http://www.vim.org/scripts/script.php?script_id=42
let mapleader=","

set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" set folding things
set foldmethod=indent
set nofoldenable
set foldcolumn=1

set nobackup
set nowritebackup
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set scrolloff=3

set cursorline " highlight current line
set hidden " allow unsaved buffers

" smart indent options
" set cindent
set smartindent

" Color scheme
colorscheme vividchalk
highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

set guifont=Monaco:h12 

" Numbers
set number
set numberwidth=5

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Always display the status line
set laststatus=2

" use w!! to sudo :w  a file that we opened without su privs
cmap w!! w !sudo tee % >/dev/null

" Nerd Tree shortcut
map <leader>n :NERDTreeToggle<CR>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map a shortcut for rotating windows around
" Learned from Reddit: http://www.reddit.com/r/vim/comments/e6aw9/rotate_all_the_visible_windows_no_cwr/
map <leader>rr <C-w>K<C-W>r<C-W>k<C-W>H

" For Pathogen
" call pathogen#runtime_append_all_bundles()
call pathogen#infect()

" Maintaining the visual line selection after indenting with '>' or '<'
vmap > >gv
vmap < <gv

" Enable JSLint plugin
filetype plugin on

 " Autoc-compile coffee script
autocmd BufWritePost *.coffee silent CoffeeMake!

" Insert a carrage return exactly where you are and moves to the start of that line.  The opposite of <Shift + j>
map <leader>j i<CR><ESC>^

" let g:tagbar_ctags_bin='/usr/local/bin/ctags'
" let g:tagbar_width=26
" map <leader>m :TagbarToggle<CR>

" Automatically add an "end" below the current line
map <leader><CR> oend<ESC>O<C-T>
