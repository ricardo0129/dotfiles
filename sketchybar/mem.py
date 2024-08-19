import subprocess

# Pressure - just get the pressure value
sy = subprocess.Popen(['vm_stat'], stdout=subprocess.PIPE).communicate()[0].decode()
lines = sy.split('\n')
#print(lines)
#for i, line in enumerate(lines):
#    print(i, line)
def parse_val(s):
    return int(s.split()[-1][:-1])
anonymous_pages = parse_val(lines[14])
active_pages = parse_val(lines[2])
inactive_pages = parse_val(lines[3])
purgeable_pages = parse_val(lines[7])
wired_pages = parse_val(lines[6])
compressed = parse_val(lines[16])
file_backed = parse_val(lines[13])
free_pages = parse_val(lines[1])
appMemory = anonymous_pages - purgeable_pages
page_size = int(lines[0].split()[-2])
total_ram = appMemory + wired_pages + compressed + file_backed + purgeable_pages + free_pages
print(f'appMemory {appMemory * page_size / 1e9}')
print(f'total {total_ram * page_size / 1e9}')
#print ('Total:\t\t\t%9.3f GB' % ( (appMemory + vmStats["Pages wired down"] + vmStats["Pages occupied by compressor"] + vmStats["File-backed pages"] + vmStats["Pages purgeable"] + vmStats["Pages free"]) * f1))



'''
print ('')
print ('Activity Monitor memory')
print ('App Memory:\t\t%9.3f GB' % ( appMemory * f1 ))
print ('Wired Memory:\t\t%9.3f GB' % ( vmStats["Pages wired down"] * f1 ))
print ('Compressed:\t\t%9.3f GB' % ( vmStats["Pages occupied by compressor"] * f1 ))
print ('Memory Used:\t\t%9.3f GB' % ( (appMemory + vmStats["Pages wired down"] + vmStats["Pages occupied by compressor"] ) * f1 ))
print ('Cached Files:\t\t%9.3f GB' % ( (vmStats["File-backed pages"] + vmStats["Pages purgeable"]) * f1 ))
# and these add up to physical rAM
print ('Total:\t\t\t%9.3f GB' % ( (appMemory + vmStats["Pages wired down"] + vmStats["Pages occupied by compressor"] + vmStats["File-backed pages"] + vmStats["Pages purgeable"] + vmStats["Pages free"]) * f1))
print ('Swap Used:\t\t%9.3f GB  %9.3f MB' % ( swapUsed * 0.0009765625, swapUsed ))
print ('Memory Pressure:\t%7.1f   GB %6.0f percent' % ( (appMemory + vmStats["Pages wired down"] + vmStats["Pages occupied by compressor"] + vmStats["File-backed pages"] + vmStats["Pages purgeable"] + vmStats["Pages free"]) * f1 * mp / 100, mp) )
print ('')


p1 = sy.decode().find('tage:')
p2 = sy.decode().find('%')
mp = 100 - int(sy[p1+6:p2])

# There are 2 tricks to get Activity Monitor's App Memory (which is best?)
#appMemory = page_pageable_internal_count - vmStats["Pages purgeable"] 
appMemory = vmStats["Anonymous pages"] - vmStats["Pages purgeable"] 

print('Traditional memory:')
print ('Wired Memory:\t\t%9.3f GB' % ( vmStats["Pages wired down"] * f1 ))
print ('Active Memory:\t\t%9.3f GB' % ( vmStats["Pages active"] * f1 ))
print ('Inactive Memory:\t%9.3f GB' % ( vmStats["Pages inactive"] * f1 ))
print ('Speculative:\t\t%9.3f GB' % ( vmStats["Pages speculative"] * f1 ))
print ('Throttled:\t\t%9.3f GB' % ( vmStats["Pages throttled"] * f1 ))
print ('Free Memory:\t\t%9.3f GB' % ( vmStats["Pages free"] * f1 ))
print ('Compressed:\t\t%9.3f GB' % ( vmStats["Pages occupied by compressor"] * f1 ))
# These add up close to phyical RAM
print ('Total:\t\t\t%9.3f GB' % ( (vmStats["Pages free"] + vmStats["Pages wired down"] + vmStats["Pages active"] + vmStats["Pages inactive"] + vmStats["Pages speculative"] + vmStats["Pages throttled"] + vmStats["Pages occupied by compressor"]) * f1 ))
    
sys.exit(0);
'''
