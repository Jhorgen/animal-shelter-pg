class Shelter
  attr_accessor: :species, :name, :breed, :gender, :timestamp, :id

  def initialize(attr)
    @species = attr.fetch(:species)
    @name = attr.fetch(:name)
    @breed = attr.fetch(:breed)
    @gender = attr.fetch(:gender)
    @timestamp = attr.fetch(:time)
    @id = attr.fetch(:id)
  end

end
