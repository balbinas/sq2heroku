class ApplicationController < ActionController::API
    before_action :authenticate_user

    def authenticate_user
        token = request.headers['Authorization']
        if token.present?
            begin
            jwt_payload = JWT.decode(token, "d9c2fb4fbd8dece91adf53604d0662376112aff81c36f911931d57e1e2880ea12e2733f770a188117c23673e6dff00bee413225d42360d130c4512995e77b71b").first
    
            @current_user_id = jwt_payload['id']
            rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
            head :unauthorized
            end
        else
            head :unauthorized
        end
    end
end
