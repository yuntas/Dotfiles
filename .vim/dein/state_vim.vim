if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/yuko/.vimrc', '/home/yuko/.vim/dein/userconfig/plugin.toml', '/home/yuko/.vim/dein/userconfig/plugin_lazy.toml'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/yuko/.vim/dein'
let g:dein#_runtime_path = '/home/yuko/.vim/dein/.cache/.vimrc/.dein'
let g:dein#_cache_path = '/home/yuko/.vim/dein/.cache/.vimrc'
let &runtimepath = '/home/yuko/.vim/dein/repos/github.com/Shougo/dein.vim/,/home/yuko/.vim,/usr/local/share/vim/vimfiles,/home/yuko/.vim/dein/repos/github.com/Shougo/dein.vim,/home/yuko/.vim/dein/.cache/.vimrc/.dein,/usr/local/share/vim/vim80,/home/yuko/.vim/dein/.cache/.vimrc/.dein/after,/usr/local/share/vim/vimfiles/after,/home/yuko/.vim/after'
filetype off
