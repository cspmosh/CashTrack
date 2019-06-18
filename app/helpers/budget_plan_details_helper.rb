module BudgetPlanDetailsHelper
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
end
