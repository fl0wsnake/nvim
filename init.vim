call plug#begin('~/.vim/plugged')
Plug 'neomake/neomake'
Plug 'Shougo/vimproc', {'do': 'make'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jreybert/vimagit'
Plug 'bling/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-eunuch'
" syntax
Plug 'Chiel92/vim-autoformat'
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'sirver/ultisnips'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-repeat'
Plug 'svermeulen/vim-easyclip'
Plug 'vim-scripts/loremipsum'
Plug 'scrooloose/nerdtree'
Plug 'dbakker/vim-projectroot'
Plug 'sk1418/HowMuch'
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
Plug 'Rip-Rip/clang_complete'
" i3
Plug 'PotatoesMaster/i3-vim-syntax'
" xml
Plug 'othree/xml.vim'
" LaTeX
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'
" markdown
Plug 'gabrielelana/vim-markdown'
Plug 'suan/vim-instant-markdown'
" notes
Plug 'vimwiki/vimwiki'
call plug#end()

" sets
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

" keymaps
noremap <silent> <leader>ad a<C-R>=strftime('%d/%m/%y')<cr><esc>
noremap <silent> <leader>aD a<C-R>=strftime('%d/%m/%y %H:%M')<cr><esc>
noremap <silent> <leader>al :Loremipsum<space>
noremap <silent> <leader>bs :enew<cr>
noremap <silent> <leader>wd :q<cr>
noremap <silent> <leader>wD :q!<cr>
noremap <silent> <leader>wv :vsplit<cr>
noremap <silent> <leader>wt :tabe<cr>
noremap <silent> <leader>wm :only<cr>
noremap <silent> <leader>fw :silent! w<cr>
noremap <silent> <leader>fW :silent! wa<cr>
noremap <silent> <leader>fu :set undoreload=0<cr>:e<cr>
noremap <silent> <leader>fe :e!<cr>
noremap <silent> <leader>qq :qa<cr>
noremap <silent> <leader>qQ :qa!<cr>
noremap <silent> <leader>qw :wqa<cr>
noremap <silent> <leader>qW :wqa!<cr>
noremap <silent> <leader>vD :tabe ~/.config/nvim/init.vim<cr>
noremap <silent> <leader>vd :e ~/.config/nvim/init.vim<cr>
noremap <silent> <leader>vs :so $MYVIMRC<cr>
noremap <silent> <leader>vi :PlugInstall<cr>
noremap <silent> <leader>vc :PlugClean<cr>
noremap <silent> <leader>vp :so $MYVIMRC<cr>:PlugInstall<cr>
noremap <silent> <leader>vu :PlugUpdate<cr>
noremap <silent> <leader>fD :call DeleteFileAndBuffer()<cr>
function! DeleteFileAndBuffer()
    if confirm('Delete buffer with file?', "&Yes\n&No", 0) == 1
        call delete(expand('%'))
        bdelete!
    endif
endfunction
noremap <silent> <leader>fd :call delete(expand('%'))<cr>:set modified<cr>
noremap <silent> <leader>bd :bdelete!<cr>
noremap <silent> <leader>fm :Rename<space>
noremap <silent> <M-h> :bprevious<cr>
noremap <silent> <M-l> :bnext<cr>
noremap <silent> <leader>gs :MagitOnly<cr>
nnoremap <silent> <A-j> :m .+1<cr>
nnoremap <silent> <A-k> :m .-2<cr>
nnoremap <silent> <A-h> :bnext<cr>
nnoremap <silent> <A-l> :bprevious<cr>
nnoremap <silent> <leader>V ggvG$<cr>
noremap <silent> <leader>au :MundoToggle<cr>
noremap <silent> <leader>r :reg<cr>
noremap <silent> <leader>hb :map
noremap <silent> <leader>hh :tab h
noremap <silent> <leader>as :Snippets<cr>
noremap <silent> <leader>hc :Commands<cr>
noremap <silent> <leader><tab> :b#<cr>
noremap Y y$
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$
noremap <silent> ^ g^
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

" completion tab behaviour
inoremap <expr> <tab> pumvisible() ? deoplete#close_popup() : "\<tab>"
let g:UltiSnipsExpandTrigger='<C-P>'
" completion enter behaviour
inoremap <silent> <cr> <C-r>=<SID>my_cr_function()<cr>
function! s:my_cr_function() abort
    return deoplete#mappings#smart_close_popup() . "\<CR>"
endfunction

" translator
let g:trans_dir = "~/apps/trans/"
function! Trans(if_delete)
    exe system("mkdir -p " . g:trans_dir)
    let l:word = tolower(expand("<cword>"))
    let l:word_path = g:trans_dir . l:word . ".txt"
    if !filereadable(expand(l:word_path)) || a:if_delete
        if system("command -v trans") == ''
            echo("No trans executeble found.")
        else
            exe system("trans -no-ansi " . l:word . ">" . l:word_path)
        endif
    endif
    exe "e" fnameescape(l:word_path) | setl buftype=nowrite
endfunction
noremap <silent> <leader>at :exe Trans(0)<cr>
noremap <silent> <leader>aT :exe Trans(1)<cr>

" lyrics
let g:lyrics_dir = "~/apps/lyrics/"
function! Lyrics(if_delete)
    exe system("mkdir -p " . g:lyrics_dir)
    let l:song_name = substitute(tolower(getline('.')), " ", "_", "g")
    let l:song_path = g:lyrics_dir . l:song_name . ".txt"
    if !filereadable(expand(l:song_path)) || a:if_delete
        if system("command -v clyrics") == ''
            echo("No clyrics executeble found.")
        else
            exe system("clyrics " . l:song_name . ">" . l:song_path)
        endif
    endif
    exe "e" fnameescape(l:song_path) | setl buftype=nowrite
endfunction
noremap <silent> <leader>al :exe Lyrics(0)<cr>
noremap <silent> <leader>aL :exe Lyrics(1)<cr>

" global settings
" no comment formatting
au BufEnter * silent! set formatoptions-=cro
" strip trailing whitespaces
au BufWritePre * :%s/\s\+$//e
" transparency
hi Normal guibg=NONE ctermbg=NONE
" autochdir
set autochdir
" content if no arguments are supplied
" au VimEnter * if argc() == 0 | setlocal buftype=nofile | endif

" modes
function! ToggleVar(var, message)
    if a:var
        echo a:message.' OFF'
        return 0
    else
        echo a:message.' ON'
        return 1
    endif
endfunction
" autosave buffers on focus loss mode
let AutoSaveMode = 1
nnoremap <silent> <leader>ts :let AutoSaveMode=ToggleVar(AutoSaveMode, 'autosave buffers mode')<CR>
au FocusLost * silent! exec AutoSaveMode?"wa":""
" highlight symbol under cursor mode
let HlUnderCursorMode = 0
nnoremap <silent> <leader>th :let HlUnderCursorMode=ToggleVar(HlUnderCursorMode, 'symbol highlight mode')<CR>
au CursorHold * exe HlUnderCursorMode?printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\')):'match none'
" spellchecker mode
set spellcapcheck=
set spelllang=en_us
au FileType text setl spell
nnoremap <silent> <leader>tc :call ToggleVar(&spell, 'spellchecker mode')<cr>:setl spell!<cr>

" deoplete
let g:deoplete#enable_at_startup = 1
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline_section_a = airline#section#create([])
let g:airline_section_c = airline#section#create(['path'])
let g:airline_section_z = airline#section#create([])
" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1
noremap <silent> <leader>ft :NERDTreeFind<cr>
noremap <silent> <leader>pt :ProjectRootExe NERDTreeFind<cr>
" fzf
let $FZF_DEFAULT_COMMAND = 'ag --hidden -l -g ""'
noremap <silent> <leader>ww :Windows!<cr>
noremap <silent> <leader>pf :GFiles!<cr>
noremap <silent> <leader>sf :Ag! .<cr>
noremap <silent> <leader>ff :Files!<cr>
nmap <silent> <leader>fs <leader>ff
noremap <silent> <leader>fa :FZF! -x ~<cr>
noremap <silent> <leader>sp :Ag!<cr>
noremap <silent> <leader>ss :BLines!<cr>
nmap <silent> <leader>sl <leader>ss
noremap <silent> <leader>s: :History:!<cr>
noremap <silent> <leader>sc :History:!<cr>
noremap <silent> <leader>s/ :History/!<cr>
noremap <silent> <leader>fr :History!<cr>
noremap <silent> <leader>fR :tabe<cr>:History!<cr>
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
" vimwiki
let s:vimwiki_main = {}
let s:vimwiki_main.path = '~/Dropbox/vimwiki'
let s:vimwiki_main.path_html = s:vimwiki_main.path . '/html'
let s:vimwiki_main.diary_index = 'diary_index'
let s:vimwiki_main.template_path = s:vimwiki_main.path . '/templates'
let s:vimwiki_main.template_ext = '.html'
let s:vimwiki_main.syntax = 'markdown'
let g:vimwiki_list = [s:vimwiki_main]
let g:vimwiki_global_ext = 0
let g:vimwiki_folding = 'expr'
au FileType vimwiki vmap <silent> ,u :s/ /_/g<cr>
nmap <silent> <leader>ow <plug>VimwikiIndex
nmap <silent> <leader>oW <plug>VimwikiTabIndex
nmap <silent> <leader>os <plug>VimwikiUISelect
nmap <silent> <leader>oi <plug>VimwikiDiaryIndex
nmap <silent> <leader>od <plug>VimwikiMakeDiaryNote
nmap <silent> <leader>oD <plug>VimwikiTabMakeDiaryNote
nmap <silent> <leader>oy <plug>VimwikiMakeYesterdayDiaryNote
nmap <silent> <leader>og <plug>VimwikiDiaryGenerateLinks
nmap <silent> <leader>or <plug>VimwikiRenameLink
nmap <silent> <leader>oq <plug>VimwikiDeleteLink
nmap <silent> <leader>ot :VimwikiTOC<cr>
nmap <silent> <leader>on :exe "e" vimwiki_main.path . '/notes.md'<cr>
" markdown
let g:markdown_enable_mappings = 0
let g:markdown_include_jekyll_support = 0
let g:markdown_enable_input_abbreviations = 0
" markdown preview
au FileType markdown,vimwiki noremap <silent> ,p :InstantMarkdownPreview<cr>
let g:instant_markdown_autostart = 0
let g:instant_markdown_slow = 1
let g:instant_markdown_open_to_the_world = 1

" langs
" format
au FileType javascript,sh au BufWritePre * :Autoformat
" ts
let g:nvim_typescript#type_info_on_hold=1
let g:nvim_typescript#signature_complete=1
au FileType typescript noremap <buffer> K :TSDoc<cr>
au FileType typescript noremap <buffer> <M-cr> :TSImport<cr>
au FileType typescript noremap <buffer> <C-b> :TSDef<cr>
au FileType typescript noremap <buffer> <C-S-b> :TSTypeDef<cr>
" elm
let g:elm_format_autosave = 1
au FileType elm nmap <buffer> K :ElmShowDocs<cr>
" haskell
let g:necoghc_enable_detailed_browse = 1
au FileType haskell nnoremap <buffer> <silent> ,t :w<cr>:GhcModType<cr>
au FileType haskell nnoremap <buffer> <silent> ,c :GhcModTypeClear<cr>
" TeX
let g:livepreview_previewer = 'zathura'
au FileType tex,latex noremap <buffer> ,p :LLPStartPreview<cr>
