require 'spec_helper'

module LocationsNg
  describe State do
    let(:state) { LocationsNg::State }

    describe '.all' do
      let(:state_response) { File.read('spec/responses/canonical_states.json') }

      it 'returns 37 states' do
        expect(state.all.count).to eq(37)
      end

      it 'returns all canonical states, with name and capital' do
        expect(state.all).to eq(JSON.parse(state_response, symbolize_names: true))
      end
    end

    describe '.details' do
      context 'when state is not found' do
        it 'returns status with message' do
          expect(state.details('AbIja')).to eq({message: "No state found for 'AbIja'", status: 404})
        end
      end

      context 'when state is found' do
        it 'returns detailed data for the state' do
          expect(state.details('Lagos')).to eq({'minLat'=>6.3936419,
                                             'name'=>'Lagos',
                                             'capital'=>'Ikeja',
                                             'latitude'=>6.5243793,
                                             'minLong'=>3.0982732,
                                             'maxLat'=>6.7027984,
                                             'longitude'=>3.3792057,
                                             'maxLong'=>3.696727799999999,
                                             'area'=>3345,
                                             'alias'=>'lagos',
                                             'cities'=>%w(Agege Ikeja),
                                             'lgas'=>['Agege', 'Ajeromi/ifelodun', 'Alimosho',
                                                      'Amuwo-odofin', 'Apapa', 'Badagry', 'Epe',
                                                      'Eti-osa', 'Ibeju/lekki', 'Ifako/ijaiye',
                                                      'Ikeja', 'Ikorodu', 'Kosofe', 'Lagos Island',
                                                      'Lagos Mainland', 'Mushin', 'Ojo', 'Oshodi/isolo',
                                                      'Shomolu', 'Surulere']
                                            })
        end
      end
    end

    describe '.capital' do
      context 'when state is not found' do
        it 'returns status with message' do
          expect(state.details('AbIja')).to eq({message: "No state found for 'AbIja'", status: 404})
        end
      end

      context 'when state is found' do
        it 'returns the capital of a state' do
          expect(state.capital('Plateau')).to eq('Jos')
        end
      end
    end
  end
end
