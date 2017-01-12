require "spec_helper"

class Dog


  describe Dog do
    describe "::new" do
      it "initializes a new dog" do
        dog = Dog.new
        expect(dog).to be_a(Dog)
      end
    end
  end



end
