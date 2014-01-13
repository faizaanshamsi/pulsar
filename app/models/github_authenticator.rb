class GithubAuthenticator

  def self.authenticate(env_hash)
    if correct_hash?(env_hash)
      User.find_or_create_by(
        github_uid: env_hash['uid'],
        name: env_hash['info']['nickname'],
        display_name: env_hash['info']['nickname'])
    else
      nil
    end
  end

  def self.correct_hash?(env_hash)
    env_hash['uid'] != nil && env_hash['info']['nickname'] != nil
  end

end
