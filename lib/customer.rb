class Customer
  attr_reader :name
  
  
  def initialize( options={} )
    @name = options[:name]
    
    add_to_customers
  end
  
  def purchase( product )
    Transaction.new( self, product )
  end
  
  @@customers = []
  def self.all
    @@customers
  end
  
  def self.find_by_name( name )
    @@customers.find do |it| name == it.name end
  end
  
  private
  
  def add_to_customers
    if( nil == @@customers.find do |it| it.name == self.name end )
      @@customers <<self  
    else
      raise DuplicateCustomerError, "'#{self.name}' already exists."
    end
  end
  
end