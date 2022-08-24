puts("hoge")
MyClass.transaction do
  puts("fuga")
  puts("piyo")
  MyClass.foo do
    foo = "foo"
    puts(foo)
  rescue => e
    logger.debug "foo"
    @err += 1
  end
end

