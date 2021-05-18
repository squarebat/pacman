Rails.application.routes.draw do
  get 'multiplayer_games/playrace'
  resources :multiplayer_games
  resources :user_game_stats
  root 'home#index'  
  devise_for :users
  get 'games/playgame'  
  resources :games  
  get 'home/about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
