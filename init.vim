call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'morhetz/gruvbox'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-airline'
Plug 'kassio/neoterm'
Plug 'sirver/ultisnips'
Plug 'pangloss/vim-javascript'
Plug 'mhartington/nvim-typescript'
Plug 'HerringtonDarkholme/yats'
Plug 'pbogut/deoplete-elm'
Plug 'ElmCast/elm-vim'
call plug#end()


let g:echodoc_enable_at_startup = 1
let g:deoplete#enable_at_startup=1

" interface
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
let g:airline#extensions#tabline#fnamemod = ':t'
set mouse-=a
set clipboard=unnamedplus
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
noremap <silent> <Leader>wd :q<CR>
noremap <silent> <Leader>wv :vsplit<CR>
noremap <silent> <Leader>wt :tabe<CR>
noremap <silent> <Leader>wm :only<CR>
noremap <silent> <Leader>fs :w<CR>
noremap <silent> <Leader>fS :wa<CR>
noremap <silent> <Leader>fr :e<CR>
noremap <silent> <Leader>qq :qa<CR>
noremap <silent> <Leader>qQ :qa!<CR>
noremap <silent> <Leader>qs :wqa<CR>
noremap <silent> <Leader>fv :e ~/.config/nvim/init.vim<CR>


" fzf
let g:fzf_layout = { 'down': '~30%' }
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git/ node_modules/ elm-stuff/ -l -g ""'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git/ -l -g ""'
" nnoremap <Leader>ww :Windows<CR>
noremap <silent> <Leader>pf :GFiles<CR>
noremap <silent> <Leader>ff :Files<CR>
noremap <silent> <Leader>sa :FZF -x ~<CR>
noremap <silent> <Leader>sp :Ag<CR>
noremap <silent> <Leader>ss :BLines<CR>
noremap <silent> <Leader>fr :History<CR>
noremap <silent> <Leader>as :Snippets<CR>
noremap <silent> <Leader><Leader> :Commands<CR>
noremap <silent> <Leader><tab> :b# <CR>
" window switching
map <silent> <Leader>1 :1wincmd W<CR>
map <silent> <Leader>2 :2wincmd W<CR>
map <silent> <Leader>3 :3wincmd W<CR>
map <silent> <Leader>4 :4wincmd W<CR>
map <silent> <Leader>5 :5wincmd W<CR>
map <silent> <Leader>6 :6wincmd W<CR>
map <silent> <Leader>7 :7wincmd W<CR>
map <silent> <Leader>8 :8wincmd W<CR>
map <silent> <Leader>9 :9wincmd W<CR>
" paste in insert mode
imap <C-v> <Esc>pa
" delete without yanking
nnoremap <space>d "_d
vnoremap <space>d "_d
nnoremap <space>D "_D
vnoremap <space>D "_D
" visual never changes registers
vnoremap p "_dP
vnoremap P "_dp
" change never changes registers
nnoremap c "_c
nnoremap C "_C
vnoremap c "_c
vnoremap C "_C
" g{n} for tab switch
noremap g1 1gt
noremap g2 2gt
noremap g3 3gt
noremap g4 4gt
noremap g5 5gt
noremap g6 6gt
noremap g7 7gt
noremap g8 8gt
noremap g9 9gt
" faster scrolling
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>


" tab completion
inoremap <expr> <tab> pumvisible() ? deoplete#close_popup() : "\<tab>"
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
	return "\<CR>"
endfunction
let g:UltiSnipsExpandTrigger="nil"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" langs
" typescript
let g:nvim_typescript#type_info_on_hold=1
let g:nvim_typescript#signature_complete=1
" elm
let g:elm_format_autosave = 1


" autocmds
augroup my_augroup
" comments
    autocmd BufEnter * silent! set formatoptions-=cro
" autochdir
    autocmd BufEnter * silent! lcd %:p:h
" save buffers on focus loss
    autocmd FocusLost * silent! wa
" typescript
    autocmd FileType typescript nmap <buffer> K :TSDoc<CR>
	autocmd FileType typescript nmap <buffer> <M-CR> :TSImport<CR>
	autocmd FileType typescript nmap <buffer> <C-b> :TSDef<CR>
	autocmd FileType typescript nmap <buffer> <C-S-b> :TSTypeDef<CR>
" elm
    autocmd FileType elm nmap <buffer> K :ElmShowDocs<CR>
augroup END


" vimfiler
noremap <Leader>ft :VimFilerBufferDir -explorer<CR>
noremap <Leader>pt :VimFiler -explorer<CR>
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
