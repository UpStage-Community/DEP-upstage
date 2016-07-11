# Preview all emails at http://localhost:3000/rails/mailers/company_mailer
class CompanyMailerPreview < ActionMailer::Preview
	def company_registered_preview
		CompanyMailer.company_registered(Company.last)
	end
end
