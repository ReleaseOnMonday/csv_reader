class PeopleImport < ApplicationRecord
  attr_reader :file

  def initialize(csv_file)
    @file = csv_file
    @invalid_records = []
  end

  def save
    
    if imported_people.map(&:valid?).all?
      # If all rows are valid, then save all of them to the database
      imported_people.each(&:save!)
      true
    else
      imported_people.each_with_index do |person, index|
        if person.valid?
          person.save
        else
          @invalid_records << person
          add_person_errors(person,index)
        end
      end
      false
    end

  end

  def add_person_errors(person, index)
    person.errors.full_messages.each do |message|
      next if message.empty?
      errors.add :base, "Row #{index}: #{message}"
    end
    
  end

  def invalid_records
    @invalid_records
  end

  def imported_people
    @imported_people ||= load_file
  end

  def load_file
    raise "Please upload a valid file" if file.nil?
    mappings = {"first_name" => "first_name", "last_name" => "last_name"}
    @imported_people = []

    CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
      person = Person.new
      person_csv = row.to_hash.slice("first_name", "last_name",
        "email", "phone")
      person.attributes = person_csv.map {|k, v| [mappings[k] || k, v] }.to_h
      @imported_people << person
    end

    @imported_people
  end
end
