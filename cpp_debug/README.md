# A Simple Debug Header For C++ 

## Usage

1. enable: #include "debug.h". disable: #define NDBUG (just like <cassert>).

2. The header defines two functions, DMESG & LOG

3. the function is C++11 friendly only

### DMESG

> output a debug message to stderr

> DMESG("some debug message")
  
> outputs "[DBG]some debug message"

### LOG

> output log message, variable values in a specific format to stderr

> LOG("foo", "var1", var1, "var2", var2) 
  
> outputs "[foo]var1 = 1, var2 = 12"
  
> LOG("something shall happen here")
  
> outputs "[something shall happen here]"
