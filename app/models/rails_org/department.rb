class Department < ApplicationRecord
  prepend RailsTaxonNode

  has_many :job_descriptions
  has_many :members, dependent: :nullify

  has_many :job_titles
  has_many :member_departments
  has_many :leaders, through: :member_departments, source: :member
  has_one :member_department, -> { order(grade: :desc) }
  has_one :leader, through: :member_department, source: :member

  has_many :offices, -> { distinct }, through: :members

  validates :name, presence: true

  def col_span
    self.class.max_depth - self.depth
  end

  # todo cache in db
  def all_members_count
    self.self_and_descendants.sum(:members_count)
  end

  def names
    self_and_ancestors.pluck(:name).reverse
  end

  def full_name
    names.join(' > ')
  end

  def supports
    return @supports if @supports
    results = Support.where(department_id: self.self_and_ancestor_ids).group_by { |i| i.kind }
    @supports = results.map do |_, records|
      records.sort_by! { |i| self.self_and_ancestor_ids.index(i.department_id) }.first
    end
  end

  def job_titles
    JobTitle.where(department_id: self_and_ancestor_ids)
  end

  def self.filter_options
    Department.leaves.map { |i| [i.full_name, i.id] }
  end

end
