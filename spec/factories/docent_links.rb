# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :docent_link, :class => 'Docent::Link' do
    controller "users"
    action "new"
    url "http://help/docs/123"
  end
end
