highlight CursorAutoHighlight term=underline cterm=underline gui=underline

if !exists('g:AutoHighlight_ClearOnCursorMoved')
    let g:AutoHighlight_ClearOnCursorMoved = 0
endif

if !exists('g:AutoHighlight_ClearOnWindowExit')
    let g:AutoHighlight_ClearOnWindowExit = 0
endif


function! s:clear()
    if (exists('w:current') && w:current > 0)
        call matchdelete(w:current)
        let w:current = 0
    endif
endfunction

function! s:highlight()
    call s:clear()
    let word = expand('<cword>')
    if (word != '')
        let w:current = matchadd('CursorAutoHighlight', '\V\<'.escape(word, '\').'\>')
    endif
endfunction

if !exists('autocommands_loaded')
    let autocommands_loaded = 1
    augroup autohighlight
        au!
        au CursorHold * call s:highlight()
        if (exists('g:AutoHighlight_ClearOnCursorMoved') && g:AutoHighlight_ClearOnCursorMoved == 1)
            au CursorMoved * call s:clear()
        endif
        if (exists('g:AutoHighlight_ClearOnWindowExit') && g:AutoHighlight_ClearOnWindowExit == 1)
            au WinLeave * call s:clear()
        endif
    augroup end
endif
