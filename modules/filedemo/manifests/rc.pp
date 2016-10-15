class filedemo::rc {
	# Examples:
	# all File resources owned by root
	#File <| owner == "root" |>
	# all File resources 
	#File <| |>
	# Update all File resources with group = "root" to group => "jeff":
	File <| group == "root" |> {
		group => "jeff",
	}

}
