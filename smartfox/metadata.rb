name             'smartfox'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures smartfox'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


depends "rightscale"

recipe "smartfox::install_license_server", "Installs and configures SmartFox Pro License Server"

attribute "smartfox/storage_account_id",
  :description => "API public key of storage provider (s3, cloudfiles, ...)",
  :recipes     => ["smartfox::install", "smartfox::install_license_server"],
  :type        => "string",
  :display     => "smartfox/storage_account_id",
  :required    => "required"

attribute "smartfox/storage_account_secret",
  :description => "API private key of storage provider (s3, cloudfiles, ...)",
  :recipes     => ["smartfox::install", "smartfox::install_license_server"],
  :type        => "string",
  :display     => "smartfox/storage_account_secret",
  :required    => "required"

attribute "smartfox/bucket",
  :description => "Bucket name where Smartfox is stored",
  :recipes     => ["smartfox::install", "smartfox::install_license_server"],
  :type        => "string",
  :display     => "smartfox/bucket",
  :required    => "required"

attribute "smartfox/file",
  :description => "Path to file in container",
  :recipes     => ["smartfox::install", "smartfox::install_license_server"],
  :type        => "string",
  :display     => "smartfox/bucket",
  :required    => "required"
