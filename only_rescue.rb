def myfunc
  puts("foo")
rescue => e
  logger.debug "error"
  @err += 1
end
