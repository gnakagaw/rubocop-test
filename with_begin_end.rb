MyClass.transaction do
  MyClass.foo do
    begin
      foo = "foo"
      puts(foo)
    rescue => e
      logger.debug "foo"
      @err += 1
    end
  end
end
