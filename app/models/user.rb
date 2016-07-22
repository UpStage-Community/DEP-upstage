class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable
    has_attached_file :image, styles: { medium: "600x200>", thumb: "300x200>" }, default_url: "default.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    has_many :productions, through: :production_members
    has_many :production_members
    has_many :companies, through: :company_members
    has_many :company_members
    has_many :ratings
    has_many :votes
    has_many :feedbacks

    enum role: [:patron, :admin]
    after_initialize :set_default_role, :if => :new_record?

    def set_default_role
      self.role ||= :patron
    end

    def all_productions
        productions = Production.where()
    end


end