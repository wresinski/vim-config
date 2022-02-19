"设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

"显示行号
set nu

"设置粘帖模式
"set paste
set pastetoggle=<F8>

"启动时隐去援助提示
set shortmess=atI

"语法高亮
syntax on

"使用vim的键盘模式
"set nocompatible

"不需要备份
set nobackup

"没有保存或文件只读时弹出确认
set confirm

"鼠标可用
set mouse=a

"tab缩进
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

"文件自动检测外部更改
set autoread

"c文件自动缩进
set cindent

"自动对齐
set autoindent

"智能缩进
set smartindent

"高亮查找匹配
set hlsearch

"背景色
set background=dark
highlight PMenu ctermfg=11 ctermbg=238 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=238 ctermbg=11 guifg=darkgrey guibg=black

"显示匹配
set showmatch

"显示标尺，就是在右下角显示光标位置
set ruler

"去除vi的一致性
set nocompatible

"允许折叠
set foldenable
"""""""""""""""""设置折叠"""""""""""""""""""""
"
"根据语法折叠
"set fdm=syntax

"手动折叠
"set fdm=manual

"设置键盘映射，通过空格设置折叠
nnoremap <space> @=((foldclosed(line('.')<0)?'zc':'zo'))<CR>
""""""""""""""""""""""""""""""""""""""""""""""
"不要闪烁
set novisualbell

"启动显示状态行
set laststatus=2

"浅色显示当前行
autocmd InsertLeave * se nocul

"用浅色高亮当前行
autocmd InsertEnter * se cul

"显示输入的命令
set showcmd

"被分割窗口之间显示空白
set fillchars=vert:/

set fillchars=stl:/

set fillchars=stlnc:/

set relativenumber

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap h <nop>
nnoremap j <nop>
nnoremap k <nop>
nnoremap l <nop>

if &diff
    syntax off
endif

set tags+=~/.vim/systags

set backspace=indent,eol,start

exec 'cd ' . fnameescape('D:/home/AsterUser')
"set autochdir
nmap <silent> <F3> :cd %:h<CR>
set ignorecase
"""""""""""""""""gvim"""""""""""""""""""""
if has('gui_running')
    set noimdisable
    set gfn=Consolas\ NF:h10
    colorscheme molokai
    "Toggle Menu and Toolbar
    set guioptions-=l
    set guioptions-=r
    set guioptions-=m
    set guioptions-=T
    map <silent> <F2> :if &guioptions =~# 'T' <Bar>
                \set guioptions-=T <Bar>
                \set guioptions-=m <bar>
                \else <Bar>
                \set guioptions+=T <Bar>
                \set guioptions+=m <Bar>
                \endif<CR>
endif
""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""Plugin"""""""""""""""""""""
call plug#begin('~/.vim/plugged')
"Plug 'ZSaberLv0/ZFVimIM'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'skywind3000/vim-auto-popmenu'
"Plug 'ycm-core/YouCompleteMe'
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'puremourning/vimspector'
"Plug 'APZelos/blamer.nvim'
call plug#end()

"""""""""""""""""ZFVimIM"""""""""""""""""""""
"function! s:myLocalDb()
"    let db = ZFVimIM_dbInit({
"                \   'name' : 'YourDb',
"                \ })
"    call ZFVimIM_cloudRegister({
"                \   'mode' : 'local',
"                \   'dbId' : db['dbId'],
"                \   'repoPath' : '/home/AsterUser/ZFVimIM_pinyin_base/misc',
"                \   'dbFile' : '/pinyin.txt',
"                \   'dbCountFile' : '/pinyin_count.txt',
"                \ })
"endfunction
"autocmd User ZFVimIM_event_OnDbInit call s:myLocalDb()
""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""vim-airline"""""""""""""""""""""
let g:airline_powerline_fonts=1
let g:airline_theme="deus"
let g:airline#extensions#tabline#enabled = 1
""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""vim-auto-popmenu"""""""""""""""""""""
"let g:apc_enable_ft={'*':1}
"set cpt=.,k,w,b
"set completeopt=menu,menuone,noselect
"set shortmess+=c
""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""YouCompleteMe"""""""""""""""""""""
"let g:ycm_server_python_interpreter='/usr/bin/python'
"let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
"let g:ycm_add_preview_to_completeopt = 0
"let g:ycm_show_diagnostics_ui = 0
"let g:ycm_server_log_level = 'info'
"let g:ycm_min_num_identifier_candidate_chars = 2
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"let g:ycm_complete_in_strings=1
"let g:ycm_key_invoke_completion = '<c-z>'
"set completeopt=menu,menuone
"
"noremap <c-z> <NOP>
"
"let g:ycm_semantic_triggers =  {
"            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
"            \ 'cs,lua,javascript': ['re!\w{2}'],
"            \ }
"
"let g:ycm_auto_hover=''
"set updatetime=1000
"
"let s:ycm_hover_popup = -1
"function s:Hover()
"    let type = youcompleteme#GetCommandResponse( 'GetType' )
"    let doc = youcompleteme#GetCommandResponse( 'GetDoc' )
"    if type == 'Unknown type' || type == 'Internal error: cursor not valid'
"        let type = ''
"    endif
"    if type != '' && doc != ''
"        let response = join([type, doc], "\n---\n")
"    elseif type == '' && doc != ''
"        let response = doc
"    elseif type != '' && doc == ''
"        let response = type
"    else
"        return
"    endif
"
"    call popup_hide( s:ycm_hover_popup )
"    let s:ycm_hover_popup = popup_atcursor( balloon_split( response ), {} )
"endfunction
"
""CursorHold triggers in normal mode after a delay
""autocmd CursorHold * call s:Hover()
"" Or, if you prefer, a mapping:
"nnoremap <silent> <tab> :call <SID>Hover()<CR>
"
"let g:ycm_confirm_extra_conf=0
""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""NERDTree"""""""""""""""""""""
nnoremap <leader>n :NERDTreeFocus<CR>
map <F7> :NERDTreeToggle<CR>
""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""coc-nvim"""""""""""""""""""""
let g:coc_global_extensions = ['coc-clangd']

" TextEdit might fail if hidden is not set.
set hidden
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
set signcolumn=number
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""vimspector"""""""""""""""""""""
let g:vimspector_test_plugin_path = expand( '<sfile>:p:h:h' )
set mouse=a
set noequalalways
let mapleader = ','
let maplocalleader = "\<Space>"

let &runtimepath = &runtimepath . ',' . g:vimspector_test_plugin_path

filetype plugin indent on
syntax enable
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'
""""""""""""""""""""""""""""""""""""""""""""""
