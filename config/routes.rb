Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    devise_for :users
    root "static_pages#home"
    get "courses/show"
    get "static_pages/subject"
    get "static_pages/in_subject"
    get "static_pages/report"
    get "static_pages/login"
    get "static_pages/profile"
    get "static_pages/edit_profile"
    resources :user_courses
    resources :subjects
    resources :user_subjects
    resources :courses
    resources :users do
      collection {post :import}
    end
  end
end
