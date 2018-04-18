highlight default CursorAutoHighlight term=underline cterm=underline gui=underline

if !exists('g:AutoHighlight_ClearOnCursorMoved')
    let g:AutoHighlight_ClearOnCursorMoved = 0
endif

if !exists('g:AutoHighlight_ClearOnWindowExit')
    let g:AutoHighlight_ClearOnWindowExit = 0
endif

if !exists('g:AutoHighlight_DisabledBuffers')
    let g:AutoHighlight_DisabledBuffers = ""
endif

let s:disabled_buffers = split(g:AutoHighlight_DisabledBuffers, ",")
function! s:buffered_enabled()
    if ! exists('b:autohighlight_enabled')
        let b:autohighlight_enabled = index(s:disabled_buffers, @%) == -1
    endif
    return b:autohighlight_enabled
endfunction

function! s:clear()
    if (s:buffered_enabled() && exists('w:autohighlight_current') && w:autohighlight_current > 0)
        call matchdelete(w:autohighlight_current)
        let w:autohighlight_current = 0
    endif
endfunction

function! s:highlight()
    if ! s:buffered_enabled()
        return
    endif
    call s:clear()
    let word = expand('<cword>')
    if (word != '')
        let w:autohighlight_current = matchadd('CursorAutoHighlight', '\V\<'.escape(word, '\').'\>')
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
