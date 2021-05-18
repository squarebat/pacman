require "test_helper"

class MultiplayerGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @multiplayer_game = multiplayer_games(:one)
  end

  test "should get index" do
    get multiplayer_games_url
    assert_response :success
  end

  test "should get new" do
    get new_multiplayer_game_url
    assert_response :success
  end

  test "should create multiplayer_game" do
    assert_difference('MultiplayerGame.count') do
      post multiplayer_games_url, params: { multiplayer_game: { opponent_id: @multiplayer_game.opponent_id, score: @multiplayer_game.score, time: @multiplayer_game.time, user_id: @multiplayer_game.user_id, win: @multiplayer_game.win } }
    end

    assert_redirected_to multiplayer_game_url(MultiplayerGame.last)
  end

  test "should show multiplayer_game" do
    get multiplayer_game_url(@multiplayer_game)
    assert_response :success
  end

  test "should get edit" do
    get edit_multiplayer_game_url(@multiplayer_game)
    assert_response :success
  end

  test "should update multiplayer_game" do
    patch multiplayer_game_url(@multiplayer_game), params: { multiplayer_game: { opponent_id: @multiplayer_game.opponent_id, score: @multiplayer_game.score, time: @multiplayer_game.time, user_id: @multiplayer_game.user_id, win: @multiplayer_game.win } }
    assert_redirected_to multiplayer_game_url(@multiplayer_game)
  end

  test "should destroy multiplayer_game" do
    assert_difference('MultiplayerGame.count', -1) do
      delete multiplayer_game_url(@multiplayer_game)
    end

    assert_redirected_to multiplayer_games_url
  end
end
