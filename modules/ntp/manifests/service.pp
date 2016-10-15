class ntp::service {
	
	service { 'ntp_service':
		name => $ntp::params::service_name,
		ensure => running,
		enable => true,
		# subscribe also implies requires
		# restart the service, if the conf file is updated
		subscribe => File['/etc/ntp.conf'],
	}
}
