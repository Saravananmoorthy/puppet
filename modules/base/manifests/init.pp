class base {
	$dnsutil = $osfamily ? {
	'Redhat' => 'bind-utils',
	'Debian' => 'dnsutils',
	}

	$systemupdate = $osfamily ? {
		'RedHat' => '/usr/bin/yum update -y',
		'Debian' => '/usr/bin/apt-get upgrade -y',
	}

	package { ['tree',$dnsutil ]:
		ensure => present,
	}

	# Execute this command...
	# schedule 'resource type'
	schedule { 'system-daily': 
		period => daily,
		# hours:
		range => '00:00 - 01:00',
	}

	exec { $systemupdate:
		# 'schedule' metaparameter:
		schedule => 'system-daily', 
	}

}
