# base class for mco_profile servers and clients
class mco_profile {

  class { '::mcollective':
    server             => false,
    client             => false,
  }
}
