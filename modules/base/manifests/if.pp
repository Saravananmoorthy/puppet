class base::if {
	if $::hostname =~ /^tracedlowe(\d+)/ {
		# $0 evaluates to whatever evaluates in the regex above.
		notice("you have arrived at server $0 ")
	}
}

