Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allCollections, !types[Types::Kms::ModelType] do
    description "Get all Collections"
    resolve ->(root, args, ctx) {
      Kms::Model.all
    } 
  end

  field :singleCollection, !Types::Kms::ModelType do
    description "Get all Collections"
    argument :collection_name, types.String
    resolve ->(root, args, ctx) {
      collection = Kms::Model.find_by_collection_name(args[:collection_name])

    } 
  end

  field :singleCollectionAllEntries, !types[Types::Kms::EntryType] do
    description "Get all Entries of from Specified Collection"
    argument :collection_name, types.String
    resolve ->(root, args, ctx) {
      Kms::Model.find_by_collection_name(args[:collection_name]).entries
    } 
  end

  field :singleCollectionSingleEntry, !Types::Kms::EntryType do
    description "Get specific Entry of specified Collection"
    argument :collection_name, types.String
    argument :id, types.Int
    resolve ->(root, args, ctx) {      
      collection = Kms::Model.find_by_collection_name(args[:collection_name])
      Kms::Entry.find_by(id: args[:id], model_id: collection.id)
    } 
  end
end
