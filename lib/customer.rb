class Customer
  attr_reader :id
  attr_accessor :name, :phone, :animal_preference, :breed_preference, :id

  def initialize(attr)
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
    @animal_preference = attr.fetch(:animal_preference)
    @breed_preference = attr.fetch(:breed_preference)
    @id = nil
  end

  def self.clear()
    DB.exec("DELETE FROM customers *;")
  end

  def save()
    result = DB.exec("INSERT INTO customers (name, phone, animal_preference, breed_preference) VALUES ('#{@name}', #{@phone}, '#{@animal_preference}', '#{@breed_preference}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.all()
    DB.exec("SELECT * FROM customers ORDER BY name;")
  end

  def self.find(id)
    DB.exec("SELECT * FROM customers WHERE id = #{@id};").first
  end

end
