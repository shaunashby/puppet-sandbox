class xen::yum {

  yumrepo { 'citrix':
    ensure     => present,
    descr      => 'XenServer 6.2.0 updates',
    mirrorlist => 'http://updates.vmd.citrix.com/XenServer/6.2.0/domain0/mirrorlist',
    gpgcheck   => 1,
    gpgkey     => 'http://updates.vmd.citrix.com/XenServer/RPM-GPG-KEY-6.2.0',
    enabled    => 0,
    target     => '/etc/yum.repos.d/Citrix.repo',
    proxy      => "http://10.20.164.22:3128",
  }

  yumrepo { 'base':
    ensure   => present,
    descr    => 'CentOS-$releasever - Base',
    baseurl  => 'http://mirror.centos.org/centos/$releasever/os/$basearch/',
    gpgcheck => 1,
    gpgkey   => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-5',
    exclude  => 'kernel-xen*, *xen*',
    enabled  => 1,
    target   => '/etc/yum.repos.d/CentOS-Base.repo',
    proxy    => "http://10.20.164.22:3128",
  }

  if !defined(Yumrepo['epel']) {
    yumrepo { 'epel':
      proxy => "http://10.20.164.22:3128",
    }
  }

  file { '/etc/yum.conf':
    ensure => present,
  }

  file_line { 'Clean yum.conf: comment should be absent':
    line    => '# Use webproxy.algo.internal to exit to the internet:',
    path    => '/etc/yum.conf',
    require => File['/etc/yum.conf'],
    ensure  => absent,
  }

  file_line { 'Clean yum.conf: proxy entry should be absent':
    line    => 'proxy=http://10.20.164.22:3128',
    path    => '/etc/yum.conf',
    require => File['/etc/yum.conf'],
    ensure  => absent,
  }

}
