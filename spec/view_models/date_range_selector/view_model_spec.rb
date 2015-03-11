require 'spec_helper'

module DateRangeSelector
  RSpec.describe ViewModel do

    let(:start_date) { Date.parse('2015-01-10') }
    let(:session) { {} }
    let(:params) do
      {
        start_date: '2015-01-10',
        end_date: '2015-01-15'
      }
    end
    let(:empty_params) { {} }

    let(:controller) { double(:controller, session: session, params: params) }
    let(:empty_controller) { double(:controller, session: session, params: empty_params) }

    let(:date_range) { described_class.new(controller) }
    let(:empty_date_range) { described_class.new(empty_controller) }

    context 'Initializing the object' do
      it 'sets the session based on params' do
        expect {
          date_range.start_date
        }.to change { session[:start_date] }.to(start_date)
      end
    end

    context 'with empty params and session present' do
      before { session[:start_date] = start_date }
      it 'uses the session value' do
        expect(empty_date_range.start_date).to eq start_date
      end
    end

    describe '#full_range' do
      it 'returns the full date range' do
        full_range = date_range.full_range

        expect(full_range).to eq 'January 10, 2015 to January 15, 2015'
      end
    end


  end
end
