Rails.application.routes.draw do
  resources :cocktails, only: [ :index, :show, :new, :create ] do
    resources :doses, only: [ :new, :create, :destroy ]
  end

  patch "/cocktails/:id/upvote", to: "cocktails#upvote", as: "upvote_cocktail"

  root "cocktails#index"
end
