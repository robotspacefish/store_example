class CLI
  attr_accessor :type, :options
  def initialize(args)
    # TODO handle user not entering any args
    # args is an array of arguments the
    # user entered in the command line, or []
    @type = args.first
    @options = args.length > 1 ? self.set_options(args) : []
  end

  def set_options(options)
    # store remaining style options
    options.slice(1, options.length)
  end

  def self.run(product_data, args)
    cli = self.new(args)
    self.create_products(product_data)

    products = cli.find_by_options(cli.find_by_type)

    pp products
  end

  def self.create_products(product_data)
    product_data.each do |prod|
      Product.new(prod["id"], prod["product_type"], prod["options"])
    end

  end

  def find_by_type
    # search for products that match type given by user
    Product.all.filter do |prod|
      prod.type == @type
    end
  end

  def find_by_options(products)
    # then narrow down further by options,
    if @options != []
      products.filter do |prod|
        @options.all? do |option|
          prod.options.value?(option)
        end
      end
    else
      products
    end
  end

end


