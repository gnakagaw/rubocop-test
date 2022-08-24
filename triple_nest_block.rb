MyClass.transaction do
  MyClass.foo do
    AwesomeClass.fuga do
      SupercalifragilisticexpialidociousClass.piyo do
        foo = "foo"
        puts(foo)
      rescue => e
        logger.debug "foo"
        @err += 1
      end
    end
  end
end

