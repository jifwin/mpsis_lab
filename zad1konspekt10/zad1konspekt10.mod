/*********************************************
 * OPL 12.6.3.0 Model
 * Author: grzegorz
 * Creation Date: 01-01-2017 at 11:01:46
 *********************************************/

tuple device {
 	int number_of_clients;
 	int cost;
 }
 
{int} S = ...;
{int} J = ...;
{int} Js[S] = ...;
{int} T = ...;
{int} Tj[J] = ...;

device devices[T] = ...;

dvar int x[S][J] in 0..1;
dvar int y[J][T]; //todo: should be plus?
//dvar int y[J][T] in 0..1; 

minimize
  sum(j in J) sum(t in Tj[j]) devices[t].cost * y[j][t];
  
  
subject to
	{
	forall (s in S) sum(j in J) x[s][j] == 1;
//	forall (j in J) sum (s in S: j in Js[s]) x[s][j] <= sum(t in Tj[j]) devices[t].number_of_clients*y[j][t];
	forall (j in J) sum (s in S: j in Js[s]) x[s][j] <= sum(t in Tj[j]) devices[t].number_of_clients*y[j][t];
	forall (j in J) sum(t in Tj[j]) y[j][t] <= 1;
	}