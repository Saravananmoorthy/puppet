class base::ssh {
	
	package { 'openssh-package':
		name => 'openssh-server',
		ensure => present,
	}

	# Disable root login
	file { '/etc/ssh/sshd_config':
		ensure => file,
		owner => 'root',
		group => 'root',
		# require that the Package resource has run.
		source => 'puppet:///modules/base/sshd_config',
		require => Package['openssh-package'],
		notify => Service['sshd-service'],
	}

	service { 'sshd-service':
		# Reference the scope of another class (params):
		name => $base::params::ssh_name,
		ensure => running,
		enable => true,
	}
		

}
