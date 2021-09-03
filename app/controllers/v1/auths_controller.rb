module V1
  class AuthsController < ApplicationController
    def create
      _SECRET_ = "34f83350b03742cd1"
      payload = {nome: params[:nome], exp: Time.now.to_i + 30}
      _token_ = JWT.encode payload, _SECRET_, 'HS256'
      render json: {token: _token_}
    end
  end
end
