require 'test_helper'



class OwnerTest < ActiveSupport::TestCase

  describe Owner do
    describe "Constructor" do
      subject(:matt) { Owner.new("Matt") }

      it "creates a new instance of class Owner" do
        expect(matt).to be_an_instance_of(Owner)
      end
    end
  end
end
