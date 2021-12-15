MyClass.transaction do
  MyClass.foo do
    foo = "foo"
    puts(foo)
  rescue => e
    logger.debug "foo"
    @err += 1
  end
end
