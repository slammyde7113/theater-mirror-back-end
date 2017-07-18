class CommentSerializer < ActiveModel::Serializer
  attributes :id, :user, :article, :date_created, :title, :body
  has_one :user
  has_one :article
end
