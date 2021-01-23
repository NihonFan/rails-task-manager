# this is the model
class Task < ApplicationRecord
  # will have the actions pertaining to the tasks. RCUD.
  # attr_reader? @title, @details, @completed
  validates :title, presence: true
  validates :details, presence: true
end
