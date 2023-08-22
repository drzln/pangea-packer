require %(terraform-synthesizer)

describe %(packer architecture) do
  let(:tf) do
    TerraformSynthesizer.new
  end

  before do
    tf.synthesize(File.read(%(./lib/pangea-packer.rb)))
  end

  it %(returns a hash) do
    expect(tf.synthesis).to be_a(Hash)
  end

  it %(contains at least one vpc) do
    expect(tf.synthesis[:resource].keys.map(&:to_sym).include?(:aws_vpc)).to be(true)
  end
end
