project "RaspiCam"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	links
	{
		"opencv_core", "opencv_highgui", "opencv_imgproc", "opencv_imgcodecs"
	}

	files
	{
		"src/raspicam_cv.h",
		"src/raspicam_still_cv.h",
		"src/raspicam_still.h",
		"src/raspicam.h",
		"src/raspicamtypes.h",
		"src/scaler.h",
		"src/raspicam_cv.cpp",
		"src/raspicam_still_cv.cpp",
		"src/raspicam_still.cpp",
		"src/raspicam.cpp",
		
		"src/private/exceptions.h",
		"src/private/private_impl.h",
		"src/private/private_types.h",
		"src/private/threadcondition.h",

		"src/private/fake_mmal_dependencies.cpp",
		"src/private/private_impl.cpp",
		"src/private/threadcondition.cpp",

		"src/private_still/private_still_impl.h",
		"src/private_still/private_still_impl.cpp",
	}

	includedirs
	{
		"/usr/local/include/opencv4",
		"src",
		"dependencies/mmal",
		"dependencies/vcos",
		"dependencies"
	}

filter "configurations:Debug"
    runtime "Debug"
    symbols "On"

filter "configurations:Release"
    runtime "Release"
    optimize "On"
