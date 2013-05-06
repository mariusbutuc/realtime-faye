RealtimeFaye::Application.routes.draw do
  get     '/start'          => 'sessions#new',      as: :start
  post    '/start'          => 'sessions#create',   as: :start
  get     '/join/:scene_id' => 'sessions#new',      as: :join

  resources :scenes
  post    '/scenes/:id/drop_a_line' => 'scenes#drop_a_line',  as: :drop_a_line
  get     '/scenes/:id/waiting'     => 'scenes#waiting',      as: :waiting
  delete  '/scenes/:id/quit'        => 'sessions#destroy',    as: :end_scene
  get     '/scenes/:id/leave'       => 'scenes#leave',        as: :leave

  root to: 'scenes#index'
end
