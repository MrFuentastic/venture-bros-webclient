Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/venture_bros' => 'venture_bros#index'
  get '/venture_bros/new' => 'venture_bros#new'
  post '/venture_bros' => 'venture_bros#create'
  get '/venture_bros/:id' => 'venture_bros#show'
  get '/venture_bros/:id/edit' => 'venture_bros#edit'
  patch '/venture_bros/:id' => 'venture_bros#update'
  delete '/venture_bros/:id' => 'venture_bros#destroy'  

end
