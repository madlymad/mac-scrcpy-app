on run {input, parameters}
	set answer to choose from list input ¬
		with prompt "Select device or devices to screen share:" with multiple selections allowed and empty selection allowed
	if answer is not false then
		return answer
	end if
	
	return "false"
end run