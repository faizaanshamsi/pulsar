class Learning < ActiveRecord::Base
  validates_presence_of :content
  has_many :comments, dependent: :destroy
end
