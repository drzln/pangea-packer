require %(pangea-component)

spec              = {}
spec[:namespace]  = PangeaData.data.fetch(:namespace, %(pangea))
spec[:base_cidr]  = PangeaData.data.fetch(:base_cidr, %(10.1))
spec[:base_tags]  = PangeaData.data.fetch(:base_tags, { Name: :packer })

component(
  resource: :aws_vpc,
  name: spec[:namespace],
  properties: {
    cidr_block: %(#{spec[:base_cidr]}.0.0/16),
    tags: spec[:base_tags]
  }
)
