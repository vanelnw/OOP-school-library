class Teacher < Person
  attr_reader :specialization

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, specialization, name = 'Unknown', parent_permission = true)
    super(age, name, parent_permission)
    @specialization = specialization
  end
  # rubocop:enable Style/OptionalBooleanParameter

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'specialization' => @specialization,
      'age' => @age,
      'name' => @name,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end

  def self.json_create(object)
    new(object['specialization'], object['age'], object['name'], object['parent_permission'])
  end
end
