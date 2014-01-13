require 'spec_helper'

describe GithubAuthenticator do

  it "stubbed happy path" do
    clean_hash = {
      "provider"=>"github",
       "uid"=>"5712387",
       "info"=>
        {"nickname"=>"enthusiastick",
         "email"=>nil,
         "name"=>nil
        }
      }

    user = GithubAuthenticator.authenticate(clean_hash)
    expect(user).to be_valid
  end


  it "malformed env_hash parameter"

  it "empty env_hash parameter"

end
