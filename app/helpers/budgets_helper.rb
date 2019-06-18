module BudgetsHelper
	def calc_monthly_amount( frequency, amount )
		case frequency
		when "Annually"
			return amount / 12 
		when "Semiannually"
			return amount / 6
		when "Quarterly"
			return amount / 3
		else
			return amount
		end
	end
	
	def calc_annual_amount( frequency, amount )
		case frequency
		when "Monthly"
			return amount * 12 
		when "Semiannually"
			return amount * 2
		when "Quarterly"
			return amount * 4
		else
			return amount
		end
	end
end
