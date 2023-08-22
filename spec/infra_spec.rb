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
    deep_ostruct({
      # directory where we store pangea configuration
      # and other assets needed to setup test
      test: { home: %(./spec/test_home/infrastructure_state) }
    })
  end

  it %(passes the module test) do
    expect(pangea.ping).to be_a(String)
  end

  it %(creates config ostruct) do
    expect(config.test.home).to be_a(String)
  end
end

# end create test infrastructure with pangea
