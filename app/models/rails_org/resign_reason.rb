class ResignReason < ApplicationRecord
  prepend RailsTaxonNode

  has_many :resign_resign_reasons, dependent: :destroy
  has_many :resigns, through: :resign_resign_reasons

  validates :name, presence: true
end
