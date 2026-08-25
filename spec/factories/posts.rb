FactoryBot.define do
  factory :post do
    title { 'タイトル１' }
    content { '本文１' }

    association :user, factory: :user
  end
end
