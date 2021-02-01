# Practice Class 2


## Controlling your program and data

### Conditional and Loop

1. If....[else]

   ```java
   public class MyHelloWord {
     public static void main(String[] args) {
       int x = 11;
       //one output
       if (x > 0) {
         System.out.println("x>0");
       } else if (x > 5) {
         System.out.println("x>5");
       } else if (x > 10) {
         System.out.println("x>10");
       } else {
         System.out.println("others");
       }
     }
   }
   ```

   ```java
   public class MyHelloWord {
     public static void main(String[] args) {
       int x = 11;
       //all output
       if (x > 0) {
         System.out.println("x>0");
       }
       if (x > 5) {
         System.out.println("x>5");
       }
       if (x > 10) {
         System.out.println("x>10");
       }
       System.out.println("others");
     }
   }
   ```

   In Java, the expression in "()" must be a boolean expression!

   

2. For

   Loops: repeat the same set of operations for several times.

   Each time you perform the set of operations for once, it's called one "iteration".

   for-loop has three parts to control the loop statement

   ```java
   for (initial statement; condition; incrementation) {
     //statement
   }
   
   public class MyHelloWorld {
     public static void main(String[] args) {
       for (int i = 0; i < 10; i++) {
         int k;
         System.out.print(i + " ");
       }
     }
   }
   ```

   Incrementation does not have to be ++.

   ```java
   public class MyHelloWorld {
     public static void main(String[] args) {
       for (int i = 0; i < 10; i += 3) {
         int k;
         System.out.print(i + " ");
       }
     }
   }
   ```

   intuitions about variable scopes

   The "i" will "disappear" the time you exit the for loop.

   ```java
   public class MyHelloWorld {
     public static void main(String[] args) {
       for (int i = 0; i < 10; i += 3) {
         System.out.print(i + " ");
       }
       System.out.println("The last i is:" + i);//out of scope
     }
   }
   ```

   The way to fix it is to move i's declaration out of the "for" statement.

   ```java
   public class MyHelloWorld {
     public static void main(String[] args) {
       int i;
       for (i = 0; i < 10; i += 3) {
         System.out.print(i + " ");
       }
       System.out.println("The last i is:" + i);// The last i is 12
     }
   }
   ```

3. While

   While is a simplified version of for

   ```java
   for (initialization; condition; increment) {
     statement;
   }
   <=>
   initialization;
   while (condition) {
     statement;
     increment;
   }
   ```

4. Break and Continue

   **Break: jumps out of the entire loop**

   **Continue: skip the current iteration**


