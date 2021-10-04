#include<EulerGameEngine.h>

class SandBox : public EulerEngine::Application
{
public:
	SandBox()
	{

	}

	~SandBox()
	{

	}
};

EulerEngine::Application* EulerEngine::CreateApplication()
{
	return new SandBox();
}