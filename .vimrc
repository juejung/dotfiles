"------------------------------------------------------------------------------
" Juergen Jung, vimrc file
"------------------------------------------------------------------------------
" [1] Basics{{{1
filetype off                   " required!

if has('vim_starting')
   set nocompatible               " Be iMproved

    if has('win32') || has('win64')
        let $TMP="C:/temp"
        let $TEMP="C:/temp"
        set directory=.,$TMP,$TEMP
        "-------------------------------------"
        "source $VIMRUNTIME/mswin.vim
        "behave mswin
        " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
        " can be called correctly.
        "set shellslash
        "set shell=/bin/sh
        "set shell=/bin/bash
        set shellxquote=
        "-------------------------------------"
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        "set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        "-------------------------------------"
        " NeoBundle setup
        set rtp+=C:\Dropbox\Programs\Vim\vimfiles\bundle\neobundle.vim
        call neobundle#rc('C:\Dropbox\Programs\Vim\vimfiles\bundle\')
        "call neobundle#rc(expand('~/.vim/bundle/'))

        " [.] Vundle setup
        "set rtp+=C:\Dropbox\Programs\Vim\vimfiles\bundle\vundle\
        "call vundle#rc('C:\Dropbox\Programs\Vim\vimfiles\bundle\')
        "older:
        "set rtp+=C:\Dropbox\dotfiles\.vim\bundle\vundle\
        "call vundle#rc('C:\Dropbox\dotfiles\.vim\bundle\bundle\')
        " -----------------------------
        " Make symbolic/dynamiclinks
        " -----------------------------
        "ln -s ~/Dropbox/dotfiles/.vimrc ~/.vimrc
        "ln -s ~/Dropbox/dotfiles/.vimrc.bundles ~/.vimrc.bundles
        "ln -s ~/Dropbox/dotfiles/.vim ~/.vim
        "mklink  C:\Users\LatishSehgal\_vimrc C:\Dropbox\dotfiles\.vimrc
        "mklink  C:\Users\LatishSehgal\.vimrc.bundles C:\Dropbox\dotfiles\.vimrc.bundles
        "mklink  C:\Users\LatishSehgal\.vim C:\Dropbox\dotfiles\.vim
    else
        " NeoBundle setup
        set rtp+=~/.vim/bundle/neobundle.vim/
        call neobundle#rc(expand('~/.vim/bundle/'))
        "call neobundle#rc()
        " [.] Vundle setup
        " set rtp+=~/.vim/bundle/vundle/
        " call vundle#rc()
    endif

    " Installation check. Adds helpfiles
    NeoBundleCheck
    source $VIMRUNTIME/macros/matchit.vim
endif
"set rtp+=C:\Dropbox\Programs\Vim\vimfiles\bundle\vundle\
"call vundle#rc('C:\Dropbox\Programs\Vim\vimfiles\bundle\')
"}}}1
" [2] NeoBundle stuff{{{1
" -----------------------------------------------------------------------------
" Active plugins {{{2
" ------------------------------------------- "
" NeoBundle Setup: Let NeoBundle manage NeoBundle {{{3
NeoBundleFetch 'Shougo/neobundle.vim'
" [.] Vundle Setup
" let Vundle manage Vundle - required!
"Bundle 'gmarik/vundle'

" original repos on github
"
" Recommended to install
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundle 'Shougo/unite.vim'
" ------------------------------------------}}}3
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Lokaltog/vim-powerline'
"NeoBundle 'bling/vim-airline'
NeoBundle 'mhinz/vim-startify'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-dispatch.git'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'kshenoy/vim-signature'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'xolox/vim-misc'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'arecarn/crunch'
NeoBundle 'utl.vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'triglav/vim-visual-increment'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'sjl/gundo.vim'
" ------------------------------------------- "
" vim-scripts repos
" ------------------------------------------- "
NeoBundle 'vim-scripts/vimwiki.git'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-scripts/kwbdi.vim'
NeoBundle 'vim-scripts/VOoM'
NeoBundle 'vim-scripts/Auto-Pairs'
NeoBundle 'vim-scripts/LanguageTool'
NeoBundle 'vim-scripts/IndexedSearch'
NeoBundle 'vim-scripts/xoria256.vim'
NeoBundle 'vim-scripts/BufOnly.vim'
if v:version>703
    NeoBundle 'airblade/vim-gitgutter'
    NeoBundle 'myusuf3/numbers.vim'
    NeoBundle 'pydave/AsyncCommand'
    NeoBundle 'tomtom/checksyntax_vim'
    NeoBundle 'tomasr/molokai'
    NeoBundle 'vim-scripts/Wombat'
endif

" ------------------------------------------- "
" Lazy loading
" ------------------------------------------- "
NeoBundleLazy 'klen/python-mode'
    autocmd FileType python NeoBundleSource python-mode
NeoBundleLazy 'jcfaria/Vim-R-plugin'
    autocmd FileType r NeoBundleSource Vim-R-plugin
NeoBundleLazy 'JuliaLang/julia-vim'
    autocmd FileType julia NeoBundleSource julia-vim
" Latex modules
if v:version>703
    "NeoBundleLazy 'jcf/vim-latex'
    "NeoBundle 'sourceforge.net/p/vim-latex/vim-latex'
    NeoBundleLazy 'git://git.code.sf.net/p/vim-latex/vim-latex'
        autocmd FileType tex,latex NeoBundleSource vim-latex
    NeoBundleLazy 'matze/vim-tex-fold'
        autocmd FileType tex,latex NeoBundleSource vim-tex-fold
else
    NeoBundleLazy 'jcf/vim-latex'
        autocmd FileType tex,latex NeoBundleSource vim-latex
    "NeoBundle 'sourceforge.net/p/vim-latex/vim-latex'
    "NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
    NeoBundleLazy 'matze/vim-tex-fold'
        autocmd FileType tex,latex NeoBundleSource vim-tex-fold
endif
"}}}2
" Not currently used plugins {{{2
" ------------------------------------------- "
"NeoBundle 'jlanzarotta/bufexplorer'
"NeoBundle 'vim-scripts/taglist.vim'
"NeoBundle 'andviro/flake8-vim'
    "autocmd FileType python NeoBundleSource flake8-vim
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'vim-scripts/mru.vim'
"NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'xolox/vim-session'
"Bundle 'dockyard/vim-easydir'
"Bundle 'bling/vim-airline'
"Bundle 'noah/vim256-color'
"Bundle 'vim-scripts/matchit.zip'
"Bundle 'rstacruz/sparkup'
"Bundle 'vim-scripts/L9'
"Bundle 'xolox/vim-shell'
"Bundle 'vim-scripts/ScrollColors'
"Bundle 'prendradjaja/vim-vertigo'
"Bundle 'vim-scripts/vim-toggle-wrap'
"Bundle 'vim-scripts/Vim-Support'
"Bundle 'mikewest/vimroom.git'
"Bundle 'tpope/vim-endwise'
"Bundle 'stephenmckinney/vim-solarized-powerline.git'
"Bundle 'xolox/vim-notes'
"Bundle 'matthias-guenther/hammer.vim'
"Bundle 'tpope/vim-fugitive'
"Bundle 'wincent/command-t'
"Bundle 'tpope/vim-rails.git'
"Bundle 'mileszs/ack.vim'
" Vim-signature has the marks inside"
"Bundle 'paradigm/vim-multicursor'
"Bundle 'fisadev/FixedTaskList.vim'
"Bundle 'hlissner/vim-multiedit'
"Bundle 'junegunn/vim-scroll-position'
"Bundle 'jamestomasino/vim-writeroom.git'
"Bundle 'beloglazov/vim-online-thesaurus'
"Bundle 'itchyny/thumbnail.vim'
"Bundle 'Twinside/vim-codeoverview'
"Bundle 'vim-scripts/FuzzyFinder'
"Bundle 'vim-scripts/Bookmarking'
" ------------------------------------------- "
" non github repos
" ------------------------------------------- "
" Causes error when :BundleInstall
"Bundle 'buffdelete'
"Bundle 'hicursorwords'
" Can't load rubygems for some reason
" }}}2
" Allow plugins by file type {{{2
filetype plugin on
filetype indent on
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"}}}2
"}}}1
" [3] Plugin options {{{1
" Tasklist {{{2
" [1] http://www.vim.org/scripts/script.php?script_id=2607
    noremap T :TaskList<CR>
    noremap TT :TlistToggle<CR>
"}}}2
" Wildfire {{{2
" [1] https://github.com/gcmt/wildfire.vim
    " This selects the next closest text object.
    let g:wildfire_fuel_map = "<S-ENTER>"

    " This selects the previous closest text object.
    let g:wildfire_water_map = "<BS>"
    "let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]
"}}}2
" Vim-airline {{{2
    "if !exists('g:airline_symbols')
        "let g:airline_symbols = {}
    "endif
    "" vim-powerline symbols
    ""let g:airline_powerline_fonts=1
    ""let g:airline_left_sep = '⮀'
    ""let g:airline_left_alt_sep = '⮁'
    ""let g:airline_right_sep = '⮂'
    ""let g:airline_right_alt_sep = '⮃'
    ""let g:airline_fugitive_prefix = '⭠'
    ""let g:airline_readonly_symbol = '⭤'
    ""let g:airline#extensions#branch#symbol = '⭠'
    ""let g:airline#extensions#readonly#symbol = '⭤'
    ""let g:airline_linecolumn_prefix = '⭡'
    ""let g:airline_branch_symbol = '⭠'
    ""
    "let g:airline_theme='powerlineish'
    "let g:airline_detect_whitespace=0
    "let g:airline_powerline_fonts=1
    "let g:airline_section_gutter=""
    "let g:airline_enable_branch     = 1
    "let g:airline_enable_syntastic  = 0
    ""let g:airline#extensions#tabline#enabled = 1

    "" old vim-powerline symbols
    "let g:airline_left_sep = '⮀'
    "let g:airline_left_alt_sep = '⮁'
    "let g:airline_right_sep = '⮂'
    "let g:airline_right_alt_sep = '⮃'
    "let g:airline_symbols.branch = '⭠'
    "let g:airline_symbols.readonly = '⭤'
    "let g:airline_symbols.linenr = '⭡'
""    }}}2
" Vim Git Gutter {{{2
    let g:gitgutter_enabled = 0
"}}}2
"Nerdtree {{{2
    if has('gui_running')
        let g:NERDTreeDirArrows=1
    else
        let g:NERDTreeDirArrows=0
    endif
    let g:NERDChristmasTree=1
    "let NERDTreeShowLineNumbers=1
"}}}2
" Vim latexsuite {{{2
    " IMPORTANT: grep will sometimes skip displaying the file name if you
    " search in a single file. This will confuse Latex-Suite. Set your grep
    " program to always generate a file-name.
    " Info for forward/backward search from:
    "http://scturtle.me/2013/1/22/forward-inverse-search/
    "
    set grepprg=grep\ -nH\ $*

    " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
    " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
    " The following changes the default filetype back to 'tex':
    " Compiler and viewer settings
    let g:tex_flavor='latex'
    let g:Tex_PackagesMenu = 0  "tex package scanning. This reduces startup time.
    "
    let g:Tex_DefaultTargetFormat='pdf'
    let g:Tex_MultipleCompileFormats='pdf'
    "
    let g:Tex_CompileRule_pdf='pdflatex -synctex=-1 -src-specials -interaction=nonstopmode $*'
    "
    "let g:Tex_ViewRule_pdf ='C:\Program Files (x86)\SumatraPDF\SumatraPDF  -reuse-instance'
    if has('win32') || has('win64')
        let g:Tex_ViewRule_pdf='C:\Program Files (x86)\SumatraPDF\SumatraPDF -reuse-instance -inverse-search "gvim -c \":RemoteOpen +\%l \%f\""'
    endif
    let g:Tex_GotoError=0
    let g:tex_fast= "bcMrsvV"
    "p...parts,section,chapter makes latex-syntax highlighting very SLOW!!
    "let g:tex_fast= "bcmMprsvV"
    "let g:tex_fast= ""
    "let g:Tex_ViewRule_pdf ='C:\Program Files (x86)\Foxit Software\Foxit Reader\Foxit Reader'
    " ----
    if v:version>703
        set conceallevel=0
    endif
    "let g:tex_conceal="adgm"
    "a = conceal accents/ligatures
    "d = conceal delimiters
    "g = conceal Greek
    "m = conceal math symbols
    "s = conceal superscripts/subscripts
    " ----
    "  Folding
    let g:Tex_FoldedEnvironments="frame"

    " TIP: if you write your \label's as \label{fig:something}, then if you
    " type in \ref{fig: and press <C-n> you will automatically cycle through
    " all the figure labels. Very useful!
    set iskeyword+=:
"}}}2
" vim-tex-fold {{{2
    let g:tex_fold_override_foldtext = 0
    "if has('win32') || has('win64')
        "let g:tex_fold_sec_char = ''
    "else
        "let g:tex_fold_sec_char = ''
    "endif
    "if has('gui_running')
        "let g:tex_fold_env_char = '▼'
    "else
        "let g:tex_fold_env_char = '>'
    "endif
    " Set this to 1, otherwise the triple-brace markers are not recognized!
    let g:tex_fold_allow_marker = 1
    "cchar=●→▲←↓↑▼ ▾▸■□▼◘◙↓→↔↕❶❷❸❹❺❻❼❽❾❿ ⮀⮁⮂⮃⭤⭠
    "}}}2
" Python plugin {{{2
    let g:pymode_lint_write=0     " Disable pylint checking every save
    " Set key 'R' for run python code
    let g:pymode_run_key='R'
"}}}2
" Startify {{{2
    if hostname()=="econ01"
        let g:startify_session_dir    = '~/.sessions'
    else
        let g:startify_session_dir    = 'C:\Dropbox\Programs\Vim\sessions'
    endif

    let g:startify_bookmarks      = [ '~/.vimrc' ]
    let g:startify_show_sessions  = 1
    let g:startify_change_to_dir  = 1
    let g:startify_enable_special = 0
    let g:startify_custom_header = [
                \ '                    __      __              ______ _  _     ',
                \ '                    \ \    / (_)           |____  | || |    ',
                \ '                     \ \  / / _ _ __ ___       / /| || |_   ',
                \ '                      \ \/ / | | ''_  `_ \     / / |__   _| ',
                \ '                       \  /  | | | | | | |   / /     | |    ',
                \ '                        \/   |_|_| |_| |_|  /_(_)    |_|    ',
                \ '                 ',
                \ '                               VIM - Vi IMproved',
                \ '                             by Bram Moolenaar et al.',
                \ '                    Type :help iccf<Enter> for information',
                \ '                 ',
                \ ]
    if has('gui_running')
        let g:startify_list_order = [
            \ [' ▸ Recently opened files:'],
            \ 'files',
            \ [' ▸ Recently modified files in current directory:'],
            \ 'dir',
            \ [' ▸ Sessions:'],
            \ 'sessions',
            \ [' ▸ Bookmarks:'],
            \ 'bookmarks']
    else
        let g:startify_list_order = [
            \ [' :> Recently opened files:'],
            \ 'files',
            \ [' :> Recently modified files in current directory:'],
            \ 'dir',
            \ [' :> Sessions:'],
            \ 'sessions',
            \ [' :> Bookmarks:'],
            \ 'bookmarks']
    endif
    "cchar=●→▲←↓↑▼ ▾▸■□▼◘◙↓→↔↕❶❷❸❹❺❻❼❽❾❿ ⮀⮁⮂⮃⭤⭠
    "-----------------------------------
        "}}}2
" Vim Languagetool - grammar check {{{2
    if has('win32') || has('win64')
        let g:languagetool_jar='C:/Programs/LanguageTool-2.2/languagetool-commandline.jar'
    endif
    "}}}2
" Turn on supertab for autocompletion with omnicompletion {{{2
    let g:SuperTabDefaultCompletionType="<C-X><C-O>"
    let g:SuperTabDefaultCompletionType="context"
    "}}}2
" Tagbar plugin {{{2
    if has('win32') || has('win64')
        let g:tagbar_ctags_bin='C:/Programs/ctags58/ctags.exe'
        let g:tagbar_iconchars = ['▸', '▾']
        "cchar=●→▲←↓↑▼ ▾▸■□▼◘◙↓→↔↕❶❷❸❹❺❻❼❽❾❿ ⮀⮁⮂⮃⭤⭠
    endif
    let g:tagbar_width=30
        "}}}2
" Vim Languagetool - grammar check {{{2
    if has('win32') || has('win64')
        let g:languagetool_jar='C:/Programs/LanguageTool-2.2/languagetool-commandline.jar'
    endif
    "}}}2
" Turn on supertab for autocompletion with omnicompletion {{{2
    let g:SuperTabDefaultCompletionType="<C-X><C-O>"
    let g:SuperTabDefaultCompletionType="context"
    "}}}2
    "}}}2
"" Vim session {{{2
    "" Vim session directory
    "if hostname()=="econ01"
       "let g:session_directory='~/.sessions'
    "else
       "let g:session_directory='C:\Dropbox\Programs\Vim\sessions'
    "endif
    "" Do not autoload last saved session and don't prompt for it"
    "let g:session_autoload='no'
    "if has('win32') || has('win64')
       "let g:session_autosave='yes'
    "else
       "let g:session_autosave='no'
"    endif
"}}}2
"" CtrlP {{{2
    "let g:ctrlp_map = '<c-p>'
    "let g:ctrlp_cmd = 'CtrlP'
    "let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$',
  "\ 'file': '\.exe$\|\.so$\|\.dat$'
  "\ }
""}}}2
"}}}1
" [4] User Functions {{{1
    if !exists("*MyConceal") "{{{2
        if version>703
            function MyConceal()
                hi jFoldMark ctermbg=Black ctermfg=White guibg=#202020 guifg=#FF0000
                "highlight Conceal term=underline ctermbg=Black ctermfg=Green guibg=#262626 guifg=#FFA500
                highlight Conceal term=underline ctermbg=Black ctermfg=Green guibg=#262626 guifg=#008000
                syn match jFoldMark "\v\{\{\{1" display containedin=ALL conceal cchar=❶
                syn match jFoldMark "\v(\"|!|\%|//|#)\}\}\}1" display containedin=ALL conceal cchar=❶
                syn match jFoldMark "\v\{\{\{2" display containedin=ALL conceal cchar=❷
                syn match jFoldMark "\v(\"|!|\%|//|#)\}\}\}2" display containedin=ALL conceal cchar=❷
                syn match jFoldMark "\v\{\{\{3" display containedin=ALL conceal cchar=❸
                syn match jFoldMark "\v(\"|!|\%|//|#)\}\}\}3" display containedin=ALL conceal cchar=❸
                syn match jFoldMark "\v\{\{\{4" display containedin=ALL conceal cchar=❹
                syn match jFoldMark "\v(\"|!|\%|//|#)\}\}\}4" display containedin=ALL conceal cchar=❹
                syn match jFoldMark "\v\{\{\{5" display containedin=ALL conceal cchar=❺
                syn match jFoldMark "\v(\"|!|\%|//|#)\}\}\}5" display containedin=ALL conceal cchar=❺
                "cchar=●→▲←↓↑▼ ▾▸■□▼◘◙↓→↔↕❶❷❸❹❺❻❼❽❾❿ ⮀⮁⮂⮃⭤⭠
                set conceallevel=2
            endfunction
        else
            function MyConceal()
                "Do nothing
            endfunction
        endif
    endif "}}}2
    if !exists("*TabLeft") "{{{2
        function TabLeft()
            let tab_number = tabpagenr() - 1
            if tab_number == 0
                execute "tabm" tabpagenr('$') - 1
            else
                execute "tabm" tab_number - 1
            endif
        endfunction
    endif "}}}2
    if !exists("*TabRight") "{{{2
        function TabRight()
            let tab_number = tabpagenr() - 1
            let last_tab_number = tabpagenr('$') - 1
            if tab_number == last_tab_number
                execute "tabm" 0
            else
                execute "tabm" tab_number + 1
            endif
        endfunction
    endif "}}}2
    if !exists("*MyDiff") "{{{2
        function MyDiff()
            let opt = ''
            if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
            if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
            silent execute '!"'.$VIMRUNTIME.'\diff" -a ' . opt . v:fname_in . ' ' . v:fname_new . ' > ' . v:fname_out
        endfunction
    endif
    set diffexpr=MyDiff() "}}}2
    if !exists("*RemoveM") "{{{2
        " Removes the ^M character from the end of every line
        function! RemoveM()
            execute '%s/\r\(\n\)/\1/g'
        endfunction
    endif "}}}2
    if !exists("*MyRound") "{{{2
        " Rounds numbers to 2 digits after comma
        function! MyRound()
            execute '%s/\d\+\.\d\+/\=printf(\'%.2f\',str2float(submatch(0)))/g'
        endfunction
    endif "}}}2
    if !exists("*NeatFoldText") "{{{2

        if has('gui_running')
            function! NeatFoldText()
                let line = ' ' . substitute(getline(v:foldstart),
                        \ ('^\s*\(["!#%]\|//\)\?\s*\|\s*\(["!#%]\|//\)\?\s*{{' . '{\d*\s*')
                        \ , '', 'g') . ' '
                let lines_count = v:foldend - v:foldstart + 1
                let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
                let foldchar = matchstr(&fillchars, 'fold:\zs.')
                let foldtextstart = strpart('⮀' . repeat('⮁', v:foldlevel*1) . line, 0, (winwidth(0)*2)/3)
                let foldtextend = lines_count_text . repeat(foldchar, 8)
                let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
                return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
            endfunction
            "cchar=●→▲←↓↑▼ ▾▸■□▼◘◙↓→↔↕❶❷❸❹❺❻❼❽❾❿ ⮀⮁⮂⮃⭤⭠
        else
            function! NeatFoldText()
                let line = ' ' . substitute(getline(v:foldstart),
                        \ ('^\s*\(["!#%]\|//\)\?\s*\|\s*\(["!#%]\|//\)\?\s*{{' . '{\d*\s*')
                        \ , '', 'g') . ' '
                let lines_count = v:foldend - v:foldstart + 1
                let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
                let foldchar = matchstr(&fillchars, 'fold:\zs.')
                let foldtextstart = strpart('|' . repeat('>', v:foldlevel*1) . line, 0, (winwidth(0)*2)/3)
                let foldtextend = lines_count_text . repeat(foldchar, 8)
                let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
                return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
            endfunction
            "cchar=●→▲←↓↑▼ ▾▸■□▼◘◙↓→↔↕❶❷❸❹❺❻❼❽❾❿ ⮀⮁⮂⮃⭤⭠
        endif
    endif

    set foldtext=NeatFoldText() "}}}2
"}}}1
" [5] Other option settings {{{1
    ":command! -nargs=+ Calc :py print <args>
    ":py from math import *

    " Change working directory to current file directory (except for files in tmp)
    autocmd! BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

    " change the mapleader from \ to ,
    let mapleader=","
    retab
    set diffopt=filler
"}}}1
" [6] General settings {{{1

    set hidden
    set nobackup
    set noswapfile

    " For Python style programming
    " set wrap linebreak nolist " softwrap, doesn't break words
    set nowrap
    set tabstop=4       " a tab is four spaces
    set backspace=indent,eol,start
    " allow backspacing over everything in insert mode
    set autoindent      " autoindent always set autoindenting on
    set copyindent      " copy the previous indentation on autoindenting
    set shiftwidth=4    " number of spaces to use for autoindenting
    set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
    set showmatch       " set show matching parenthesis
    set ignorecase      " ignore case when searching
    set smartcase       " ignore case if search pattern is all lowercase,
    "    case-sensitive otherwise
    set smarttab        " insert tabs on the start of a line according to
    "    shiftwidth, not tabstop
    set hlsearch        " highlight search terms
    set incsearch       " show search matches as you type

    set expandtab
    set softtabstop=4
    let fortran_free_source = 1
    syntax enable
    set nuw=5
    set tabpagemax=30

    set history=1000         " remember more commands and search history
    set undolevels=1000      " use many muchos levels of undo
    set wildignore=*.swp,*.bak,*.pyc,*.class
    " Enable the title string
    set title                " change the terminal's title
    " configure title to look like: /path/to/file
    set titlestring=\ %-25.140F\ %a%r%m titlelen=140
    "
    set visualbell           " don't beep
    set noerrorbells         " don't beep

    set cmdheight=1 " height of command line
    " 0: Never show status line
    " 1: only show status line if there is more than 1 window
    " 2: always show status line
    set number " enable line numbers
    let g:enable_numbers=0 " Numbers toggle - turn off relative line numbers. Turn on with F3"
    set linespace=0 " Pixels of space between lines
    set thesaurus+=C:\Dropbox\Bib\mthesaur.txt
    "
    set lines=999 columns=118
    set textwidth=79             " Line length before wrapping

    set cursorline               " turn on highlight for active line
    set nowinfixwidth            " :set winfixwidth -->fixed window size so nerdtree etc. does not shrink active window
    set mousehide           " Hide the mouse when typing text
    let c_comment_strings=1 " I like highlighting strings inside C comments
    "
    set encoding=utf-8
    set wildmenu            " visual autocomplete for command menu
    set lazyredraw          " redraw only when we need to.
"}}}1
"                                                                              "
" [7] GUI vs. Terminal configuration {{{1
if has('gui_running')
    " ----------------------------------
    " GUI version
    " ----------------------------------
    if hostname()=="BR962"
        set guifont=Consolas\ for\ Powerline\ FixedD:b:h13
    elseif has('gui_gtk2')
        set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
    else
        set guifont=Consolas\ for\ Powerline\ FixedD:b:h10
        "set gfn=Lucida_Sans_Typewriter_Regular:h10:b:cANSI
    endif

    " Set winpos after setting guifont, so window can be reset and put in right
    " place !!!
    "
    " We need both!!
    " On starting vim we need autocmd
    autocmd GUIEnter * winpos 0 30
    " This is for everytime vc file is refreshed
    winpos 0 30

    let g:Powerline_symbols="fancy"
    set laststatus=2
    colorscheme xoria256
    "colorscheme sorcerer
    "colorscheme fu

    " -----------------------------
    " Set GUI options, like having tabs etc.
    " -----------------------------
    " m = Menubar
    " T = Toolbar
    " t = tearoff menus
    " a = autoselect "this overwrite clipboard register * or + with visual selection
    " A = -"- only for modeless
    " c = use console dialogs
    " f = foreground
    " g = Grey Menu Items
    " i = Icon
    " v = buttons are vertical
    " e = tabs in gui
    " This has to be set early
    " r = show right scroll bar
    " L = show left scrollbar on split
    " i = icon
    set guioptions=ftigre

    " Gui tab label definition
    " -----------------------------
    set guitablabel=\[%N\]\ %t\ %M

    "" Autocommand filetype specific -> buffer enter {{{2
    "augroup configgroup
        "autocmd! BufEnter,BufNewFile *.do,*.ado
            "\ setlocal nowrap |
            "\ setlocal formatoptions-=t |
            "\ call MyConceal()
            ""\ set gfn=Consolas\ for\ Powerline\ FixedD:b:h11 |
            ""\ let g:Powerline_symbols="fancy" |
            ""\ set t_Co=256 |
            ""\ set laststatus=2 |
            ""\ highlight ColorColumn ctermbg=235 guibg=#262626
        "autocmd! BufEnter,BufNewFile *.tex
            "\ highlight Conceal cterm=NONE ctermbg=NONE ctermfg=darkblue guibg=NONE guifg=NONE |
            "\ hi SignColumn  ctermfg=235 guifg=#202020 guibg=#202020 |
            "\ hi Folded guifg= #C5C5BF guibg=#3C3C59 |
            "\ hi ColorColumn ctermbg=235 guibg=#262626
            ""\ set regexpengine=1
            ""\ set gfn=Consolas\ for\ Powerline\ FixedD:b:h11 |
            ""\ let g:Powerline_symbols="compatible" |
            ""\ set t_Co=256 |
            ""\ set laststatus=2 |
            ""\ colorscheme elflord |
        "autocmd! BufEnter,BufNewFile *.f90,*.f95,*.f77
            "\ retab |
            "\ !write |
            "\ IndentGuidesEnable |
            "\ call MyConceal()
            ""\ set encoding=utf-8 |
            ""\ set guifont=Consolas\ for\ Powerline\ FixedD:b:h11 |
            ""\ let g:Powerline_symbols="fancy" |
            ""\ set t_Co=256 |
            ""\ set laststatus=2 |
            ""\ highlight ColorColumn ctermbg=235 guibg=#262626 |
            ""\ highlight SignColumn  ctermfg=235 guifg=#262626
        "autocmd! BufEnter,BufNewFile *.m,*.r
            "\ retab |
            "\ IndentGuidesEnable |
            "\ call MyConceal()
            ""\ set gfn=Consolas\ for\ Powerline\ FixedD:b:h11 |
            ""\ let g:Powerline_symbols="fancy" |
            ""\ set t_Co=256 |
            ""\ set laststatus=2 |
            ""\ highlight ColorColumn ctermbg=235 guibg=#262626
        "autocmd! BufEnter,BufNewFile *.sh
            "\ call MyConceal()
            ""\ colorscheme zmrok |
            ""\ set gfn=Consolas\ for\ Powerline\ FixedD:b:h11 |
            ""\ let g:Powerline_symbols="fancy" |
            ""\ set t_Co=256 |
            """\ set laststatus=2 |
            ""\ highlight ColorColumn ctermbg=235 guibg=#262626
        ""autocmd! BufLeave *.do,*.ado,*.tex,*.f90,*.f95,*.f77,*.sh,*.m
            ""set wrap |
            ""set formatoptions+=t
            ""\ set encoding=utf-8 |
            ""\ set guifont=Consolas\ for\ Powerline\ FixedD:b:h11 |
            ""\ let g:Powerline_symbols="fancy" |
            ""\ set t_Co=256 |
            ""\ set laststatus=2 |
            ""\ highlight ColorColumn ctermbg=235 guibg=#262626
    "augroup END
    "}}}2
else
    " ----------------------------------
    " Terminal version
    " ----------------------------------
    "let g:Powerline_symbols="fancy"
    set laststatus=2
    set t_Co=256 | colorscheme xoria256
    "
    set guitablabel=\[%N\]\ %t\ %M
    "
    " Switches block cursor to bar cursor in TMUX window
    if exists('$TMUX') " allows cursor change in tmux mode
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif
    "if &term =~ '^xterm'
        "" solid underscore
        "let &t_SI .= "\<Esc>[4 q"
        "" solid block
        "let &t_EI .= "\<Esc>[2 q"
        "" 1 or 0 -> blinking block
        "" 2 -> solid block
        "" 3 -> blinking underscore
        "" 4 -> solid underscore
        "" Recent versions of xterm (282 or above) also support
        "" 5 -> blinking vertical bar
        "" 6 -> solid vertical bar
    "endif

    "" changes the cursor shape/color
    "" in the terminal depending on the mode
    "" see http://code.google.com/p/iterm2/issues/detail?id=710&q=cursor
    "function! SetCursorStyle()
        "if &term =~ "xterm\\|rxvt"
            "" use a | cursor in insert mode
            "let &t_SI = "\<Esc>]50;CursorShape=1\x7"

            "" use a rectangle cursor otherwise
            "let &t_EI = "\<Esc>]50;CursorShape=0\x7"

            "" reset cursor when vim exits
            "autocmd VimLeave * silent !echo -ne "\<Esc>]50;CursorShape=0\x7"
        "endif
    "endfunction
    "call SetCursorStyle()

endif
"}}}1
" [8] GUI and Terminal configuration {{{1
"Custom Colors"
    hi SignColumn  ctermfg=235 guifg=#202020 guibg=#202020
    highlight Folded guifg= #C5C5BF guibg=#3C3C59 "#434363

" Startify color settings, put after calling colorscheme, otherwise it will be
" overwritten
    hi StartifyHeader  guifg=#009900 "#66cc66
    hi StartifyBracket guifg=#878787
    hi StartifyFile    guifg=#cc9966
    hi StartifyNumber  guifg=#cc6633
    hi StartifyPath    guifg=#006699
    hi StartifySlash   guifg=#666666
    hi StartifySpecial guifg=#666666
    hi StartifySection guifg=#b5a771

" Text formatting & display
    if v:version>703
        highlight ColorColumn ctermbg=235 guibg=#262626
        set colorcolumn=80
    endif

"set colorcolumn=+1          " highlight column after 'textwidth'

" For indent_guides plug-in (they mark the tabstops in greyscale)
" Needs to be after colorscheme
    set ts=4 sw=4 et
    let g:indent_guides_start_level= 2
    let g:indent_guides_guide_size = 1
"}}}1
" [9] Autocommands  {{{1
    augroup filetype_vim
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker | call MyConceal()
    augroup END

    augroup filetype_stata
        autocmd!
        autocmd FileType stata setlocal foldmethod=marker | call MyConceal() |
                    \ setlocal textwidth=0 | setlocal nowrap
    augroup END

    augroup filetype_fortran
        autocmd!
        autocmd FileType fortran setlocal foldmethod=marker | call MyConceal() |
                    \ let b:match_words.=',(:)'
    augroup END

    augroup filetype_latex
        autocmd!
        "autocmd FileType latex let b:match_words.=',(:)'
        " This savs the .tex file before it compiles it
        autocmd FileType tex
            \ call Tex_MakeMap('<leader>ll', ':update!<CR>:call Tex_RunLaTeX()<CR>', 'n', '<buffer>')
        autocmd FileType tex
            \ call Tex_MakeMap('<leader>ll', '<ESC>:update!<CR>:call Tex_RunLaTeX()<CR>', 'v', '<buffer>')
    augroup END

    augroup filetype_log
        autocmd FileType log setlocal autoread
    augroup END

    augroup filetype_R
        autocmd!
        autocmd FileType r setlocal foldmethod=marker | call MyConceal()
    augroup END

    augroup filetype_python
        autocmd!
        autocmd FileType python setlocal foldmethod=marker | call MyConceal()
    augroup END

    augroup filetype_matlab
        autocmd!
        autocmd FileType matlab setlocal foldmethod=marker |
                    \ setlocal commentstring=%%s |
                    \ call MyConceal()
    augroup END

" Set the syntax for files that are not immediately recognized
    augroup setFiletype
        autocmd!
        autocmd BufRead,BufNewFile *.md set filetype=markdown | call MyConceal()
        autocmd BufRead,BufNewFile *.rdf set filetype=redif | call MyConceal()
        autocmd BufRead,BufNewFile *.mod set filetype=dynare | call MyConceal()
        autocmd BufRead,BufNewFile *.jl set filetype=julia | call MyConceal()
        autocmd BufRead,BufNewFile *.log set filetype=log
    augroup END

" Deal with whitespace and tabs on saving
    augroup treatWhite
        autocmd!
        autocmd BufWritePre *.py,*.m,*.vimrc,*f90 :%s/\s\+$//e | retab
    augroup END

" Insert mode highlight
    augroup highlightCursorline
        autocmd!
        autocmd InsertEnter * highlight CursorLine guifg=white guibg=grey40
                    \ ctermfg=white ctermbg=darkgray
        autocmd InsertLeave * highlight CursorLine guifg=white guibg=grey25
                    \ ctermfg=white ctermbg=238
    augroup END
"}}}1
"                                                                              "
" [10] User key bindings {{{1
" Quickly get out of insert mode without your fingers having to leave the
" home row (either use 'jj' or 'jk')
    inoremap jk <Esc>

" Enter for zs,zo
    nnoremap <enter> za

" ,cd: Change directory to that of current file
    nnoremap ,cd :cd %:p:h<CR>
    cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Remap j and k to act as expected when used on long, wrapped, lines
    noremap j gj
    noremap k gk

" delete without yanking
    nnoremap <leader>d "_d
    vnoremap <leader>d "_d

" Yank/paste to the OS clipboard with ,y and ,p
    nnoremap <leader>y "*y
    nnoremap <leader>yy "*yy

" gv makes cursor stay at the end of the selection
    vnoremap <leader>y "*ygv<Esc>
    vnoremap y "aygv<Esc>
    nnoremap Y y$
    nnoremap <leader>p "*p
    nnoremap <leader>P "*P

" replace currently selected text with default register without yanking it
    vnoremap p "aP
    vnoremap <leader>p "*P

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
    nnoremap <silent><C-j> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
    nnoremap <silent><C-k> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
    nnoremap <silent><A-j> :set paste<CR>m`o<Esc>``:set nopaste<CR>
    nnoremap <silent><A-k> :set paste<CR>m`O<Esc>``:set nopaste<CR>

" Edit the vimrc file
    nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
    nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Clears the search register
    nnoremap <silent> <leader>/ :nohlsearch<CR>

" Pull word under cursor into LHS of a substitute (for quick search/replace)
    nnoremap <leader>z :%s/\<<C-r>=expand("<cword>")<CR>\>/

" Pull selection into LHS of a substitute (for quick search/replace)
    vnoremap <leader>z y:%s/\<<C-r>=expand("<C-r>0")<CR>\>/

" Shortcuts to pull up search/replace in command line
    noremap ;; :%s/cg<Left><Left>
    noremap ;' :%s/g<Left>

" Quick alignment of text
    inoremap <leader><tab> <C-v><tab>
    nnoremap <leader><tab> bi<C-v><tab><Esc>

    vnoremap < <gv " better indentation that keeps selection
    vnoremap > >gv " better indentation
    nnoremap <leader>al :left<CR>
    nnoremap <leader>ar :right<CR>
    nnoremap <leader>ac :center<CR>

" Turn on horizontal scroll bar when word wrap is off
    nnoremap <silent><expr> <f2> ':set wrap! go'.'-+'[&wrap]."=b\r"

" Creating underline/overline headings for markup languages
" Inspired by http://sphinx.pocoo.org/rest.html#sections
    nnoremap <leader>1 yyPVr=jyypVr=
    nnoremap <leader>2 yyPVr*jyypVr*
    nnoremap <leader>3 yypVr=
    nnoremap <leader>4 yypVr-
    nnoremap <leader>5 yypVr^
    nnoremap <leader>6 yypVr"

" CTRL+s for saving file not working in Putty-Terminal C-q to get back
    inoremap <C-s> <ESC>:w<CR>a
    nnoremap <C-s> :w<CR>
    nnoremap <leader>s :w<CR>

" Call myMakefile to delete aux .tex files
    nnoremap <leader>lc :silent !make -f myMakefile<CR>
    nnoremap <leader>lll :g/\\input{tcilatex}/d<CR><Esc>:w<CR><Esc>
    nnoremap <leader>rr :%s/\d\+\.\d\+/\=printf('%.2f',str2float(submatch(0)))/g<CR>
"}}}1
" [11] Windows, tabs and buffer keybindings {{{1
" Moving tabs around with CRTL+Shift left/right
    inoremap <silent> <C-S-Left>  <C-r>=TabLeft()<CR>
    inoremap <silent> <C-S-Right>  <C-r>=TabRight()<CR>
    nnoremap <silent> <C-S-Left>  :call TabLeft()<CR>
    nnoremap <silent> <C-S-Right> :call TabRight()<CR>

" Switching between tabs like in Browser
    nnoremap <C-S-tab> :tabprevious<cr>
    nnoremap <C-tab> :tabnext<cr>
    inoremap <C-S-tab> <ESC>:tabprevious<cr>i
    inoremap <C-tab> <ESC>:tabnext<cr>i
    nnoremap <C-t> :tabnew<cr>
    inoremap <C-t> <ESC>:tabnew<cr>i

" Cycling through buffers
    nnoremap <S-Tab> :bnext<CR>
    ":nnoremap <S-Tab> :bprevious<CR>

"A list of your buffers can be shown after switching by using the following maps:
    nnoremap <A-n> :bnext<CR>:redraw<CR>:ls<CR>
    nnoremap <A-p> :bprevious<CR>:redraw<CR>:ls<CR>

" Change window size
    "noremap <leader>j :set lines+=1<CR>
    "noremap <leader>k :set lines-=1<CR>
    "noremap <leader>l :set columns+=1<CR>
    "noremap <leader>h :set columns-=1<CR>

" Switch between open splits
    noremap <leader>j <C-W>j
    noremap <leader>k <C-W>k
    noremap <leader>l <C-W>l
    noremap <leader>h <C-W>h
"}}}1
" [12] Plugin Shortcuts {{{1
" Buffer only {{{2
    nnoremap <leader>woo :BufOnly<CR>
"}}}2
" NERDTree settings {{{2
    "Put focus to the NERD Tree with F3 (tricked by quickly closing it and
    "immediately showing it again, since there is no :NERDTreeFocus command)
    "nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>:set columns=120<CR>:winpos 0 30<CR>
    "nnoremap <leader>nn :NERDTreeClose<CR>:set columns=90<CR>:winpos 0 30<CR>
    "nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
    nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
    nnoremap <leader>nn :NERDTreeClose<CR>
"}}}2
" Voom settings {{{2
    "nnoremap <leader>v :Voom latex<CR>:set columns=120<CR>:winpos 0 30<CR>
    "nnoremap <leader>vv :Voomquit<CR>:set columns=90<CR>:winpos 0 30<CR>
    nnoremap <leader>v :Voom latex<CR>
    nnoremap <leader>fv :Voom<CR>
    nnoremap <leader>vv :Voomquit<CR>
"}}}2
" Tabularize {{{2
    "nnoremap <Leader>t= :Tabularize /=<CR>
    vnoremap <Leader>t= :Tabularize /=<CR>
    nnoremap <Leader>t: :Tabularize /:<CR>
    vnoremap <Leader>t: :Tabularize /:<CR>
    vnoremap <Leader>tt :Tabularize /&<CR>
    nnoremap <Leader>t:: :Tabularize /:\zs<CR>
    vnoremap <Leader>t:: :Tabularize /:\zs<CR>
    "nnoremap <Leader>t, :Tabularize /,<CR>
    "vnoremap <Leader>t, :Tabularize /,<CR>
    nnoremap <Leader>t<Bar> :Tabularize /<Bar><CR>
    vnoremap <Leader>t<Bar> :Tabularize /<Bar><CR>
"}}}2
" Rainbow Parenthesis {{{2
" Toggle it on/off
    nnoremap <leader>R :RainbowParenthesesToggle<CR>
"}}}2
" Thesaurus {{{2
    let g:online_thesaurus_map_keys = 0
    nnoremap <leader>k :OnlineThesaurusLookup<CR>
"}}}2
" Powerline color scheme {{{2
    "let g:Powerline_colorscheme='solarized256_dark'
"}}}2
" Vim vertigo {{{2
    nnoremap <silent> <Space>j :<C-U>VertigoDown n<CR>
    vnoremap <silent> <Space>j :<C-U>VertigoDown v<CR>
    onoremap <silent> <Space>j :<C-U>VertigoDown o<CR>
    nnoremap <silent> <Space>k :<C-U>VertigoUp n<CR>
    vnoremap <silent> <Space>k :<C-U>VertigoUp v<CR>
    onoremap <silent> <Space>k :<C-U>VertigoUp o<CR>
"}}}2
" Crunch {{{2
    map <silent> <plug>NoCrunchEvalLine <plug>CrunchEvalLine
    map <silent> <plug>NoCrunchEvalBlock <plug>CrunchEvalBlock
    map <silent> <leader>== <plug>CrunchEvalLineExc
"}}}2
" Utl jumping {{{2
    " Initiate jump, then use CTRL+o and CTRL+i to jump back and forth
    nnoremap <silent> <leader>o :Utl<CR>
"}}}2
" Unite {{{2
    let g:unite_source_history_yank_enable = 1
    let g:unite_data_directory='~/.vim/.cache/unite'
    let g:unite_source_rec_max_cache_files=5000
    let g:unite_enable_start_insert = 1
    let g:unite_split_rule = "botright"
    let g:unite_force_overwrite_statusline = 0
    let g:unite_winheight = 10

    call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
        \ 'ignore_pattern', join([
        \ '\.git/',
        \ 'git5/.*/review/',
        \ 'google/obj/',
        \ ], '\|'))

    " Use the fuzzy matcher for everything
    call unite#filters#matcher_default#use(['matcher_fuzzy'])

    " Use the rank sorter for everything
    call unite#filters#sorter_default#use(['sorter_rank'])

    " Browse open buffers
    nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>

    " Browse recently edited files
    nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>

    " Browse recursive list of all the files under the current working
    " directory (CTRL-P functionvim)
    nnoremap <leader>f :Unite file_rec/async<cr>

    nnoremap <space>/ :Unite grep:.<cr>
    nnoremap <space>y :Unite history/yank<cr>
    nnoremap <silent> <space>p :Unite -start-insert buffer<CR>
    nnoremap <C-h> :Unite -start-insert help<CR>

    autocmd FileType unite call s:unite_settings()

    function! s:unite_settings()
        let b:SuperTabDisabled=1
        "imap <buffer> <C-j> <NOP>
        imap <buffer> <C-j>   <Plug>(unite_select_next_line)
        imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
        imap <silent><buffer><expr> <C-x> unite#do_action('split')
        imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
        imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
        nmap <buffer> <ESC> <Plug>(unite_exit)
    endfunction
"}}}2
"}}}1
" [13] Function keys {{{1
" ctrl + F1: toggle menue bar
    nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" F2: Maximize window
    nnoremap <F2> :simalt ~x<CR>

" Shift F2: Restore window size
    nnoremap <S-F2> :simalt ~r<CR>

" CTRL F2: Calls vimroom plugin toogle
    nnoremap <C-F2> :VimroomToggle<CR>
    "map <C-F2> :call VimWriteRoom()<CR>

" F3: Relative/absolute line numbers toggle
    nnoremap <F3> :NumbersToggle<CR>

" F4: Gundo Toggle
    nnoremap <F5> :GundoToggle<CR>

" F5: Highlight column 79
    "nnoremap <F5> :SnapshotFile<CR>

" F6: Tagbar
    "nnoremap <silent><F6> :TlistToggle<cr>
    nnoremap <silent><F6> :TagbarToggle<cr>

" F7: Find word under in all files in current dir or subdirectories
    "map <F7> :execute "vimgrep /" . expand("<cword>") . "/j **/*." . expand('%:e') <Bar> cw<CR>
    "map <F7> :execute "vimgrep /" . expand("<cword>") . "/j **/*." . expand('%:e')<CR>
    nnoremap <F7> :execute "vimgrep /" . expand("<cword>") . "/j **/*.tmpl **/*.py **/*.cc **/*.c **/*.cxx **/*.cpp **/*.h"<CR><F2><S-F2>

" F8: Switch to tab ball or tabo
    let notabs = 1
    nnoremap <silent> <F8> :let notabs=!notabs<Bar>:if notabs<Bar>
        \ :tabo<Bar>:else<Bar>:tab ball<Bar>:tabn<Bar>:endif<CR>
        \ :set lines=999<CR>:winpos 0 30<CR>

" F9: remove ^M symbols
    nnoremap <F9> :call RemoveM()<cr>

" F10: add time stamp
    nnoremap <F10> a<C-R>=strftime("%m/%d/%Y - %I:%M %p")<CR><Esc>
    inoremap <F10> <C-R>=strftime("%m/%d/%Y - %I:%M %p")<CR>

" F11: start ipython in current     dir
    nnoremap <F11> :silent !start ipython<CR>
    inoremap <F11> <Esc>:silent !start ipython<CR>

" Shift F11: start ipython notebook in current dir
" you can import a python script into the notebook using: load myfile.py
    nnoremap <S-F11> :silent !start ipython notebook<CR>
    inoremap <S-F11> <Esc>:silent !start ipython notebook<CR>

"}}}1
" [14] My macros and abbreviations {{{1
" [1] Put dollar signs around selection
let @1 = 'xi$pa$'

" [2] Macro to put \hline into .tex tables
let @a = 'ggjjjyyjpjjpjjjjpjjjjjpjjjjjjpjjjpjpjjjpjpjpddjjpjpjjjpjjjjpjjjjpjjjjztkkkjjpjpjjjjjkkkpjjjjjjpjpjjpjjjpjjjjpgg'
" [3] Macro shorten table
let @b = 'gg5j3dd2jddjddkddjddkddjjdd3j8ddj2ddji+ji+ji+jddjj2dd:295ddddjjddjjjddj10dd10dd5dddd:18dd3kkp5dd:4p:323dd:9p:2015dd:12p:192dd:32p'

" [3] Macros to reduce table
" --------------------------
" ACA Alternative fiscal policies: AT off
    " Short
    "let @b = 'gg6j3ddj5ddjjdd2j8dd2j2dd6j2dd9j6dd2jdd3j27ddgg11jEElvEEExhxeea:10j5j0eeelveeeeexeea:lveeelxgg4j6ddGkpjdd10k3k2ddGkp10k10k2dd5kpjdd5k3dd5jpdd8j4j3dd8k5kp2jyy3jkp'
    " 2 columns
    let @c = 'ggvG,ttgg3jkeeeeEe25jjjj9l3l2lxeeeeeeeeeheeeeEEEEEEEEEE30jkkxgg20jdd5jjddkkkyyjpggjjEla\textbf{lxEEa}eev7ec\textbf{[2la ACA:save! TableACAAToffShort2Cols.tex'

" Round to 2 digits
"%s/\d\+\.\d\+/\=printf('%.2f',str2float(submatch(0)))/g

" Abbreviations
" -------------
    :abbrev hte the
    :iabbrev hte the
"}}}1
" [2] Put Fold markers {{{1
let @w = '$a {{{1lxxx'
let @e = '0i!}}}1'
"}}}1
