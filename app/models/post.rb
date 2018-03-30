class Post < ApplicationRecord
  validates :title, presence: true , length: {minimum: 3, maximum: 25}
  validates :body, presence: true, length: {minimum: 5, maximum: 250}

end
