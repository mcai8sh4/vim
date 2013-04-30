" Filename:      vimrc
" Description:   Vim configuration file
" Maintainer:    mcai8sh4 - stehowarth@gmail.com
" Last Modified: 04-12-2009
" General Settings --------------------------------------------------
" -------------------------------------------------------------------

	    let &t_Co=256
		set nocompatible
		filetype off
		call pathogen#runtime_append_all_bundles()
		call pathogen#helptags()
		filetype on
		filetype plugin indent on
		set mouse=a

		" Use Vim settings, rather then Vi settings (much better!).
		                                           
		" allow backspacing over everything in insert mode
		set backspace=indent,eol,start
		set nobackup		" keep a backup file
		set history=100		" keep 50 lines of command line history
		set ruler		" show the cursor position all the time
		set showcmd		" display incomplete commands
		set incsearch		" do incremental searching
		set showmatch		" show matching bracket when in insert mode
		set matchtime=7		" show matching brackets for 2 sec
		set splitright		" when splitting vertically go right.
		set nu
		set ts=4
		set shiftwidth=4
        set smartindent
		" Make the 'cw' and like commands put a $ at the end instead of just deleting
		" the text and replacing it
		set cpoptions+=$
		set nowrap
		
		"show indent things!
		set lcs=tab:│┈,trail:·,extends:>,precedes:<,nbsp:$
		set list

		" Set the status line the way i like it
		set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
		
		" tell VIM to always put a status line in, even if there is only one window
		set laststatus=2
		
		" start scrolling 8 lines before getting to the screen limits
		set scrolloff=8
		"
		" alow cursor to go anywhere
		" set virtualedit=all
		
		set timeoutlen=600
		
		" Improve autocomplete (I think)
		set wildmenu
		
		" Allow hinding buffers without saving
		set hidden
		"
		" set the search scan so that it ignores case when the search is all lower
		" case but recognizes uppercase if it's specified
		set ignorecase
		set smartcase
		"
		" Switch syntax highlighting on, when the terminal has colors
		if &t_Co > 2 || has("gui_running")
		  syntax on
		endif
		
		" Only do this part when compiled with support for autocommands.
		if has("autocmd")
		
		  " Enable file type detection.
		  " Use the default filetype settings, so that mail gets 'tw' set to 72,
		  " 'cindent' is on in C files, etc.
		  " jlso load indent files, to automatically do language-dependent indenting.
		  filetype plugin indent on
		  " Put these in an autocmd group, so that we can delete them easily.
		  augroup vimrcEx
		  au!
		  " For all text files set 'textwidth' to 78 characters.
		  autocmd FileType text setlocal textwidth=78
		  " When editing a file, always jump to the last known cursor position.
		  " Don't do it when the position is invalid or when inside an event handler
		  " (happens when dropping a file on gvim).
		  autocmd BufReadPost *
		    \ if line("'\"") > 0 && line("'\"") <= line("$") |
		    \   exe "normal! g`\"" |
		    \ endif
		  augroup END
		else
		   set autoindent		" always set autoindenting on
		endif " has("autocmd")
" Colours ----------------------------------------------------------
"-------------------------------------------------------------------
		if !exists("autocmd_colorscheme_loaded")
		  let autocmd_colorscheme_loaded = 1
		  autocmd ColorScheme * highlight TodoRed      ctermbg=yellow guibg=#002b37 ctermfg=black    guifg=#E01B1B
		  autocmd ColorScheme * highlight TodoOrange   ctermbg=darkgreen guibg=#002b37 ctermfg=LightMagenta guifg=#E0841B
		  autocmd ColorScheme * highlight TodoYellow   ctermbg=darkgreen guibg=#002b37 ctermfg=LightYellow  guifg=#E0D91B
		endif
		

		"colorscheme corporation
		"colorscheme molokai
		colorscheme darkspectrum
		"   :hi SpecialKey cterm=none ctermfg=darkgrey ctermbg=black
		 "  :hi Normal ctermbg=none
		   ":hi Normal ctermbg=black

		 if has("autocmd")
		    if v:version > 701
		      autocmd Syntax * call matchadd('TodoRed',  '\W\zs\(NOTE:\)')
		      autocmd Syntax * call matchadd('TodoOrange', '\W\zs\(TODO2\)')
		      autocmd Syntax * call matchadd('ToDoYellow', '\W\zs\(TODO3\)')
		    endif
		endif

" Key Mappings -----------------------------------------------------
"------------------------------------------------------------------j
		noremap <C-l> <esc>[siw<C-x>s
		noremap <C-i> gi
		"remove spaces at the end of lines
		nmap <silent> ,dws :%s/\s\+$// <CR>
		"use crosshairs to see column/line (toggled)
		map <F10> :set cursorcolumn! cursorline!<cr>
		" Don't use Ex mode, use Q for formatting
		map Q gq
		
		" map <f2> :mkview<cr>
		" map <f3> :loadview<cr>
		map <F7> :setlocal spell!<CR>
		
		"map Ctags list
		map <F2> : TlistToggle<CR>
		" Compile using make
		map <F5> :w<cr>:!clear<CR>:make<CR>
	   	"
		" toggle quickfix window - if needed
		nmap ,cw :cw<CR>
		" close quickfix window if there are errors still present
		nmap ,ccl :cclo<CR>
		" Save/Compile/Run current file using gcc
		nmap <silent> ,<F5> :w<CR>:!clear;gcc %:p; ./a.out<CR>
		
		" Add/Remove comments in c code
		map <silent> ,cc :s/^\(\s*\)/\1\/\/\ / <CR>
		map <silent> ,dc :s/^\(\s*\)\/\/\ /\1/ <CR>
		" Add a comment block - this is just a huge connection of
		" commands strung together - but it works!		
        nmap <silent> ,cb
			\ 0i/*<ESC>A-<ESC>50.0i<CR><ESC>
			\ o<ESC>0xA-<ESC>50.A*/<ESC>
			\ ko<ESC>0xA<SPACE><SPACE>

		" Use tab in normal mode to add a new line
		nmap <tab> o
	
		" Move between viewports using alt+arrow keys
		nmap <silent> <A-Up> :wincmd k<CR>
		nmap <silent> <A-Down> :wincmd j<CR>
		nmap <silent> <A-Left> :wincmd h<CR>
		nmap <silent> <A-Right> :wincmd l<CR>
		
		" turn off search hilighting
		nmap <silent> ,n :set invhls<CR>:set hls?<CR>
		
		" Edit the vimrc file
		nmap <silent> ,ev :e $MYVIMRC<CR>
		nmap <silent> ,svr :so $MYVIMRC<CR>
		
		" Remap Ctrl+/ to perform the same autocomplete are ctrl+p
		imap  <C-p>
		
		" Search for word under cursor, but dont go to it
		nmap # #*
		"
		" show current and alternative buffers in vertial split screen
		" General buffer settings
		" split horiz current and alt buffer
		nmap <silent> ,sb :sb#<CR>	
		" split vertically current and alt buffer
		nmap <silent> ,vsb :vert sb#<CR>
		" Change to alt buffer
		nmap <silent> ,b# :b#<CR>
		" Hide current buffer (removes from split window)
		nmap <silent> ,hb :hid<CR>
		" Delete current buffer
		nmap <silent> ,bd :bd<CR>
		
		" Close all folds (foldlevel=0) then recursivly open the current one
		nmap <silent> z\ zM zA



		" fold by indent by default, but also use manual folds if you wish
		augroup vimrc
				  au BufReadPre * setlocal foldmethod=indent
				    au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
		augroup END

" abbriviations -----------------------------------------------------
" -------------------------------------------------------------------

		iab libn libnerdkits/

" PLUGIN STUFF -------------------------------------------------------
" --------------------------------------------------------------------
		let c_cpp_comments = 1
		" NERD_tree stuff
		nmap <silent> <F8> :NERDTreeToggle<cr>
		
		" Snipmate stuff
		let g:snips_author = 'Stephen Howarth'

		set formatoptions-=cro
