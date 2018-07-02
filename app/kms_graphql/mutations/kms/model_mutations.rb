module Mutations::Kms::ModelMutations
  Create = GraphQL::Relay::Mutation.define do
    name "CreateCollection"
    description "Create New Collection"

    # input parameters
    input_field :kms_model_name, !types.String
    input_field :collection_name, !types.String
    input_field :description, types.String
    input_field :label_field, !types.String
    input_field :allow_creation_using_form, types.Boolean
    input_field :fields_attributes, !types[Inputs::Kms::FieldInput]

    # return parameters
    return_field :collection, Types::Kms::ModelType
    return_field :errors, types.String
    
    resolve ->(object, inputs, ctx) {
      begin
        structured_inputs = inputs.to_h
        collection = Kms::Model.find_by_collection_name(structured_inputs["collection_name"])
        raise "Model alredy exist: #{inputs[:collection_name]}" if collection.present?
        # Initialize and save Collection
        new_collection = Kms::Model.create! structured_inputs
        { collection: new_collection }
      rescue => e
        { errors: e.message }
      end
    }
  end

  Update = GraphQL::Relay::Mutation.define do
    name "UpdateCollection"
    description "Update Existing Collection"

    # input parameters
    input_field :search_collection_name, !types.String
    input_field :kms_model_name, types.String
    input_field :collection_name, types.String
    input_field :description, types.String
    input_field :label_field, types.String
    input_field :allow_creation_using_form, types.Boolean
    input_field :fields_attributes, types[Inputs::Kms::FieldInput]

    # return parameters
    return_field :collection, Types::Kms::ModelType
    return_field :errors, types.String
    
    resolve ->(object, inputs, ctx) {
      begin
        structured_inputs = inputs.to_h
        model_name = structured_inputs.delete("search_collection_name")
        collection = Kms::Model.find_by_collection_name model_name
        raise "Model doesn't exist: #{inputs[:model_name]}" unless collection.present?
        # Update Collection
        collection.update structured_inputs
        { collection: collection }
      rescue => e
        { errors: e.message }
      end
    }
  end

  Delete = GraphQL::Relay::Mutation.define do
    name "DeleteCollection"
    description "Delete Existing Collection"

    # input parameters
    input_field :collection_name, !types.String

    # return parameters
    return_field :collection, Types::Kms::ModelType
    return_field :errors, types.String
    
    resolve ->(object, inputs, ctx) {
      begin
        collection = Kms::Model.find_by_collection_name inputs[:collection_name]
        raise "Model doesn't exist: #{inputs[:collection_name]}" unless collection.present?
        # Delete Collection
        collection.destroy!
        { collection: collection }
      rescue => e
        { errors: e.message }
      end
    }
  end

  DeleteAll = GraphQL::Relay::Mutation.define do
    name "DeleteAllCollection"
    description "Delete All Existing Collection"

    # return parameters
    return_field :status, types.String
    return_field :errors, types.String
    
    resolve ->(object, inputs, ctx) {
      begin
        collection = Kms::Model.destroy_all
        { status: "Deleted all collections!" }
      rescue => e
        { errors: e.message }
      end
    }
  end
end
