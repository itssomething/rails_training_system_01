Rails.application.routes.draw do
  scope "(:locale)", locale: /en/ do
    get "courses/show"
    devise_for :users
    root "static_pages#home"
    get "static_pages/subject"
    get "static_pages/in_subject"
    get "static_pages/report"
    get "static_pages/login"
    get "static_pages/profile"
    get "static_pages/edit_profile"
    resources :user_courses
    get "subjects/show"
  end
end
