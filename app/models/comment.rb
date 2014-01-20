class Comment < ActiveRecord::Base
  validates_presence_of :body
  validates_presence_of :learning
  validates_presence_of :user

  belongs_to :learning, inverse_of: :comments
  belongs_to :user, inverse_of: :comments
end
