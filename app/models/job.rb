class Job < ApplicationRecord
  validates :name, :wage, presence: true
end
