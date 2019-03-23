class Image < ApplicationRecord
    belongs_to :entity, polymorphic: true
    has_attached_file :photo, styles: { medium: "300x300>", thumb: "50x50>", small: "150x150>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
