#pragma once

#include"Application.h"
#ifdef  ELR_PLATFORM_WINDOWS
extern EulerEngine::Application* EulerEngine::CreateApplication();

int main(int argc, char** argv)
{
	auto app = EulerEngine::CreateApplication();
	app->Run();
	delete app;
}

#endif
