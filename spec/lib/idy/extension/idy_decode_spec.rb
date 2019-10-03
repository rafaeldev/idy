# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article, '#idy_decode' do
  context 'with no given salt' do
    it 'undos the obfuscation of id with default class salt' do
      expect(described_class.idy_decode('My')).to eq 1
    end
  end

  context 'with empty salt' do
    let!(:salt) { '' }

    it 'undos the obfuscation of id with given salt' do
      expect(described_class.idy_decode('jR', salt: salt)).to eq 1
    end
  end

  context 'with salt' do
    context 'when is string' do
      let!(:salt) { 'salt' }

      it 'undos the obfuscation of id with given salt' do
        expect(described_class.idy_decode('XG', salt: salt)).to eq 1
      end
    end

    context 'when is number' do
      let!(:salt) { 1 }

      it 'undos the obfuscation of id with given salt as string' do
        expect(described_class.idy_decode('kL', salt: 1)).to eq 1
      end
    end
  end
end
