/*Listing 3: pi_openmp.c*/

/* Program to compute Pi using Monte Carlo method:
(http://math.fullerton.edu/mathews/n2003/montecarlopimod.html)
 */

#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <string.h>

/* Returns the value of count with niter iterations*/
int part_count(int niter)
{
  int i, count=0;
  float x,y,z;

  for ( i=0; i<niter; i++) 
    {
      x = (double)rand()/RAND_MAX;
      y = (double)rand()/RAND_MAX;
      z = x*x+y*y;
      if (z<=1) count++;
    }

  return count;
}


int main(int argc, char* argv)
{
  int niter=0,chunk;
  double x,y;
  int i,count=0; /* # of points in the 1st quadrant of unit circle */
  double z;
  double pi;

  /* Get the number of processors */
  printf("Number of processors available:: %d\n",omp_get_num_procs());

  printf("Enter the number of iterations used to estimate pi (multiple of %d please): ",omp_get_num_procs());
  scanf("%d",&niter);


  /* Set the number of threads to the number of processors*/
  omp_set_num_threads(omp_get_num_procs());
  chunk = niter/omp_get_num_procs();
  
#pragma omp parallel shared(chunk) reduction(+:count)
  {
    count = part_count(chunk);
  }    

  pi=(double)count/niter*4;
  printf("# of iterations = %d , estimate of pi is %g \n",niter,pi);

  return 0;
}
