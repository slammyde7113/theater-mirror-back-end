class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :user, :date_created, :title, :body
  has_one :user
end
