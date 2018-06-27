module Mutations::Kms::ModelMutations
  Create = GraphQL::Relay::Mutation.define do
    name "CreateCollection"
    description "Create New Collection"

    # Define input parameters
    input_field :kms_model_name, !types.String
    input_field :collection_name, !types.String
    input_field :description, types.String
    input_field :label_field, !types.String
    input_field :allow_creation_using_form, types.Boolean
    input_field :fields_attributes, !types[Inputs::Kms::FieldInput]

    # Define return parameters
    return_field :collection, Types::Kms::ModelType
    return_field :errors, types.String
    
    resolve ->(object, inputs, ctx) {
      model = Kms::Model.find_by_collection_name(inputs[:collection_name])
      return {errors: "KmsModel alredy exist: #{inputs[:collection_name]}"} if model.present?
      new_model = Kms::Model.new(inputs.to_h)

      new_model.save ? { collection: new_model } : {errors: new_model.errors}
    }
  end

  Update = GraphQL::Relay::Mutation.define do
    name "UpdateCollection"
    description "Update Existing Collection"

    # Define input parameters
    input_field :collection_name, types.String
    input_field :kms_model_name, types.String
    input_field :collection_name, types.String
    input_field :description, types.String
    input_field :label_field, types.String
    input_field :allow_creation_using_form, types.Boolean
    input_field :fields_attributes, types[Inputs::Kms::FieldInput]

    # Define return parameters
    return_field :collection, Types::Kms::ModelType
    return_field :errors, types.String
    
    resolve ->(object, inputs, ctx) {
      # Write Code
      debugger

      { collection: @collection }
    }
  end

  Delete = GraphQL::Relay::Mutation.define do
    name "DeleteCollection"
    description "Delete Existing Collection"

    # Define input parameters
    input_field :collection_name, types.String
    input_field :kms_model_name, types.String
    input_field :collection_name, types.String
    input_field :description, types.String
    input_field :allow_creation_using_form, types.Boolean
    input_field :fields_attributes, types[Inputs::Kms::FieldInput]

    # Define return parameters
    return_field :collection, Types::Kms::ModelType
    return_field :errors, types.String
    
    resolve ->(object, inputs, ctx) {
      # Write Code
      debugger

      { collection: @collection }
    }
  end
end
