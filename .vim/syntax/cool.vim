if exists("b:current_syntax")
    finish
endif

syntax region coolComment start=/\v\(\*/ end=/\v\*\)/
highlight link coolComment Comment

syntax region coolString start=/\v"/ skip=/\v[^\\]\\"/ end=/\v"/
highlight link coolString String

syntax keyword coolKeyword class inherits let in
syntax keyword coolKeyword while loop pool
syntax keyword coolKeyword isvoid not
syntax keyword coolKeyword if then else fi


highlight link coolKeyword Keyword

let b:current_syntax = "cool"

