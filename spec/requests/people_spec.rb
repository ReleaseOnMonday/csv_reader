require 'rails_helper'

RSpec.describe "People", type: :request do
  context "GET /index" do
    it 'returns a success response' do
      get people_url
      expect(response.status).to eq(200)
      expect(response.body).to include("ID")
      expect(response.body).to include("First Name")
      expect(response.body).to include("Last Name")
      expect(response.body).to include("Email")
      expect(response.body).to include("Phone")
      expect(response.body).to include("Save Errors")
      expect(response.body).to include("Actions")
    end
  end

  context "GET /new" do
    it 'returns show page' do
      get new_person_path
      expect(response.body).to include("New Person")
    end
  end

  context "GET /show" do
    it 'returns index page with success' do
      person = Person.create(first_name: 'First', last_name: 'Last', email: 'test@gmail.com', phone: '+9806221101')
      get people_url
      expect(response.body).to include(person.first_name)
      expect(response.body).to include(person.last_name)
      expect(response.body).to include(person.email)
      expect(response.body).to include(person.phone)
    end
  end
end
