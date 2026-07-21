" Vim syntax file
" Language: Cedar policy language (https://cedarpolicy.com/)
" Target:   Cedar 4.x
" Notes:    Highlighting is not validation. Use the Cedar CLI or cedar-wasm
"           for authoritative parse/validate against your schema.

if exists("b:current_syntax")
  finish
endif

" Comments: Cedar supports // only. There are no block comments.
syn match   cedarComment    "//.*$" contains=@Spell

" Annotations: @id("value"), @advice("..."), arbitrary keys allowed
syn match   cedarAnnotation "@[A-Za-z_][A-Za-z0-9_]*" nextgroup=cedarAnnotationArgs skipwhite
syn region  cedarAnnotationArgs start="(" end=")" contained contains=cedarString

" Effects
syn keyword cedarEffect     permit forbid

" Scope variables and condition clauses
syn keyword cedarScope      principal action resource context
syn keyword cedarCondition  when unless

" Operators and control words
syn keyword cedarOperator   in is has like if then else
syn match   cedarOperator   "&&\|||\|!\|==\|!=\|<=\|>=\|<\|>\|+\|-\|\*"

" Booleans
syn keyword cedarBoolean    true false

" Template slots
syn match   cedarSlot       "?principal\|?resource"

" Numbers: Cedar has Long only, no floats. Decimals are strings via decimal().
syn match   cedarNumber     "\<-\?\d\+\>"

" Strings, with Cedar escape forms including \u{...}
syn region  cedarString     start=+"+ skip=+\\.+ end=+"+ contains=cedarEscape
syn match   cedarEscape     +\\\(["'\\nrt0]\|u{\x\{1,6}}\)+ contained

" Entity type paths: Namespace::Type::"id"
syn match   cedarEntityType "\<[A-Z][A-Za-z0-9_]*\(::[A-Za-z_][A-Za-z0-9_]*\)*\>"
syn match   cedarNamespace  "\<[a-z][A-Za-z0-9_]*\ze::"

" Built-in methods on Set and entity types
syn keyword cedarMethod     contains containsAll containsAny isEmpty
syn keyword cedarMethod     getTag hasTag

" Extension functions and their methods
syn keyword cedarExtension  ip decimal datetime duration
syn keyword cedarExtension  isIpv4 isIpv6 isLoopback isMulticast isInRange
syn keyword cedarExtension  lessThan lessThanOrEqual greaterThan greaterThanOrEqual
syn keyword cedarExtension  toDate toTime toMilliseconds toSeconds toMinutes toHours toDays
syn keyword cedarExtension  offset durationSince

hi def link cedarComment        Comment
hi def link cedarAnnotation     PreProc
hi def link cedarEffect         Statement
hi def link cedarScope          Identifier
hi def link cedarCondition      Conditional
hi def link cedarOperator       Operator
hi def link cedarBoolean        Boolean
hi def link cedarSlot           Special
hi def link cedarNumber         Number
hi def link cedarString         String
hi def link cedarEscape         SpecialChar
hi def link cedarEntityType     Type
hi def link cedarNamespace      Structure
hi def link cedarMethod         Function
hi def link cedarExtension      Function

let b:current_syntax = "cedar"
