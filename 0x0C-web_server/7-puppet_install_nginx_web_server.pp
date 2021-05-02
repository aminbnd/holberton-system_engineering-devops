# Script that setup a nginx web server on our server + redirection.

package { 'nginx':
  ensure   => present,
  provider => 'apt'
}

# Index page
file { '/var/www/html/index.html':
  ensure  => present,
  path    => '/var/www/html/index.html',
  content => 'Holberton School'
}

# Redirect to fabulous Rick Astley page
file_line { 'Nyan Cat':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default_server;',
  line   => '        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;'
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  require    => Package['nginx'],
  subscribe  => File_line['Nyan Cat']
}