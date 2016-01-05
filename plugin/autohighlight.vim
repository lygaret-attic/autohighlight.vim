highlight CursorAutoHighlight term=underline cterm=underline gui=underline

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
    augroup end
endif
