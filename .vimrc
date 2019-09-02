call pathogen#infect()
filetype off            " for NeoBundle
set nocompatible

if has('vim_starting')
        set rtp+=$HOME/.vim/bundle/neobundle.vim/

        call neobundle#begin(expand('~/.vim/bundle'))
        NeoBundleFetch 'Shougo/neobundle.vim'
        " NeoBundle で管理するプラグインを追加します。
        NeoBundle 'Shougo/neocomplcache.git'
        " ファイルオープンを便利に
        NeoBundle 'Shougo/unite.vim'
        " " Unite.vimで最近使ったファイルを表示できるようにする
        NeoBundle 'Shougo/neomru.vim'
        NeoBundle 'Shougo/vimfiler.vim'
        NeoBundle 'Shougo/vimproc.vim'
        NeoBundle 'tyru/operator-camelize.vim'
        NeoBundle 'kana/vim-operator-user'
        NeoBundle 'surround.vim'
        NeoBundle 'mattn/emmet.vim'
        NeoBundle 'slim-tamplate/vim-slim'
        NeoBundle 'Shougo/unite.vim.git'
        " Coffee Script
        NeoBundle 'kchmck/vim-coffee-script'
        " NeoBundle 'vim-ruby/vim-ruby'
        NeoBundle 'Shougo/neosnippet'
        NeoBundle 'Shougo/neosnippet-snippets'
        NeoBundle 'w0ng/vim-hybrid'
        NeoBundle 'tpope/vim-fugitive'
        NeoBundle 'bronson/vim-trailing-whitespace'
        NeoBundle 'rking/ag.vim'
        NeoBundle "ctrlpvim/ctrlp.vim"
        NeoBundle 'szw/vim-tags'
        NeoBundle 'leafgarland/typescript-vim'
        NeoBundle 'xsbeats/vim-blade'
        call neobundle#end()
endif
" source '~/.vim/autoload/pathogen.vim'
" vimfiler -------------------------------
command FF VimFiler -buffer-name=explorer
command MM Unite file_mru buffer
" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'
"vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
""セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
" syntax on
set incsearch
set ruler
set number
set encoding=utf-8
set expandtab
set tabstop=2
set shiftwidth=2
set clipboard=unnamed,autoselect
inoremap <silent> jj <ESC>
set timeoutlen=200
set hlsearch
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets-user/'
" Plugin key-mappings.
imap <C-y>     <Plug>(neosnippet_expand_or_jump)
smap <C-y>     <Plug>(neosnippet_expand_or_jump)
xmap <C-y>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB>
\ neosnippet#expandable() <Bar><Bar> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
  endif
" set cursorline
syntax enable
filetype plugin indent on       " restore filety

set modifiable
set write

set showcmd                      " コマンドをステータス行に表示
"-------------------------------------------------------------------------------
" カラー関連 Colors
"-------------------------------------------------------------------------------
set background=dark
colorscheme hybrid
set t_Co=256
"colorscheme molokai
"autocmd VimEnter * :GuiColorScheme darkspectrum
" ハイライト on
 " syntax enable
 " 補完候補の色づけ for vim7
 " hi Pmenu ctermbg=255 ctermfg=0 guifg=#000000 guibg=#999999
 " hi PmenuSel ctermbg=blue ctermfg=black
 " hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
 " hi PmenuSbar ctermbg=0 ctermfg=9
 "
" "インサートモードで bash 風キーマップ
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-h> <BS>
inoremap <C-d> <Del>
inoremap <C-k> <C-o>D<Right>
inoremap <C-u> <C-o>d^
inoremap <C-w> <C-o>db
"" 次の検索結果
nnoremap <C-n> :cn<CR>
"" 前の検索結果
nnoremap <C-p> :cp<CR>

" タイポ抑制
nnoremap q: :q

" 英語キーボードの時に;でもコマンドモードに入る
nnoremap ; :
" remap record macro key from q to Q
nnoremap Q q" hi PmenuSbar ctermbg=255 ctermfg=0 guifg=#000000 guibg=#FFFFFF
if neobundle#tap('vim-trailing-whitespace')
    " uniteでスペースが表示されるので、設定でOFFにします。
    let g:extra_whitespace_ignored_filetypes = ['unite']
endif
NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}

autocmd BufRead,BufNewFile *.es6 setfiletype javascript
" カーソル位置の単語をgrep検索
nnoremap    [unite]   <nop>
nmap    , [unite]
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
map <Leader>c <plug>(operator-camelize-toggle)
let g:vim_tags_project_tags_command = "/usr/local/bin/ctags -R {OPTIONS} {DIRECTORY} 2>/dev/null"
let g:vim_tags_gems_tags_command = "/usr/local/bin/ctags -R {OPTIONS} `bundle show --paths` 2>/dev/null"
if !exists('loaded_matchit')
  " matchitを有効化
  runtime macros/matchit.vim
endif
