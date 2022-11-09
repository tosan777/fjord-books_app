class Report < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true

  belongs_to :user
end
