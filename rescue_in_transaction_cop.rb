class RuboCop::Cop::Lint::RescueInTransaction < RuboCop::Cop::Base
  def_node_matcher :rescue_in_transaction_call?, <<~PATTERN
    (block
      (send
        (const nil? :ApplicationRecord) :transaction)
      (args)
      {(rescue ...) | (begin ... (kwbegin (rescue ...)))}
    )
  PATTERN

  MSG = 'Avoid the use of `rescue` in a `ApplicationRecord.transaction` block'.freeze
  
  def on_block(node)
    return unless rescue_in_transaction_call?(node)
    
    add_offense(node)
  end
end
