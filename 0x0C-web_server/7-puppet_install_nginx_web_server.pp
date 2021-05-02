# Scrpit that setup Nginx web server on web-01 server 

package { 'nginx':
	ensure   => present,
    provider => 'apt'
}

# Index page content
file { '/var/www/html/index.nginx-debian.html'
    ensure  => present,
    path    => '/var/www/html/index.nginx-debian.html'
    content => 'Holberton School'
}

# Redirection
file_line { 'Nyan Cat': 
    ensure  => 'present',
    path    => '/etc/nginx/sites-available/default',
    after   => 'listen 80 default server;',
    line    => '        rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;'
}

service {'nginx':
    ensure     => running,
    enable     => true,
    hasrestart => true,
    require    => Package['nginx'],
    subscribe  => File_line['Nyan Cat']
}