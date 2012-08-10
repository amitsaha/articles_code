import cloud

def savedata():
    f=open('data.txt','w')
    f.write('This is a line of text')
    f.close()
    
    cloud.files.put('data.txt')
