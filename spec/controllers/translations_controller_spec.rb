# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TranslationsController, type: :controller do
  describe '#create' do
    context 'without required parameters' do
      before do
        post :create
      end

      subject { response }

      it { is_expected.to have_http_status(:bad_request) }
    end

    context 'with required paramters' do
      before do
        allow(Translator).to receive(:translate) do
          Struct.new(:from, :to, :origin, :text)
                .new('en', 'ko', 'Hello World!', '안녕하세요!')
        end

        post :create,
             params: {
               translation: {
                 from: 'en',
                 to: 'ko',
                 source: 'Hello World!'
               }
             }
      end

      subject { response }

      it { is_expected.to have_http_status(:ok) }
    end
  end
end
