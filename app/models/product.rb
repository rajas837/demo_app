class Product < ApplicationRecord
    has_many :images, as: :entity
    accepts_nested_attributes_for :images
end
