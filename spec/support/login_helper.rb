module LoginHelper
  def set_omniauth(user)
    OmniAuth.config.test_mode = true
    omniauth_hash = {
      provider: "github",
      uid:      user.github_uid,
      info: {
        nickname: user.display_name,
        email: nil,
        name: user.name,
        image: 'http://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?'
        }
      }

    OmniAuth.config.add_mock(:github, omniauth_hash)
  end
end
