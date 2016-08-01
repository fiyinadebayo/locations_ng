require 'spec_helper'

module LocationsNg
  describe Lga do
    let(:lga) { LocationsNg::Lga }

    describe '.all' do
      let(:lga_response) { File.read('spec/responses/lgas.json') }

      it 'returns all LGAs in Nigeria' do
        expect(lga.all).to eq(JSON.parse(lga_response))
      end
    end

    describe '.lgas' do
      context 'when lgas for a state is not found' do
        it 'returns an error message' do
          expect(lga.lgas('Unknown State')).to eq({message: "No lgas found for 'Unknown State'", status: 404})
        end
      end

      context 'when state is found' do
        it 'returns the lgas for state' do
          expect(lga.lgas('lagos').count).to eq(20)
          expect(lga.lgas('Lagos')).to eq(['Agege', 'Ajeromi/ifelodun', 'Alimosho', 'Amuwo-odofin', 'Apapa',
                                           'Badagry', 'Epe', 'Eti-osa', 'Ibeju/lekki', 'Ifako/ijaiye',
                                           'Ikeja', 'Ikorodu', 'Kosofe', 'Lagos Island', 'Lagos Mainland',
                                           'Mushin', 'Ojo', 'Oshodi/isolo', 'Shomolu', 'Surulere'
                                          ])
        end
      end
    end

    describe '.localities' do
      context 'when no query is passed' do
        it 'returns 500' do
          expect(lga.localities(nil, nil)).to eq({message: 'You must enter a state and lga.', status: 500})
        end

        it 'returns 500' do
          expect(lga.localities('Kano', nil)).to eq({message: 'You must enter a state and lga.', status: 500})
        end

        it 'returns 500' do
          expect(lga.localities(nil, 'Aba South')).to eq({message: 'You must enter a state and lga.', status: 500})
        end
      end

      context 'when state is not found' do
        it 'returns an error message' do
          expect(lga.localities('logos', 'South West')).to eq({message: "'logos' state not found.", status: 404})
        end
      end

      context 'when lgas for a state is not found' do
        it 'returns an error message' do
          expect(lga.localities('Abia', 'Isiala Ngwa')).to eq({message: "'Isiala Ngwa' LGA not found for 'Abia' state.", status: 404})
        end
      end

      context 'when localities are found for lga' do
        it 'returns localities for LGAs in a state' do
          expect(lga.localities('Abia', 'Aba North')).to eq(['Ariaria', 'Asaokpoja', 'Asaokpulor',
                                                             'Eziama  ward', 'Industrial', 'Ogbor 1',
                                                             'Ogbor 2', 'Old GRA', 'Osusu 1', 'Osusu 2',
                                                             'St. Eugene', 'Umuogor', 'Umuola', 'Uratta'
                                                            ])
        end
      end
    end
  end
end
