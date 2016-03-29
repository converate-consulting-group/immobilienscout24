require 'spec_helper'

describe Immobilienscout24::Api::Gis, vcr: true do
  default_config
  default_client

  describe "continents" do
    it 'should return continents' do
      expect(client.continents).to include('gis.continents')
    end
  end

  describe "continent" do
    it 'should return countries' do
      expect(client.continent(1)).to include('gis.countries')
    end
  end

  describe "countries" do
    it 'should return countries' do
      expect(client.countries(1)).to include('gis.countries')
    end
  end

  describe "country" do
    it 'should return country' do
      expect(client.country(1, 276)).to include('gis.country')
    end
  end

  describe "regions" do
    it 'should return regions' do
      expect(client.regions(1, 276)).to include('gis.regions')
    end
  end

  describe "region" do
    it 'should return cities' do
      expect(client.cities(1, 276, 4)).to include('gis.cities')
    end
  end

  describe "cities" do
    it 'should return cities' do
      expect(client.cities(1, 276, 4)).to include('gis.cities')
    end
  end

  describe "city" do
    it 'should return quarters' do
      expect(client.city(1, 276, 4, 1)).to include('gis.city')
    end
  end

  describe "quarters" do
    it 'should return quarters' do
      expect(client.quarters(1, 276, 4, 1)).to include('gis.quarters')
    end
  end

  describe "quarter" do
    it 'should return quarter' do
      expect(client.quarter(1, 276, 4, 1, 74)).to include('gis.quarter')
    end
  end

end
