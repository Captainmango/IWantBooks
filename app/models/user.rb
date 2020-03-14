class User < ApplicationRecord

  has_many :comments
  has_many :books, through: :comments

  validates :email, uniqueness: true
  # validates :first_name, presence: {message: "Please enter your first name"}
  # validates :last_name, presence: {message: "Please enter your surname"}
  validates :encrypted_password, presence: true
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]


  def self.from_omniauth(auth)
  # Either create a User record or update it based on the provider (Google) and the UID  
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.token = auth.credentials.token
      user.expires = auth.credentials.expires
      user.expires_at = auth.credentials.expires_at
      user.refresh_token = auth.credentials.refresh_token
      user.email = auth.info.email
      user.password = "admin123"
      user.save
    end
  end

  def my_comments
    Comment.where("user_id = #{self.id}")
  end

  def most_recent_comments(num)
    Comment.where("user_id = #{self.id}").order("created_at DESC").limit(num)
  end

  def library
    self.books
  end


end
