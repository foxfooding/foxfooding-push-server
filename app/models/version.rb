class Version < ActiveRecord::Base
  validates :version, presence: true, numericality: true
end
