# frozen_string_literal: true

FactoryBot.define do
  factory :album do
    name { ['Madame X', 'Ray of Light', 'True Blue'].sample }
  end
end
