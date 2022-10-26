class FollowRelationship < ApplicationRecord
  # 同じモデルを参照しているため、関連名を分ける必要がある
  belongs_to :follower, class_name: 'User'
  belongs_to :followed, class_name: 'User'
end
