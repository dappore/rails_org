class Support < ApplicationRecord
  attr_accessor :department_ancestors

  belongs_to :member, optional: true
  belongs_to :department, optional: true
  belongs_to :office, optional: true
  belongs_to :supporter, class_name: 'Member'


end
