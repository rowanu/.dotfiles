" Vim syntax file
" Language: Cedar schema, human-readable format (.cedarschema)
" Target:   Cedar 4.x
" Notes:    JSON-format schemas (.cedarschema.json) should use the json filetype.

if exists("b:current_syntax")
  finish
endif

syn match   cedarSchComment    "//.*$" contains=@Spell

" Top-level declarations
syn keyword cedarSchDecl       namespace entity action type

" Structural keywords
syn keyword cedarSchKeyword    in appliesTo principal resource context tags enum

" Primitive and container types
syn keyword cedarSchType       Long String Bool Boolean Set Record

" Extension types
syn keyword cedarSchExtType    ipaddr decimal datetime duration

" Optional attribute marker
syn match   cedarSchOptional   "?\ze\s*:"

syn region  cedarSchString     start=+"+ skip=+\\.+ end=+"+

" Entity type paths
syn match   cedarSchEntity     "\<[A-Z][A-Za-z0-9_]*\(::[A-Za-z_][A-Za-z0-9_]*\)*\>"

" Attribute names in record/context blocks
syn match   cedarSchAttr       "\<[a-zA-Z_][A-Za-z0-9_]*\ze\s*?\?\s*:"

hi def link cedarSchComment    Comment
hi def link cedarSchDecl       Keyword
hi def link cedarSchKeyword    Statement
hi def link cedarSchType       Type
hi def link cedarSchExtType    Type
hi def link cedarSchOptional   Special
hi def link cedarSchString     String
hi def link cedarSchEntity     Structure
hi def link cedarSchAttr       Identifier

let b:current_syntax = "cedarschema"
