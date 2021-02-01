# Data Structure Class2


## Class 2 Recursion I & Binary Search

**Recursion** key points:

1. Seeming: function calls itself.

2. In essence: Boil down a big problem to smaller ones (size n depends on size n -1, or n - 2 or ...n/2)

3. **implement**: 

   a. **Base Case**: smallest problem to solve

   b. **Recursive rule**: how to make the problem smaller (if we can resolve the same problem but with a smaller size, then what is left to do for the current problem size n)  

### Example problem: 

Fibonacci sequence:

Base case: F(0) = 0; F(1) = 1;

Recursive rule: F(n) = F(n - 1) + F(n - 2);

```c++
//Caculating Fibonacci value
int fibo (int n) {
  //Base case
  if (n == 0) {
    return 0;
  } else if (n == 1) {
    return 1;
  }
  return fibo(n - 1) + fibo(n - 2);// Recursive rule
}
```

Draw a recursion tree:

There are n levels in the recursion tree, and this recursion tree is a binary tree. Thus, there are totally at most O(2^n) nodes in the tree.

1 + 2^1 + 2^2 + 2^3 + 2^4 + ...... +2^n-1

Time = O(2^n)

Space: O(n) (Call Stack: N levels * O(1))
