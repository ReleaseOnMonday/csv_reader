require 'rails_helper'

RSpec.describe Person, type: :model do
  context 'validaion tests' do
    it 'should have first name present' do
      person = Person.new(last_name: 'Last', email: 'test@gmail.com').save
      expect(person).to eq(false)
    end

    it 'should have last name present' do
      person = Person.new(first_name: 'First', email: 'test@gmail.com').save
      expect(person).to eq(false)
    end

    it 'should have valid email present' do
      person = Person.new(first_name: 'First', last_name: 'Last', email: 'test@').save
      expect(person).to eq(false)
    end

    it 'should have valid phone present' do
      person = Person.new(first_name: 'First', last_name: 'Last', phone: '-504').save
      expect(person).to eq(false)
    end

    it 'should create person on validation' do
      person = Person.new(first_name: 'First', last_name: 'Last', email: 'test@gmail.com', phone: '+9806221101').save
      expect(person).to eq(true)
    end
  end
end
