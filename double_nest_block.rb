MyClass.transaction do
  MyClass.foo do
    MyAwesomeClass.fuga do
      foo = "foo"
      puts(foo)
    rescue => e
      logger.debug "foo"
      @err += 1
    end
  end
end

