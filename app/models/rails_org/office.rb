class Office < ApplicationRecord
  has_many :supports, -> { where(department_id: nil) }, dependent: :destroy
  has_many :members, dependent: :nullify

  validates :name, presence: true

  def enabled_members_count
    Member.where(office: self).where(enabled: true).count
  end

  def self.colors
    ['red', 'blue', 'orange', 'green', 'yellow', 'black', 'pink', 'purple', 'gray']
  end

end
