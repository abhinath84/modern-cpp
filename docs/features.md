# Introduction

## C++11 Features

### Core Language Features

1. Auto type deduction ***[In-progress: 70%]***
   - Automatic type inference
   - Primarily used with iterators and complex template types
2. `nullptr` ***[Done]***
   - Replaces NULL macro
   - Type-safe pointer value
3. Range-based `for` loops ***[Not-started]***
   - `for (auto& element : container)`
4. Lambda expressions ***[Done]***
   - Anonymous functions
   - Capture clauses ([] = empty, [=] = by value, [&] = by reference)
5. Move semantics & rvalue references ***[Done]***
   - `std::move()`
   - Rvalue references (Type&&)
   - Move constructors
   - Move assignment operators
6. Uniform initialization ***[In-progress: 20%]***
   - Brace initialization {}
   - Works with all types
   - Prevents narrowing conversions
7. `constexpr` ***[Done]***
   - Compile-time constants
   - Constexpr functions
8. Type inference ***[In-progress: 80%]***
   - `decltype` keyword
   - Trailing return types
   - Auto return type deduction
9. Static assertions ***[Not-started]***
   - Compile-time assertions
   - `static_assert(condition, message)`

### Template Improvements

1. Variadic templates ***[Done]***
   - Templates with variable number of arguments
   - Perfect forwarding
2. Template aliases ***[In-progress: 10%]***
   - `using` keyword for template aliases
   - Simpler than typedef
3. External templates ***[Not-started]***
   - Control template instantiation

### Concurrency Support

1. Thread library ***[In-progress: 50%]***
   - `std::thread`
   - thread_local storage
2. Atomic operations ***[In-progress: 30%]***
   - `std::atomic`
   - Memory ordering
3. Synchronization primitives ***[In-progress: 50%]***
   - `std::mutex`
   - `std::condition_variable`
   - `std::lock_guard`
   - `std::unique_lock`
4. Futures and Promises ***[In-progress: 40%]***
   - `std::future`
   - `std::promise`
   - `std::async`

### Standard Library Enhancements

1. Smart pointers ***[Done]***
   - `unique_ptr`
   - `shared_ptr`
   - `weak_ptr`
2. New containers ***[Not-started]***
   - `array`
   - `forward_list`
   - `unordered_set`
   - `unordered_map`
3. Tuple types ***[In-progress:  80%]***
   - `std::tuple`
   - `std::tie`
4. Time utilities ***[Not-started]***
   - `std::chrono`
   - Duration, timepoint
5. Regular expressions ***[Not-started]***
   - `std::regex`

### Other Features

1. Delegating constructors ***[Not-started]***
2. Inherited constructors ***[Not-started]***
3. Extended friend declarations ***[Not-started]***
4. Override and final specifiers ***[In-progress]***
5. Default and deleted functions ***[Done]***
6. Strongly-typed enums (enum class) ***[In-progress]***
7. Right angle brackets (>>) ***[Not-started]***
8. `explicit` conversion operators ***[Done]***
9. Raw string literals (R"()") ***[Not-started]***
10. User-defined literals ***[Not-started]***
11. Attributes ***[In-progress]***
12. Long long int type ***[Not-started]***
13. Alignment support (alignof, alignas) ***[Not-started]***

## C++14 Features

### Core Language Features

1. Generic lambdas with `auto` parameters
2. Return type deduction for normal functions (using `auto`)
3. Relaxed constexpr function restrictions
4. Variable templates
5. Binary literals (`0b` prefix)
6. Digit separators (`'`)
7. Initialized lambda captures
8. Generic lambda captures
9. Deprecated attribute (`[[deprecated]]`)
10. Function return type deduction (`decltype(auto)`)
11. Aggregate member initialization
12. Fixed sized array deduction

### Standard Library Enhancements

1. Smart Pointer Improvements
   - `std::make_unique<T>`
2. Concurrency
   - `std::shared_timed_mutex`
   - `std::shared_lock`
3. Utility Components
   - `std::integer_sequence`
   - `std::exchange`
   - `std::quoted`
   - Type transformation aliases (`_t` suffix)
   - `std::get<T>()` for accessing tuple elements by type
4. Library Improvements
   - User-defined literals for standard library types
   - Extended constexpr support across standard library
   - Compile-time integer sequences
   - Tuple addressing by type

### Template Metaprogramming Improvements

1. Type traits aliases (`std::enable_if_t` instead of `std::enable_if::type`)
2. Variable templates for metaprogramming
3. Extended constexpr in type traits and metafunctions

## C++17 Features

### Core Language Features

1. Structured Bindings - `auto [x,y] = pair`
2. Constructor template argument deduction
3. Declaring non-type template parameters with `auto`
4. Fold expressions
5. Compile time if `constexpr`
6. Inline variables
7. Guaranteed copy elision
8. Lambda capture of `*this` by value
9. Nested namespaces - `namespace A::B::C`
10. utf-8 character literals
11. Hexadecimal floating point literals
12. Direct list initialization of enums
13. Constant evaluation for all non-type template arguments
14. `static_assert` without message
15. Selection statements with initializers (`if` and `switch`)
16. New attributes: `[[fallthrough]]`, `[[nodiscard]]`, `[[maybe_unused]]`

### Standard Library Enhancements

1. New Containers
   - `std::string_view`
   - `std::any`
   - `std::optional`
   - `std::variant`
   - `std::filesystem` (from Technical Specification)
2. Algorithm Improvements
   - `std::for_each_n`
   - `std::clamp`
   - `std::reduce`
   - `std::inclusive_scan`
   - `std::exclusive_scan`
   - `std::transform_reduce`
   - `std::transform_inclusive_scan`
   - `std::transform_exclusive_scan`
   - `std::gcd` and `std::lcm`
   - Parallel algorithms
3. Container Improvements
   - `std::map::insert_or_assign`
   - `std::map::try_emplace`
   - `std::map::extract` and `std::map::merge`
   - Non-const `std::string::data()`
   - Splicing for `maps` and `sets`
4. Other Library Features
  - `std::byte`
  - `std::invoke`
  - `std::apply`
  - `std::make_from_tuple`
  - `std::conjunction/disjunction/negation`
  - `std::is_aggregate`
  - `std::has_unique_object_representations`
  - Elementary string conversions
  - Transparent comparators for associative containers
  - Memory resources and polymorphic allocators
  - `std::shared_ptr` for arrays
  - `std::weak_from_this`
  - `std::size`, `std::empty`, `std::data`

### Removed Features

1. `std::auto_ptr`
2. `std::random_shuffle`
3. `std::unexpected`, `std::unexpected_handler`, `std::set_unexpected`
4. Old style trigraphs
5. `register` keyword (reserved for future use)
6. bool increment operator

## C++20 Features

### Core Language Features

1. Concepts and constraints
2. Modules
3. Coroutines
4. Three-way comparison operator (`<=>`)
5. Range-based for loop with initializer
6. Template syntax improvements
   - Class template argument deduction for aggregates
   - Template parameter lists on lambdas
   - Abbreviated function templates using `auto`
   - Using `enum`
   - `typename` in more contexts
7. Designated initializers
8. `constexpr` improvements
   - `virtual` functions
   - `try/catch` blocks
   - dynamic allocation
   - `std::string` and `std::vector`
   - union active member changes
9.  `consteval` functions
10. `constinit` variables
11. Immediate functions
12. Lambda improvements
    - Default constructible and assignable
    - Template parameter lists
    - Capture of parameter pack
13. Feature test macros

### Standard Library Enhancements

1. Ranges Library
   - Range adapters and views
   - Range algorithms
   - Range factories
2. Concurrency
   - `std::jthread`
   - `std::stop_token`, `std::stop_source`
   - `std::atomic_ref`
   - `std::atomic` smart pointers
   - `std::barrier`, `std::latch`
   - `std::counting_semaphore`
   - `std::osyncstream`
   - `std::span`
3. Containers and Algorithms
   - `std::erase`/`std::erase_if`
   - `std::starts_with`/`std::ends_with`
   - `std::contains` for associative containers
   - `std::make_shared` for arrays
   - `std::shift_left`/`std::shift_right`
   - Heterogeneous lookup for unordered containers
   - `std::ssize`
   - Calendar and time zone support
4. Other Library Features
   - `std::format`
   - `std::source_location`
   - `std::assume_aligned`
   - Mathematical constants (`std::numbers`)
   - `std::is_constant_evaluated`()
   - Bit operations
     - `std::bit_cast`
     - `std::midpoint`
     - `std::lerp`
     - Bit manipulation functions
5. `std::string` improvements
   - `starts_with`, `ends_with`
   - contains
   - `std::u8string` improvements

### Concepts Library

1. Core language concepts
2. Iterator concepts
3. Range concepts
4. Callable concepts
5. Comparison concepts
6. Object concepts
7. Memory concepts

### Type Traits

1. New type traits for concepts
2. `std::type_identity`
3. `std::remove_cvref`
4. `std::is_nothrow_convertible`

## C++23 Features

### Core Language Features

1. `if consteval`
2. static operator[]
3. Size-based allocation of dynamic arrays
4. Literal suffixes for `size_t` and `signed size_t`
5. Deducing this
6. Break and continue in range-based for loops
7. Multidimensional subscript operator
8. `auto(x)`: explicit type deduction
9. Attributes
    - `[[assume]]`
    - `[[likely]]`, `[[unlikely]]`
    - `[[noreturn]]`

### Standard Library Enhancements

1. Ranges Improvements
   - `views::zip`
   - `views::adjacent`
   - `views::chunk`
   - `views::slide`
   - `views::repeat`
   - `views::as_rvalue`
   - `views::join_with`
   - `views::chunk_by`
   - Rangified `string_view` find functions
2. Container Improvements
   - `std::flat_map` and `std::flat_set`
   - `std::flat_multimap` and `std::flat_multiset`
   - `std::move_only_function`
   - `std::expected`
   - `std::generator`
   - `std::mdspan`
   - `std::out_ptr` and `std::inout_ptr`
3. Algorithm Additions
   - `std::ranges::to`
   - `std::ranges::fold_left`, `fold_right`
   - `std::ranges::contains`
   - `std::ranges::contains_subrange`
   - `std::shift_left`, `std::shift_right`
4. String and Format Improvements
   - `std::format improvements`
   - `std::basic_string::resize_and_overwrite`
   - `std::basic_string` support for `string_view` construction
   - Formatted output for `std::filesystem::path`
5. Other Library Features
   - `std::byteswap`
   - `std::invoke_r`
   - `std::is_scoped_enum`
   - `std::forward_like`
   - Stacktrace library
   - `std::debugging` support
   - `std::unreachable`
   - `std::reference_wrapper` construction from subclass
   - Improvements to `std::optional` and `std::variant`
   - `std::bind_back`

### Modules and Networking

1. Module improvements
2. Networking TS features (partial)

### Memory Model

1. Extended floating-point types
2. Memory model improvements
3. Conversion from object pointer to function pointer and vice versa

## Reference

- [modern-cpp-features](https://github.com/AnthonyCalandra/modern-cpp-features)
- [C++ Move Semantics - The Complete Guide](http://www.cppmove.com/)
- [C++17 - The Complete Guide](http://cppstd17.com/)
- [C++20 - The Complete Guide](http://www.cppstd20.com/)

## Misc

- Status
  - Done
  - In-progress
  - Not-started

- Learning pattern
  - what was the problem before those features
  - bit inner information about those features
  - practical/real-life application of those features

- How to learn
  - get basic idea from book/video
  - practice & resolve questions of your own
  - learn deep (more insight)
  - read about the feature on *"Effective Modern C++"* by Scott Meyers
