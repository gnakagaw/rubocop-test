class RuboCop::Cop::Lint::MethodHavingTransactionAndRescue < RuboCop::Cop::Base
  def_node_matcher :violate?, <<~PATTERN
    [ (def _ _ `rescue)  (def _ _ `(block (send _ :transaction)(args) _ )) ]
  PATTERN

  MSG = 'A method having `transaction` block and `rescue`. Use caution!'.freeze
  
  def on_def(node)
    return unless violate?(node)

    add_offense(node)
  end
end
