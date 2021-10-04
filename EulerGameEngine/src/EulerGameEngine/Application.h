#pragma once

#include "Core.h"

namespace EulerEngine {

	class ELR_API Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();
	};


	// To be defined in client
	Application* CreateApplication();
}

