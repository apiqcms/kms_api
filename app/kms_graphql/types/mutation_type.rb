Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # # Collections
  # Create Collection
  field :createCollection, Mutations::Kms::ModelMutations::Create.field

  # Update Collection
  field :updateCollection, Mutations::Kms::ModelMutations::Update.field

  # Delete Collection
  field :deleteCollection, Mutations::Kms::ModelMutations::Delete.field

  # Delete Collection
  field :deleteCollections, Mutations::Kms::ModelMutations::DeleteAll.field

  # # Entries
  # Create Entry for any Collection
  field :createEntry, Mutations::Kms::EntryMutations::Create.field
  
  # Update Entry for any Collection using 'slug'
  field :updateEntry, Mutations::Kms::EntryMutations::Update.field
  
  # Delete Entry for any Collection using 'slug'
  field :deleteEntry, Mutations::Kms::EntryMutations::Delete.field
  
  # Delete All Entries for any Collection
  field :deleteAllEntries, Mutations::Kms::EntryMutations::DeleteAll.field
end
