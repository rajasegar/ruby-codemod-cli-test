# frozen_string_literal: true

require './transforms/conditions_transform/transform.rb'
RSpec.describe ConditionsTransform do
  describe 'Conditions transform' do
    Dir.glob('transforms/conditions_transform/fixtures/*_input.rb').each do |input|
      p input
      it "transforms #{input}" do
        source = File.read(input)

        temp = Parser::CurrentRuby.parse(source)
        rewriter = ConditionsTransform.new

        buffer        = Parser::Source::Buffer.new('(example)')
        buffer.source = source
        # Rewrite the AST, returns a String with the new form.
        transform = rewriter.rewrite(buffer, temp)

        output_fixture = input.gsub('_input.rb', '_output.rb')
        output = File.read(output_fixture)
        expect(transform).to eq(output)
      end
    end
  end
end
