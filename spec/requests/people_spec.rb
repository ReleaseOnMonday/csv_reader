require 'rails_helper'

RSpec.describe "People", type: :request do

  let(:person_params) do
    {
      first_name: fname,
      last_name: lname,
      phone: phone,
      email: email,
    }
  end
 
  let(:fname) { 'firstname' }
  let(:lname) { 'lastname' }
  let(:phone) { '+9198062211' }
  let(:email) { 'test@gmail.com' }

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
      person = Person.create(person_params)
      get people_url
      expect(response.body).to include(person.first_name)
      expect(response.body).to include(person.last_name)
      expect(response.body).to include(person.email)
      expect(response.body).to include(person.phone)
    end
  end

  context "POST /create" do
    it "create a new person" do
      expect {
        person = Person.create(person_params)
      }.to change(Person, :count).by(1)
    end
  end

  context "when first_name if blank" do
    let(:fname) { nil }

    it "should return first_name blank error" do
      person = Person.create(person_params)
        
      expect(person.errors.messages).to eq({
        :first_name => ["can't be blank"]
      })
    end
  end

  context "when last_name if blank" do
    let(:lname) { nil }

    it "should return first_name blank error" do
      person = Person.create(person_params)
        
      expect(person.errors.messages).to eq({
        :last_name => ["can't be blank"]
      })
    end
  end

  context "when first_name if blank" do
    let(:email) { "leo" }

    it "should return first_name blank error" do
      person = Person.create(person_params)
        
      expect(person.errors.messages).to eq({
        :email => ["entry is invalid"]
      })
    end
  end

  context "when first_name if blank" do
    let(:phone) { "435435" }

    it "should return first_name blank error" do
      person = Person.create(person_params)
        
      expect(person.errors.messages).to eq({
        :phone => ["entry is invalid"]
      })
    end
  end
  
end
