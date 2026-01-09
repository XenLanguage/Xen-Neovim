" Vim indent file
" Language: Xen
" Maintainer: Jake Rieger <contact.jakerieger@gmail.com>

if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=XenIndent()
setlocal indentkeys=0{,0},0),0],!^F,o,O
setlocal autoindent

function! XenIndent()
  let line = getline(v:lnum)
  let previousNum = prevnonblank(v:lnum - 1)
  let previous = getline(previousNum)

  " If the current line starts with }, ], or ), unindent
  if line =~ '^\s*[}\])]'
    return indent(previousNum) - shiftwidth()
  endif

  " If the previous line ends with {, [, or (, indent
  if previous =~ '[{[(]\s*$'
    return indent(previousNum) + shiftwidth()
  endif

  " Otherwise, keep the same indent
  return indent(previousNum)
endfunction
