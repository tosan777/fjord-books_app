class Report < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  belongs_to :user

  has_many :comments, as: :commentable, dependent: :destroy
end
