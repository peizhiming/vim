"通用配置
"通用配置
syntax on  " 开启语法高亮
colorscheme peachpuff "vim配置方案
set number  " 显示行号
set hls "搜索时高亮显示被找到的文本
set scrolloff=3 " 上下可视行数
set incsearch   " 搜索时高亮显示被找到的文本
set ignorecase "搜索忽略大小写
set enc=utf-8  "编码设置
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1 "编码自动识别
set mouse=n "鼠标普通模式
" set cursorline "选中行出现下划线
map qq :qa!<CR> "多窗口不保存关闭
map ww :wqa!<CR> "多窗口保存关闭
"vim自动打开跳到上次的光标位置
if has("autocmd")
        au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
set nocompatible  "设置backspace的工作方式
set backspace=indent,eol,start " 设置backspace的工作方式
map <F5> :set listchars=tab:>-,trail:-<CR> :set list<CR> " 显示空格和tab
map <F6> :set list!<CR> " 取消显示空格和tab


call plug#begin('~/.vim/plugged')
"plug插件管理，全异步安装，不仅支持在线安装，更支持下载好的离线包直接安装。
"且安装完后，可以注释掉相关指令很方便的关闭对应插件。下面基本都是离线安装的例子
Plug 'vim-scripts/vim-gutentags'
Plug 'vim-scripts/taglist' "Tlist标签列表插件
Plug 'vim-scripts/nerdcommenter'
Plug 'vim-scripts/vim-airline' "airline状态栏
Plug 'vim-scripts/vim-gutentags' "gutentags异步tags插件
Plug 'vim-scripts/LeaderF' "LeaderF模糊查找插件
Plug 'vim-scripts/vim-cpp-enhanced-highlight' "c/c++ 语法高亮
Plug 'vim-scripts/AutoComplPop' "查字典补全
Plug 'vim-scripts/nerdtree' "显示目录树
Plug 'vim-scripts/ale' "语法检测
Plug 'vim-scripts/global-6.6.4' "gtags引用跳转
Plug 'vim-scripts/gutentags_plus' "gutentags_plus异步ctags插件
Plug 'vim-scripts/SrcExpl' "srcexpl插件
call plug#end()




"Tlist插件配置
let Tlist_Show_One_File           = 1 " 只显示当前文件的tags
"let Tlist_Auto_Open			  = 1 " 打开vim自动打开Tlist
"let Tlist_GainFocus_On_ToggleOpen = 1 " 打开Tlist窗口时,光标跳到list窗口
let Tlist_Exit_OnlyWindow         = 1 " 如果Tlist窗口是最后一个窗口则退出Vim
" let Tlist_Use_Left_Window         = 1 " 在左侧窗口中显示
let Tlist_Use_Right_Window         = 1 " 在左侧窗口中显示
let Tlist_File_Fold_Auto_Close    = 1 " 自动折叠
let Tlist_Auto_Update             = 1 " 自动更新
" <F4> 打开 Tlist 窗口，在左侧栏显示
map <F4> :TlistToggle<CR>





"nerdcommenter插件快速注释
let g:NERDSpaceDelims            = 1      " 在注释符号后加一个空格
let g:NERDCompactSexyComs        = 1      " 紧凑排布多行注释
let g:NERDDefaultAlign           = 'left' " 逐行注释左对齐
let g:NERDAltDelims_java         = 1      " JAVA 语言使用默认的注释符号
let g:NERDCustomDelimiters       = {'c': {'left': '/*', 'right': '*/'}} " C 语言注释符号
let g:NERDCommentEmptyLines      = 1      " 允许空行注释
let g:NERDTrimTrailingWhitespace = 1      " 取消注释时删除行尾空格
let g:NERDToggleCheckAllLines    = 1      " 检查选中的行操作是否成功
map <F12> <plug>NERDCommenterSexy         " 选中注释
map <c-F12> <plug>NERDCommenterUncomment  " 选中取消注释





"airline状态栏配置
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
map <c-Left> :bp<CR>    " 切换到上一个
map <c-Right> :bn<CR>   " 切换到下一个
map <F2> :bd<CR>        " 关闭当前窗口
map 11 :b1<CR>          " 切换到编号1
map 22 :b2<CR>          " 切换到编号2
map 33 :b3<CR>          " 切换到编号3
map 44 :b4<CR>          " 切换到编号4
map 55 :b5<CR>          " 切换到编号5
map 66 :b6<CR>          " 切换到编号6
map 77 :b7<CR>          " 切换到编号7
map 88 :b8<CR>          " 切换到编号8
map 99 :b9<CR>          " 切换到编号9
map 00 :b10<CR>         " 切换到编号10





" 配置 ctags 的参数 "
map <c-]> g<c-]>  "ctags跳转不自动选择





" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
if executable('ctags')
        let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
        let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有--extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的Exuberant-ctags 不能加下一行
"let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0







"LeaderF 模糊文件查找配置
let g:Lf_ShortcutF = '<c-p>' " 文件快速搜索
" 函数,宏,变量快速搜索
noremap <c-f> :LeaderfTag<cr>
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}




let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
" let g:Lf_Gtagsconf = '/usr/local/share/gtags/gtags.conf'
let g:Lf_Gtagsconf = '/home/user/syy/.gtags_code/share/gtags/gtags.conf'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>




" cpp-enhanced-highlight c/c++ 语法高亮配置
" 默认情况下，不突出显示类范围。启用设置
let g:cpp_class_scope_highlight = 1

" 默认情况下，成员变量突出显示为禁用状态。启用设置
let g:cpp_member_variable_highlight = 1

" 默认情况下，在声明中高亮显示类名。启用设置
let g:cpp_class_decl_highlight = 1

" POSIX功能的突出显示默认情况下处于禁用状态。启用设置
let g:cpp_posix_standard = 1

" 有两种突出显示模板功能的方法。要么
let g:cpp_experimental_simple_template_highlight = 1

" 在大多数情况下都可以使用，但是在大文件上可能会有点慢。替代设置
let g:cpp_experimental_template_highlight = 1

" 这是一个较快的实现，但是在某些极端情况下它不起作用。
" 注意：众所周知，C ++模板语法很难解析，因此不要指望此功能是完美的。
" 库概念的突出显示由
let g:cpp_concepts_highlight = 1

" 这将突出显示关键字的概念，要求以及标准库中的所有命名要求（例如DefaultConstructible）
" 可以通过以下方式禁用突出显示用户定义的功能
let g:cpp_no_function_highlight = 1






" NerdTree才插件的配置信息
""将F2设置为开关NERDTree的快捷键
map <f2> :NERDTreeToggle<cr>
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=0






"ALE异步语法检查
" ale-setting {{{
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
" }}}





"启用gtags模块
let g:gutentags_modules = ['ctags','gtags_cscope']

"配置项目根标记。
let g:gutentags_project_root = ['.root']

"在我的缓存目录中生成日期数据库，防止gtags文件污染我的项目
let g:gutentags_cache_dir = expand('~/.cache/tags')

"搜索后将焦点更改为quickfix窗口（可选）。
let g:gutentags_plus_switch = 1




" source explorer
map <C-e> :SrcExplToggle<CR>
let g:SrcExpl_winHeight = 8
let g:SrcExpl_refreshTime = 100
let g:SrcExpl_gobackKey = "<SPACE>"
let g:SrcExpl_jumpKey = '<ENTER>'
let g:SrcExpl_isUpdateTags = 0
