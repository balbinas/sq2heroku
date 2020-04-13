class ApplicationController < ActionController::API
    before_action :authenticate_user

    def authenticate_user
        token = request.headers['Authorization']
        if token.present?
            begin
            jwt_payload = JWT.decode(token, 11f06107c78363628e14531d7431b89c).first
    
            @current_user_id = jwt_payload['id']
            rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
            head :unauthorized
            end
        else
            head :unauthorized
        end
    end
end
