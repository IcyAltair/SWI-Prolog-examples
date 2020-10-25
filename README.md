# SWI-Prolog_examples
Some solutions of popular tasks implemented in SWI-Prolog
1. Factorial and Fibonacci number 

   Calculation factorial and Fibonacci number using SWI-Prolog in two ways: simple recursion and tail      recursion. Examples of usage:

* simple factorial: `factor(6,X).`
* 'tail' factorial: `tailFactor(6,X).`
* simple Fibonacci: `fibonacci(8,X).`
* 'tail' Fibonacci: `tailFibonacci(8,V1,V).`

2. Knight's tour
   
   This task is solved using Warnsdorff's rule. Examples of usage:
   
* `horse(8).`
* `horse(20).`
3. Wolf, goat and cabbage problem
   
   This task is solved through сyclical transition between states. Examples of usage:
   
* `condition(left,left,left,left,none).` 
