# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	helper :all # include all helpers, all the time

	# See ActionController::RequestForgeryProtection for details
	# Uncomment the :secret if you're not using the cookie session store
	#protect_from_forgery # :secret => '6d6d38ee2691c47c3f9292a26fa2710f'
  
	# See ActionController::Base for details 
	# Uncomment this to filter the contents of submitted sensitive data parameters
	# from your application log (in this case, all fields with names like "password"). 
	# filter_parameter_logging :password
 
	# Make duplicates of previous month's budgets and budgets with the same month of previous year if applicable
	Budget.copy_budgets
 
	private 
  
	def authorize_user
		unless Administrator.find_by_id(session[:administrator_id])
			redirect_to('/404.html')
		end
	end


  
end
