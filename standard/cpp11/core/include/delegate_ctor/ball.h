#include <string>

using std::string;

class Ball
{
  public:
    Ball();
    Ball(const string& color);
    Ball(const double& radius);
    Ball(const string& color, const double& radius);

  private:
    string color;
    double radius;
};
