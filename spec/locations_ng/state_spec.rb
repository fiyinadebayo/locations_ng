require 'spec_helper'

module LocationsNg
  describe State do
    describe '.initialize' do
      context 'when no argument is passed' do
        let(:state) { LocationsNg::State.new }

        it 'state is "all"' do
          expect(state.state).to eq('all')
        end
      end
    end

    describe '.states' do
      let(:state) { LocationsNg::State.new }
      let(:state_response) { File.read('spec/responses/canonical_states.json') }

      it 'returns 37 states' do
        expect(state.states.count).to eq(37)
      end

      it 'returns all canonical states, with name and capital' do
        expect(state.states).to eq(JSON.parse(state_response, symbolize_names: true))
      end
    end
  end
end
