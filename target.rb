# NG
def method_ng_1
  ApplicationRecord.transaction do
    rand1 = SecureRandom.base64(8)
    rand2 = SecureRandom.base64(8)

    record1 = Test.new(foo: rand1, bar: rand2)
    record2 = Test.new(foo: rand1, bar: rand2)
    record1.save
    record2.save
  rescue ActiveRecord::RecordNotUnique => e
    logger.debug('transaction error')
    logger.debug(e)
  end
end

def method_ng_2
  ApplicationRecord.transaction do
    rand1 = SecureRandom.base64(8)
    rand2 = SecureRandom.base64(8)

    record1 = Test.new(foo: rand1, bar: rand2)
    record2 = Test.new(foo: rand1, bar: rand2)
    begin
      record1.save
      record2.save
    rescue ActiveRecord::RecordNotUnique => e
      logger.debug('transaction error')
      logger.debug(e)
    end
  end
end

# OK
def method_ok_1
  ApplicationRecord.transaction do
    rand1 = SecureRandom.base64(8)
    rand2 = SecureRandom.base64(8)

    record1 = Test.new(foo: rand1, bar: rand2)
    record2 = Test.new(foo: rand1, bar: rand2)
    record1.save
    record2.save
  end
rescue ActiveRecord::RecordNotUnique => e
  logger.debug('transaction error')
  logger.debug(e)
end

def method_ok_2
  begin
    ApplicationRecord.transaction do
      rand1 = SecureRandom.base64(8)
      rand2 = SecureRandom.base64(8)
      
      record1 = Test.new(foo: rand1, bar: rand2)
      record2 = Test.new(foo: rand1, bar: rand2)
      record1.save
      record2.save
    end

  rescue ActiveRecord::RecordNotUnique => e
    logger.debug('transaction error')
    logger.debug(e)
  end
end
