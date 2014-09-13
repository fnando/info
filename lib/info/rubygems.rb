require 'info'

Info.setup do
  add 'Rubygems', Gem.loaded_specs.map {|(_, spec)|
    {name: spec.name, version: spec.version.to_s}
  }
end
