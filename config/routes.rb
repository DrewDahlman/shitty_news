Rails.application.routes.draw do
  root "site#index"

  get "update" => "index#update"
end
