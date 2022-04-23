class Tt < ApplicationRecord
  self.table_name = 'tts'

  validates :name, presence: true
end
