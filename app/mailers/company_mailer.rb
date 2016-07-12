class CompanyMailer < ApplicationMailer
	def company_registered(company)
		@company = company

		mail(to: "info@upstagecommunity.com", 
			from: @company.email, 
			subject: "Company Registration Request")
	end

	def company_approved(company)
		@company = company
		mail(to: @company.email,
			subject: "#{@company.name} is live on UpStage Community!")
	end
end
