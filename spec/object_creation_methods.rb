Fixjour do
  define_builder(Supporter) do |klass, overrides|
    klass.new(:email => Faker::Internet.email, :name => Faker::Name.name)
  end
end

include Fixjour
