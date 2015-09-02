# an example profile for mco clients
class mco_profile::client (
  $middleware_hosts   = $mco_profile::middleware_hosts,
  $ssl_server_cert    = $mco_profile::ssl_server_cert,
  $ssl_server_private = $mco_profile::ssl_server_private,
  $ssl_server_public  = $mco_profile::ssl_server_public,
  $ssl_ca_cert        = $mco_profile::ssl_ca_cert,
  $connector          = $mco_profile::connector,
) inherits mco_profile {

  Class['::mcollective'] {
    client => true,
  }

  user { "${::hostname}_client":
    password => '!',
    shell    => '/usr/sbin/nologin',
  }

  mcollective::user { "${::hostname}_client":
    homedir           => '/root',
    certificate       => $ssl_server_cert,
    private_key       => $ssl_server_private,
    ssl_ca_cert       => $ssl_ca_cert,
    ssl_server_public => $ssl_server_public,
    middleware_hosts  => $middleware_hosts,
    middleware_ssl    => true,
    securityprovider  => 'ssl',
    connector         => $connector,
  }

}
