#include "delegate_ctor/index.h"
#include "delegate_ctor/ball.h"

void delegate_ctor::practice()
{
  Ball def{};
  Ball blue{ "blue" };
  Ball twenty{ 20.0 };
  Ball blueTwenty{ "blue", 20.0 };
}
