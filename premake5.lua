workspace "EulerGameEngine"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "EulerGameEngine"
	location "EulerGameEngine"
	kind "SharedLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
				"ELR_BUILD_DLL",
				"ELR_PLATFORM_WINDOWS",
				"_WINDLL"
		}

		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/SandBox")
		}

	filter "configurations:Debug"
		defines "ELR_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "ELR_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "ELR_DIST"
		optimize "On"


project "SandBox"
	location "SandBox"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"EulerGameEngine/vendor/spdlog/include",
		"EulerGameEngine/src"
	}

	links
	{
		"EulerGameEngine"
	}

	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"

		defines
		{
				"ELR_PLATFORM_WINDOWS"
		}

	filter "configurations:Debug"
		defines "ELR_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "ELR_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "ELR_DIST"
		optimize "On"