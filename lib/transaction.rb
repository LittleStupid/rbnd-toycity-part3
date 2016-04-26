class Transaction
  
  attr_accessor :customer, :product
  attr_accessor :id
  
  @@global_id = 0
  @@transactions = []
  
  def initialize( customer, product )
    if( product.stock > 0 )
      self.customer = customer
    
      self.product = product
      product.stock -= 1
        
      @@global_id += 1
      self.id = @@global_id
    
      @@transactions << self
    else
      raise OutOfStockError, "'#{product.title}' is out of stock."
    end
  end
  
  def self.all
    @@transactions
  end
  
  def self.find( index )
    @@transactions[ index - 1 ]
  end  
  
end