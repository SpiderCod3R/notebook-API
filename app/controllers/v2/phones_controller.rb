module V2
  class PhonesController < ApplicationController
    before_action :set_contact

    # GET /contact/1/phones
    def show
      render json: @contact.phones
    end

    # POST /contact/1/phones
    def create
      @contact.phones << Phone.new(phone_params)
      if @contact.save
        render json: @contact.phones, status: :created, location: contact_phones_url(@contact)
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # PATCH /contact/1/phone
    def update
      _phone = Phone.find(phone_params[:id])
      if _phone.update(phone_params)
        render json: @contact.phones, location: contact_phones_url(@contact)
      else
        render json: @contact.errors, status: :unprocessable_entity
      end
    end

    # DELETE /contact/1/phone
    def destroy
      Phone.find(phone_params[:id]).destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_contact
        @contact = Contact.find(params[:contact_id])
      end

      def phone_params
        ActiveModelSerializers::Deserialization.jsonapi_parse(params)
      end
  end
end