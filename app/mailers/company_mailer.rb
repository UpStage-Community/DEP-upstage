class CompanyMailer < ApplicationMailer
	def company_registered(company)
		@company = company
		p "INSIDE MAILER"
		p @company
		
		mail(to: "info@upstagecommunity.com", 
			# from: @company.email, 
			subject: "Company Registration Request")
	end
end
