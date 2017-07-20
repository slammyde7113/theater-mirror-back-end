class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :user, :comments, :updated_at, :title, :body
  has_one :user
end
