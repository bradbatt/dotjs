# encoding: utf-8

require 'spec_helper'

describe '.js' do
  let(:base_uri) { 'https://localhost:3030' }

  it 'runs on port 3131' do
    expect(HTTParty.head(base_uri).code).to eql 200
  end

  describe 'scripts' do
    it 'responds with proper content-type' do
      res = HTTParty.get("#{base_uri}/github.com.js")

      expect(res.headers['content-type']).to eql 'text/javascript'
    end

    it 'responds with scripts for the requested domain' do
      res = HTTParty.get("#{base_uri}/github.com.js")

      expect(res.body).to include read_fixture('github.com.js')
    end

    it 'responds with scripts for all requested subdomains' do
      res = HTTParty.get("#{base_uri}/pages.github.com.js")

      expect(res.body).to include read_fixture('github.com.js')
      expect(res.body).to include read_fixture('pages.github.com.js')
    end
  end

  describe 'stylesheets' do
    it 'responds with proper content-type' do
      res = HTTParty.get("#{base_uri}/github.com.css")

      expect(res.headers['content-type']).to eql 'text/css'
    end

    it 'responds with stylesheets for the requested domain' do
      res = HTTParty.get("#{base_uri}/github.com.css")

      expect(res.body).to include read_fixture('github.com.css')
      expect(res.headers['content-type']).to eql 'text/css'
    end

    it 'responds with stylesheets for the all requested subdomains' do
      res = HTTParty.get("#{base_uri}/pages.github.com.css")

      expect(res.body).to include read_fixture('github.com.css')
      expect(res.body).to include read_fixture('pages.github.com.css')
    end
  end
end
