class GithubAuthenticator

  def self.authenticate(env_hash)
    User.find_or_create_by(
      github_uid: env_hash['uid'],
      name: env_hash['info']['nickname'],
      display_name: env_hash['info']['nickname'])
  end
end
