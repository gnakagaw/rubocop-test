def myfunc
  MyClass.transaction do
    puts("foo")
  end
rescue => e
  logger.debug("err")
  @err += 1
end
