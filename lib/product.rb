class Product
  @@products = []
  
  def initialize( option={} )
    @@products << self
  end
  
  def self.all
    @@products
  end
end