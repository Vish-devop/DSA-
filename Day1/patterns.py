'''
Pattern(1): 
*
**
***

'''
print("Pattern1 -> ")
def pattern1(n): 
    for i in range(1,n+1):
        for j in range(1,i+1):
            print("*", end="")
        print()
    
print(pattern1(3))
print("===============================")

'''
Pattern(2): 
****
****
****

'''
print("Pattern2 -> ")
def pattern2(n): 
    for i in range(1,n+1): 
        for j in range(1,n+1): 
            print("*", end="")
        print()

print(pattern2(4))

'''
Pattern3 -> 
****
***
**
*

'''
print("Pattern3 -> ")
def pattern3(n): 
    for i in range(1,n+1): 
        for j in range(i,n):
            print("*",end="")
        print()

print(pattern3(4))

'''
Pattern(4) -> 
1
12
123
1234
'''
print("Pattern4 -> ")
def pattern4(n): 
    for i in range(1,n+1): 
        for j in range(1,i+1):
            print(j, end="")
        print()
print(pattern4(4))

'''
Pattern5 -> 
4,3,2,1
3,2,1
2,1
1
'''
print("Pattern5 -> ")
def pattern5(n): 
    for i in range(1, n+1):
        for j in range(i,n+1): 
            print(j, end="")
        print()
print(pattern5(4))

'''
Pattern(6) -> 
1234
123
12
1
'''

print("Pattern(6) -> ")
def pattern6(n): 
    for row in range(n,0,-1):
        for j in range(1,row+1):
            print(j,end=" ")
        print()
print(pattern6(12)) 
