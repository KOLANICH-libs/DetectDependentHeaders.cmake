function(detect_dependent_headers prefix file output_var)
	set(DETECTED_HEADERS "")
	file(READ "${example}" EXAMPLE_TEXT)
	string(REPLACE "\n" ";" EXAMPLE_TEXT "${EXAMPLE_TEXT}")
	foreach(line ${EXAMPLE_TEXT})
		if(line MATCHES "[ 	]*#[ 	]*include[ 	]*[\"'<](${prefix}[a-zA-Z0-9]+\.h)")
			#message(STATUS "line ${line}")
			set("HEADER_NAME" "${CMAKE_MATCH_1}")
			set(DETECTED_HEADERS "${DETECTED_HEADERS};${HEADER_NAME}")
		endif()
	endforeach()
	set("${output_var}" "${DETECTED_HEADERS}" PARENT_SCOPE)
endfunction()

function(detect_dependencies_by_headers prefix file output_var)
	detect_dependent_headers("${prefix}" "${file}" DETECTED_HEADERS)
	set(DETECTED_DEPS "")

	foreach(header ${DETECTED_HEADERS})
		get_filename_component(LIB_NAME "${header}" NAME_WE)
		if(TARGET "${LIB_NAME}")
			set(DETECTED_DEPS "${DETECTED_DEPS};${LIB_NAME}")
		endif()
	endforeach()

	set("${output_var}" "${DETECTED_DEPS}" PARENT_SCOPE)
endfunction()
