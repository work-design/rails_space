Rails.application.routes.draw do

  namespace :space, defaults: { business: 'space' } do
    resources :grids, only: [] do
      member do
        get :qrcode
      end
    end
    resources :rooms, only: [] do
      member do
        get :qrcode
      end
    end
    namespace :admin, defaults: { namespace: 'admin' } do
      root 'home#index'
      resources :stations do
        resources :buildings
        resources :rooms do
          resources :grids
        end
      end
    end
    namespace :me, defaults: { namespace: 'me' } do
      resources :rooms do
        member do
          post :in
          post :out
          get :qrcode
        end
        resources :grids do
          member do
            post :in
            post :out
            get :qrcode
          end
        end
      end
    end
  end

end
