"───────────────────────────────────────────────────────────────────────────────
" Juergen Jung, vimrc and nvimrc file
"───────────────────────────────────────────────────────────────────────────────
" [1] Basics{{{1
"───────────────────────────────────────────────────────────────────────────────
filetype off                   " required!
set nocompatible               " Be iMproved

if has('vim_starting')
    if has('win32') || has('win64')
        let $TMP="C:/temp"
        let $TEMP="C:/temp"
        set directory=.,$TMP,$TEMP
        " So that temp folder can be read from
        "-------------------------------------"
        "source $VIMRUNTIME/mswin.vim
        "behave mswin
        " IMPORTANT: win32 users will need to have 'shellslash' set so that latex
        " can be called correctly.
        "set shellslash
        "set shell=/bin/sh
        "set shell=/bin/bash
        "set shellxquote=
        "-------------------------------------"
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        "set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        "-------------------------------------"
        "" [a] NeoBundle setup "set rtp+=C:\Dropbox\Programs\Vim\vimfiles\bundle\neobundle.vim
        "call neobundle#rc('C:\Dropbox\Programs\Vim\vimfiles\bundle\')

        " [b] Vundle setup
        set rtp+=C:\Dropbox\Programs\Vim\vimfiles\bundle\Vundle.vim\
        call vundle#begin('C:\Dropbox\Programs\Vim\vimfiles\bundle\')
        "older:
        "set rtp+=~/vimfiles/bundle/Vundle.vim/
        "let path='~/vimfiles/bundle'
        "call vundle#rc(path)
        "call vundle#rc('C:\Dropbox\Programs\Vim\vimfiles\bundle\')
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
        "" [a] NeoBundle setup
        "set rtp+=~/.vim/bundle/neobundle.vim/
        "call neobundle#rc(expand('~/.vim/bundle/'))
        " [b] Vundle setup
        set rtp+=~/.vim/bundle/Vundle.vim
        call vundle#begin()
        "set rtp+=~/.vim/bundle/vundle/
        "call vundle#rc()
    endif

    "" [a] NeoBundle - Installation check. Adds helpfiles
    "NeoBundleCheck
    source $VIMRUNTIME/macros/matchit.vim
endif
"set rtp+=C:\Dropbox\Programs\Vim\vimfiles\bundle\vundle\
"call vundle#rc('C:\Dropbox\Programs\Vim\vimfiles\bundle\')
"}}}1
" [2] NeoBundle stuff{{{1
"───────────────────────────────────────────────────────────────────────────────
" [2.1] NeoBundle Setup: Let NeoBundle manage NeoBundle {{{2
"───────────────────────────────────────────────────────────────────────────────
"" [a] NeoBundle Setup
"NeoBundleFetch 'Shougo/neobundle.vim'
" [b] Vundle Setup
" let Vundle manage Vundle - required!
Plugin 'gmarik/Vundle.vim'

" Recommended to install
" For some reason it simply renames the vimprod64.dll and doesn't compile it,
" which then fucks up unite etc. So comment this out for now. JJ: 08-07-2014
"NeoBundle 'Shougo/vimproc.vim', {
"      \ 'build' : {
"      \     'windows' : 'tools\\update-dll-mingw',
"      \     'cygwin' : 'make -f make_cygwin.mak',
"      \     'mac' : 'make -f make_mac.mak',
"      \     'unix' : 'make -f make_unix.mak',
"      \    },
"      \ }
"let vimproc_updcmd = has('win64') ?
"      \ 'tools\\update-dll-mingw 64' : 'tools\\update-dll-mingw 32'
"execute "NeoBundle 'Shougo/vimproc.vim'," . string({
"      \ 'build' : {
"      \     'windows' : vimproc_updcmd,
"      \     'cygwin' : 'make -f make_cygwin.mak',
"      \     'mac' : 'make -f make_mac.mak',
"      \     'unix' : 'make -f make_unix.mak',
"      \    },
"      \ })
"}}}2
"  [2.2] Plugins {{{2
"───────────────────────────────────────────────────────────────────────────────
Plugin 'Lokaltog/vim-powerline'
Plugin 'mhinz/vim-startify'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-dispatch.git'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'kshenoy/vim-signature'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'xolox/vim-misc'
Plugin 'luochen1990/rainbow'
Plugin 'arecarn/crunch'
Plugin 'utl.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'triglav/vim-visual-increment'
Plugin 'sjl/gundo.vim'
Plugin 'mmahnic/vim-flipwords'
Plugin 'godlygeek/tabular'
" ------------------------------------------- "
" vim-scripts repos
" ------------------------------------------- "
Plugin 'vim-scripts/vimwiki.git'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/kwbdi.vim'
Plugin 'vim-scripts/VOoM'
Plugin 'vim-scripts/Auto-Pairs'
Plugin 'vim-scripts/LanguageTool'
Plugin 'vim-scripts/IndexedSearch'
Plugin 'vim-scripts/BufOnly.vim'
Plugin 'vim-scripts/DirDiff.vim'
if v:version>703
    "Plugin 'vim-scripts/xoria256.vim'
    Plugin 'terryma/vim-multiple-cursors'
    Plugin 'ervandew/supertab'
    Plugin 'Lokaltog/vim-easymotion'
    Plugin 'airblade/vim-gitgutter'
    Plugin 'myusuf3/numbers.vim'
    Plugin 'pydave/AsyncCommand'
    Plugin 'tomtom/checksyntax_vim'
    Plugin 'tomasr/molokai'
    Plugin 'vim-scripts/Wombat'
    Plugin 'msanders/snipmate.vim'
    Plugin 'SirVer/ultisnips'
    Plugin 'klen/python-mode'
    Plugin 'vim-scripts/python.vim'
    Plugin 'vim-scripts/python_match.vim'
    "Plugin 'Rykka/clickable.vim'
    "Plugin 'Rykka/riv.vim'
    Plugin 'vim-scripts/vimf90'
    " Latex modules
    Plugin 'matze/vim-tex-fold'
    Plugin 'git://git.code.sf.net/p/vim-latex/vim-latex'
else
    Plugin 'jcf/vim-latex'
endif
"Plugin 'JuliaLang/julia-vim'
"}}}2
" [2.3] Lazy loading plugins {{{2
"───────────────────────────────────────────────────────────────────────────────
" Only works with NeoBundle
"NeoBundleLazy 'matze/vim-tex-fold'
"    autocmd FileType tex,latex NeoBundleSource vim-tex-fold
"if v:version>703
"    NeoBundleLazy 'klen/python-mode'
"        autocmd FileType python NeoBundleSource python-mode
"    NeoBundleLazy 'vim-scripts/python.vim'
"        autocmd FileType python NeoBundleSource python.vim
"    NeoBundleLazy 'vim-scripts/python_match.vim'
"        autocmd FileType python NeoBundleSource python_match.vim
"    "NeoBundleLazy 'ivanov/vim-ipython'
"        "autocmd FileType python NeoBundleSource vim-ipython
"    NeoBundleLazy 'jcfaria/Vim-R-plugin'
"        autocmd FileType r NeoBundleSource Vim-R-plugin
"    NeoBundleLazy 'JuliaLang/julia-vim'
"        autocmd FileType julia NeoBundleSource julia-vim
"    NeoBundleLazy 'Rykka/riv.vim'
"        autocmd FileType rst NeoBundleSource riv-vim
"    NeoBundleLazy 'vim-scripts/vimf90'
"        autocmd FileType fortran NeoBundleSource vimf90
"    " Latex modules
"    "NeoBundleLazy 'jcf/vim-latex'
"    "NeoBundle 'sourceforge.net/p/vim-latex/vim-latex'
"    NeoBundleLazy 'git://git.code.sf.net/p/vim-latex/vim-latex'
"        autocmd FileType tex,latex NeoBundleSource vim-latex
"else
"    NeoBundleLazy 'jcf/vim-latex'
"        autocmd FileType tex,latex NeoBundleSource vim-latex
"    "NeoBundle 'sourceforge.net/p/vim-latex/vim-latex'
"    "NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
"endif
"
"}}}2
" [2.4] Not currently used plugins {{{2
"───────────────────────────────────────────────────────────────────────────────
"Plugin 'kien/rainbow_parentheses.vim'
"Plugin 'jcfaria/Vim-R-plugin'
"Plugin 'vim-scripts/DirDiff.vim'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'honza/vim-snippets'
"NeoBundle 'bling/vim-airline'
"NeoBundle '29decibel/codeschool-vim-theme'
"NeoBundle 'jlanzarotta/bufexplorer'
"NeoBundle 'vim-scripts/taglist.vim'
"NeoBundle 'andviro/flake8-vim'
"autocmd FileType python NeoBundleSource flake8-vim
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'vim-scripts/mru.vim'
"NeoBundle 'kien/ctrlp.vim'
"NeoBundle 'xolox/vim-session'
"Bundle 'xolox/vim-shell'
"Bundle 'xolox/vim-notes'
"Bundle 'dockyard/vim-easydir'
"Bundle 'bling/vim-airline'
"Bundle 'noah/vim256-color'
"Bundle 'vim-scripts/matchit.zip'
"Bundle 'rstacruz/sparkup'
"Bundle 'vim-scripts/L9'
"Bundle 'vim-scripts/ScrollColors'
"Bundle 'prendradjaja/vim-vertigo'
"Bundle 'vim-scripts/vim-toggle-wrap'
"Bundle 'vim-scripts/Vim-Support'
"Bundle 'mikewest/vimroom.git'
"Bundle 'tpope/vim-endwise'
"Bundle 'stephenmckinney/vim-solarized-powerline.git'
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
" [2.5] Allow plugins by file type {{{2
"───────────────────────────────────────────────────────────────────────────────
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"filetype plugin on
"filetype indent on
" Brief help
"  --------------------------------------------
" PluginList          - list configured bundles
" PuginUpdate         - PluginUpdate
" PluginInstall(!)    - install(update) bundles
" PluginSearch(!) foo - search(or refresh cache first) for foo
" PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"}}}2
"}}}1
" [4] User Functions {{{1
"───────────────────────────────────────────────────────────────────────────────
    if !exists("*MyConceal") "{{{2
        if version>703
            function MyConceal()
                hi jFoldMark ctermbg=Black ctermfg=White guibg=#202020 guifg=#FF0000
                "highlight Conceal term=underline ctermbg=Black ctermfg=Green guibg=#2e2e2e guifg=#FFA500
                highlight Conceal term=underline ctermbg=Black ctermfg=Green guibg=#2e2e2e guifg=#4682B4
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
                syn match jFoldMark "\v(#)end" display containedin=ALL conceal cchar=■
                syn match jFoldMark "\v(\"|!|#)_" display containedin=ALL conceal cchar=_
                syn match jFoldMark "\v(\"|!|#|\/\/)—" display containedin=ALL conceal cchar=—
                syn match jFoldMark "\v(\"|!|#)─" display containedin=ALL conceal cchar=─
                "syn match jFoldMark "\v(\/\/)" display containedin=ALL conceal cchar=‖
                "cchar=●→▲←↓↑▼ ▾▸■□▼◘◙↓→↔↕❶❷❸❹❺❻❼❽❾❿ ⮀⮁⮂⮃⭤⭠
                set conceallevel=2
            endfunction
        else
            "Do nothing
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
            let opt = '-a --binary '
            if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
            if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
            let arg1 = v:fname_in
            if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
            let arg2 = v:fname_new
            if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
            let arg3 = v:fname_out
            if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
            if $VIMRUNTIME =~ ' '
                if &sh =~ '\<cmd'
                if empty(&shellxquote)
                    let l:shxq_sav = ''
                    set shellxquote&
                endif
                let cmd = '"' . $VIMRUNTIME . '\diff"'
                else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
                endif
            else
                let cmd = $VIMRUNTIME . '\diff'
            endif
            silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
            if exists('l:shxq_sav')
                let &shellxquote=l:shxq_sav
            endif
        endfunction
    "    "function MyDiff()
    "    "    let opt = ''
    "    "    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    "    "    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    "    "    silent execute '!"'.$VIMRUNTIME.'\diff" -a ' . opt . v:fname_in . ' ' . v:fname_new . ' > ' . v:fname_out
    "    "endfunction
    endif
    set diffexpr=MyDiff() "}}}2
    if !exists("*RemoveM") "{{{2
        " Removes the ^M character from the end of every line
        function! RemoveM()
            execute '%s/\r\(\n\)/\1/g'
        endfunction
    endif "}}}2
    if !exists("*MyRound1") "{{{2
        " Rounds numbers to 2 digits after comma
        function! MyRound1()
            execute '%s/\d\+\.\d\+/\=printf("%.2f",str2float(submatch(0)))/g'
        endfunction
    endif "}}}2
    if !exists("*MyRound2") "{{{2
        " Rounds numbers to 2 digits after comma
        function! MyRound2()
            execute '%s/\.\d\+/\=printf("%.2f",str2float(submatch(0)))/g'
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
    if !exists("*MakePweave2Html") "{{{2
        " First transforms Pweave file .Pnw into a reST .rst file
        " Then calls make html in the parent directory to build .html files
        function! MakePweave2Html()
            execute 'cd %:p:h'
            execute 'write!'
            execute '! Pweave -f sphinx --figure-directory=_static %'
            execute 'cd..'
            execute 'make html'
            execute 'cd %:p:h'
        endfunction
    endif "}}}2
    if !exists("*MakePweave2HtmlSilent") "{{{2
        " First transforms Pweave file .Pnw into a reST .rst file
        " Then calls make html in the parent directory to build .html files
        function! MakePweave2HtmlSilent()
            execute 'cd %:p:h'
            execute 'write!'
            execute 'silent ! Pweave -f sphinx --figure-directory=_static %'
            execute 'cd..'
            execute 'silent make html'
            execute 'cd %:p:h'
        endfunction
    endif "}}}2
    if !exists("*SetWinPos") "{{{2
        " Saves window position and then resets it
        function! SetWinPos()
            let g:winpos_x1 = getwinposx()
            let g:winpos_y1 = 30
            exec ':winpos ' . g:winpos_x1 . ' ' . g:winpos_y1
        endfunction
    endif "}}}2
"}}}1
" [3] Plugin options {{{1
"───────────────────────────────────────────────────────────────────────────────
" [3.1] Tasklist {{{2
"───────────────────────────────────────────────────────────────────────────────
" http://www.vim.org/scripts/script.php?script_id=2607
    noremap T :TaskList<CR>
    noremap TT :TlistToggle<CR>
"}}}2
" [3.2] Wildfire {{{2
"───────────────────────────────────────────────────────────────────────────────
" https://github.com/gcmt/wildfire.vim
    " This selects the next closest text object.
    let g:wildfire_fuel_map = "<S-ENTER>"

    " This selects the previous closest text object.
    let g:wildfire_water_map = "<BS>"
    "let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]
"}}}2
" [3.4] Vim-airline {{{2
"───────────────────────────────────────────────────────────────────────────────
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
" [3.5] Vim Git Gutter {{{2
"───────────────────────────────────────────────────────────────────────────────
    let g:gitgutter_enabled = 0
"}}}2
" [3.6] Nerdtree {{{2
"───────────────────────────────────────────────────────────────────────────────
    if has('gui_running')
        let g:NERDTreeDirArrows=1
    else
        let g:NERDTreeDirArrows=0
    endif
    let g:NERDChristmasTree=1
    "let NERDTreeShowLineNumbers=1
"}}}2
" [3.7] Vim latexsuite {{{2
"───────────────────────────────────────────────────────────────────────────────
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
    "let g:Tex_ViewRule_pdf ='C:\Program Files (x86)\SumatraPDF\SumatraPDF  -reuse-instance'
    if has('win32') || has('win64')
        let g:Tex_ViewRule_pdf='C:\Program Files (x86)\SumatraPDF\SumatraPDF -reuse-instance -inverse-search "gvim -c \":RemoteOpen +\%l \%f\""'
    endif

    let g:Tex_CompileRule_pdf='pdflatex --synctex=-1 -src-specials -interaction=nonstopmode $*'
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
    let g:Tex_SmartKeyDot=0
    " TIP: if you write your \label's as \label{fig:something}, then if you
    " type in \ref{fig: and press <C-n> you will automatically cycle through
    " all the figure labels. Very useful!
"}}}2
" [3.8] vim-tex-fold {{{2
"───────────────────────────────────────────────────────────────────────────────
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
" [3.9] Python-mode plugin {{{2
"───────────────────────────────────────────────────────────────────────────────
    "filetype plugin indent on " required!
    "syntax on

    " Load the whole python-mode plugin
    let g:pymode = 1
    let g:pymode_indent = 0

    let g:pymode_lint = 0
    " Disable pylint checking every save
    let g:pymode_lint_write = 0
    let g:pymode_folding = 0
    "let g:pymode_motion = 1
    "let g:pymode_doc = 1
    "let g:pymode_doc_bind = 1
    "" Set key 'R' for run python code
    "let g:pymode_run = 1
    "let g:pymode_run_key='R'
    "let g:pymode_run_bind ='<leader>r'

    "let g:pymode_breakpoint = 1
    let g:pymode_breakpoint_bind = '<leader>b'
    "let g:pymode_breakpoint_cmd = ''

    "let g:pymode_lint_message = 1
    "let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
    "let g:pymode_lint_signs = 1

    "cchar=●→▲←↓↑▼ ▾▸■□▼◘◙↓→↔↕❶❷❸❹❺❻❼❽❾❿ ⮀⮁⮂⮃⭤⭠
    let g:pymode_lint_todo_symbol = 'W▸'
    let g:pymode_lint_comment_symbol = 'C▸'
    let g:pymode_lint_visual_symbol = 'R▸'
    let g:pymode_lint_error_symbol = 'ϟ'
    let g:pymode_lint_info_symbol = 'I▸'
    let g:pymode_lint_pyflakes_symbol = 'F⮁'

    "let g:pymode_lint_todo_symbol = 'WW'
    "let g:pymode_lint_comment_symbol = 'CC'
    "let g:pymode_lint_visual_symbol = 'RR'
    "let g:pymode_lint_error_symbol = 'EE'
    "let g:pymode_lint_info_symbol = 'II'
    "let g:pymode_lint_pyflakes_symbol = 'FF'

    let g:pymode_rope = 0
    "let g:pymode_rope_regenerate_on_write = 1
    "let g:pymode_rope_completion = 1
    "let g:pymode_rope_complete_on_dot = 1
    "let g:pymode_rope_completion_bind = '<C-Space>'
    "let g:pymode_rope_goto_definition_bind = '<C-c>g'
    "let g:pymode_rope_goto_definition_cmd = 'new'

    "let g:pymode_syntax = 1
    "let g:pymode_syntax_all = 1
    "let g:pymode_syntax_print_as_function = 1
    "let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all
    "let g:pymode_syntax_highlight_stars_operator = g:pymode_syntax_all
    "let g:pymode_syntax_highlight_self = g:pymode_syntax_all
    "let g:pymode_syntax_indent_errors = g:pymode_syntax_all
    "let g:pymode_syntax_space_errors = g:pymode_syntax_all
    "let g:pymode_syntax_string_formatting = g:pymode_syntax_all
    "let g:pymode_syntax_string_format = g:pymode_syntax_all
    "let g:pymode_syntax_string_templates = g:pymode_syntax_all
    "let g:pymode_syntax_doctests = g:pymode_syntax_all
    "let g:pymode_syntax_builtin_objs = g:pymode_syntax_all
    "let g:pymode_syntax_builtin_types = g:pymode_syntax_all
    "let g:pymode_syntax_highlight_exceptions = g:pymode_syntax_all
    "let g:pymode_syntax_docstrings = g:pymode_syntax_all
"}}}2
" [3.10] Startify {{{2
"───────────────────────────────────────────────────────────────────────────────
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
" [3.11] Vim Languagetool - grammar check {{{2
"───────────────────────────────────────────────────────────────────────────────
    if has('win32') || has('win64')
        let g:languagetool_jar='C:/Programs/LanguageTool-2.2/languagetool-commandline.jar'
    endif
    "}}}2
" [3.12] Turn on supertab for autocompletion with omnicompletion {{{2
"───────────────────────────────────────────────────────────────────────────────
    let g:SuperTabDefaultCompletionType="<C-X><C-O>"
    let g:SuperTabDefaultCompletionType="context"
    "}}}2
" [3.13] Tagbar plugin {{{2
"───────────────────────────────────────────────────────────────────────────────
    if has('win32') || has('win64')
        let g:tagbar_ctags_bin='C:/Programs/ctags58/ctags.exe'
        let g:tagbar_iconchars = ['▸', '▾']
        "cchar=●→▲←↓↑▼ ▾▸■□▼◘◙↓→↔↕❶❷❸❹❺❻❼❽❾❿ ⮀⮁⮂⮃⭤⭠
    endif
    let g:tagbar_width=30
        "}}}2
" [3.14] Vim Languagetool - grammar check {{{2
"───────────────────────────────────────────────────────────────────────────────
    if has('win32') || has('win64')
        let g:languagetool_jar='C:/Programs/LanguageTool-2.2/languagetool-commandline.jar'
    endif
    "}}}2
" [3.15] Turn on supertab for autocompletion with omnicompletion {{{2
"───────────────────────────────────────────────────────────────────────────────
    let g:SuperTabDefaultCompletionType="<C-X><C-O>"
    let g:SuperTabDefaultCompletionType="context"
    "}}}2
    "[3.16] Rainbow Parenthesis {{{2
"───────────────────────────────────────────────────────────────────────────────
    let g:rainbow_active = 0 "0 if you want to enable it later via :RainbowToggle
    "}}}2
"" Vim session {{{2
"───────────────────────────────────────────────────────────────────────────────
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
"───────────────────────────────────────────────────────────────────────────────
    "let g:ctrlp_map = '<c-p>'
    "let g:ctrlp_cmd = 'CtrlP'
    "let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$',
  "\ 'file': '\.exe$\|\.so$\|\.dat$'
  "\ }
""}}}2
"}}}1
" [5] Other option settings {{{1
"───────────────────────────────────────────────────────────────────────────────
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
"───────────────────────────────────────────────────────────────────────────────
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

    set linespace=1 " Pixels of space between lines
    set thesaurus+=C:\Dropbox\Bib\mthesaur.txt
    "
    set lines=999 columns=118
    set showtabline=1           " Don't show tabline
    set textwidth=79            " Line length before wrapping

    set cursorline              " turn on highlight for active line
    set nowinfixwidth           " :set winfixwidth -->fixed window size so nerdtree etc. does not shrink active window
    set mousehide               " Hide the mouse when typing text
    let c_comment_strings=1     " I like highlighting strings inside C comments
    "
    set encoding=utf-8
    set wildmenu            " visual autocomplete for command menu
    set lazyredraw          " redraw only when we need to.
"}}}1
" [7] GUI vs. Terminal configuration {{{1
"───────────────────────────────────────────────────────────────────────────────
    " [7.1] GUI version {{{2
    "───────────────────────────────────────────────────────────────────────────
    if has('gui_running')
        if hostname()=="BR962"
            set guifont=Consolas\ for\ Powerline\ FixedD:b:h12
        elseif has('gui_gtk2')
            set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
        else
            set guifont=Consolas\ for\ Powerline\ FixedD:b:h10
            "set gfn=Lucida_Sans_Typewriter_Regular:h10:b:cANSI
        endif

        " Set winpos after setting guifont, so window can be reset and put in right
        " place !!!
        " On starting vim we need autocmd
        autocmd GUIEnter * winpos 0 30

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
    "}}}2
    " [7.2] Terminal version {{{2
    "───────────────────────────────────────────────────────────────────────────
    else
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
    "}}}2
"}}}1
" [8] GUI and Terminal configuration {{{1
"───────────────────────────────────────────────────────────────────────────────
"Custom Colors"
    hi SignColumn  ctermfg=235 guifg=#202020 guibg=#202020
    hi Folded ctermfg=235 guifg= #C5C5BF guibg=#3C3C59 "#434363

" Text formatting & display
    if v:version>703
        highlight ColorColumn ctermbg=235 guibg=#1c1c1c
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
"───────────────────────────────────────────────────────────────────────────────
" [9.1] Insert mode cursorline highlight {{{2
"───────────────────────────────────────────────────────────────────────────────
    augroup highlightCursorline
        autocmd!
        autocmd InsertEnter * highlight CursorLine guifg=white guibg=grey40
                    \ ctermfg=white ctermbg=darkgray
        autocmd InsertLeave * highlight CursorLine guifg=white guibg=grey25
                    \ ctermfg=white ctermbg=238
    augroup END "}}}2
" [9.2] Set the syntax for files that are not immediately recognized {{{2
"───────────────────────────────────────────────────────────────────────────────
    augroup setFiletype
        autocmd!
        autocmd BufRead,BufNewFile *.md set filetype=markdown | call MyConceal()
        autocmd BufRead,BufNewFile *.Pnw set filetype=pweave | call MyConceal()
        autocmd BufRead,BufNewFile *.rdf set filetype=redif | call MyConceal()
        autocmd BufRead,BufNewFile *.mod set filetype=dynare | call MyConceal()
        autocmd BufRead,BufNewFile *.jl set filetype=julia | call MyConceal()
        autocmd BufRead,BufNewFile *.log set filetype=log
        autocmd BufRead,BufNewFile *.g set filetype=gauss | call MyConceal()
    augroup END "}}}2
    augroup filetype_vim "{{{2
        autocmd!
        autocmd FileType vim setlocal foldmethod=marker |
                \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
        autocmd BufEnter *.vimrc setlocal foldmethod=marker |
                \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
    augroup END "}}}2
    augroup filetype_stata {{{2
        autocmd!
        autocmd FileType stata setlocal foldmethod=marker |
                    \ setlocal textwidth=0 | setlocal nowrap |
                    \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#4682B4
        autocmd BufRead,BufEnter *.do setlocal foldmethod=marker |
                    \ setlocal textwidth=0 | setlocal nowrap |
                    \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#4682B4
    augroup END "}}}2
    augroup filetype_fortran {{{2
        autocmd!
        autocmd FileType fortran setlocal foldmethod=marker |
                    \ let b:match_words.=',(:)' |
                    \ let fortran_free_source = 1 |
                    \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
        autocmd BufRead,Bufenter *.f,*f90 setlocal foldmethod=marker |
                    \ let fortran_free_source = 1 |
                    \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
    augroup END "}}}2
    augroup filetype_latex {{{2
        autocmd!
        "autocmd FileType latex let b:match_words.=',(:)'
        " This savs the .tex file before it compiles it
        autocmd FileType tex
            \ call Tex_MakeMap('<leader>ll', ':update!<CR>:call Tex_RunLaTeX()<CR>', 'n', '<buffer>')
        autocmd FileType tex
            \ call Tex_MakeMap('<leader>ll', '<ESC>:update!<CR>:call Tex_RunLaTeX()<CR>', 'v', '<buffer>')
        autocmd FileType tex
                    \ set spell spelllang=en_us |
                    \ set foldtext=NeatFoldText() |
                    \ syntax spell toplevel |
                    \ set iskeyword+=: |
                    \ if hostname()=="BR962" |
                            \ set guifont=Consolas\ for\ Powerline\ FixedD:b:h13 |
                            \ endif |
                    \ if hostname()=="JJUNG-PC" |
                            \ set guifont=Consolas\ for\ Powerline\ FixedD:b:h10 |
                            \ endif |
                    \ colorscheme peachpuff |
                    \ set showtabline=1 |
                    \ set linespace=1 |
                    \ set lines=999 |
                    \ winpos 0 30
                    "\ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
    augroup END "}}}2
    augroup filetype_log {{{2
        autocmd FileType log setlocal autoread |
                    \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
    augroup END "}}}2
    augroup filetype_R {{{2
        autocmd!
        autocmd FileType r setlocal foldmethod=marker |
                    \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
        autocmd BufRead, BufEnter *.r setlocal foldmethod=marker |
                    \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
    augroup END "}}}2
    augroup filetype_python {{{2
        autocmd!
        autocmd FileType python setlocal foldmethod=marker |
                    \ set foldtext=NeatFoldText() |
                    \ set nospell |
                    \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#4682B4
        autocmd BufEnter *.py setlocal foldmethod=marker |
                    \ set foldtext=NeatFoldText() |
                    \ set nospell |
                    \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#4682B4
    augroup END "}}}2
    augroup filetype_matlab {{{2
        autocmd!
        autocmd FileType matlab setlocal foldmethod=marker |
                    \ setlocal commentstring=%%s |
                    \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
        autocmd BufRead,BufEnter *.m setlocal foldmethod=marker |
                    \ setlocal commentstring=%%s |
                    \ call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
    augroup END "}}}2
    augroup filetype_rst {{{2
        au!
        " Headings
        au FileType rst nnoremap <leader>h1 ^yypv$r=o<cr><esc>
        au FileType rst inoremap <leader>h1 <esc>^yypv$r=o<cr>

        au FileType rst nnoremap <leader>h2 ^yypv$r-o<cr><cr><cr><cr><cr><cr><esc>kkkk
        au FileType rst inoremap <leader>h2 <esc>^yypv$r-o<cr><cr><cr><cr><cr><cr><esc>kkkki

        au FileType rst nnoremap <leader>h3 ^yypv$r+o<cr><cr><cr><cr><cr><cr><esc>kkkk
        au FileType rst inoremap <leader>h3 <esc>^yypv$r+o<cr><cr><cr><cr><cr><cr><esc>kkkki

        au FileType rst nnoremap <leader>h4 ^yypv$r~o<cr><cr><cr><cr><cr><cr><esc>kkkk
        au FileType rst inoremap <leader>h4 <esc>^yypv$r~o<cr><cr><cr><cr><cr><cr><esc>kkkki

        au FileType rst nnoremap <leader>h5 ^yypv$r*o<cr><cr><cr><cr><cr><cr><esc>kkkk
        au FileType rst inoremap <leader>h5 <esc>^yypv$r*o<cr><cr><cr><cr><cr><cr><esc>kkkki
        """Make Link (ml)
        " Highlight a word or phrase and it creates a link and opens a split so
        " you can edit the url separately. Once you are done editing the link,
        " simply close that split.
        au FileType rst vnoremap <leader>ml yi`<esc>gvvlli`_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. _<esc>pA: http://TODO<esc>vb
        """Make footnote (ml)
        au FileType rst iabbrev mfn [#]_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. [#] TODO
        au FileType rst set spell
        "Create image
        au FileType rst iabbrev iii .. image:: TODO.png<cr>    :scale: 100<cr>:align: center<cr><esc>kkkeel
        "Create figure
        "au FileType rst iabbrev iif .. figure:: TODO.png<cr>    :scale: 100<cr>:align: center<cr>:alt: TODO<cr><cr><cr>Some brief description<esc>kkkeel

        "Create note
        au FileType rst iabbrev nnn .. note::
        "Create math
        au FileType rst iabbrev mmm :math:``
        "Start or end bold text inline
        au FileType rst inoremap <leader>bb **
        "Start or end italicized text inline
        au FileType rst inoremap <leader>ii *
        "Start or end preformatted text inline
        au FileType rst inoremap <leader>pf ``

        " Fold settings
        "au FileType rst set foldmethod=marker
        "
        " Admonitions
        au FileType rst iabbrev adw .. warning::
        au FileType rst iabbrev adn .. note::
    augroup END "}}}2
    augroup filetype_pweave {{{2
        au!

        "Create math
        au FileType pweave inoremap <leader>mmm :math:
        au FileType pweave nnoremap <leader>mmm i:math:
        au FileType pweave vnoremap <leader>mmm S)i:math:<ESC>f`

        "au FileType pweave nnoremap <F12> :call MakePweave2Html()<cr>
        au FileType pweave nnoremap <leader>ll :call MakePweave2HtmlSilent()<cr>
        au FileType pweave nnoremap <leader>lll :call MakePweave2Html()<cr>

        " Insert python codeblock
        au FileType pweave nnoremap <leader>pp i<<>>= <cr><cr>@<ESC>ki

        au FileType pweave nnoremap <leader>ppp i<<>>= <cr>
                    \from __future__ import print_function<cr>
                    \import numpy as np<cr><cr>@<ESC>ki

        au FileType pweave nnoremap <leader>ff i<<fig = True, width = '12 cm'>>=
                    \<cr><cr>@<ESC>ki

        " Headings
        au FileType pweave nnoremap <leader>h1 ^yypv$r=o<cr><esc>
        au FileType pweave inoremap <leader>h1 <esc>^yypv$r=o<cr>

        au FileType pweave nnoremap <leader>h2 ^yypv$r-o<cr><esc>
        au FileType pweave inoremap <leader>h2 <esc>^yypv$r-o<cr>

        au FileType pweave nnoremap <leader>h3 ^yypv$r+o<cr><esc>
        au FileType pweave inoremap <leader>h3 <esc>^yypv$r+o<cr>

        au FileType pweave nnoremap <leader>h4 ^yypv$r~o<cr><esc>
        au FileType pweave inoremap <leader>h4 <esc>^yypv$r~o<cr>

        au FileType pweave nnoremap <leader>h5 ^yypv$r*o<cr><esc>
        au FileType pweave inoremap <leader>h5 <esc>^yypv$r*o<cr>
        """Make Link (ml)
        " Highlight a word or phrase and it creates a link and opens a split so
        " you can edit the url separately. Once you are done editing the link,
        " simply close that split.
        au FileType pweave vnoremap <leader>ml yi`<esc>gvvlli`_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. _<esc>pA: http://TODO<esc>vb
        """Make footnote (ml)
        au FileType pweave iabbrev mfn [#]_<esc>:vsplit<cr><C-W>l:$<cr>o<cr>.. [#] TODO
        au FileType pweave set spell
        "Create image
        au FileType pweave iabbrev iii .. image:: TODO.png<cr>    :scale: 100<cr>:align: center<cr><esc>kkkeel
        "Create figure
        "au FileType pweave iabbrev iif .. figure:: TODO.png<cr>    :scale: 100<cr>:align: center<cr>:alt: TODO<cr><cr><cr>Some brief description<esc>kkkeel

        "Create note
        au FileType pweave iabbrev nnn .. note::

        "Start or end bold text inline
        au FileType pweave inoremap <leader>bb **
        "Start or end italicized text inline
        au FileType pweave inoremap <leader>ii *
        "Start or end preformatted text inline
        au FileType pweave inoremap <leader>pf ``

        " Fold settings
        "au FileType pweave set foldmethod=marker
        "
        " Admonitions
        au FileType pweave iabbrev adw .. warning::
        au FileType pweave iabbrev adn .. note::
    augroup END "}}}2
" [9.3] Deal with whitespace and tabs on saving {{{2
"───────────────────────────────────────────────────────────────────────────────
    augroup treatWhite
        autocmd!
        autocmd BufWritePre *.py,*.m,*.vimrc,*f90 :%s/\s\+$//e | retab
    augroup END "}}}2
" [9.4] Turn on conceal feature by filetype when sourcing .vimrc file {{{2
"───────────────────────────────────────────────────────────────────────────────
    if &filetype == 'vim'
        call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
    elseif &filetype =='fortran'
        call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
    elseif &filetype =='matlab'
        call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
    elseif &filetype =='python'
        call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#4682B4
    elseif &filetype =='latex'
        call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
    elseif &filetype =='stata'
        call MyConceal() | highlight Conceal guibg=#2e2e2e guifg=#008000
    endif "}}}2
"}}}1
" [10] User key bindings {{{1
"───────────────────────────────────────────────────────────────────────────────
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
    "nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
    "nnoremap <silent> <leader>sv :so $MYVIMRC<CR>
    nnoremap <silent> <leader>ev :e C:\Dropbox\dotfiles\.vimrc<CR>
    nnoremap <silent> <leader>sv :so C:\Dropbox\dotfiles\.vimrc<CR>

" Clears the search register
    nnoremap <silent> <leader>/ :nohlsearch<CR>

" Pull word under cursor into LHS of a substitute (for quick search/replace)
    nnoremap <leader>z :%s/<C-r>=expand("<cword>")<CR>/

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
"───────────────────────────────────────────────────────────────────────────────
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
"───────────────────────────────────────────────────────────────────────────────
" [12.1] Buffer only {{{2
    nnoremap <leader>woo :BufOnly<CR>
"}}}2
" [12.2] NERDTree settings {{{2
"───────────────────────────────────────────────────────────────────────────────
    "Put focus to the NERD Tree with F3 (tricked by quickly closing it and
    "immediately showing it again, since there is no :NERDTreeFocus command)
    "nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>:set columns=120<CR>:winpos 0 30<CR>
    "nnoremap <leader>nn :NERDTreeClose<CR>:set columns=90<CR>:winpos 0 30<CR>
    "nnoremap <leader>m :NERDTreeClose<CR>:NERDTreeFind<CR>
    nnoremap <leader>n :NERDTreeClose<CR>:NERDTreeToggle<CR>
    nnoremap <leader>nn :NERDTreeClose<CR>
"}}}2
" [12.3] Voom settings {{{2
"───────────────────────────────────────────────────────────────────────────────
    "nnoremap <leader>v :Voom latex<CR>:set columns=120<CR>:winpos 0 30<CR>
    "nnoremap <leader>vv :Voomquit<CR>:set columns=90<CR>:winpos 0 30<CR>
    nnoremap <leader>v :Voom latex<CR>
    nnoremap <leader>fv :Voom<CR>
    nnoremap <leader>vv :Voomquit<CR>
"}}}2
" [12.4] Tabularize {{{2
"───────────────────────────────────────────────────────────────────────────────
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
" [12.5] Rainbow Parenthesis {{{2
"───────────────────────────────────────────────────────────────────────────────
" Toggle it on/off
    nnoremap <leader>R :RainbowToggle<CR>
"}}}2
" [12.6] Thesaurus {{{2
"───────────────────────────────────────────────────────────────────────────────
    let g:online_thesaurus_map_keys = 0
    nnoremap <leader>k :OnlineThesaurusLookup<CR>
"}}}2
" [12.7] Powerline color scheme {{{2
"───────────────────────────────────────────────────────────────────────────────
    "let g:Powerline_colorscheme='solarized256_dark'
"}}}2
" [12.8] Vim vertigo {{{2
"───────────────────────────────────────────────────────────────────────────────
    nnoremap <silent> <Space>j :<C-U>VertigoDown n<CR>
    vnoremap <silent> <Space>j :<C-U>VertigoDown v<CR>
    onoremap <silent> <Space>j :<C-U>VertigoDown o<CR>
    nnoremap <silent> <Space>k :<C-U>VertigoUp n<CR>
    vnoremap <silent> <Space>k :<C-U>VertigoUp v<CR>
    onoremap <silent> <Space>k :<C-U>VertigoUp o<CR>
"}}}2
" [12.9] Crunch {{{2
"───────────────────────────────────────────────────────────────────────────────
    map <silent> <plug>NoCrunchEvalLine <plug>CrunchEvalLine
    map <silent> <plug>NoCrunchEvalBlock <plug>CrunchEvalBlock
    map <silent> <leader>== <plug>CrunchEvalLineExc
"}}}2
" [12.10] Utl jumping {{{2
"───────────────────────────────────────────────────────────────────────────────
    " Initiate jump, then use CTRL+o and CTRL+i to jump back and forth
    nnoremap <silent> <leader>o :Utl<CR>
"}}}2
"" [12.11] Unite {{{2
""───────────────────────────────────────────────────────────────────────────────
"    let g:unite_source_history_yank_enable = 1
"    let g:unite_data_directory='~/.vim/.cache/unite'
"    let g:unite_source_rec_max_cache_files=5000
"    let g:unite_enable_start_insert = 1
"    let g:unite_split_rule = "botright"
"    let g:unite_force_overwrite_statusline = 0
"    let g:unite_winheight = 10

"    call unite#custom_source('file_rec,file_rec/async,file_mru,file,buffer,grep',
"        \ 'ignore_pattern', join([
"        \ '\.git/',
"        \ 'git5/.*/review/',
"        \ 'google/obj/',
"        \ ], '\|'))

"    " Use the fuzzy matcher for everything
"    call unite#filters#matcher_default#use(['matcher_fuzzy'])

"    " Use the rank sorter for everything
"    call unite#filters#sorter_default#use(['sorter_rank'])

"    " Browse open buffers
"    nnoremap <Leader>b :Unite -buffer-name=buffers -winheight=10 buffer<cr>

"    " Browse recently edited files
"    nnoremap <silent> <Leader>m :Unite -buffer-name=recent -winheight=10 file_mru<cr>

"    " Browse recursive list of all the files under the current working
"    " directory (CTRL-P functionvim)
"    nnoremap <leader>f :Unite file_rec/async<cr>

"    nnoremap <space>/ :Unite grep:.<cr>
"    nnoremap <space>y :Unite history/yank<cr>
"    nnoremap <silent> <space>p :Unite -start-insert buffer<CR>
"    nnoremap <C-h> :Unite -start-insert help<CR>

"    autocmd FileType unite call s:unite_settings()

"    function! s:unite_settings()
"        let b:SuperTabDisabled=1
"        "imap <buffer> <C-j> <NOP>
"        imap <buffer> <C-j>   <Plug>(unite_select_next_line)
"        imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
"        imap <silent><buffer><expr> <C-x> unite#do_action('split')
"        imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
"        imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
"        nmap <buffer> <ESC> <Plug>(unite_exit)
"    endfunction
""}}}2
"}}}1
" [13] Function keys {{{1
"───────────────────────────────────────────────────────────────────────────────
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
        \ :set lines=999<CR>:call SetWinPos()<CR>
        "\ :set lines=999<CR>:winpos getwinposx() 30<CR>

" F9: remove ^M symbols
    nnoremap <F9> :call RemoveM()<cr>

" F10: add time stamp
    nnoremap <F10> a<C-R>=strftime("%m/%d/%Y - %I:%M %p")<CR><Esc>
    inoremap <F10> <C-R>=strftime("%m/%d/%Y - %I:%M %p")<CR>

" F11: start ipython in current     dir
    nnoremap <F11> :silent !start ipython --profile=juergen<CR>
    inoremap <F11> <Esc>:silent !start ipython<CR>

" Shift F11: start ipython notebook in current dir
" you can import a python script into the notebook using: load myfile.py
    nnoremap <S-F11> :silent !start ipython notebook<CR>
    inoremap <S-F11> <Esc>:silent !start ipython notebook<CR>

"}}}1
" [14] User Ex-commands {{{1
"───────────────────────────────────────────────────────────────────────────────
" Save a file
command W w

" [15] My macros and abbreviations {{{1
"───────────────────────────────────────────────────────────────────────────────
" [1] Put dollar signs around selection
let @1 = 'xi$pa$'

" [2] Macro to put \hline into .tex tables

" mat2tex.py uses \bottomline
let @a = 'ggjjjjo\hlineyyjjpjjjjpjjjjjpjjjjjjpjjjpjpjjjpjpjpddjjpjpjjjpjjjjpjjjjpjjjjztkkkjjpjpjjjjjkkkpjjjjjjpjpjjpjjjpjjjjp4jp4jpgg'

" Mat2Tex.m file uses \hline
let @b = 'ggjjjyyjpjjpjjjjpjjjjjpjjjjjjpjjjpjpjjjpjpjpddjjpjpjjjpjjjjpjjjjpjjjjztkkkjjpjpjjjjjkkkpjjjjjjpjpjjpjjjpjjjjpgg'

" [3] Macro shorten table
let @c = 'gg5j3dd2jddjddkddjddkddjjdd3j8ddj2ddji+ji+ji+jddjj2dd:295ddddjjddjjjddj10dd10dd5dddd:18dd3kkp5dd:4p:323dd:9p:2015dd:12p:192dd:32p'

" CMS report tables horizontal lines
let @e = 'ggjjjjo\hlineyyjjpjjjjpjpjjjjpjjjjjjpjjjjjpjjjjjpjjjjpjpjjjpjjpjjjpjpjjjpjjpjjjjjjjpjjjjpjjjpjpjjjkpjjjjjjpjpjjpjjjpjjpjjjjjpjjjjpjjjjp'

" [3] Macros to reduce table
" --------------------------
" ACA Alternative fiscal policies: AT off
    " Short
    "let @b = 'gg6j3ddj5ddjjdd2j8dd2j2dd6j2dd9j6dd2jdd3j27ddgg11jEElvEEExhxeea:10j5j0eeelveeeeexeea:lveeelxgg4j6ddGkpjdd10k3k2ddGkp10k10k2dd5kpjdd5k3dd5jpdd8j4j3dd8k5kp2jyy3jkp'
    " 2 columns
    let @d = 'ggvG,ttgg3jkeeeeEe25jjjj9l3l2lxeeeeeeeeeheeeeEEEEEEEEEE30jkkxgg20jdd5jjddkkkyyjpggjjEla\textbf{lxEEa}eev7ec\textbf{[2la ACA:save! TableACAAToffShort2Cols.tex'

" Round to 2 digits
"%s/\d\+\.\d\+/\=printf('%.2f',str2float(submatch(0)))/g

" Change words to upper case
":%s/\v^\a|\:\s\a|<%(in>|the>|at>|with>|a>|and>|for>|of>|on>|from>|to>|an>|pdf>|http>|papers>|science>|or>|s>|jjung>|by>)@!\a/\U&/gc
" Abbreviations
" -------------
    :abbrev hte the
    :iabbrev hte the
"}}}1
