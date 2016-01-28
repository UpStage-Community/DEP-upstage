class Feedback < ActiveRecord::Base
  has_many :votes
  belongs_to :user
  belongs_to :performance
  has_one :production, through: :performance

  def score
    if votes.length > 0
      votes.map(&:value).inject(:+)
    else
      0
    end
  end
end
