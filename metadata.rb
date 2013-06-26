description       'Configures Ubuntu to have an unsafe umask'
maintainer        'Rapid7'
maintainer_email  'William_Sharar@rapid7.com'
name              'unsafe_umask'
license           'All rights reserved'
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
recipe            'unsafe_umask::default', 'Updates /etc/login.defs to either have safe/unsafe umask and usergroups values'
supports          'ubuntu', '= 12.04'
version           '1.0.0'
