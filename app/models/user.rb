class User < ActiveRecord::Base
  attr_accessible :email, :password
  attr_reader :password
  before_validation :ensure_session_token
  validates :email, :password_digest, :session_token, :presence => true
  validates :password, :length => { :minimum => 5 }, :on => :create

  def is_password?(plaintext)
    BCrypt::Password.new(self.password_digest).is_password?(plaintext)
  end

  def password=(plaintext)
    @password = plaintext
    self.password_digest = BCrypt::Password.create(plaintext)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save!
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end


end