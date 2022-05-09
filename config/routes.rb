Rails.application.routes.draw do
  # top pageのルーティング
  root :to => 'homes#top'
  # top page 表示　get
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
