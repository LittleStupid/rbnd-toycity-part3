class Product
  attr_reader :title
  
  @@products = []
  
  def initialize( options={} )
    @title = options[:title]
    add_to_products
  end
  
  def self.all
    @@products
  end
  
  def self.find_by_title( title )
    @@products.find do |it| it.title == title end 
  end
  
  private
  
  def add_to_products
    group = @@products.select { |it| it.title == self.title }
    if( group.length == 0 )
      @@products << self
    else
      raise DuplicateProductError, "'#{self.title}' already exists."
    end
  end
end