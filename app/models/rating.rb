class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :performance
  has_one :production, through: :performance

end
