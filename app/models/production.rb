class Production < ActiveRecord::Base
  has_attached_file :image, 
    styles: { medium: "600x200>", thumb: "300x200>" }, 
    default_url: "default.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  belongs_to :company
  has_many :members, through: :production_members, class_name: "User"
  has_many :production_members
  has_many :performances
  has_many :ratings, through: :performances

  def rating
    if ratings.length > 0
      (ratings.map(&:value).inject(:+)/ratings.count.to_f).round(2)
    else
      "Not yet rated"
    end
  end

  def rating_count
    ratings.length
  end
end
