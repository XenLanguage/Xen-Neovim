" Vim syntax file
" Language: Xen
" Maintainer: Your Name
" Latest Revision: 2026-01-02

if exists("b:current_syntax")
  finish
endif

" Keywords
syntax keyword xenKeyword fn include class
syntax keyword xenConditional if else new this private and or var const
syntax keyword xenRepeat for while in
syntax keyword xenBoolean true false
syntax keyword xenConstant null 

" Built-in functions
syntax keyword xenBuiltin number typeof

" Module names
syntax keyword xenModule io math string datetime array os

" Numbers (must come before operators to avoid . matching)
syntax match xenFloat "\v<\d+\.\d+>"
syntax match xenNumber "\v<\d+>"

" Strings
syntax region xenString start='"' skip='\\"' end='"' contains=xenEscape
syntax region xenString start="'" skip="\\'" end="'" contains=xenEscape
syntax match xenEscape contained "\\[ntr\\'\"]"

" Function calls
syntax match xenFunction "\v<\w+>\s*\("me=e-1

" Module function calls
syntax match xenModuleFunction "\v<(io|math|string|datetime|array|os)\.\w+>"

" Constants (all caps)
syntax match xenUserConstant "\v<[A-Z_][A-Z0-9_]*>"

" Delimiters
syntax match xenDelimiter ";"
syntax match xenDelimiter ","

" Brackets
syntax match xenBracket "[{}()\[\]]"

" Operators - compound operators BEFORE single char operators
syntax match xenOperator "++"
syntax match xenOperator "--"
syntax match xenOperator "+="
syntax match xenOperator "-="
syntax match xenOperator "\*="
syntax match xenOperator "/="
syntax match xenOperator "%="
syntax match xenOperator "=="
syntax match xenOperator "!="
syntax match xenOperator "<="
syntax match xenOperator ">="
syntax match xenOperator "&&"
syntax match xenOperator "||"
syntax match xenOperator "\.\."
syntax match xenOperator "+"
syntax match xenOperator "-"
syntax match xenOperator "\*"
syntax match xenOperator "%"
syntax match xenOperator "="
syntax match xenOperator "<"
syntax match xenOperator ">"
syntax match xenOperator "!"
syntax match xenOperator "\."
syntax match xenOperator "=>"

" Division operator - but NOT when followed by another / (comment)
" Skip this to avoid conflict with comments
" syntax match xenOperator "/" 

" Comments - DEFINED LAST so they have HIGHEST PRIORITY
" This ensures // and /* */ are matched as comments, not as division operators
syntax match xenComment "//.*$"
syntax region xenCommentBlock start="/\*" end="\*/"

" Highlighting
highlight default link xenKeyword Keyword
highlight default link xenConditional Conditional
highlight default link xenRepeat Repeat
highlight default link xenBoolean Boolean
highlight default link xenConstant Constant
highlight default link xenBuiltin Function
highlight default link xenModule Type
highlight default link xenString String
highlight default link xenEscape SpecialChar
highlight default link xenNumber Number
highlight default link xenFloat Float
highlight default link xenOperator Operator
highlight default link xenFunction Function
highlight default link xenModuleFunction Function
highlight default link xenDelimiter Delimiter
highlight default link xenBracket Delimiter
highlight default link xenUserConstant Constant
highlight default link xenComment Comment
highlight default link xenCommentBlock Comment

let b:current_syntax = "xen"
