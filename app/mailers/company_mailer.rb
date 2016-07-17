class CompanyMailer < ApplicationMailer
	def company_registered(company)
		@company = company

		mail(to: "info@upstagecommunity.com",
			subject: "Company Registration Request")
	end

	def company_approved(company)
		@company = company
		mail(to: @company.email,
			subject: "#{@company.name} is live on UpStage Community!")
		@company.company_members.each do |member|
			mail(to: member.user.email,
				subject: "#{@company.name} is live on UpStage Community!")
		end

	end
end
