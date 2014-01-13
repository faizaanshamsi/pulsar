class Learning < ActiveRecord::Base
  validates_presence_of :content

  has_many :comments, dependent: :destroy
  belongs_to :user, inverse_of: :learnings
end
