class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :article, :updated_at, :title, :body
  has_one :user
  has_one :article
end
