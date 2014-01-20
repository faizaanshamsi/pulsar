class Like < ActiveRecord::Base
  validates_presence_of :user
  validates_presence_of :learning
  validates_uniqueness_of :user_id, scope: :learning_id

  belongs_to :user, inverse_of: :likes
  belongs_to :learning, inverse_of: :likes, counter_cache: true
end
