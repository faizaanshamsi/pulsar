class GithubAuthenticator

  def initialize
  end

  def self.authenticate(env_hash, params)
    @params = Hash.new
    # @params['user'] = {}
    @params['user']['name'] = env_hash['info']['nickname']
    @params['user']['display_name'] = env_hash['info']['nickname']
    @params['user']['github_uid'] = env_hash['uid']
    @params
  end
end
