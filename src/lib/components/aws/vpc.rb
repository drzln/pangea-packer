require_relative %(../../pangea_component/pangea_component)

def vpc(**kwargs)
  component(resource: %(aws_vpc), **kwargs)
end
