module LoginHelper
  def set_omniauth(user)
    OmniAuth.config.test_mode = true
    omniauth_hash = {
      provider: "github",
      uid:      user.github_uid,
      info: {
        nickname: user.display_name,
        email: nil,
        name: user.name
        }
      }

    OmniAuth.config.add_mock(:github, omniauth_hash)
  end

  # def set_invalid_omniauth(opts = {})

  #   credentials = { :provider => :facebook,
  #                   :invalid  => :invalid_crendentials
  #                  }.merge(opts)

  #   OmniAuth.config.test_mode = true
  #   OmniAuth.config.mock_auth[credentials[:provider]] = credentials[:invalid]

  # end
end
