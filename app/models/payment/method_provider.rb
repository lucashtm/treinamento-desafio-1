module Payment
  class MethodProvider
    def self.for(name)
      (METHODS[name] || DEFAULT_METHOD)
    end
  end
end