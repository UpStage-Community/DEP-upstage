class User < ActiveRecord::Base
  has_many :productions, through: :production_members
  has_many :production_members
  has_many :companies, through: :company_members
  has_many :company_members
  has_many :ratings
  has_many :votes
  has_many :feedbacks

  class << self
    def from_omniauth(auth_hash)
      user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
      user.handle = auth_hash['info']['nickname']
      user.name = auth_hash['info']['name']
      user.image_url = auth_hash['info']['image']
      user.url = auth_hash['info']['urls']['Twitter']
      user.save!
      user
    end
  end

end