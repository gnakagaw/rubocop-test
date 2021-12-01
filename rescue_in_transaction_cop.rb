class RuboCop::Cop::Lint::RescueInTransaction < RuboCop::Cop::Base
  def_node_matcher :violate?, <<~PATTERN
    (block
      (send
        _ :transaction)
      (args)
      `(rescue ...)
    )
  PATTERN
  
  MSG = 'Avoid the use of `rescue` in a `ApplicationRecord.transaction` block'.freeze
  
  def on_block(node)
    return unless violate?(node)
    
    add_offense(node)
  end
end
