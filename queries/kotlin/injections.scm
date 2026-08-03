
; extends

((annotation
    name: (user_type (reference_identifier) @annotation_name)
    arguments: (annotation_arguments 
      [
        (value_argument 
          value: (multi_line_string_literal) @content)
        (value_argument 
          (assignment_expression
            alias: (reference_identifier) @arg_name
            right: (multi_line_string_literal) @content))
      ]))
  (#eq? @annotation_name "Query")
  (#set! injection.language "sql"))
