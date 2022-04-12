import sys
print('Hello Beta')
for i in range(1, len(sys.argv)):
    print('argument:', i, 'value:', sys.argv[i])