if ($args.Count -eq 0) {
  Write-Host "Please provide argument"
  Write-Host "Usage: ./tools/run build|run|test|clear"
} elseif ($args[0] -eq "build") {
  # cmake build prerequisites.
  if (Test-Path -Path ".\build" -PathType Container) {
    if ($args[1] -eq "all") {
      rm -r build/*
    }
  } else {
    mkdir -p build
  }

  # execute cmake build
  cmake -S . -B build
  cmake --build build
} elseif ($args[0] -eq "run") {
  # run app
  $executablePath = ".\build\bin\Debug\emcpp_item-$($args[1]).exe"
  & $executablePath
# } elseif ($args[0] -eq "test") {
#   # run test
#   $Env:GTEST_COLOR = 1
#   ctest --test-dir build\ --output-on-failure -j 12
} elseif ($args[0] -eq "clean") {
  # clean build
  if (Test-Path -Path ".\build" -PathType Container) {
    rm -r build/*
  }
} else {
  Write-Host "Invalid argument: $args"
}
