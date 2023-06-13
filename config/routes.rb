Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'abs/saml/consume', to: "saml#consume"
  get 'saml/initiate', to: "saml#initiate"
end
