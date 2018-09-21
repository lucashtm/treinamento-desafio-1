class Payment::MethodProvider
  DEFAULT_METHOD = Method
  METHODS = {
    credit_card: CreditCard,
    ticket: Ticket
  }
  def self.for(name)
    (METHODS[name] || DEFAULT_METHOD)
  end
end