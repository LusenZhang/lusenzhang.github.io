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

 **Apply binary search in 2D space**

**Variant 1.0 application**: 2D matrix, sorted on each row, first element of next row is larger(or equal) to the last element of previous row, now giving a target number, returning the position that the target locates within the matrix

1 	2	3	4

5	 6.   7    8

9    10  11  12 

**Solution 1**:

Step1: Run binary search in the 0-th column to find the possible row that contains target

Step2: Run 2nd binary search, in the particular row to find target (if any)

Time = O(logo + logn) = O(log(m*n))

**Solution 2**:

```java
public boolean ifFind(int[][] matrix, int target) {
  if (matrix.length == 0 || matrix[0].length == 0) {
    return false;
  }
  int row = matrix.length;
  int col = matrix[0].length;
  int i = 0;
  int row * col - 1;
  while (i < j) {
    int mid = i + (j - i) / 2;
    int r = mid / col; //helper function to map n-dimensional coordinate to 1D coordinate
    int c = mid % col;
    if (matrix[r][c] == target) {
      return true;
    } else if (matrix[r][c] > target) {
      j = mid - 1;
    } else {
      i = mid + 1;
    }
  }
  return false;
}
```

Time = O(log(m*n))

Variant 1.1 how to find an element in the array that is **closest** to the target number?

Target == 4

// e.g.	int a[5] = {1, 2, **3**, 8, 9}

```java
int binary_search(int a[], int size, int target) {
  int left = 0;
  int right= size - 1;
  while(left < right) {				//avoid infinite loop
    int mid = left + (right - left) / 2;
    if (a[mid] == target) {
      return mid;
    } else (a[mid] < target) {
      left = mid;							//Wrong left = mid + 1
    } else {
      right = mid;						//Wrong right = mid - 1
    } 
  }
  //post-processing
  if (Math.abs(a[left] - target) < Math.abs(a[right] - target)) {
    return left;
  } else {
    return right;
  }
}

```

![](/images/DataStructureNote/class2/algo2_2.png   "002")

```java
// e.g int a[7] = {4, 5, 5, 5, 5, 5, 5};
// if target == 5;  then index 1 is returned;
// if target == 10; then -1 is returned.
// Termination condition: when L meets R, jump out the while loop, then compare L and R to find the correct answer.(= post-processing).
int BinarySearch(int a[], int left, int right, int target) {
  int mid;
  while (left < right - 1) { // if left neighbors right --> terminate
    mid = left + (right - left) / 2;
    if (a[mid] == target) {
      right = mid;
    // do not stop here, keep checking to left
    } else if (a[mid] < target) {
      left = mid;				//left = mid + 1;
    } else {
      right = mid;			//right = mid - 1;
    }
  }
  if (a[left] == target) return left; //check a[left] against target first
  if (a[right] == target) return right; //then check a[right] against target
  return -1;
}
```


