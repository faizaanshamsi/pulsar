class GithubAuthenticator

  def self.authenticate(env_hash)
    params = {}
    params['user'] = {}
    params['user']['name'] = env_hash['info']['nickname']
    params['user']['display_name'] = env_hash['info']['nickname']
    params['user']['github_uid'] = env_hash['uid']
    User.find_or_create_by(github_uid: params['user']['github_uid'])
  end
end
