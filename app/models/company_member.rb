class CompanyMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  after_initialize :init

  def init
    self.admin ||= false
  end
end
