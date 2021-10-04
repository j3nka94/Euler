#pragma once

#ifdef ELR_PLATFORM_WINDOWS
	#ifdef ELR_BUILD_DLL
		#define ELR_API __declspec(dllexport)
	#else
		#define ELR_API __declspec(dllimport)
	#endif
#else
	#error Euler only supports Windows!
#endif