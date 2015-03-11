require 'rails_helper'

module DateRangeSelector
  module Concerns
    RSpec.describe ControllerConcern do

      class BaseController
        def self.helper_method(m); end;
        include ::DateRangeSelector::Concerns::ControllerConcern
        def params; {}; end;
        def session; {}; end;
      end

      subject { BaseController.new }

      it 'creates a date_range_selector intance' do
        instance = subject.date_range_selector

        expect(instance).to be_kind_of(DateRangeSelector::ViewModel)
      end
    end
  end
end

