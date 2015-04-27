FactoryGirl.define do
  factory :reservation do
    num_of_seats 4
    time 12
    date 2015-04-27
    restaurant
  end
end