(begin
  name: (curly_group_text (_) @_name @run @script
  (#eq? @_name "document"))
  (#set! tag package-script))
