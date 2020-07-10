class Product
  attr_accessor :id, :type, :options
  @@all = []
  def initialize(id, type, options)
    @id = id
    @type = type
    @options = options
    @@all << self
  end

  def self.all
    @@all
  end

  def self.print_all
    # just testing that the products exist
    self.all.each do |prod|
      puts "#{prod.type}, #{prod.options}"
    end
  end
end