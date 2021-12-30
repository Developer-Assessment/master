class ApplicationController < ActionController::API
	def authenticate_user
      # find the user based on the headers from HTTP request
      @current_user = User.find_by(
        username: request.headers['X-Username'],
        authentication_token: request.headers['X-Token']
      )
      
      # return error message with 403 HTTP status if there's no such user
      render(json: { message: 'Invalid User' }, status: 403) unless @current_user
    end
end
