class Payment::MethodProvider
  def self.for(name)
    (METHODS[name] || DEFAULT_METHOD)
  end
end