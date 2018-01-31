" PLUGINS -------------------------------------------------------------------- {{{
" --------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
  Plug 'altercation/vim-colors-solarized'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'vim-syntastic/syntastic'
  Plug 'simeji/winresizer'
call plug#end()

" Powerline
let g:airline_powerline_fonts = 1

" Syntastic
" There is a bug here where the following are appended to 'statusline' every
" time this file is saved
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" BASIC SETTINGS ------------------------------------------------------------- {{{
" --------------------------------------------------------------------------------
set nocompatible
syntax on
filetype plugin indent on
let mapleader = ' '
let localmapleader = '\\'
set number                    " line numbers
set ruler
set visualbell
set scrolloff=3
set textwidth=0
set hidden
set cursorline
set laststatus=2
set showbreak=↪
set virtualedit=all
set tags=tags;/

" Backups
let s:vim_swp = expand('~/.vim/swap//')
if filewritable(s:vim_swp) == 0 && exists("*mkdir")
  call mkdir(s:vim_swp, "p", 0700)
endif
let s:vim_bkp = expand('~/.vim/backups//')
if filewritable(s:vim_bkp) == 0 && exists("*mkdir")
  call mkdir(s:vim_bkp, "p", 0700)
endif
set directory=~/.vim/swap
set backupdir=~/.vim/backups

" TABS
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent
set shiftround

" SEARCHING
set hlsearch
set incsearch
set background=dark

silent! colorscheme solarized

" Jump to matching pairs
set matchpairs+=<:>
runtime! macros/matchit.vim

" Highlight trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
" }}}

" MAPPINGS ------------------------------------------------------------------- {{{
" --------------------------------------------------------------------------------

" Basic {{{
" Easy vimrc edit
nnoremap <leader>ew :e ~/.vimrc<CR>
nnoremap <leader>es :split ~/.vimrc<CR>
nnoremap <leader>ev :vsplit ~/.vimrc<CR>
nnoremap <leader>et :tabnew ~/.vimrc<CR>

" Figure out how to easily quit/write
nnoremap <leader>fw :w<CR>
nnoremap <leader>fq :q<CR>

" nnoremap <leader>df :q!<CR>
" nnoremap <leader>da :qall<CR>
" nnoremap <leader>fs :w!<CR>

" Windows / buffers
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <leader>sk <C-w>s <C-w>k
nnoremap <leader>sj <C-w>s <C-w>j
nnoremap <leader>sl <C-w>v<C-w>l
nnoremap <leader>sh <C-w>v<C-w>h
nnoremap <leader>= <C-w>=

" Folds
nnoremap <cr> za
nnoremap <S-cr> za
nnoremap <tab> zj
nnoremap <S-tab> zk

" Toggles (note: lots of toggles are in 'unimpaired', try not to duplicate
" Redraw the screen and toggle hlsearch
nnoremap <leader>hl <C-l>:nohlsearch<CR>


" ctags
nnoremap <leader>tk <C-w>s <C-w>k
nnoremap <leader>tj <C-w>s <C-w>j
nnoremap <leader>tl <C-w>v<C-w>l
nnoremap <leader>th <C-w>v<C-w>h

nnoremap <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

function! TagSplit()
  tab split
  exec "tag ".expand("<cword>")
endfunction


" Repeatable window resizing
nnoremap <silent> <Plug>IncreaseWindowSize :vertical resize +10<CR> :call repeat#set("\<Plug>IncreaseWindowSize")<CR>
nmap <leader>] <Plug>IncreaseWindowSize
nnoremap <silent> <Plug>DecreaseWindowSize :vertical resize -10<CR> :call repeat#set("\<Plug>DecreaseWindowSize")<CR>
nmap <leader>[ <Plug>DecreaseWindowSize

" Remove whitespace
nnoremap <leader>rw :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
" }}}

" Plugins {{{

nnoremap <Leader>cc :SyntasticCheck<cr>

"}}}

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" }}}

" AUTOCOMMANDS --------------------------------------------------------------- {{{
" --------------------------------------------------------------------------------
augroup filetype_vim
  autocmd!

  " Automatically source vimrc on write
  autocmd BufWritePost ~/.vimrc :source ~/.vimrc
  autocmd FileType vim setlocal foldmethod=marker
  autocmd FileType vim setlocal foldlevelstart=1
augroup END

augroup filetype_text
  autocmd!
  autocmd FileType text setlocal spell
augroup END

autocmd BufRead,BufNewFile *.thor set filetype=ruby

" }}}

" ABBREVIATIONS -------------------------------------------------------------- {{{
" --------------------------------------------------------------------------------
iabbrev @e ellingtonjp@gmail.com
iabbrev @n Jonathan Ellington
" }}}

" EXAMPLES ---- -------------------------------------------------------------- {{{
" --------------------------------------------------------------------------------

" Alter cursor line if using virtual edit and pass the end of the line
" function! AlterCursorLine()
"   let l:pos = getpos(".")
"   if l:pos[3] >? 0
"     highlight CursorLine ctermbg=0
"   else
"     highlight CursorLine ctermbg=bg
"   endif
" endfunction
"
" autocmd! CursorMoved,CursorMovedI * call AlterCursorLine()


" Easy GREP, simple {{{
" Mapping for grepping the WORD underneath the cursor, then automatically
" opening the quickfix menu. Ensures the WORD underneath the cursor is properly
" shell escaped. For some reason it is also necessary to redraw after opening
" the quick fix menu, else all other splits are blank.
"
" nnoremap <leader>g :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr><C-l>
" }}}

" Easy GREP, improved {{{
" A new operator is created, so we can use Easy GREP with any normal mode vim motion
" and visualmode selections (but not line or block visualmode).
"
" We ensure not to pollute the user's @@ register.
"
" NOTES
"   * s: and <SID> is used for scoping, which would be used if this was used as
"     a separate plugin (ie ~/.vim/plugin/grep_operator.vim)
"   * :set operatorfunc=<SID>GrepOperator<cr>g@ details:
"     - set teh operatorfunc option to the GrepOperator function
"     - g@ calls the function set in operatorfunc
"     - operator is called with one String argument "line", "char", "block" specifying
"       the type of motion.
"   * :<c-u>call <SID>GrepOperator(visualmode())<cr>
"     - explicitly call the GrepOperator, and pass the type of visual mode as an arg
"       (v, V, C-V)
"
" Visualmode doesn't require an equivalent operatorfunc and call to g@, we can explicitly
" call GrepOperator. This is because we already have the selection, contrast with normal
" mode where we await a motion from the user.
"
" :help g@
" :help :map-operator
" nnoremap <leader>g :set operatorfunc=GrepOperator<cr>g@
" vnoremap <leader>g :<c-u>call GrepOperator(visualmode())<cr>
"
" function! GrepOperator(type)
"   " Don't ruin user's @@ register.
"   let saved_unnamed_register = @@
"
"   if a:type ==# 'v'
"     execute "normal! `<y`>"
"   elseif a:type ==# 'char'
"     execute "normal! `[y`]"
"   else
"     return
"   endif
"
"   silent execute "grep! -R " . shellescape(@@) . " ."
"   copen
"
"   " Necessary after copen, else all other splits will be blank
"   redraw
"
"   let @@ = saved_unnamed_register
" endfunction
" }}}

" Quickfix Toggle {{{
" Add mapping to toggle the quickfix menu open. Uses a global variable to keep
" track of menu open/close state, which can fail if user manually opens/closes
" the quickfix menu. Keeps track of which window the user came from, so when
" closing the quickfix menu we return to the correct split -- this can fail
" if splits are created/closed while the quickfix menu is open.

" let g:quickfix_is_open = 0
" nnoremap <leader>q :call QuickfixToggle()<cr>
" function! QuickfixToggle()
"   if g:quickfix_is_open
"     cclose
"     let g:quickfix_is_open = 0
"
"     " return to saved window number
"     execute g:quickfix_return_to_window . "wincmd w"
"   else
"     " get current window number
"     let g:quickfix_return_to_window = winnr()
"
"     copen
"     let g:quickfix_is_open = 1
"   endif
" endfunction
" }}}

" Example operator pending mappings {{{

" Delete body (deletes all text from cursor position until 'return')
" onoremap b /return<cr>

" Change in next parantheses
"   We use <c-u>normal! to change the start of the selection
" onoremap in( :<c-u>normal! f(vi(<cr>

" Change in next email address
"   execute is needed because normal! does not recognize special characters
"   (like <cr>). Instead, execute as string and replace with chars like \r
" onoremap in@ :<c-u>execute "normal! /\\w\\+@\\w\\+\\.\\w\\+\r:nohlsearch\rvt@"<cr>
" }}}

" }}}
