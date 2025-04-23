Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  scope module: :public do
    root to: "homes#top"
    get "/about", to: "homes#about"
    get "customers/my_page", to: "customers#show"
    get "customers/infomation/edit", to: "customers#edit"
    get "customers/unsubscribe"
    resources :addresses, only: [:index, :edit]
    resources :orders, only: [:new, :index, :show]
    get 'orders/confirm'
    get 'orders/thanks'
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    root to: "homes#top"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
