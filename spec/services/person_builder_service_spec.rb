require 'rails_helper'

RSpec.describe PersonBuilderService, type: :service do
    describe "#build_one" do
        let(:person_string) { "Scott Fortmann-Roe <scottfr@berkeley.edu>" }
        let(:person) { PersonBuilderService.build_one(person_string) }
        
        it "build one person" do
            expect(person.name).to eq("Scott Fortmann-Roe")
            expect(person.email).to eq("scottfr@berkeley.edu")
        end
    end

    describe "#build" do
        let(:people_string) { "Katalin Csillery, Michael Blum and Olivier Francois" }
        let(:people) { PersonBuilderService.build(people_string) }
        
        it "build more the one person" do
            expect(people.size).to eq(3)
            expect(people[0].name).to eq("Katalin Csillery")
            expect(people[1].name).to eq("Michael Blum")
            expect(people[2].name).to eq("Olivier Francois")
        end
    end

end