Types::Kms::EntryType = GraphQL::ObjectType.define do
  name "KmsEntry"

  field :id, types.Int
  field :slug, types.String

  # field :collection_name, !Types::Kms::ModelType
  field :collection_name, types.String do
    description "entryType"
    resolve ->(entry, args, ctx) {
      entry.model.collection_name
    }
  end

  field :values, types[types[types.String]] do
    description "value of all fields"
    resolve ->(entry, args, ctx) {
      entry.values.to_a
    } 
  end
end
