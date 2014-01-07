class Identity < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :identities

  validates_presence_of :user

  validates_inclusion_of :provider,
    in: %w{ github },
    allow_blank: false

  validates_presence_of :uid

  def build_from_auth_data(attempt_data)
    self.uid = attempt_data['uid']
    self.provider  = attempt_data['provider']
  end

  class << self
    def with_auth_data(attempt_data)
      includes(:user).
      where({
          provider: attempt_data['provider'],
          uid: attempt_data['uid']
      })
    end
  end
end
