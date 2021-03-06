''' Serial code to estimate the value of PI
using monte carlo sampling'''

import random


def monte_carlo_pi(n):

    count=0
    for i in range(n):
        x=random.random()
        y=random.random()
        
        # if it is within the unit circle
        if x*x + y*y <= 1:
            count=count+1
        
    #return
    return count/(n*1.0)*4


if __name__=='__main__':
    print monte_carlo_pi(10000000)
        

