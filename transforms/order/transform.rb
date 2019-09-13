# Your Transform Class should always extend from 
# Parser:: TreeRewriter
class Transform < Parser::TreeRewriter
  def on_send(node)
    if node.children.length > 3 and node.children[1] == :has_many
      hash = node.children[3]
      hash.children.each do |child|
        if child.type == :pair
          _key = child.children[0]
          _value = child.children[1]
          if _key.type == :sym and _key.children[0] == :order
            replace(child.loc.to_hash[:expression],"-> { order(\"#{_value.children[0]}\") }")
          end
        end
      end
    end
  end
end
