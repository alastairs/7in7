class Tree
  attr_accessor :children, :node_name

  def initialize(tree_hash = {})
  	  @children = []
  	  tree_hash.each do |name, subtree|
  	  	  @node_name = name
  	  	  subtree.each do |childName, childSubtree|
  	  	  	  @children.push(Tree.new({ childName => childSubtree }))
	  	  end
	  end
  end

  def visit_all(&block)
  	  visit &block
  	  children.each {|c| c.visit_all &block}
  end

  def visit(&block)
  	  block.call self
  end
end

ruby_tree = Tree.new({
	'grandpa' => {
		'dad' => {
			'child1' => {},
			'child2' => {}
		},
		'uncle' => {
			'child3' => {},
			'child4' => {}
		}
	}
})

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
