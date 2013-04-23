RealtimeFaye::Application.routes.draw do
  get     '/start'    => 'sessions#new',      as: :start
  post    '/start'    => 'sessions#create',   as: :start
  delete  '/logout'   => 'sessions#destroy',  as: :logout
  get     '/join/:id' => 'sessions#new',      as: :join

  resources :scenes
  post  '/scenes/:id/drop_a_line' => 'scenes#drop_a_line',  as: :drop_a_line
  get   '/scenes/:id/waiting'     => 'scenes#waiting',      as: :waiting

  root to: 'scenes#index'
end
