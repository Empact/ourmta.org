Fixjour do
  define_builder(Supporter) do |klass, overrides|
    klass.new(:email => Faker::Internet.email)
  end
end

include Fixjour
