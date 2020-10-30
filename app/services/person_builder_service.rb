class PersonBuilderService
    def self.build(raw_people_string)
        people_string = raw_people_string.split(',').map {|item| item.split('and')}.flatten

        people = people_string.map do |person_string|
            build_one(person_string)
        end
        people
    end

    def self.build_one(person_string)
        name, email = person_string.split('<')
        name = name.strip
        email = email.delete_suffix('>') unless email.nil?
        
        person = Person.find_or_create_by(name: name)
        if !email.nil?
            person.email = email
            person.save!
        end

        person
    end
end