class User < ActiveRecord::Base
	#Listing 10.8, 10.13
	has_many :microposts, dependent: :destroy
	#Listing 11.4 (think relationships=invitations for my app)
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	#Listing 11.10
	has_many :followed_users, through: :relationships, source: :followed
	#Listing 11.16
	has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
	#before_save { self.email = email.downcase }
	#Changed per excercises in Rails Tutorial - Section 6.5
	has_secure_password
	before_save { email.downcase! }
	before_create :create_remember_token

	validates(:name, presence: true, length: { maximum: 50})
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates(:email, presence: true, format: { with: VALID_EMAIL_REGEX }, 
		uniqueness: { case_sensitive: false })
	validates :password, length: { minimum: 6 }

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	#Listing 10.36, 11.42
	def feed
    Micropost.from_users_followed_by(self)
  end

  #Listing 11.12
  def following?(other_user)
    self.relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    self.relationships.create!(followed_id: other_user.id)
  end

  #Listing 11.14
  def unfollow!(other_user)
    self.relationships.find_by(followed_id: other_user.id).destroy!
  end

	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
