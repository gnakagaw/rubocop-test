def myfunc
  MyClass.transaction do
    MyAwesomeClass.invoke do
      puts("foo")
    rescue => e
      logger.debug("err")
      @err += 1
    end
  end
end
