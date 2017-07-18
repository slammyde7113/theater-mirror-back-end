class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :article_id, :date_created, :title, :body
  has_one :user
end
