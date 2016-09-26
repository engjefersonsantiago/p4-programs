import sys
import os.path
import re
from struct import *
import math
def main():
    
    if len(sys.argv) != 3:
        param = len(sys.argv) - 1
        print "Invalid parameter number. Expected at least 2 got %d" % param
        print "Usage python parser_and_calculate.py <log_file> <regex1>"
        return
    
    file_log = sys.argv[1] 
    file_ = open(file_log, "r")
    patern = sys.argv[2]

    time_array = []
    for line in file_:
       if re.match(patern, line):
           time = str(re.sub(patern, '', line)).strip()
           time = int(re.match("[0-9]+", time).group(0).strip())
           time_array.append(time)
    
    avg = sum(time_array)/len(time_array)
    print "Average time for #%d packets: %d usec" % (len(time_array), avg)
    sigma_sq = []
    for i in time_array:
        sigma_sq.append(i**2-avg**2)
    
    sigma_sq_mean = sum(sigma_sq)/len(sigma_sq)
    
    print "Mean variance for #%d packets: %d usec" % (len(sigma_sq), sigma_sq_mean)
    print "Mean Deviation for #%d packets: %d usec" % (len(sigma_sq), math.sqrt(sigma_sq_mean))


if __name__ == '__main__':
    main()

