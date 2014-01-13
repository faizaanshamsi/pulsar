class User < ActiveRecord::Base

  validates_presence_of :github_uid, :name
  validates_uniqueness_of :github_uid, :display_name

  has_many :learnings, inverse_of: :user, dependent: :destroy
  has_many :comments, inverse_of: :user, dependent: :destroy
end
