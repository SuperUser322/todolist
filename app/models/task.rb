class Task < ApplicationRecord
  belongs_to :project
  validates :text, :done, :project, presence: true
end
