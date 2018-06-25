Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allCollections, types[Types::Kms::ModelType] do
    description "Get all Models"
    resolve ->(root, args, ctx) {
      Kms::Model.all
    } 
  end

  field :allEntries, types[Types::Kms::EntryType] do
    description "Get all Entries"
    resolve ->(root, args, ctx) {
      Kms::Entry.all
    } 
  end

  field :singleModelEntries, types[Types::Kms::EntryType] do
    description "Get all Entries"
    argument :collection_name, types.String
    resolve ->(root, args, ctx) {
      Kms::Model.find_by_collection_name(args[:collection_name]).entries
    } 
  end

  field :singleEntry, !Types::Kms::EntryType do
    description "Get specific Entry"
    argument :collection_name, types.String
    argument :id, types.Int
    resolve ->(root, args, ctx) {      
      collection = Kms::Model.find_by_collection_name(args[:collection_name])
      Kms::Entry.find_by(id: args[:id], model_id: collection.id)
    } 
  end
end
