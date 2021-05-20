class MultiplayerGamesController < ApplicationController
  def playrace
    @username = user_signed_in? ? current_user.name : "awesomeguest#"+SecureRandom.uuid[0..5]
  end
end
