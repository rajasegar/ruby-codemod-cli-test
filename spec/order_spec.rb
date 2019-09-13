require './transforms/order/transform.rb'
RSpec.describe "Order Transform" do
  describe "Order transform" do
    it "transforms basic" do
      input = File.read('transforms/order/__testfixtures__/input.rb')

      temp = Parser::CurrentRuby.parse(input)
      rewriter = Transform.new

      buffer        = Parser::Source::Buffer.new('(example)')
      buffer.source = input 
      # Rewrite the AST, returns a String with the new form.
      transform = rewriter.rewrite(buffer, temp)

      output = File.read('transforms/order/__testfixtures__/output.rb')
      expect(transform).to eq(output)
    end
  end
end
