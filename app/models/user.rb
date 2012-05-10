# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
    attr_accessible :email, :name, :password, :password_confirmation
    has_secure_password
    has_many :microposts, dependent: :destroy
     
    before_save { |user| user.email = email.downcase }
    before_save :create_remember_token

    validates :name, presence: true, length: { maximum: 50 }
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PASSWORD_REGEX = /^\w*(?=\w*\d)(?=\w*[a-z])(?=\w*[A-Z])\w*$/
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    
    validates :password, length: { minimum: 6 }, format: {with: VALID_PASSWORD_REGEX}
    validates :password, length: { maximum: 12 }
    
    validates :password_confirmation, presence: true

    def feed
      Micropost.where("user_id = ?", id)
    end
    
    private
    
        def create_remember_token
            self.remember_token = SecureRandom.urlsafe_base64
        end
end
