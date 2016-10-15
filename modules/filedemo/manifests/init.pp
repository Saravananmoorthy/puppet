class filedemo {

	# Set File module defaults for this module:
	File {
		owner=> 'root',
		group => 'finance',
		mode => '0660',
	}

	# set a variable
	$homedir = "/root"

	file { "${homedir}/myfile1.txt":
		content => "myfile1 content",
	}

	file { "${homedir}/myfile2.txt":
		content => "myfile2 content",
	}

	file { "${homedir}/myfile3.txt":
		content => "myfile3 content",
		owner=> 'admin',
		group => 'root',
	}

	file { '/root/motd':
		ensure => present,
		source => 'puppet:///modules/filedemo/motd',
		#content => 'this is my motd file managed by content attrib',
		owner => root,
		group  => root,
		mode => '0644',
	}

	file { '/etc/motd':
		ensure => link,
		target => '/root/motd',
	}
		
}
