Types::Kms::FieldType = GraphQL::ObjectType.define do
  name "KmsField"

  field :id, types.Int
  field :name, types.String
  field :liquor_name, types.String
  field :type, types.String
  field :class_name, types.String
end
