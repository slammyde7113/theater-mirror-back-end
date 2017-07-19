class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :user, :updated_at, :title, :body
  has_one :user
end
