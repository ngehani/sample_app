class Micropost < ActiveRecord::Base
	#Listing 10.7
	belongs_to :user
	#listing 1.45
	default_scope -> { order('created_at DESC') }
	#Listing 10.11
	default_scope -> { order('created_at DESC')}
	#Listing 10.15
	validates :content, presence: true, length: { maximum: 140 }
	#Listing 10.4
	validates :user_id, presence: true

	#Listing 11.43, 11.44, 11.45
	# Returns microposts from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
          user_id: user.id)
  end

end
