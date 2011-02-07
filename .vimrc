syntax on
set autoindent

" Показывать незавершенные команды в статусбаре
set showcmd
" Нумерация строк
"set number
" Поддержка мыши
set mouse=a
set mousemodel=popup
" Скрыть указатель мыши во время набора текста
set mousehide
" Ширина строки команд в одну строку
set ch=1
" Подсветка синтаксиса
syntax enable
hi comment ctermfg=cyan
" Цветовая схема
color zellner
set autoindent
" Не создавать резервных копий файлов
set nobackup
set noswapfile
" Фолдинг по отступам
set foldmethod=manual
" Поиск по набору текста
set incsearch
" Отключение подсветки найденных вариантов
set nohlsearch
" Не выгружать буфер когда переключаешься на другой
set hidden
" Скрыть панель в gui версии
set guioptions-=T
" Включить автоотступы
set autoindent
" Преобразовать Таба в пробелы
set expandtab
" Размер табуляции по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4
" походу, ширина строки
set textwidth=120
set fo=tcroq
" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2
"Умные" отступы (например, автоотступ после {)
set smartindent
filetype plugin on
" Опции сессии
set sessionoptions=curdir,buffers,tabpages
set dictionary+=/usr/share/dict/words


" Настраиваем переключение раскладок клавиатуры по
" set keymap=russian-jcukenwin
" Раскладка по умолчанию - английская
" set iminsert=0

" Просмотр нетекстовых файлов в Vim -->
au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
au BufReadPost *.doc silent %!antiword "%"
au BufReadPost *.odt silent %!odt2txt "%"
" Просмотр нетекстовых файлов в Vim <--

"--------------------------
" ГОРЯЧИЕ КЛАВИШИ
"--------------------------

" Пробел в нормальном режиме перелистывает страницы
nmap <Space> <PageDown>

" CTRL-F для omni completion
imap <C-F> <C-X><C-O>

" F2 - быстрое сохранение
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>
imap <F2> <esc>:w<cr>

" F3 - просмотр ошибок
nmap <F3> :open<cr>
vmap <F3> <esc>:copen<cr>
imap <F3> <esc>:copen<cr>

" F4 - ctags
nmap <F4> :TlistToggle<cr>
vmap <F4> <esc>:TlistToggle<cr>
imap <F4> <esc>:TlistToggle<cr>

" F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F6-предыдущий буфер
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" F9 - "make" команда
map <F9> :make<cr>
vmap <F9> <esc>:make<cr>i
imap <F9> <esc>:make<cr>i

" F10 - удалить буфер
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F12 - обозреватель файлов
map <F12> :WMToggle<cr>
vmap <F12> <esc>:WMToggle<cr>i
imap <F12> <esc>:WMToggle<cr>i

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

" Выключаем ненавистный режим замены
imap >Ins> <Esc>i

" Редко когда надо [ без пары =)
imap [ []<LEFT>
" Аналогично и для {
imap {<CR> {<CR>}<Esc>O

" С-q - выход из Vim
map <C-Q> <Esc>:qa<cr>


" Ускоренное передвижение по тексту

" Более привычные Page Up/Down, когда курсор остаётся в той же строке,
" а не переносится вверх/вниз экрана, как при стандартном
"     PgUp/PgDown.
" Поскольку по умолчанию прокрутка по C-U/D происходит на
"         полэкрана,
" привязка делается к двойному нажатию этих комбинаций.
nmap <PageUp> <C-U><C-U>
imap <PageUp> <C-O><C-U><C-O><C-U>
nmap <PageDown> <C-D><C-D>
imap <PageDown> <C-O><C-D><C-O><C-D>

au BufNewFile,BufRead *.tt setf tt2html
:let b:tt2_syn_tags = '\[% %]'

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType tt2html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

let g:Perl_AuthorName = "Andrey Kostenko"
let g:Perl_Company = "Rambler Internet Holding"
let g:Perl_Email = "andrey@kostenko.name"

"setlocal spell spelllang=ru,en
set fileencodings=utf-8,cp1251
set modeline
autocmd BufRead *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\" 
autocmd BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m 
python << EOL
import vim
def EvaluateCurrentRange():
    eval(compile('\n'.join(vim.current.range),'','exec'),globals())
EOL
map <C-h> :py EvaluateCurrentRange() 
nnoremap <C-]> :execute 'tj' expand('<cword>')<CR>zv
set keywordprg=pydoc
