class Todo < ActiveRecord::Base
  validates :description, presence: true
  validates :due_date, presence: true

  belongs_to :user
end
