# frozen_string_literal: true

Rails.application.routes.draw do
  get '/' => 'app#index'
  post '/translations' => 'translations#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
