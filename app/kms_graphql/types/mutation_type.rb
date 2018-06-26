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

  # Create Entry for any Collection
  field :createEntry, Mutations::Kms::EntryMutations::Create.field
  
  # Update Entry for any Collection using 'slug'
  field :updateEntry, Mutations::Kms::EntryMutations::Update.field
end
