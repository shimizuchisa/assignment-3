class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body,
    presence: true,
    length: {minimum: 1, maximum: 200}
  #空でない、かつ最大200文字まで
end
