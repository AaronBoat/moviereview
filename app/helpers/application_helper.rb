module ApplicationHelper
	def flash_message (type)
	    type== :notice ? "alert-success" : "alert-danger"
	    #case type
	    #when :notice
	    # "alert-success"
	    #when :alert
	    # "alert-danger"
	    #else
	    #""
	    #end
end
end
