" Basics {
    set nocompatible        " Must be first line
    if !(has('win16') || has('win32') || has('win64'))
        set shell=/bin/bash
    endif
    set encoding=utf-8
" }

" General {

    set diffopt=filler,context:3,iwhite
    set fileformats=unix,dos,mac
    set fileencodings=utf-8,default,latin1

    filetype plugin indent on   " Automatically detect file types.
    syntax on                   " Syntax highlighting
    set mouse=a                 " Automatically enable mouse usage
    "set mousehide               " Hide the mouse cursor while typing
    scriptencoding utf-8

    " PHP config
    let php_sql_query          = 1
    let php_htmlInStrings      = 1
    let php_parent_error_close = 1
    let php_folding            = 1

    " Enable omni completion.
    autocmd FileType css,sass,scss  setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown  setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript     setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python         setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml            setlocal omnifunc=xmlcomplete#CompleteTags

    if has ('x') && has ('gui')   " On Linux use + register for copy-paste
        set clipboard=unnamedplus
    elseif has ('gui')            " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
        au GUIEnter * simalt ~x   " Start maximized
        set guifont=Source_code_Pro:h11:cANSI,Consolas:h10,Anka/Coder_Condensed:h10,VT323:h13:cANSI,Lucida_Console:h10
    endif

    "set autowrite                     " Automatically write a file when leaving a modified buffer
    set shortmess+=filmnrxoOtT         " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options
    set viewoptions+=cursor,unix,slash " Better Unix / Windows compatibility
    "set virtualedit=onemore           " Allow for cursor beyond last character
    set history=1000                   " Store a ton of history (default is 20)
" }

" Vim UI {
    set tabpagemax=20                  " Only show 15 tabs
    set showtabline=2                  " Always
    set showmode                       " Display the current mode

    set background=dark                " Assume a dark background
    if !has('gui')
        set term=$TERM                 " Make arrow and other keys work
        set t_Co=256
    endif

    let g:rehash256=1               " For the molokai theme

    set cursorline cursorcolumn     " Show a 'cross' that pinpoints to the cursor position
    set splitright                  " New window on rightside when vsplit
    set splitbelow                  " New window on bottomside when hsplit

    "color scheme
    color GUI_distinguished

    " Sets CursorLine color to a smooth background, no underline
    highlight CursorLine   cterm=NONE ctermfg=NONE ctermbg=234 guibg=Grey3
    highlight CursorColumn cterm=NONE ctermfg=NONE ctermbg=233 guibg=Grey4

    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

    set diffopt=filler,context:3,iwhite,vertical " diffmode options

    if has('cmdline_info')
        set ruler                   " Show the ruler
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
        set showcmd                 " Show partial commands in status line and
                                    " Selected characters/lines in visual mode
    endif

    if has('statusline')
        set laststatus=2

        " Broken down into easily includeable segments
        set statusline=%<%f\                                    " Filename
        set statusline+=%w%h%m%r%q                              " Options
        " set statusline+=\ %{fugitive#statusline()}              " Git Hotness
        set statusline+=\ [%Y\|%{&ff}\|%{&fenc!=''?&fenc:&enc}] " Filetype & encoding
        set statusline+=\ [%{getcwd()}]                         " Current dir
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%                 " Right aligned file nav info
        set statusline+=\ Chr\ %b                               " Current char ASCII (Dec)
        set statusline+=\ %{strftime(\"\|\ %d-%m-%y\ %H:%M\")}  " Current date-time

        let g:airline_theme='powerlineish'                 " airline users use the powerline theme
        let g:airline_powerline_fonts=1                    " and the powerline fonts
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set wiw=150
    set ignorecase                  " Case insensitive search
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
    set scrolljump=4                " Lines to scroll when cursor leaves screen
    set scrolloff=2                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code
    set list
    set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

" }

    " Setting up the directories {
    set backup                  " Backups are nice ...
    if has('persistent_undo')
        set undofile                " So is persistent undo ...
        set undolevels=1000         " Maximum number of changes that can be undone
        set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    endif
    "}

" NetRW - vim file-system manager {
    let g:netrw_liststyle    = 3        " Sets Tree view as default
    let g:netrw_banner       = 0        " Supress the NetRW banner (experimental)
    let g:netrw_browse_split = 2        " When \<CR> a file, do a vsplit first
    let g:netrw_altv         = &spr     " Uses the 'splitright' value
    let g:netrw_winsize      = 80       " Relativa (%) size of new window when 'o' or 'v'
    let g:NetrwTopLvlMenu    = 'FS Nav' " NetRW window name

    " Opens current directory on a new tab
    noremap <silent><Leader>o :tabe %:p:h<CR>

    au FileType netrw  au BufEnter <buffer> vert resize 32|set winfixwidth
" }

" Formatting {
    "set nowrap                    " Do not Wrap long lines
    set autoindent                 " Indent at the same level of the previous line
    set shiftwidth=4               " Use indents of 4 spaces
    "set noexpandtab                " 2014-06-03: deactivated. " Tabs are spaces, not tabs
    set tabstop=4                  " An indentation every four columns
    set softtabstop=4              " Let backspace delete indent
    set matchpairs+=<:>            " Match, to be used with %
    set pastetoggle=<F12>          " pastetoggle (sane indentation on pastes)
    set comments=sl:/*,mb:*,elx:*/ " auto format comment blocks
    " Remove trailing whitespaces and ^M chars
    autocmd FileType c,cpp,java,go,php,javascript,css,python,twig,xml,html,yml autocmd BufWritePre <buffer> call StripTrailingWhitespace()
    autocmd FileType go autocmd BufWritePre <buffer> Fmt
    autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig st=2 sts=2 sw=2
    autocmd FileType php autocmd BufRead set foldmethod=indent et
    autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery
	autocmd ColorScheme highlight CursorLine   ctermbg=234 guibg=Grey3
	autocmd ColorScheme highlight CursorColumn ctermbg=233 guibg=Grey4
    " Automatically open, but do not go to (if there are errors) the quickfix /
    " location list window, or close it when is has become empty.
    "
    " Note: Must allow nesting of autocmds to enable any customizations for quickfix
    " buffers.
    " Note: Normally, :cwindow jumps to the quickfix window if the command opens it
    " (but not if it's already open). However, as part of the autocmd, this doesn't
    " seem to happen.
    autocmd QuickFixCmdPost [^l]* nested cwindow
    autocmd QuickFixCmdPost    l* nested lwindow
" }

" Key (re)Mappings {
    " Wrapped lines goes down/up to next row, rather than next line in file.
    noremap j gj
    noremap k gk

    " Move a line up & down with ALT/META - Up/Down arrows
    nnoremap <silent> <M-Up> :m-2<CR>
    nnoremap <silent> <M-Down> :m+1<CR>
    nnoremap <silent> <M-S-Up> :copy-1<CR>
    nnoremap <silent> <M-S-Down> :copy+0<CR>

    " De-Indent a line or a selected lines
    nnoremap <silent> <M-Left> <<
    nnoremap <silent> <M-Right> >>
    vnoremap <silent> <M-Left> <gv
    vnoremap <silent> <M-Right> >gv
    " Visual shifting (does not exit Visual mode)
    vnoremap < <gv
    vnoremap > >gv
    " Move selected lines or visual block using arrow keys ou  h j k l
    vmap  <expr> <S-UP>     DVB_Drag('up')
    vmap  <expr> <S-DOWN>   DVB_Drag('down')
    vmap  <expr> <S-LEFT>   DVB_Drag('left')
    vmap  <expr> <S-RIGHT>  DVB_Drag('right')
    vmap  <expr> <M-DOWN>   DVB_Drag('down')
    vmap  <expr> <M-UP>     DVB_Drag('up')

    vmap  <expr>  h DVB_Drag('left')
    vmap  <expr>  l DVB_Drag('right')
    vmap  <expr>  j DVB_Drag('down')
    vmap  <expr>  k DVB_Drag('up')
    vmap  <expr>  D DVB_Duplicate()

    " Stupid shift key fixes
    if !exists('g:spf13_no_keyfixes')
        if has("user_commands")
            command! -bang -nargs=* -complete=file E e<bang> <args>
            command! -bang -nargs=* -complete=file W w<bang> <args>
            command! -bang -nargs=* -complete=file Wq wq<bang> <args>
            command! -bang -nargs=* -complete=file WQ wq<bang> <args>
            command! -bang Wa wa<bang>
            command! -bang WA wa<bang>
            command! -bang Q q<bang>
            command! -bang QA qa<bang>
            command! -bang Qa qa<bang>
        endif

        cmap Tabe tabe
    endif

    :noremap <silent> <Leader>cf zfa{

    " Yank from the cursor to the end of the line, to be consistent with C and D.
    "nnoremap Y y$

    " MLG - I prefer the other way... Y means yy, so...
    " nnoremap D dd
    " nnoremap C cc

    " Toggle search highlighting
    nmap <silent> <leader>/ :set invhlsearch<CR>

    " NeoComplCache <TAB>: completion. {
    "   inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    "   inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
    "   inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    " }

    " UndoTree {
        nnoremap <Leader>u :UndotreeToggle<CR>
        " If undotree is opened, it is likely one wants to interact with it.
        let g:undotree_SetFocusWhenToggle=1
    " }

    " Strip whitespace {
    function! StripTrailingWhitespace()
        " To disable the stripping of whitespace, add the following to your
        " .vimrc.local file:
        "   let g:spf13_keep_trailing_whitespace = 1
        if !exists('g:spf13_keep_trailing_whitespace')
            " Preparation: save last search, and cursor position.
            let _s=@/
            let l = line(".")
            let c = col(".")
            " do the business:
            %s/\s\+$//e
            " clean up: restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endif
    endfunction
    " }

    " Format JSON file {
    function! PrettyJSON()
        exec 's/\({\|[\)\|\(:\)\(:?.\{40,\}\)/\1\2\3\r/g|:%s/\s*\(["\]}]\?,\)\s*"/\1\r"/g|:%s/}/\r}/g|:normal gg=G'
    endfunction
    nnoremap <silent> =J :call PrettyJSON()<CR>
    " }
    " Format SGML file {
    function! FormatXML()
        exec ':%s/<\/\(\w\+\)>/<\/\1>\r/g|:%s/></>\r</g|:normal 2G=it'
    endfunction

    nnoremap <silent> <leader>X :call FormatXML()<CR>
    " De-format SGML file (minifies)
    nnoremap <silent> <leader>x :2,$s/>\n\s*</></g<CR>
    " }
    " Syntastic
    let g:syntastic_javascript_checkers = ['jsl'] " JavaScript syntax check
" }

if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
endif

" Load visual drag plugin
runtime plugin/dragvisuals.vim
