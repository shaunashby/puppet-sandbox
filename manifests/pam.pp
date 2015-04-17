class xen::pam {
  file { "Xen PAM sshd file fixup":
    path    => "/etc/pam.d/sshd",
    source  => 'puppet:///modules/xen/etc/pam.d/sshd',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }

  file { "Xen PAM system-auth-ac file fixup":
    path    => "/etc/pam.d/system-auth-ac",
    source  => 'puppet:///modules/xen/etc/pam.d/system-auth-ac',
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
  }
}
