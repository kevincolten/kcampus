class User < ActiveRecord::Base
  attr_accessible :email, :password, :client_id, :client, :admin, :instructor
  attr_reader :password
  validates :password_digest, :presence => { :message => "Password can't be blank" }
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  after_initialize :ensure_session_token
  before_save { self.email = self.email.downcase.strip }
  # before_save :confirm_password

  def self.find_by_credentials(email, password)
  	user = User.find_by_email(email)
  	return nil if user.nil?

  	user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
  	SecureRandom::urlsafe_base64(16)
  end

  def is_password?(password)
  	BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
  	self.session_token = self.class.generate_session_token
  	self.save!
  end

  private
  def ensure_session_token 
  	self.session_token ||= self.class.generate_session_token
  end
  
end