IF "%1"=="" (
  echo "Please provide argument"
  echo "Usage: ./tools/run build|run|test|clear"
) ELSE IF "%1"=="build" (
  :: cmake build prerequisites.
  IF EXIST ".\build" (
    IF "%2"=="all" (
      rmdir /s /q "build"
    )
  ) ELSE (
    mkdir -p build/windows
  )

  :: execute cmake build
  cmake -S . -B build/windows
  cmake --build build/windows
) ELSE IF "%1"=="run" (
  :: run app
  set executable=.\build\bin\Debug\emcpp_item-%2.exe
  "%executable%"
::) ELSE IF "%1"=="test" (
  :: run test
::  ctest --test-dir build\ --output-on-failure -j 12
) ELSE IF "%1"=="clean" (
  :: clean build
  IF EXIST ".\build" (
    rmdir /s /q "build"
  )
) ELSE (
    echo "Invalid argument: %1"
)
