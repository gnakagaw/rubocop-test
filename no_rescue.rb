def my_func 
  MyClass.transaction do
    foo = "foo"
    puts(foo)
  end
rescue => e
  logger.debug "foo"
  @err += 1
end
