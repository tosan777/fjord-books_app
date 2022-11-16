# frozen_string_literal: true

class FollowRelationship < ApplicationRecord
  validates :follower, uniqueness: { scope: [:follower_id, :followed_id] }
  validates :followed, uniqueness: { scope: [:follower_id, :followed_id] }

  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
end
