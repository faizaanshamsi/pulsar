class GithubAuthenticator

  def self.authenticate(env_hash)
    if correct_hash?(env_hash)
      user = User.find_or_initialize_by(github_uid: env_hash['uid'])
      unless user.valid?
        user.name = env_hash['info']['nickname']
        user.display_name = user.name
      end
      user
    else
      nil
    end
  end

  def self.correct_hash?(env_hash)
    env_hash['uid'] != nil && env_hash['info']['nickname'] != nil
  end

end
