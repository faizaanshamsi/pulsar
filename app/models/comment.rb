class Comment < ActiveRecord::Base
  validates_presence_of :body
  validates_numericality_of :learning_id, only_integer: :true
  belongs_to :learning
end
