class User < ApplicationRecord
  has_many :roles

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def to_s
    "#{email} (#{admin? ? 'Admin' : 'User'})"
  end

  def archive
    self.update(archived_at: Time.now)
  end

  def active_for_authentication?
    super && archived_at.nil?
  end

  def inactive_message
    archived_at.nil? ? super : :archived
  end

  def role_on(project)
    roles.find_by(project_id: project).try(:name)
  end

  scope :excluding_archived, -> { where(archived_at: nil) }
end
