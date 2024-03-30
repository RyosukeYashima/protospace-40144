class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title,:image,:concept,:catch_copy, presence: true
  has_many :comments, dependent: :destroy
end
