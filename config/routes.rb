Rails.application.routes.draw do
  post "kms_api/graphql", to: "kms/api/graphql#execute"
end
