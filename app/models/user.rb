# frozen_string_literal: true
class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
end
