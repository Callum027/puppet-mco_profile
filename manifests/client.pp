# an example profile for mco clients
class mco_profile::client inherits mco_profile {

  Class['::mco_profile::wrapper'] {
    client => true,
  }

}
