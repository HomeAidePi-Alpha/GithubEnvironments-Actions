import sys

def beta(a,b):
    print("Hello Beta")
    print('argument 1:"', param1, '"')
    print('argument 2:"', param2, '"')

if __name__ == "__main__":
    param1 = sys.argv[1]
    param2 = sys.argv[2]
    beta(param1, param2)
