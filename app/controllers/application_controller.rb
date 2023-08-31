class ApplicationController < ActionController::API
# OPTIONALLY - You can include rescue_from in the ApplicationController, since all the controllers would have access to these methods via inheritance! 
# We are leaving the rescue_from and one example of the per-action error handling in the books_controller, just for illustration. 

#   rescue_from ActiveRecord::RecordNotFound, with: :not_found_response

#   def not_found_response
#     render json: ErrorSerializer.new(ErrorMessage.new(error.message, 404)).serialize_json, status: 404
#   end


end
