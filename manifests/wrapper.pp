# This class should be applied to all servers, and sets up the MCollective
# server. It includes its parent class "site" and uses the parameters set
# there. Inheritance is used to ensure order of evaluation and exposition of
# parameters without needing to call "include".
#
# The default parameters come from the mco_profile::params class for only one
# reason. It allows the user to OPTIONALLY use Hiera to set values in one place
# and have them propagate multiple related classes. This will only work if the
# parameters are set in Hiera. It will not work if the parameters are set from
# an ENC.
#
class mco_profile::wrapper (
  $server,
  $client,

  $middleware_ssl_port,
  $middleware_user,
  $middleware_password,
  $main_collective,
  $collectives,

  $middleware_hosts,
  $ssl_server_cert,
  $ssl_server_private,
  $ssl_server_public,
  $ssl_ca_cert,
  $connector
) {

  class { '::mcollective':
    server              => $server,
    client              => $client,

    securityprovider    => 'ssl',
    middleware_ssl      => true,

    middleware_ssl_port => $middleware_ssl_port,
    middleware_user     => $middleware_user,
    middleware_password => $middleware_password,
    main_collective     => $main_collective,
    collectives         => $collectives,

    middleware_hosts    => $middleware_hosts,
    ssl_server_private  => $ssl_server_private,
    ssl_server_public   => $ssl_server_public,
    ssl_ca_cert         => $ssl_ca_cert,
    connector           => $connector,
  }

    if ($client == true) {
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

}
