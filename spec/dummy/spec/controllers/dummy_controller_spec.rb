require 'rails_helper'

RSpec.describe DummyController, js: true do
  render_views

  it 'renders the view' do
    get :index
    expect(response.body).to match /dummy/i
  end
end
