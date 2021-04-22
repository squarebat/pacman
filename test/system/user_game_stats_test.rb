require "application_system_test_case"

class UserGameStatsTest < ApplicationSystemTestCase
  setup do
    @user_game_stat = user_game_stats(:one)
  end

  test "visiting the index" do
    visit user_game_stats_url
    assert_selector "h1", text: "User Game Stats"
  end

  test "creating a User game stat" do
    visit user_game_stats_url
    click_on "New User Game Stat"

    fill_in "Highest score", with: @user_game_stat.highest_score
    fill_in "Total games", with: @user_game_stat.total_games
    fill_in "Total score", with: @user_game_stat.total_score
    fill_in "User", with: @user_game_stat.user_id
    fill_in "Wins", with: @user_game_stat.wins
    click_on "Create User game stat"

    assert_text "User game stat was successfully created"
    click_on "Back"
  end

  test "updating a User game stat" do
    visit user_game_stats_url
    click_on "Edit", match: :first

    fill_in "Highest score", with: @user_game_stat.highest_score
    fill_in "Total games", with: @user_game_stat.total_games
    fill_in "Total score", with: @user_game_stat.total_score
    fill_in "User", with: @user_game_stat.user_id
    fill_in "Wins", with: @user_game_stat.wins
    click_on "Update User game stat"

    assert_text "User game stat was successfully updated"
    click_on "Back"
  end

  test "destroying a User game stat" do
    visit user_game_stats_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User game stat was successfully destroyed"
  end
end
