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
int Js[S][J] = ...;
{int} T = ...;

device Tj[J][T] = ...;

dvar int x[S][J] in 0..1;
dvar int+ y[J][T]; //todo: should be plus?

minimize
  sum(j in J) sum(t in T) Tj[j][t].cost * y[j][t];
  
  
subject to
	{
	forall (s in S) sum(j in J) Js[s][j]*x[s][j] == 1; //todo: if condition
	//forall (j in J) sum (s in S) (Js[s][j]*x[s][j]) <= sum(t in T) (Tj[j][t].number_of_clients * y[j][t]);
	forall (j in J) sum (s in S) (Js[s][j]*x[s][j]) <= sum(t in T) (Tj[j][t].number_of_clients * y[j][t]);
	forall (j in J) sum(t in T) y[j][t] <= 1;
	}