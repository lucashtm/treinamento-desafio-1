class Payment::Ticket < Payment::Method
  def self.confirm
    puts('Ticket confirmed')
  end
end