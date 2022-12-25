def my_func
  MyClass.transaction do
    foo = "foo"
    puts(foo)
  rescue => e
    logger.debug "foo"
    @err += 1
  end
end
