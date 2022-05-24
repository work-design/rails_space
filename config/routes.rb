Rails.application.routes.draw do

  namespace :space, defaults: { business: 'space' } do
    namespace :admin, defaults: { namespace: 'admin' } do
      resources :stations do
        resources :buildings
        resources :rooms do
          resources :grids
        end
      end
    end
  end

end
