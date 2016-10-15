class base::variables {
	file { '/root/var_test.txt':
		content => $topscope,
		owner => 'root',
		group => 'root',
		mode => '0644',
	}

	$localvar = "this is a local var"
	# tryuing to reasign will generate an error:
	#$localvar = "new value"

	# Override variable set in site.pp (topscope):
	$topscope = "new top scope value"

	notify { "${::topscope} is your REAL top scope variable": }
	notify { "${topscope} is your OVERIDDEN top scope variable": }
	notify { "${nodescope} is your node scope variable": }
	notify { "${localvar} is your local scope variable": }
	notify { "${::operatingsystem} is your OS": }
}
