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

**Recursion Question 2**:

**Example question**: how to calculate a^b (where a is an integer and b is also an integer, we do not care about the corner case where a = 0 or b < 0 for now)

2^1000

a = 2

b = 1000

**Solution**:

```c++
int a_power_b(int a, int b) {
	if (b == 0) {
    return 1;
  }
  int half_result = a_power_b(a, b / 2);
  if (b % 2 == 0) {
    return half_result * half_result;
  } else {
    return half_result * half_result * a;
  }
}

b = 1000
  |
b = 500
  |
b = 250
  |
b = 125
  |
b = 64
  |
 ...
  |
b = 0
  
There are log_2(b) levels. Thus, its time complexity = O(logb) 
Space = O(logb)
```

2. Binary Search

what is **binary search** in the context of an array?

1. Array has to be sorted. ascending or descending 1 2 3 5 7 8 ...... ??????

   ​		**Not necessarily the case.**

2. Problem to solve?

0 1 2 **3** 4 5 6

1 3 5 6 7 8 9		tell me whether 6 is in the array or not, if yes, please return 6's index

**Essentially, the principle** of binary search is to reduce the search space by 1/2 of its original size. in th meantime, you must gurarntee that the target must not be ruled out.

Array	1 3 7 23 57 ...... **100** 99 86 44 32 21

![](/images/DataStructureNote/class2/algo2_1.png   "001")

```c++
// Classical Version 1.0
// return any target element's index
int binary_search(int a[], int size, int target) {
  int left = 0;
  int right = size - 1;
  while (left <= right) {
    int mid = left + (right - left) / 2;
    if (a[mid] == target) {
      return mid;
    } else if(a[mid] < target) {
      left = mid + 1;
    } else {
      right = mid - 1;
    }
  }
  return -1;
}
```


