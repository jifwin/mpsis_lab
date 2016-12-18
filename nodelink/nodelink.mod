/*********************************************
 * OPL 12.6.3.0 Model
 * Author: grzegorz
 * Creation Date: 18-12-2016 at 11:05:20
 *********************************************/

{int} e = ...;
{int} v = ...;
{int} d = ...;


int a[e][v] = ...;
int b[e][v] = ...;
int ksi[e] = ...;
int s[d] = ...;
int t[d] = ...;
int h[d] = ...;
int cap[e] = ...;


dvar float+ x[e][d];
dvar float+ y[e];

minimize
  sum(edge in e) ksi[edge]*y[edge];
  
subject to {

	forall (edge in e) {
		sum(demand in d) x[edge][demand] <= y[edge];	
	}
		
	
	forall (demand in d) {
		forall (node in v) {
			
			if (node == s[demand]) {
				sum(edge in e) a[edge][node]*x[edge][demand] - sum(edge in e) b[edge][node]*x[edge][demand] == h[demand];
			}
			
			else if (node == t[demand]) {
				sum(edge in e) a[edge][node]*x[edge][demand] - sum(edge in e) b[edge][node]*x[edge][demand] == -1*h[demand];
			}	
			
			else {
				sum(edge in e) a[edge][node]*x[edge][demand] - sum(edge in e) b[edge][node]*x[edge][demand] == 0;
			}	
		
		}
	}
	
	forall (edge in e) {
		y[edge] <= cap[edge];
	}
	
}