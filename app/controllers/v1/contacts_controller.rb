module V1
  class ContactsController < ApplicationController
    include ErrorSerializer
    # before_action :authenticate_user!
    
    # TOKEN = "15b552b25eaf4b741e501010006a108"
    #include ActionController::HttpAuthentication::Token::ControllerMethods
    
    before_action :set_contact, only: [:show, :update, :destroy]

    # GET /contacts
    def index
      # _page_number = params[:page] ? params[:page][:number] : 1
      _page_number = params[:page].try(:[], :number)
      _page_number = params[:page].try(:[], :size)
      @contacts = Contact.all.page(_page_number).per(_page_number)

      # CACHE CONTROL - expires_in 30.seconds, public: true
      render json: @contacts
    end

    # GET /contacts/1
    def show
      render json: @contact, include: [:kind, :phones, :address]
    end

    # POST /contacts
    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        render json: @contact, include: [:kind, :phones, :address], status: :created, location: @contact
      else
        render json: ErrorSerializer.serialize(@contact.errors), status: :unprocessable_entity
      end
    end

    # PATCH/PUT /contacts/1
    def update
      if @contact.update(contact_params)
        render json: @contact, include: [:kind, :phones, :address]
      else
        render json: ErrorSerializer.serialize(@contact.errors), status: :unprocessable_entity
      end
    end

    # DELETE /contacts/1
    def destroy
      @contact.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def contact_params
        # params.require(:contact).permit(
        #   :name, :email, :birthdate, :kind_id,
        #   phones_attributes: [:id, :number, :_destroy],
        #   address_attributes: [:id, :street, :city]
        # )
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end

      # def authenticate
      #   authenticate_or_request_with_http_token do |token, options|
      #     secret_key = "34f83350b03742cd1"
      #     _token_ = JWT.decode token, secret_key, true, { algorithm: 'HS256'}
      #     # Compare the tokens is a time-constant manner, to mitigate
      #     # Time Attack
      #     # ActiveSupport::SecurityUtils.secure_compare(
      #     #   ::Digest::SHA256.hexdigest(token),
      #     #   ::Digest::SHA256.hexdigest(TOKEN)
      #     # )
      #   end
      # end
  end
end