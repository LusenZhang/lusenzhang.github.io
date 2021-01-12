# Data Structure Class1


Become a solid software engineer, need to achieve the following:

* **Part1** Solid CS basic knowledge
* **Part2** Solid Coding Skills
* **Part3** industry project -->  Outstanding Resume
* **Part4** interview soft power
* **Part5** Referral + career development

## Data Structure

**Data Structure** is a particular way of organizing data in a computer so that it can be used efficiently.

Common data structure

* Array (physical concepts)
* Stack (logical concepts)
* Queue (logical concepts)
*  Linked List (physical concepts)  
* Tree
* Heap
* Graph
* Hash table

**Big O notation**: algorithm complexity(time complexity, space complexity)

e.g., **time complexity**

e.g., **space complexity:** how much memory does it need to run this algorithm.

e.g., **auxilliary space complexity:** is the extra space or temporary space used by an algorithm.

### Sorting Algorithms

1. What are sorting algorithms?

   a. Selection sort

   b. Merge sort

   c. Quicksort

   d. Bubble sort

   e. Bucket sort

   ......

**Example:** int a[i] = {-1, -3, 4, 7} ==> {-3, -1, 4, 7} ascending order

## 1. Selection Sort:

<font face="courier new">Iteration 1: find global min -3 {-3, -1, 4, 7} insert 3 to the right place</font>

<font face="courier new">Iteration 2: find global min in the rest -3 {-1, 4, 7} ==> -3, -1 {4, 7}</font>

<font face="courier new">Iteration 3: find global min in the rest -3 -1 {4, 7} ==> -3, -1 4 {7}</font>

<font face="courier new">Iteration 4: find global min and done.</font>

### Key Points of Explaining Code:

A complete answer will include the following:

1. Document your assumpations
2. Explain your approach and how you intend to solve the problem
3. Provide code comments where applicable
4. Explain the big-O run time complexity of your solution. Justify your answer.
5. Identify any additional data structures your used and justify why you used them
6. Only provide your best answer to each part of the question

```c++
//selection sort an array a[] with size n.
void SelectionSort(int a[], int n) {
  int global, temp;
  for (int i = 0; i < n - 1; i++) { //outer loop: how many iterations.
    global = i;
    for (int j = i + 1; j < n; j++) {//inner loop: find the global min from the rest elements.
      if (a[j] < a[global]) {
        //record the index of the smallest element.
        global = j;
      }
    }
    //swap the global (a[index]) min with a[i];
    temp = a[i];
    a[i] = a[global];
    a[global] = temp;
  }
} 
```

Time complexity analysis:

```c++
for (int i = 0; i < n - 1; i++) { //outer loop: how many iterations.
    for (int j = i + 1; j < n; j++)
iteration j = 0: inner		 (0..n-1) = 4
iteration j = 1: inner n-1 (0..n-1) = 3
iteration j = 2: inner n-2 (0..n-1) = 2
iteration j = 3: inner n-3 (0..n-1) = 1
1+2+3+4...+n = n(n+1)/2 --> n^2 --> O(n^2)
```

## Discussion:

1. Given an array stored in Stack 1, how to sort the numbers by using addtional two stacks

2. Follow up, what if only 1 additional stack can be used?

   Stack 1 | |  1 3 2 4			global_min = 

   Stack 2 | | 

   Stack 3 | | 



## 2. Merge sort

a[n] == 1, 3, 5 ,7, 9, 8, 6, 4, 2, 0

![](/images/DataStructureNote/MergeSort.PNG "001")

Which small move it「谁小移谁」

```c++
vector<int> mergesort (vector<int> a, int left, int right) {
  vector<int> solution;										// store the final solution
  if (left == right) {										// base case (smallest problem)
    soulution.push_back(array[left]);
    return solution;
  }
  
  int mid = left + (right - left) / 2;		// mid is == 4
  vector<int> solu_left = mergeSort(a, left, mid) // left:0 mid:4
  vector<int> solu_right = mergeSort(a, mid + 1, right) // left:5 mid:9  
  solution = combine(solu_left, solu_right);	//谁小移谁
  return solution;
}
```

**Time complexity:** 

![](/images/DataStructureNote/MergeSortTime.PNG   "002")

**Space complexity: call stack (like DFS)**

![](/images/DataStructureNote/MergeSortSpace.PNG   "003")

**if implement by LinkedList:** 

**Time complexity: O(nlogn) + O(nlogn)**

![](/images/DataStructureNote/MergeSortTime2.PNG   "004")

## Discussion:

2.1

e.g., A1B2C3D4 -> ABCD1234

```c++
								A1B2|C3D4 

​							A1B2

​						A1	B2

​					A	1	B	2

==========================================

​					A1			B2

​						i		j

​							AB12							CD34

​								i							j

​										ABCD1234

```

2.2 (Advanced topic 1) ABCD1234 --> A1B2C3D4					**(reverse engineering)**

```c++
C1	 C2   C3   C4
AB | CD | 12 | 34 	-->	 AB | 12 | CD | 34
     DC   21			// reverse C2 and reverse C3
     12   CD			// reverse C2 + C3
```






