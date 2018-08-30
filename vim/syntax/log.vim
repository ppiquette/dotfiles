" Vim syntax file
" file type: log files
syn match fatal "\c.* FATAL .*"
syn match fatal "\c^\[FATAL.*"
syn match error "\c.* ERROR .*"
syn match error "\c^\[ERROR.*"
syn match warn "\c.* WARN .*"
syn match warn "\c^\[WARN.*"
syn match info "\c.* INFO .*"
syn match info "\c^\[INFO.*"
syn match debug "\c.* DEBUG .*"
syn match debug "\c^\[DEBUG.*"

syn match error "^java.*Exception.*"
syn match error "^java.*Error.*"
syn match error "^\tat .*"

" yanick 
syn match warn "\c.*failed.*"



" Highlight colors for log levels.
" hi fatal ctermfg=Red ctermbg=Black
" hi error ctermfg=Red ctermbg=Black
" hi warn ctermfg=Yellow ctermbg=Black
" hi info ctermfg=Green ctermbg=Black
" hi debug ctermfg=Gray ctermbg=Black
" 
" hi fatal guifg=Red 
" hi error guifg=Red 
hi warn guifg=Black guibg=Yellow 
" hi info guifg=Green 
" hi debug guifg=Gray 
" 
" hi fatal guifg=Red guibg=Black
" hi error guifg=Red guibg=Black
" hi warn guifg=Yellow guibg=Black
" hi info guifg=Green guibg=Black
" hi debug guifg=Gray guibg=Black



let b:current_syntax = "log"

" vim: ts=2 sw=2
