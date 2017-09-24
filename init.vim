call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/vimfiler'
Plug 'Shougo/unite.vim'
Plug 'jreybert/vimagit'
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
" syntax
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
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
call plug#end()

let g:echodoc_enable_at_startup = 1
let g:deoplete#enable_at_startup = 1

" interface
set noswapfile
set ignorecase
set updatetime=250
set shortmess+=c
set completeopt-=preview
set completeopt+=noinsert
set nocursorline
set nocursorcolumn
set lazyredraw
set nohlsearch
set helpheight=99999
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" set clipboard=unnamed
set clipboard=unnamedplus
" set clipboard=unnamed,unnamedplus
set noshowmode
set cmdheight=2 " for echodoc prompts
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


" keymaps
noremap <silent> <leader>wd :q<cr>
noremap <silent> <leader>wD :q!<cr>
noremap <silent> <leader>wv :vsplit<cr>
noremap <silent> <leader>wt :tabe<cr>
noremap <silent> <leader>wm :only<cr>
noremap <silent> <leader>fs :w<cr>
noremap <silent> <leader>fS :wa<cr>
noremap <silent> <leader>fe :e<cr>
noremap <silent> <leader>qq :qa<cr>
noremap <silent> <leader>qQ :qa!<cr>
noremap <silent> <leader>qs :wqa<cr>
noremap <silent> <leader>vD :tabe ~/.config/nvim/init.vim<cr>
noremap <silent> <leader>vd :e ~/.config/nvim/init.vim<cr>
noremap <silent> <leader>vs :so $MYVIMRC<cr>
noremap <silent> <leader>vi :PlugInstall<cr>
noremap <silent> <leader>vp :so $MYVIMRC<cr>:PlugInstall<cr>
noremap <silent> <leader>fD :call delete(expand('%'))<cr> :bdelete!<cr>
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
noremap <leader>ft :VimFilerBufferDir -explorer<cr>
noremap <leader>pt :VimFiler -explorer<cr>
noremap <leader>r :reg<cr>
noremap <leader>hb :map 
" paste in insert mode
inoremap <C-v> <C-r>*
" fzf
let g:fzf_layout = { 'down': '~30%' }
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git/ node_modules/ elm-stuff/ -l -g ""'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git/ -l -g ""'
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
vmap s S
for i in range(1, 9)
" <leader>{n} for window switching
    execute "noremap <silent> <leader>" . i . " :" . i . "wincmd W<cr>"
" g{n} and M-{n} for tab switch
    execute "noremap g" . i . " " . i . "gt"
    execute "noremap <m-" . i . "> " . i . "gt"
endfor
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


" tab completion
inoremap <expr> <tab> pumvisible() ? deoplete#close_popup() : "\<tab>"
inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<cr>
function! s:my_cr_function() abort
	return "\<cr>"
endfunction
let g:UltiSnipsExpandTrigger="nil"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" comments
autocmd BufEnter * silent! set formatoptions-=cro
" autochdir
autocmd BufEnter * silent! lcd %:p:h
" save buffers on focus loss
autocmd FocusLost * silent! wa


" use this function to toggle vimfiler
function! s:vimfiler_toggle()
  if &filetype == 'vimfiler'
    execute 'silent! buffer #'
    if &filetype == 'vimfiler'
      execute 'enew'
    endif
  elseif exists('t:vimfiler_buffer') && bufexists(t:vimfiler_buffer)
    execute 'buffer ' . t:vimfiler_buffer
  else
    execute 'VimFilerCreate'
    let t:vimfiler_buffer = @%
  endif
endfunction
" make vimfiler buffer behave
function! s:vimfiler_buffer_au()
  setlocal nobuflisted
  setlocal colorcolumn=
endfunction
autocmd FileType vimfiler call s:vimfiler_buffer_au()
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_ignore_pattern = []
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_enable_auto_cd = 1


" easyclip
let g:EasyClipUseSubstituteDefaults = 1
let g:EasyClipUseCutDefaults = 0
nnoremap d "_d
xnoremap d "_d
nnoremap dd "_dd
nnoremap D "_D
nmap <leader>d <Plug>MoveMotionPlug
xmap <leader>d <Plug>MoveMotionXPlug
nmap <leader>dd <Plug>MoveMotionLinePlug
nmap <leader>D <Plug>MoveMotionEndOfLinePlug


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
au FileType haskell nnoremap <buffer> <silent> ,t :GhcModType<cr> 
au FileType haskell nnoremap <buffer> <silent> ,c :GhcModTypeClear<cr> 
