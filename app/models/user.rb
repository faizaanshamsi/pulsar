class User < ActiveRecord::Base

  validates_presence_of :github_uuid, :name, :github_token
  validates_uniqueness_of :github_uuid, :display_name

  has_many :learnings, inverse_of: :user
  has_many :comments, inverse_of: :user
end
