CarrierWave.configure do |config|
  
  config.fog_credentials = {
    :provider           => 'Rackspace',
    :rackspace_username => ENV['RACK_USER'],
    :rackspace_api_key  => ENV['RACK_KEY']
  }
  config.fog_directory = 'snn'
  config.asset_host    = 'https://df2e9055fa14775f66af-b65d0713106b84eefa787b6f668dcbd8.ssl.cf1.rackcdn.com'
  
end