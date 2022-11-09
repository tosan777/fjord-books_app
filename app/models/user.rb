# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  # 命名規則以外の関連名を使用しているため、foreign_keyで指定する必要がある
  # フォロワーを取得
  has_many :follower, class_name: 'FollowRelationship', foreign_key: 'follower_id', dependent: :destroy, inverse_of: 'follower'
  # フォローする側を取得
  has_many :followed, class_name: 'FollowRelationship', foreign_key: 'followed_id', dependent: :destroy, inverse_of: 'followed'

  # フォロー、フォロワー一覧を取得するための定義
  # 中間テーブルを介し、自分のフォロワーを取得
  has_many :followers, through: :followed, source: :follower
  # 中間テーブルを介し、自分がフォローしているユーザーを取得
  has_many :followings, through: :follower, source: :followed

  # ユーザーをフォローした時の処理
  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  # ユーザーのフォローを外した時の処理
  def unfollow(user_id)
    follower.find_by(followed_id: user_id).destroy
  end

  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end
end
