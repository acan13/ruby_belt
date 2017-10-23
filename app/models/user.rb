class User < ActiveRecord::Base

  has_many :sent_invitations, foreign_key: :inviter_id, class_name: "Invitation"
  has_many :invited, through: :sent_invitations, source: :invitee

  has_many :received_invitations, foreign_key: :invitee_id, class_name: "Invitation"
  has_many :invited_by, through: :received_invitations, source: :inviter


  validates :first_name, :last_name, presence: true
  validates_email_format_of :email
  validates_uniqueness_of :email
  has_secure_password
  validates :description, presence: true

  before_validation :email_lowercase

  private

  def email_lowercase
    self.email.downcase!
  end
end
