#include "delegate_ctor/ball.h"

#include <iostream>

Ball::Ball(): Ball{"black", 10.0}
{}

Ball::Ball(const string& color): Ball{color, 10.0}
{}

Ball::Ball(const double& radius): Ball{"black", radius}
{}

Ball::Ball(const string &color, const double &radius)
    : color{color},
      radius{radius}
{
  std::cout << "Ball(" << this->color << ", " << this->radius << ")" << "\n";
}
