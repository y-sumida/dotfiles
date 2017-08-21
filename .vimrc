" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'kana/vim-smartinput'
Plug 'vim-scripts/surround.vim'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'tyru/open-browser.vim'
Plug 'kannokanno/previm'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

" settings
" search
set hlsearch
set incsearch
set smartcase

" ime
set imdisable

" quickfix
augroup quickfix
  autocmd!
  autocmd QuickfixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif
augroup END

" grep
" set grepprg=grep\ -rnIH\ --exclude-dir=.hg\ --exclude=tags
set grepprg=grep\ -rnIH\ --exclude=.svn\ --exclude=.git\ --exclude=.hg\ --exclude=tags

" free cursor
set virtualedit=block

" increment
set nf=alpha,hex

" complementation
set completeopt=menuone,preview

" dictionary
augroup dictionary
  autocmd!
  autocmd FileType php,ctp :set dictionary=~/.vim/dict/php.dict
  autocmd FileType javascript :set dictionary=~/.vim/dict/javascript.dict
  autocmd FileType javascript :set dictionary+=~/.vim/dict/jQuery.dict
augroup END

" filetype
augroup ftype
  autocmd!
  autocmd BufRead,BufNewFile jquery.*.js set filetype=javascript syntax=jquery
  autocmd BufRead,BufNewFile *.md set filetype=markdown
augroup END

" buffer
set clipboard+=unnamed

" encoding
set fileencodings=guess,utf8,iso-2022-jp-3,euc-jisx0213,euc-jp,ucs-bom
set encoding=utf-8
set fileformats=dos,unix,mac
set fileformat=unix

" backup
set nobackup
set timeoutlen=2000
set hidden
set directory=/tmp
set undodir=~/.vim/undo

" command history
set history=1000

" display
syntax enable
set background=dark
colorscheme solarized
set shortmess+=I
set showmatch
set nowrap
set cursorline
set scrolloff=5
set colorcolumn=80
set showcmd
set laststatus=2
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

" diff
set diffopt=filler,vertical

" print
set printheader=%t%=%N
" set printfont=MeiryoKe_Console:h12:cSHIFTJIS

" special keys
set list
set listchars=trail:-,nbsp:%,eol:¬,tab:▸\ 
scriptencoding utf-8
"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction

if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif

" cursor line only for current window
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

" key mappings
" vimrc
nnoremap <Space>. :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>r. :<C-u>source $MYVIMRC<CR>

" help
nnoremap <C-h>  :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>

" escape
inoremap jj <Esc>
" 
" don't use commands.
noremap ZZ <Nop>
noremap ZQ <Nop>
"noremap <C-z> <Nop>

" move
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap * *zz
nnoremap # #zz
nnoremap n nzz
nnoremap N Nzz
noremap <Up> :<C-u>echohl WarningMsg \| echo "Don't use Up key!!! Press [k]" \| echohl None<CR>
noremap! <Up> <ESC>:<C-u>echohl WarningMsg \| echo "Don't use Up key!!! Press [ESC][k]" \| echohl None<CR>
noremap <Down> :<C-u>echohl WarningMsg \| echo "Don't use Down key!!! Press [j]" \| echohl None<CR>
noremap! <Down> <ESC>:<C-u>echohl WarningMsg \| echo "Don't use Down key!!! Press [ESC][j]" \| echohl None<CR>
noremap <Left> :<C-u>echohl WarningMsg \| echo "Don't use Left key!!! Press [l]" \| echohl None<CR>
noremap! <Left> <ESC>:<C-u>echohl WarningMsg \| echo "Don't use Left key!!! Press [ESC][l]" \| echohl None<CR>
noremap <Right> :<C-u>echohl WarningMsg \| echo "Don't use Right key!!! Press [h]" \| echohl None<CR>
noremap! <Right> <ESC>:<C-u>echohl WarningMsg \| echo "Don't use Right key!!! Press [ESC][h]" \| echohl None<CR>
" noremap <BS> :<C-u>echohl WarningMsg \| echo "Don't use BackSpace key!!! Press [ctrl-h]" \| echohl None<CR>
" noremap! <BS> <ESC>:<C-u>echohl WarningMsg \| echo "Don't use BackSpace key!!! Press [ctrl-h]" \| echohl None<CR>

" yank
nnoremap Y y$

" ime off
inoremap <silent><ESC> <ESC>:<C-u>set iminsert=0<CR>

" complementation
inoremap <C-k> <C-x><C-k>
inoremap <C-o> <C-x><C-o>

" buffer
" nnoremap <Space>b :<C-u>ls<CR>:b
nnoremap <silent><Space>d :<C-u>bd<CR>
nnoremap <silent><Space>n :<C-u>enew<CR>

" filer
nnoremap <Space>f :<C-u>e %:h<CR>
nnoremap <silent>gc :<C-u>cd %:h<CR>

" window
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>

" hlsearch off
nnoremap <silent><ESC><ESC> :<C-u>nohlsearch<CR><ESC>

" insert date
nnoremap tt <ESC>i<C-R>=strftime("%Y/%m/%d (%a) %H:%M")<CR><CR>
nnoremap td <ESC>i<C-R>=strftime("%Y/%m/%d (%a)")<CR><CR>

" ctags
" tagsジャンプの時に複数ある時は一覧表示
nnoremap <C-]> g<C-]> 

" emmet
" let g:user_emmet_leader_key='<c-r>'
let g:user_emmet_expandabbr_key = '<c-t>'
let g:user_emmet_settings = {
\  'lang' : 'ja',
\  'indentation' : '  ',
\  'javascript' : {
\    'snippets' : {
\      'jq' : "\\$(function() {\n\t\\${cursor}\\${child}\n});",
\      'jq:json' : "\\$.getJSON(\"${cursor}\", function(data) {\n\t\\${child}\n});",
\      'jq:each' : "\\$.each(data, function(index, item) {\n\t\\${child}\n});",
\      'fn' : "(function() {\n\t\\${cursor}\n})();",
\      'tm' : "setTimeout(function() {\n\t\\${cursor}\n}, 100);",
\    }
\  }
\}

" previm
let g:previm_custom_css_path = '~/.vim/plugged/previm/preview/css/user.css'

" ctrlpvim
" vim終了時にキャッシュクリアしない
let g:ctrlp_clear_cache_on_exit = 0
" カレントディレクトリを基準に検索
let g:ctrlp_cmd = 'CtrlPRoot'
" ドットファイルを対象に
let g:ctrlp_show_hidden = 1

nnoremap <Space>b :<C-u>CtrlPBuffer<CR>
