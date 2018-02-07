class Project < ApplicationRecord
  has_many :tasks
  validates :title, presence: true
end

Project.create(title: "Project").valid? # => true
Project.create(title: nil).valid? # => false
