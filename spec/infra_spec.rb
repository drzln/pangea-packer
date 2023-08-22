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
end

# end create test infrastructure with pangea
