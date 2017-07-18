class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment_id, :date_created, :title, :body
  has_one :users
  has_one :articles
end
