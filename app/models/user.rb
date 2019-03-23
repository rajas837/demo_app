class User < ApplicationRecord
    
    validates :name, presence: true
    validates :email,  presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
    validates :password, presence: true, length: { maximum: 8 , minimum: 4}
    validates :confirm_password, presence: true, length: { maximum: 8 , minimum: 4} 
    has_one :image, as: :entity
    has_one :account
    has_one :history, through: :account
    accepts_nested_attributes_for :image, :account
    #class method
    def self.authenticate(email, password)
        return where(email: email, password: Digest::MD5.hexdigest(password)).first
    end
    before_create :encrypt_password
    def encrypt_password
        if not password.nil?
            self.password = Digest::MD5.hexdigest(password)
            self.confirm_password = Digest::MD5.hexdigest(confirm_password)
        end
    end
    after_destroy :save_into_file
    def save_into_file
        File.open("#{Rails.root}/public/#{self.id}.json", "w"){ |foo|
        foo.write(self.to_json)
    }
    end
    after_validation :verify_passwords
    def verify_passwords
        if password != confirm_password
            errors.add(:base, "password and confirm password are not equal")
        end
    end
    def self.omniauth(auth)
        where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
            #byebug
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.name
            user.token = auth.credentials.token
            user.email = auth.info.email
            user.expires_at = Time.at(auth.credentials.expires_at)
            user.profile_image = auth.info.image 
            # im = Image.new(photo: "http://graph.facebook.com/v2.6/860101950679738/picture", entity: user)
            # im.save(validate: falce)
            # user.profile_image = im
            user.save(validate: false)
            return user
        end
    end
#Encrypt all existing password column
#User.all.map {|user| user if user.password.size < 30}.compact.map {|u| Digest::MD5.hexdigest(u.password); Digest::MD5.hexdigest(u.confirm_password); u.save};
end
