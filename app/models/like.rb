class Like < ActiveRecord::Base
  validates_numericality_of :user_id, only_integer: true
  validates_numericality_of :learning_id, only_integer: true
  validates_uniqueness_of :user_id, scope: :learning_id

  belongs_to :user, inverse_of: :likes
  belongs_to :learning, inverse_of: :likes, counter_cache: true
end
