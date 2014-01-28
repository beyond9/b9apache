name             'b9apache'
maintainer       'Chris Escalante'
maintainer_email 'chris@beyond9.co'
license          'All rights reserved'
description      'Installs/Configures Ruby'
version          '0.0.1'

recipe "b9apache", "Installs Apache 2 server. "
recipe "b9apache::vagrant", "Changes owner and group to vagrant for better support"

depends "apache2"
