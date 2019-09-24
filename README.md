# Ada Programming Assignment

***Due Sunday, October 6 at 11:55pm.***

This assignment asks you to implement concurrent matrix multiplication in Ada.

The sections of the Lovelace Ada tutorial that you will find the most relevant 
are:

- Lesson 2 - Basic Ada Structure (Packages)
- Lesson 13 - Tasks and Protected Types

However, since you will need to declare types, implement procedures, etc., you 
should be sure to go through at least the following additional lessons in the 
Lovelace tutorial: 1, 2, 3, 4, 5, 6, 8, 9.

Also, be sure to review the sample Ada programs that I have provided under "Ada 
Resources" tab in the course website (also here).

## Assignment

Your Ada program will have two parts:

1. A package for performing concurrent matrix multiplication.
2. A main procedure, AssignmentMain, containing tasks for reading in matrix 
   data, invoking the matrix multiplication, and displaying the results.

### The `MatrixMult` Package

You should define a package called MatrixMult that exports (i.e. declares in its 
specification) the following:

- An integer constant SIZE which you should define to be 10. This constant 
  should be used throughout the program, rather than the actual number (so that 
  if you change only this number, your program will still works).

- A type (you can name it what you want) that defines the type of a matrix, 
  e.g. a two dimensional array of integers. The size of the array should be 
  SIZExSIZE (i.e. **a square matrix**).

- A procedure `MatMult(A,B,C)`, where A and B are input parameters of the matrix 
  type you defined, and C is an output parameter, also of the same matrix type.

Within the body of the MatrixMult package, you will define the MatMult procedure. 
This procedure should multiply the matrices A and B and write the result to C. It 
should be highly concurrent -- that is, should create a fairly large number of 
tasks to perform the matrix multiplication. One straightforward way to do it, 
which you are welcome to do, is to have a two-dimensional array of tasks (you'll 
need to define a task type to do this), where each task computes one element of 
the result matrix C. You're free, however, to use an alternate concurrent 
algorithm.

### The AssignmentMain Procedure

In a separate file (`AssignmentMain.adb`), you should define the procedure 
`AssignmentMain`. It should declare three matrices of the type defined in the 
MatrixMult package, read in the values for the first two matrices, call MatMult 
so that the third matrix contains the results of multiplying the first two, and 
then print out the third matrix. It should accomplish this using at least three 
tasks, as follows.

- `Reader1`: This task should read in SIZE2 integers from the terminal and write 
  them into the first matrix (in row major order -- i.e. going across the rows 
  of the matrix).

- `Reader2`: This task should also read SIZE2 integers from the terminal and 
  populate the second matrix in row major order. _**Be sure that Reader2 doesn't**_
  _**start reading until Reader1 has finished**_.

- `Printer`: This task should print the third matrix after it has been computed 
  using MatMult. The printout should look reasonable.

The actual call to the MatMult procedure should be from the body of the 
AssignmentMain procedure.

In order to make it easy to read in the values for the two matrices, simply 
create an input file containing the 200 integers, separated by spaces. Then, 
when you run your program, redirect that file to the standard input by typing

`./assignmentmain < input.txt`

assuming that the input file is called input.txt. I have attached to this 
assignment a sample input.txt file containing 200 integers that you can use. The 
output of your program for this input file should be:

```
6176 7286 6406 5358 9562 5972 8671 6089 5728 9108
4668 4819 4289 4838 5948 3677 5852 4109 5190 6052
5979 6333 5911 5554 7202 5188 6844 4932 5381 6333
6464 6629 6861 4698 7022 5642 6976 3787 5649 7137
4339 4917 4467 4928 5126 4777 7414 4229 5538 6542
3855 4845 4822 4171 4908 4482 6980 4014 5050 6493
6491 5835 5159 5300 7143 6014 8103 4480 5676 8752
4885 5314 5610 5608 7061 4967 8495 5887 4564 7556
5009 6278 5426 4930 7372 5342 7940 5344 5750 8158
7647 8076 7403 7262 8360 8431 12179 6902 8108 11189
```

When your program is finished and working, please compress your code files into 
a single zip file and upload it to the course website.

Let me know if you have any questions. If you get stuck, feel free to email me 
or Goktug.
