Rails.application.routes.draw do

  get 'topics/index'

  get 'topics/show'

  get 'topics/new'

  get 'topics/edit'

  devise_for :users
  get 'about' => 'welcome#about'
  root to: 'welcome#index'
  post :incoming, to: 'incoming#create'

end
