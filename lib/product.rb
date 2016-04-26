class Product
  attr_reader :title, :price
  attr_accessor :stock
  @@products = []
  
  def initialize( options={} )
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end
  
  def in_stock?
    @stock > 0
  end
  
  def self.in_stock
    @@products.select do |it| it.in_stock? end
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
  
  def self.empty?
    @@products.length > 0
  end
end