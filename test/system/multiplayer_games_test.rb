require "application_system_test_case"

class MultiplayerGamesTest < ApplicationSystemTestCase
  setup do
    @multiplayer_game = multiplayer_games(:one)
  end

  test "visiting the index" do
    visit multiplayer_games_url
    assert_selector "h1", text: "Multiplayer Games"
  end

  test "creating a Multiplayer game" do
    visit multiplayer_games_url
    click_on "New Multiplayer Game"

    fill_in "Opponent", with: @multiplayer_game.opponent_id
    fill_in "Score", with: @multiplayer_game.score
    fill_in "Time", with: @multiplayer_game.time
    fill_in "User", with: @multiplayer_game.user_id
    check "Win" if @multiplayer_game.win
    click_on "Create Multiplayer game"

    assert_text "Multiplayer game was successfully created"
    click_on "Back"
  end

  test "updating a Multiplayer game" do
    visit multiplayer_games_url
    click_on "Edit", match: :first

    fill_in "Opponent", with: @multiplayer_game.opponent_id
    fill_in "Score", with: @multiplayer_game.score
    fill_in "Time", with: @multiplayer_game.time
    fill_in "User", with: @multiplayer_game.user_id
    check "Win" if @multiplayer_game.win
    click_on "Update Multiplayer game"

    assert_text "Multiplayer game was successfully updated"
    click_on "Back"
  end

  test "destroying a Multiplayer game" do
    visit multiplayer_games_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Multiplayer game was successfully destroyed"
  end
end
