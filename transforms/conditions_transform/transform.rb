# frozen_string_literal: true

require 'parser/current'

# Your Transform Class should always extend from
# Parser:: TreeRewriter
class ConditionsTransform < Parser::TreeRewriter
  def on_lvasgn(node)
    # Reverse the variable names
    replace(node.loc.name, node.children[0].to_s.reverse)
  end

  def on_def(node)
    replace(node.loc.name, node.children[0].to_s.reverse)
  end
end
