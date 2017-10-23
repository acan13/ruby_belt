class User < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  validates_email_format_of :email
  validates_uniqueness_of :email
  has_secure_password

  before_validation :email_lowercase

  private

  def email_lowercase
    self.email.downcase!
  end
end
