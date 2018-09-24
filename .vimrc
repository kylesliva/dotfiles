"If you stay here too long, you'll end up frying your brain. Yes, you will. No, you will...not. Yesno, you will won't.

"relative line numbers
set rnu
"shows current number in place of '0'
set nu

"code folding (use 'za' to toggle folds)
"foldlevel keeps folds open by default
setlocal fdm=syntax
set foldlevel=20

"emacs style search
set incsearch
set ignorecase
set smartcase
set hlsearch
nmap \q :nohlsearch<CR>
nmap \p :set paste! paste?<cr>

" Always show statusline
 set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256
" colours)
 set t_Co=256
