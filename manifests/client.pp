# an example profile for mco clients
class mco_profile::client {

  ::Mco_profile::Wrapper <| name = '::mco_profile::wrapper' |> {
    client => true,
  }

}
