require %(json)

def symbolize(hash)
  JSON[JSON[hash], symbolize_names: true]
end

def deep_open_struct(hash)
  Struct.new(
    hash.map do |key, value|
      [key, value.is_a?(Hash) ? deep_open_struct(value) : value]
    end
  ).tap.call(&:freeze)
end

def component(**kwargs)
  kwargs        = symbolize(kwargs) unless kwargs.nil?
  resource_name = kwargs.fetch(:resource, nil)
  virtual_name  = kwargs.fetch(:name, nil)
  properties    = kwargs.fetch(:properties, {})

  resource(resource_name, virtual_name) do
    properties.each_key do |method|
      args = kwargs.dig(:properties, method)
      send(method, args)
    end
  end

  outputs           = {}
  outputs[:inputs]  = kwargs

  # future handle for extracted properties
  # from derived components
  nil if kwargs[:extracted_properties]

  outputs
end
