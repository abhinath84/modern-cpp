#include<iostream>

#include "smart_ptr/shared_ptr.h"


int main(int argc, char** argv)
{
  std::cout << "---------- C++11 --------------" << std::endl;

  smart_ptr::shared_ptr_test();

  return(0);
}
