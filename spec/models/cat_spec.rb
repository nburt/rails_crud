require 'spec_helper'

describe Cat do

  describe 'validations' do

    before do
      @cat = Cat.create!(:name => 'Spot', :color => 'brown')
    end

    it 'can create a valid cat' do
      expect(@cat).to be_valid
    end

    it 'cannot create a cat without a name' do
      @cat.name = nil
      expect(@cat).to_not be_valid
    end

    it 'cannot create a cat without a color' do
      @cat.color = nil
      expect(@cat).to_not be_valid
    end

  end

end