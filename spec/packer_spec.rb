require %(terraform-synthesizer)
require %(json)

def symbolize(hash)
  JSON[JSON[hash], symbolize_names: true]
end

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

  it %(all vpcs have a cidr_block) do
    synthesis = symbolize(tf.synthesis)
    aws_vpcs  = synthesis[:resource][:aws_vpc]

    aws_vpcs.each_key do |vpc_name|
      aws_vpc = aws_vpcs[vpc_name]
      expect(aws_vpc[:cidr_block]).to be_a(String)
    end
  end

  it %(all vpcs have tags) do
    synthesis = symbolize(tf.synthesis)
    aws_vpcs  = synthesis[:resource][:aws_vpc]

    aws_vpcs.each_key do |vpc_name|
      aws_vpc = aws_vpcs[vpc_name]
      expect(aws_vpc[:tags]).to be_a(Hash)
    end
  end
end
