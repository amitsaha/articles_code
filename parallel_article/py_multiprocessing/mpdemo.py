''' listing 4: mpdemo.py
Create number of processes using the multiprocessing module
'''

import multiprocessing
from multiprocessing import Process

# dummy function
def f(id):
    #This is a dummy function taking a parameter
    return

if __name__ == '__main__':

    # get the number of CPU's
    np = multiprocessing.cpu_count()
    print 'You have {0:1d} CPUs'.format(np)

    # Create the processes
    p_list=[]
    for i in range(1,np+1):
        p = Process(target=f, name='Process'+str(i), args=(i,))
        p_list.append(p)
        print 'Process:: ', p.name,
        p.start()
        print 'Was assigned PID:: ', p.pid

    # Wait for all the processes to finish
    for p in p_list:
        p.join()
