require 'rails_helper'

# Descrevendo a Contacts Controller
describe V1::ContactsController, type: :controller do
  it "request index and return (200 OK)!" do
    request.accept = 'application/vnd.api+json'
    get :index
    expect(response).to have_http_status(200)  
  end

  it "request index and return (406 Unauthorized)!" do
    get :index
    expect(response).to have_http_status(406)  
  end
  
end
