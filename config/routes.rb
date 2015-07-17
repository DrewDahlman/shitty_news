Rails.application.routes.draw do
  root "site#index"

  get "update" => "site#update"
  get "/featured/:hash_url" => "article#featured"
  get "/:category/:hash_url" => "article#show"
end
