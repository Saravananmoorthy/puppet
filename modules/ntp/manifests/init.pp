class ntp {
	package { ntp: 
		ensure => present,
	}

	# Classes are 'singleton' - run 1 time.
	include ntp::params
	include ntp::service
	include ntp::file
}
