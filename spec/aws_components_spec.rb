require %(terraform-synthesizer)

describe %(aws components) do
  let(:tf) do
    TerraformSynthesizer.new
  end

  before do
    tf.synthesize do
      require_relative %(../src/lib/components/aws/vpc)

      results = vpc(
        name: %(test_vpc),
        properties: {
          cidr_block: %(10.0.0.0/16)
        }
      )

      # inputs are always mirrored back
      results[:inputs].each_key do |k|
        output k do
          value results[:inputs][k]
          description %(The input #{k})
        end
      end
    end
  end

  it %(returns a Hash) do
    expect(tf.synthesis).to be_kind_of(Hash)
  end

  it %(contains correct outputs) do
    outputs = tf.synthesis[:output]
    expected = %i[resource name properties]
    outputs.each_key do |k|
      expect(expected.include?(k)).to be(true)
    end
  end
end
