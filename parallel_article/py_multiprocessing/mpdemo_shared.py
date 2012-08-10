''' listing xx: mpdemo-shared.py
Create number of processes using the multiprocessing module
and sharing a variable
'''

import multiprocessing
from multiprocessing import Process, Value

# dummy function
def f(count):
    #This is a dummy function taking a parameter
    count.value=count.value+1
    return

if __name__ == '__main__':

    # get the number of CPU's
    np = multiprocessing.cpu_count()
    print 'You have {0:1d} CPUs'.format(np)

    # Shared integer variable (process safe)
    count=Value('i',0)

    # Create the processes
    p_list=[]
    for i in range(1,np+1):
        p = Process(target=f, name='Process'+str(i), args=(count,))
        p_list.append(p)
        print 'Process:: ', p.name,
        p.start()
        print 'Was assigned PID:: ', p.pid

    # Wait for all the processes to finish
    for p in p_list:
        p.join()

    print count.value
