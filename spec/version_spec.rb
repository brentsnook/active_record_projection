# frozen_string_literal: true

require 'spec_helper'
require 'active_record_projection/version'

RSpec.describe 'Version' do
  it 'is 0.0.1' do
    expect(ActiveRecordProjection::VERSION).to eq('0.0.1')
  end
end
