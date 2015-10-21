class PushController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "admin"

  require 'curb'

  MOZILLA_PUSH_SERVER = "https://updates.push.services.mozilla.com/push/"

  def index
    @version = Version.first
    @version.version = @version.version + 1

    @users = User.recents
    @users.each do |user|
      puts "Pushing to " + user.uuid
      c = Curl::Easy.http_put(
        MOZILLA_PUSH_SERVER + user.endpoint,
        "version=#{@version.version}"
      )
    end

    @version.save
  end
end
