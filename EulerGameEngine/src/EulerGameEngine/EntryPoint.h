#pragma once

// Can be removed?
#include"Application.h"
#ifdef  ELR_PLATFORM_WINDOWS
extern EulerEngine::Application* EulerEngine::CreateApplication();

int main(int argc, char** argv)
{
	EulerEngine::Log::Init();
	ELR_CORE_WARN("Initialized log!");
	int a = 5;
	ELR_INFO("Hello! Var={0}", a);

	auto app = EulerEngine::CreateApplication();
	app->Run();
	delete app;
}

#endif
