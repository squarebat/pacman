Rails.application.routes.draw do
  root 'home#index'  
  get 'multiplayer_games/playrace'
  resources :multiplayer_games
  resources :user_game_stats
  devise_for :users
  get 'games/playgame'  
  resources :games  
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
