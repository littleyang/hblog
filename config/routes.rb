Hblog::Application.routes.draw do
  devise_for :users

    match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
    root :to =>"post#index"
    #match "/comment" =>"post#comment"
    match "/view" =>"post#view"
    match "/add"=>"post#add"
    match "/index"=>"post#index"
    match "/CategoryArch"=>"post#category_arch"
    match "/TagsArch" => "post#tags_arch"
    match "/AboutMe"=>"post#about_me"
    #resources :articles


    #user routes
    match "/blog/login"=>"user#login"
    match "/blog/logout"=>"user#logout"
    match "/blog/register"=>"user#register"

    #admin user controller
    match "/a/articleman"=>"admin#article_man"
    match "/post/comment"=>"post#comment"
    match "/a/addArticle"=>"admin#add_article"
    match "/a/modifyArticle"=>"admin#modify_article"
    match "/a/deletearticle"=>"admin#delete_article"
    match "/a/movetodraft"=>"admin#move_to_draft"
    match "/a/articledraft"=>"admin#draft_article"
    match "/a/savearticle"=>"admin#save_article"
    ########### 
    match "/c/mancategory"=>"admin#category_man"
    match "/c/deletecategory"=>"admin#delete_category"
    match "/c/addcategory"=>"admin#add_category"
    match "/c/modifycategory"=>"admin#modify_category"
    match "/c/savecategory"=>"admin#save_category"

    ##############r
    match "/u/index"=>"admin#index"
    match "/u/useruan"=>"admin#user_man"
    match "/s/siteset"=>"admin#site_set"
    #####################################
    #
    match "/l/linkman"=>"admin#link_man"
    match "/l/addlink"=>"admin#add_link"
    match "/l/modifylink"=>"admin#modify_link"
    match "/l/deletelink"=>"admin#delete_link"
    match "/l/savelink"=>"admin#save_link"
    ###############################
    #
    match "/c/commentman"=>"admin#comment_man"
    match "/c/deletecomment"=>"admin#delete_comment"






    # The priority is based upon order of creation:
    # first created -> highest priority.
    # Sample of regular route:
    #   match 'products/:id' => 'catalog#view'
    # Keep in mind you can assign values other than :controller and :action
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
    #   collection do
    #       get 'sold'
    #     end
    #   end      
    #  Sample resource route with sub-resources:
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
    # Directs /admin/products/* to Admin::ProductsController
    # (app/controllers/admin/products_controller.rb)
    #     resources :products
    #   end
    # You can have the root of your site routed with "root"
    # just remember to delete public/index.html
    # root :to => 'welcome#index'
    # See how all your routes lay out with "rake routes"
    # This is a legacy wild controller route that's not recommended for RESTful applications.
    # Note: This route will make all actions in every controller accessible via GET requests.
    #match ':controller(/:action(/:id))(.:format)'
    match "list_with_category(/:id)(.:format)"=>"post#list_with_category"

    match "list_with_tag(/:tag)"=>"post#list_with_tag"
end

