class User < ActiveRecord::Base
  has_many :identities,
    inverse_of: :user,
    dependent: :destroy

  # validates_presence_of :first_name
  # validates_presence_of :last_name

  # attr_accessible :first_name, :last_name, :email

  class << self
    def from_authentication_attempt(attempt)
      user = Identity.with_auth_data(attempt.data).first.try(:user)
      if user.nil?
        User.new do |u|
          name_guesses = attempt.data['info'].try(:[], 'name').try(:split, ' ', 2)
          if name_guesses
            u.first_name = name_guesses[0]
            u.last_name = name_guesses[1]
          end
          u.email = attempt.data['info'].try(:[], 'email')
          u.identities.build do |identity|
            identity.build_from_auth_data(attempt.data)
          end
          u
        end
      else
        user
      end
    end
  end
end
