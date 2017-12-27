# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, '.idy_options' do
  context 'when options is not given' do
    it 'returns a default options with a salt generated based on model name' do
      expect(Article.idy_options).to eq(salt: article_default_salt)
    end
  end

  context 'when salt is given' do
    it 'returns a default options with a salt equal the given one' do
      expect(Comment.idy_options).to eq(salt: 'salt')
    end
  end
end
