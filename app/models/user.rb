class User < ActiveRecord::Base
  has_secure_password

  has_many :snippets
  has_many :stories, foreign_key: :author_id
  has_many :votes

  validates :username, presence: true
  validates :password, presence: true

end
