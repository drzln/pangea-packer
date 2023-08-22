###############################################################################
# create test infrastructure with pangea
###############################################################################

require %(terraform-synthesizer)

describe %(infrastructure state) do
  let(:tf) do
    TerraformSynthesizer.new
  end
end

# end create test infrastructure with pangea
