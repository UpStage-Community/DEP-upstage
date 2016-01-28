class Performance < ActiveRecord::Base
  belongs_to :production
  has_many :ratings
  has_many :feedbacks, through: :ratings

  def self.dates
    self.pluck(:date)
  end
end
