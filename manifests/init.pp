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

  @::mco_profile::wrapper { '::mco_profile::wrapper':
    middleware_ssl_port => $middleware_ssl_port,
    middleware_user     => $middleware_user,
    middleware_password => $middleware_password,
    main_collective     => $main_collective,
    collectives         => $collectives,

    middleware_hosts    => $middleware_hosts,
    ssl_server_cert     => $ssl_server_cert,
    ssl_server_private  => $ssl_server_private,
    ssl_server_public   => $ssl_server_public,
    ssl_ca_cert         => $ssl_ca_cert,
    connector           => $connector,
  }
}
