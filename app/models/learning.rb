class Learning < ActiveRecord::Base
  validates_presence_of :content

  has_many :comments, inverse_of: :learning, dependent: :destroy
  belongs_to :user, inverse_of: :learnings
  has_many :likes, inverse_of: :learning, dependent: :destroy

  def like_exists?(user)
    Like.find_by(user_id: user, learning_id: self)
  end
end
