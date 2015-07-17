Rails.application.routes.draw do
  root "site#index"

  get "about" => "site#about"
  get "update" => "site#update" ## Just clears the cache real quick
  get "/featured/:hash_url" => "article#featured"
  get "/:category/:hash_url" => "article#show"
end
