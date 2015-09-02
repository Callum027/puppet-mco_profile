# base class for mco_profile servers and clients
class mco_profile (
  $middleware_ssl_port = $mco_profile::params::middleware_ssl_port,
  $middleware_user     = $mco_profile::params::middleware_user,
  $middleware_password = $mco_profile::params::middleware_password,
  $main_collective     = $mco_profile::params::main_collective,
  $collectives         = $mco_profile::params::collectives,

  $middleware_hosts    = $mco_profile::params::middleware_hosts,
  $ssl_server_cert     = $mco_profile::params::ssl_server_cert,
  $ssl_server_private  = $mco_profile::params::ssl_server_private,
  $ssl_server_public   = $mco_profile::params::ssl_server_public,
  $ssl_ca_cert         = $mco_profile::params::ssl_ca_cert,
  $connector           = $mco_profile::params::connector
) inherits mco_profile::params {

  class { '::mcollective':
    server             => false,
    client             => false,

    securityprovider   => 'ssl',
    middleware_ssl     => true,
    middleware_hosts   => $middleware_hosts,
    connector          => $connector,
    ssl_server_public  => $ssl_server_cert,
    ssl_server_private => $ssl_server_private,
    ssl_ca_cert        => $ssl_ca_cert,
  }
}
