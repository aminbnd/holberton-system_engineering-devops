# Configure ssh config

file_line { 'Turn off passwd auth':
path     => '/etc/ssh/ssh_config',
line     => '    PasswordAuthentication no',
replace  => true
}
