locals{
  function_name    = "${var.prefix}-lambda-function"
  python_file_name = replace(basename(var.python_file_name), ".py", "")
}