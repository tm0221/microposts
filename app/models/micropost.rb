class Micropost < ActiveRecord::Base
  
  mount_uploader :avatar, AvatarUploader
  
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :avatar_size
  
  has_many :favorites, dependent: :destroy 
  has_many :retweets, dependent: :destroy
  
  def retweeted_by? user     
    retweets.where(user_id: user.id).exists?
  end
  

  def avatar_size
    if avatar.size > 1.megabytes
      errors.add(:image, "should be less than 1MB")
    end
  end
end