module Authentication
  class Attempt

    attr_reader :data
    def initialize(auth_data, user_params = {})
      @data = auth_data
      @user_params = user_params
    end

    def valid?
      true
    end

    def user
      user = User.from_authentication_attempt(self).tap do |u|
        u.attributes = @user_params
      end
      user.save
      user
    end

    def session_hash
      @session_hash = @data.dup.tap do |hsh|
        hsh.delete('extra')
      end
    end

    protected

    def login
      @data['info'].try(:[], 'nickname')
    end

    def token
      @data['credentials'].try(:[], 'token')
    end
  end
end
