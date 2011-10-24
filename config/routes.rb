Medical::Application.routes.draw do

  namespace :ref do resources :sanatoria end

  namespace :ref do resources :lab_clin_mins end

  namespace :ref do resources :mkb_types end

  namespace :ref do resources :benefit_categories end

  resources :users

  namespace :ref do 
    resources :doctor_deseases 
    resources :desease_types
    resources :doctor_types 
    resources :ins_companies  
    resources :htm_help_types
    resources :med_diagnostic_test_types
    resources :hospitalization_types
    resources :diagnostic_test_types
    resources :lab_test_types       
  end

  root :to => 'welcome#index'  

  match 'csv' =>"clients#import_csv"

  resources :clients do
    member do
      get :operations,:search
    end 

      resources :sanatorium_notes

      resources :prof_inspections do

        resources :diagnoses
      end 

      resources :htm_help_notes
      resources :med_diagnostic_tests
      resources :hospitalizations
      resources :diagnostic_tests
      resources :lab_tests
      resources :benefits
      resources :mkbs
  end

  resources :client_sexes

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  match 'ajax/clients' => "ajax#clients"
  match 'ajax/prof_inspections_by_year/clients/:client_id/year/:year' => "ajax#prof_inspections_by_year",:as => :prof_inspections_by_year

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
