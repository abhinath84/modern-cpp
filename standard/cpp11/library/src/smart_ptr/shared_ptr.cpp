#include "smart_ptr/shared_ptr.h"

#include<iostream>
#include <memory>


void foo(std::shared_ptr<int> i)  // it's a COPY of shared_ptr, so, count must increament.
{
  (*i)++;
  std::cout << "pointer.use_count() = " << i.use_count() << std::endl;
}

// void foo(const std::shared_ptr<int>& i)  // it's a REFERENCE of shared_ptr, so, count would not increament.
// {
//  (*i)++;
//  std::cout << "pointer.use_count() = " << i.use_count() << std::endl;
// }


void smart_ptr::shared_ptr_test()
{
  auto pointer = std::make_shared<int>(10);
  std::cout << "pointer.use_count() = " << pointer.use_count() << std::endl;

  foo(pointer);
  std::cout << *pointer << std::endl; // 11

  std::cout << "After pointer.use_count() = " << pointer.use_count() << std::endl;
}
