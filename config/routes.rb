# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  root to: 'employees#index'

  resources :employees do
    collection do
      get :export_file
    end
  end
end
