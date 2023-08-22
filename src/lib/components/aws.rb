require_relative %(../pangea_component/pangea_component)

def local_vpc(**kwargs)
  component(resource: :aws_vpc, **kwargs)
end

module Aws
  class << self
    def vpc(**kwargs)
      local_vpc(**kwargs)
    end
  end
end
