Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createCollection, Types::Kms::ModelType do
    description "Create a Collection."
    
    argument :kms_model_name, !types.String
    argument :collection_name, !types.String
    argument :description, !types.String
    argument :allow_creation_using_form, !types.Boolean
    
    resolve ->(obj, args, ctx) {
      Kms::Model.create!(
        kms_model_name: args[:kms_model_name],
        collection_name: args[:collection_name].parameterize.underscore,
        description: args[:description],
        allow_creation_using_form: args[:allow_creation_using_form]
      )
    }
  end

  field :createEntry, Types::Kms::EntryType do
    description "Create an entry of any collection."
    
    argument :collection_name, !types.String
    argument :values, types[types[types.String]]
    
    resolve ->(obj, args, ctx) {
      debugger
      Kms::Model.find_by_collection_name(args[:collection_name]).entries.create!(
        values: args[:values].to_h
      )
    }
  end
end
