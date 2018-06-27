Rails.application.routes.draw do
  post "api", to: "kms/api/graphql#execute"
end
