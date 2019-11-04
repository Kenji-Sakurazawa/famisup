class Topic < ApplicationRecord
  # enum role: { "parents" => 0, "students" => 1, "others" => 2 }
  has_many :post, dependent: :destroy
end
