from Crypto.Util.number import *
import random, os
from gmpy2 import *

flag = os.getenv('FLAG')

mod = random.getrandbits(1024)

# print('> mod =', mod)

def XennyOracle():
    m = random.getrandbits(40)
    e = random.getrandbits(40)
    c = powmod(m, e, mod)
    print('> c =', c & 0xffffffff)
    msg = int(input('Input r:'))
    
    if m == msg:
        return True
    return False

def task():
    cnt = 0
    while True:
        if XennyOracle():
            cnt += 1
        
        if cnt == 100:
            print('flag: ', flag)
            
task()
