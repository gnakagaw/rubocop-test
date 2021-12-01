def myfunc
  MyClass.transaction do
    puts("foo")
  end
end
