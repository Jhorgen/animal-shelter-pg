class Animal
  attr_accessor :species, :name, :breed, :gender, :timestamp, :owner_id, :id

  def initialize(attr)
    @species = attr.fetch(:species)
    @name = attr.fetch(:name)
    @breed = attr.fetch(:breed)
    @gender = attr.fetch(:gender)
    @timestamp = attr.fetch(:time)
    @owner_id = attr.fetch(:owner)
  end


end
