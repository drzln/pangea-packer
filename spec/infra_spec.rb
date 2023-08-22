###############################################################################
# create test infrastructure with pangea
###############################################################################

require %(terraform-synthesizer)
require %(pangea)

describe %(infrastructure state) do
  let(:tf) do
    TerraformSynthesizer.new
  end

  let(:pangea) do
    Pangea
  end

  it %(passes the module test) do
    expect(pangea.ping).to be_a(String)
  end
end

# end create test infrastructure with pangea
