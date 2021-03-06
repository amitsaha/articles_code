''' listing 5: mp_queue.py
Queue: http://docs.python.org/library/multiprocessing.html#pipes-and-queues

Demonstrates the usage of Queue to share data between processes
Spilts up a large array into chunks and calculates the partial
dot products
'''

import multiprocessing
from multiprocessing import Process, Queue
from numpy import *

# dot product of the partial data chunks
def add(chunk1,chunk2,product):
    a = chunk1.get()
    b = chunk2.get()
    
    prod = a*b
    product.put(sum(prod))

if __name__ == '__main__':

    #size of the arrays
    num_el = 100000

    # Create two arrays
    a = linspace(0,100,num_el);
    b = linspace(0,1,num_el);

    # get the number of CPU's and assign it as the number of
    # processes to create
    np = multiprocessing.cpu_count()
    print 'You have {0:1d} CPUs'.format(np)

    # chunk size
    if num_el%np != 0:
        print "The current chunking mechanism will not work"
        exit
    else:
        chunk = num_el/np

    # Create the processes
    p_list=[]

    # Create the Queue which will have the partial products
    product=Queue()

    for i in range(1,np+1):

        # A pair of queues per process for the two arrays
        aq = Queue()
        bq = Queue()

        # push the chunks into the queue
        aq.put(a[(i-1)*chunk:i*chunk])
        bq.put(b[(i-1)*chunk:i*chunk])

        # create the process
        p = Process(target=add, args=(aq,bq,product))
        p.start()
        p.join()
 
    # collect the individual sums
    items=[]
    for i in range(product.qsize()):
        items.append(product.get())
    
    # final product: sum of individual products
    print "Dot product:: ",sum(items)
