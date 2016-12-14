describe Space do

subject(:space) { described_class.new }


  describe '#available?' do

    it 'Should accept a date' do
      expect(space).to respond_to(:available?).with(1).argument
    end

    it 'Should return true if the requested date is between the provided start and end date' do
      space.start_date = Date.new(2016, 12, 13)
      space.end_date = Date.new(2016, 12, 14)
      expect(space.available?(Date.new(2016, 12, 13))).to eq true
    end

    it 'Should return false if the requested date is between the provided start and end date' do
      space.start_date = Date.new(2016, 12, 13)
      space.end_date = Date.new(2016, 12, 14)
      expect(space.available?(Date.new(2016, 12, 15))).to eq false
    end
  end
end
