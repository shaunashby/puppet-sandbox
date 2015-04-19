class xen {
  class { 'ossec::client':
    ossec_server_ip => "10.23.51.23"
  }
}
