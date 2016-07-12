class Company < ActiveRecord::Base
  has_attached_file :image, 
    styles: { medium: "300x300>", thumb: "100x100>" }, 
    default_url: "default.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :productions
  has_many :members, through: :company_members, class_name: "User"
  has_many :company_members
  # has_many :rating, through: :productions

  validates :name, presence: true
  validates :email, presence: true
  validates :url, presence: true
  validates :short_description, presence: true,length: { maximum: 20 }
  validates :long_description, presence: true, length: { maximum: 200 }

  after_initialize :init

  def init
    self.active ||= false
  end

  # def rating
  #   if qritiques.length > 0
  #     (qritiques.map(&:rating).inject(:+)/qritiques.count.to_f).round(2)
  #   else
  #     "Not yet rated"
  #   end
  # end

  # def qritique_count
  #   qritiques.length
  # end
end
