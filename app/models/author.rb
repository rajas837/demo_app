class Author < ApplicationRecord
    has_many :articles
    has_many :contents, through: :articles
end
