require 'spec_helper'

module LocationsNg
  describe Lga do
    let(:lga) { LocationsNg::Lga.new }

    describe '.all' do
      let(:lga_response) { File.read('spec/responses/lgas.json') }

      it 'returns all LGAs in Nigeria' do
        expect(lga.all).to eq(JSON.parse(lga_response))
      end
    end

    describe '.lgas' do
      context 'when lgas for a state is not found' do
        it 'returns an error message' do
          expect(lga.lgas('Unknown State')).to eq({message: "No lgas found for 'unknown_state'", status: 404})
        end
      end

      context 'when state is found' do
        it 'returns the lgas for state' do
          expect(lga.lgas('Lagos')).to eq(['Agege', 'Ajeromi-Ifelodun', 'Alimosho',
                                           'Amuwo-Odofin', 'Badagry', 'Apapa', 'Epe',
                                           'Eti Osa', 'Ibeju-Lekki', 'Ifako-Ijaiye',
                                           'Ikeja', 'Ikorodu', 'Kosofe', 'Lagos Island',
                                           'Mushin', 'Lagos Mainland', 'Ojo', 'Oshodi-Isolo',
                                           'Shomolu', 'Surulere Lagos State'])
        end
      end
    end
  end
end
