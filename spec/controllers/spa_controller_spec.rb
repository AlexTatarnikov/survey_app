require 'rails_helper'

RSpec.describe SpaController, type: :controller do
  describe '#index' do
    subject { get :index }

    it { is_expected.to have_http_status(200) }
  end
end
