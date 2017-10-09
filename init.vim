call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jreybert/vimagit'
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
" syntax
Plug 'Shougo/echodoc.vim'
" Plug 'vim-syntastic/syntastic'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
" file explorer
Plug 'scrooloose/nerdtree'
" js
Plug 'pangloss/vim-javascript'
" ts
Plug 'mhartington/nvim-typescript'
Plug 'leafgarland/typescript-vim'
" elm
Plug 'pbogut/deoplete-elm'
Plug 'ElmCast/elm-vim'
" haskell
Plug 'eagletmt/neco-ghc'
Plug 'eagletmt/ghcmod-vim'
" org-mode
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
" python
Plug 'python-mode/python-mode'
" c++
Plug 'JBakamovic/yavide'
" i3
Plug 'PotatoesMaster/i3-vim-syntax'
" xml
Plug 'othree/xml.vim'
" LaTeX
Plug 'lervag/vimtex'
call plug#end()

set noswapfile
set ignorecase
set updatetime=250
set shortmess+=c
set completeopt-=preview
set completeopt+=noinsert
set cursorline
set nocursorcolumn
set lazyredraw
set nohlsearch
set helpheight=99999
set clipboard=unnamedplus
set noshowmode
set hidden
syntax on
colorscheme gruvbox
set background=dark
set termguicolors
set expandtab
set shiftwidth=4
set tabstop=4
set number
set relativenumber
set scrolloff=3

" leaders
let mapleader="\<Space>"
let maplocalleader=","

" deoplete
let g:deoplete#enable_at_startup = 1

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_c = airline#section#create(['%{getcwd()}', '/', 'file'])
let g:airline#extensions#tabline#tab_min_count = 2

" NERDTree
autocmd StdinReadPre * let s:std_in=1
let NERDTreeShowHidden=1

" fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'

" content if no arguments supplied
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | only | endif

" keymaps
noremap <silent> <leader>wd :q<cr>
noremap <silent> <leader>wD :q!<cr>
noremap <silent> <leader>wv :vsplit<cr>
noremap <silent> <leader>wt :tabe<cr>
noremap <silent> <leader>wm :only<cr>
noremap <silent> <leader>fs :w<cr>
noremap <silent> <leader>fS :wa<cr>
noremap <silent> <leader>fu :set undoreload=0<cr>:edit<cr>
noremap <silent> <leader>fe :e<cr>
noremap <silent> <leader>qq :qa<cr>
noremap <silent> <leader>qQ :qa!<cr>
noremap <silent> <leader>qs :wqa<cr>
noremap <silent> <leader>vD :tabe ~/.config/nvim/init.vim<cr>
noremap <silent> <leader>vd :e ~/.config/nvim/init.vim<cr>
noremap <silent> <leader>vs :so $MYVIMRC<cr>
noremap <silent> <leader>vi :PlugInstall<cr>
noremap <silent> <leader>vp :so $MYVIMRC<cr>:PlugInstall<cr>
noremap <silent> <leader>vu :PlugUpdate<cr>
noremap <silent> <leader>fD :call delete(expand('%'))<cr>:bdelete!<cr>
noremap <silent> <leader>bd :call :bdelete!<cr>
noremap <silent> <M-h> :bprevious<cr>
noremap <silent> <M-l> :bnext<cr>
noremap <silent> <leader>gs :MagitOnly<cr>
nnoremap <silent> <A-j> :m .+1<cr>
nnoremap <silent> <A-k> :m .-2<cr>
nnoremap <silent> <A-h> :bnext<cr>
nnoremap <silent> <A-l> :bprevious<cr>
nnoremap <silent> <leader>V ggvG$<cr>
noremap <silent> <leader>au :MundoToggle<cr>
noremap <leader>ft :NERDTree<cr>
noremap <leader>pt :NERDTree %<cr>
noremap <leader>r :reg<cr>
noremap <leader>hb :map
" inoremap <C-S-v> <C-r>+
noremap <silent> <leader>ww :Windows<cr>
noremap <silent> <leader>pf :GFiles<cr>
noremap <silent> <leader>ff :Files<cr>
noremap <silent> <leader>sa :FZF -x ~<cr>
noremap <silent> <leader>sp :Ag<cr>
noremap <silent> <leader>ss :BLines<cr>
noremap <silent> <leader>s: :History:<cr>
noremap <silent> <leader>sc :History:<cr>
noremap <silent> <leader>s/ :History/<cr>
noremap <silent> <leader>fr :History<cr>
noremap <silent> <leader>fR :tabe<cr>:History<cr>
noremap <silent> <leader>as :Snippets<cr>
noremap <silent> <leader>hc :Commands<cr>
noremap <silent> <leader><tab> :b#<cr>
noremap Y y$
for i in range(1, 9)
    " <leader>{n} for window switching
    execute "noremap <silent> <leader>" . i . " :" . i . "wincmd W<cr>"
    " g{n} and M-{n} for tab switch
    execute "noremap g" . i . " " . i . "gt"
    execute "noremap <m-" . i . "> " . i . "gt"
endfor
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>
nnoremap <cr> i<cr><esc>

" tab completion
inoremap <expr> <tab> pumvisible() ? deoplete#close_popup() : "\<tab>"
inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<cr>
function! s:my_cr_function() abort
    return "\<cr>"
endfunction
let g:UltiSnipsExpandTrigger="nil"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" no comment formatting
autocmd BufEnter * silent! set formatoptions-=cro
" autochdir
autocmd BufEnter * silent! lcd %:p:h
" save buffers
let AutoSaveMode = 1
autocmd FocusLost * exec exists("AutoSaveMode")?AutoSaveMode?"wa":"":""
nnoremap <silent> <leader>ts :exe "let AutoSaveMode=AutoSaveMode*-1+1"<CR>
" highlight symbol under cursor
let HlUnderCursorMode = 0
autocmd CursorHold * exe HlUnderCursorMode?printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none'
nnoremap <silent> <leader>th :exe "let HlUnderCursorMode=HlUnderCursorMode*-1+1"<CR>
" strip trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" easyclip
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipUseCutDefaults = 0
nnoremap d "_d
xnoremap d "_d
nnoremap dd "_dd
nnoremap D "_D
nmap <leader>d <plug>MoveMotionPlug
xmap <leader>d <plug>MoveMotionXPlug
nmap <leader>dd <plug>MoveMotionLinePlug
nmap <leader>D <plug>MoveMotionEndOfLinePlug
vmap s S

" transparency
hi Normal guibg=NONE ctermbg=NONE

" langs
" typescript
let g:nvim_typescript#type_info_on_hold=1
let g:nvim_typescript#signature_complete=1
autocmd FileType typescript noremap <buffer> K :TSDoc<cr>
autocmd FileType typescript noremap <buffer> <M-cr> :TSImport<cr>
autocmd FileType typescript noremap <buffer> <C-b> :TSDef<cr>
autocmd FileType typescript noremap <buffer> <C-S-b> :TSTypeDef<cr>
" elm
let g:elm_format_autosave = 1
autocmd FileType elm nmap <buffer> K :ElmShowDocs<cr>
" haskell
let g:necoghc_enable_detailed_browse = 1
au FileType haskell nnoremap <buffer> <silent> ,t :w<cr>:GhcModType<cr>
au FileType haskell nnoremap <buffer> <silent> ,c :GhcModTypeClear<cr>
