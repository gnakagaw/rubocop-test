def myfunc
  MyClass.transaction do
    puts("foo")
  rescue => e
      logger.debug("err")
      @err += 1
  end
end
