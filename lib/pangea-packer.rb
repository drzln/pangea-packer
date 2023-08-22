require %(json)
require %(pangea-component)

component(
  resource: :aws_vpc,
  name: :packer,
  properties: {
    cidr_block: %(10.1.0.0/16),
    tags: { Name: :packer }
})
