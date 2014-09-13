module Info
  class Configuration
    attr_accessor :enabled
    attr_accessor :authorizer

    def collect(request = nil)
      collectors.each_with_object({}) do |collector, buffer|
        buffer[collector[:name]] = collect_value request, collector[:value]
      end
    end

    def collectors
      @collectors ||= []
    end

    def authorize(&block)
      @authorizer = block
    end

    def enabled?
      @enabled
    end

    def disable!
      @enabled = false
    end

    def enable!
      @enabled = true
    end

    def add(name, value)
      collectors << {name: name, value: value}
    end

    private

    def collect_value(request, value)
      return value unless value.respond_to?(:call)

      if value.arity == 0
        value.call
      else
        value.call(request)
      end
    end
  end
end
