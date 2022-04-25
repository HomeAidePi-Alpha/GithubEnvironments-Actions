import sys

def alpha(a,b):
    print("Hello Alpha-Actions")
    print('argument 1:"', param1, '"')
    print('argument 2:"', param2, '"')

if __name__ == "__main__":
    param1 = sys.argv[1]
    param2 = sys.argv[2]
    alpha(param1, param2)
