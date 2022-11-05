require_relative('./decorators/nameable')
require_relative('./decorators/capitalized_decorator')
require_relative('./decorators/trimmer_decorator')
require_relative('./rental')
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :rentals

  DEFAULT_PERM = true
  def initialize(age, name = 'Unknown', parent_permission = DEFAULT_PERM)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end
