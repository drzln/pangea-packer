# frozen_string_literal: true

require_relative %(./src/lib/pangea_packer/version)

Gem::Specification.new do |spec|
  spec.name                  = %(pangea-packer)
  spec.version               = PangeaPacker::VERSION
  spec.authors               = [%(drzthslnt@gmail.com)]
  spec.email                 = [%(drzthslnt@gmail.com)]
  spec.description           = %(create architectures to support packer)
  spec.summary               = %(create architectures to support packer)
  spec.homepage              = %(https://github.com/drzln/#{spec.name})
  spec.license               = %(MIT)
  spec.files                 = `git ls-files`.split($OUTPUT_RECORD_SEPARATOR)
  spec.require_paths         = [%(src)]
  spec.executables           = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.required_ruby_version = %(>= #{`cat .ruby-version`})

  %i[
    rubocop-rspec
    rubocop-rake
    keycutter
    rubocop
    rspec
    rake
    yard
  ].each do |gem|
    spec.add_development_dependency(gem)
  end

  %i[
    terraform-synthesizer
    abstract-synthesizer
  ].each do |gem|
    spec.add_runtime_dependency(gem)
  end

  spec.metadata[%(rubygems_mfa_required)] = %(true)
end
