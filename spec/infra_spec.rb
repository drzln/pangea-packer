###############################################################################
# create test infrastructure with pangea
###############################################################################

require %(terraform-synthesizer)
require %(pangea)
require %(ostruct)

def deep_ostruct(hash)
  OpenStruct.new(
    hash.each_with_object({}) do |(key, value), result|
      result[key] = value.is_a?(Hash) ? deep_ostruct(value) : value
    end
  )
end

describe %(infrastructure state) do
  let(:tf) do
    TerraformSynthesizer.new
  end

  let(:pangea) do
    Pangea
  end

  let(:config) do

    cfg                           = {}
    cfg[:test]                    = {}
    cfg[:test][:home]             = %(./spec/test_home/infrastructure_state)
    cfg[:test][:pangea]           = {}
    cfg[:test][:pangea][:config]  = File.join(cfg[:test][:home], %(pangea.rb))

    deep_ostruct(cfg)
  end

  before do
    system %(mkdir -p #{config.test.home}) unless Dir.exist?(config.test.home)
  end

  it %(passes the module test) do
    expect(pangea.ping).to be_a(String)
  end

  it %(creates config ostruct) do
    expect(config.test.home).to be_a(String)
  end

  it %(created correct directory) do
    expect(Dir.exist?(config.test.home)).to be(true)
  end
end

# end create test infrastructure with pangea
