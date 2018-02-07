class Task < ApplicationRecord
  belong_to :project
  validates :text, :project, precence: true
end
