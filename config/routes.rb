Rails.application.routes.draw do
  root "site#index"

  get "update" => "site#update"
end
