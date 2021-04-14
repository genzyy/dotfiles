" ---------- ] PLUGINS SECTION START [ ----------
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Plugin for file structure as NERDTree
Plug 'preservim/nerdtree'

"Plugin for NERDTree & provides icons for 
"files and folders
Plug 'ryanoasis/vim-devicons'

"Completion Vim Plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'phanviet/vim-monokai-pro'
Plug 'b4skyx/serenade'
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/forest-night'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'phanviet/vim-monokai-pro'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'vim-scripts/Wombat'
"Syntax Vim Plugin
Plug 'sheerun/vim-polyglot'

"Light Line Vim
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

"Rust Vim Plugin
Plug 'rust-lang/rust.vim'

"Ayu Vim Theme
Plug 'ayu-theme/ayu-vim'

"Plugin For Spacing
Plug 'junegunn/goyo.vim'

"Tagbar Vim Plugin
Plug 'preservim/tagbar'

"Plugin for Indentlines
Plug 'Yggdroot/indentLine'

"Rust Plugin Vim
Plug 'rust-lang/rust.vim'

"Emmet JS plugin
Plug 'mattn/emmet-vim'

"JSX vim plugin
Plug 'mxw/vim-jsx'




" Initialize plugin system
call plug#end()

" ---------- ] PLUGINS END [ ----------






" ---------- ] SETTING UP PLUGINS AND
"  OTHER CONFIGURATIONS [ ----------

"Setting up GUI Font for devicons
set guifont=JetBrainsMono\ Nerd\ Font\ Mono
let g:lightline = {
      \ 'colorscheme': 'embark',
      \ }


"Emmet Configuration
let g:user_emmet_leader_key='<Tab>'
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}



"NERDTree setup

"Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

"Changing default NERDTree arrows
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"KeyBind for NERDTree
nnoremap <F4> :NERDTreeToggle<CR>

"KeyBind for TAGbar
nmap <F8> :TagbarToggle<CR>

"Setting up Numberline
set number
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
set expandtab
set mouse=a
set background=dark

if(has("termguicolors"))
  set termguicolors
endif

"let ayucolor="dark"
set background=dark
let g:material_style='oceanic'
let g:miramare_enable_italic = 1
syntax enable
let ayucolor="mirage"
colorscheme embark
"hi Normal guibg=#0d1117


" ---------- ] COC CONFIGURATIONS [ ----------

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


