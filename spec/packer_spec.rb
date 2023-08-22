require %(terraform-synthesizer)

describe %(packer architecture) do
  let(:tf) do
    TerraformSynthesizer.new
  end

  before do
    tf.synthesize(
      File.read(
        %(./src/lib/pangea_packer/pangea_packer.rb)
      )
    )
  end

  it %(returns a hash) do
    expect(tf.synthesis).to be_a(Hash)
  end
end
