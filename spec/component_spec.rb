# require_relative %(../src/lib/pangea_component/pangea_component)
# require %(terraform-synthesizer)

# describe %(component interface) do
#   let(:tf) do
#     TerraformSynthesizer.new
#   end
#
#   before do
#     tf.synthesize do
#       component(
#         resource: :aws_vpc,
#         name: %(test_vpc),
#         properties: {
#           cidr_block: %(10.0.0.0/16),
#           tags: { Name: %(test_vpc) }
#         }
#       )
#     end
#   end
#
#   it %(returns a Hash) do
#     expect(tf.synthesis).to be_kind_of(Hash)
#   end
#
#   it %(has correct property values) do
#     expected = {
#       cidr_block: %(10.0.0.0/16),
#       tags: { Name: %(test_vpc) }
#     }
#     tf.synthesis[:resource].each_key do |resource_name|
#       resource = tf.synthesis[:resource][resource_name]
#       resource.each_key do |property_name|
#         property_name   = property_name.to_sym
#         property_value  = resource[property_name]
#         expect(property_value).to eq(expected[property_name.to_sym])
#       end
#     end
#   end
# end
