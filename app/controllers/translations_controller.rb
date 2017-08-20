# frozen_string_literal: true

# Performs translation request to Google Cloud Translation API
class TranslationsController < ApplicationController
  def create
    translation = Translator.translate(
      translation_params[:source],
      from: translation_params[:from],
      to: translation_params[:to]
    )

    render json: translation_to_h(translation)
  end

  private

  def translation_params
    params.require(:translation).permit(:from, :to, :source)
  end

  def translation_to_h(translation)
    {
      from: translation.from,
      to: translation.to,
      source: translation.origin,
      translated: CGI.unescapeHTML(translation.text)
    }
  end
end
