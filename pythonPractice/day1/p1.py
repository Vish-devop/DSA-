'''
1st Approach: 
Using sort function. 

TC: O(logn) SC: O(n)
'''
def sortString(string):
    listString=list(string)
    listString.sort()

    ans="".join(listString)
    return ans

print(sortString("cba"))

'''
Using Naive Approach: Bubble Sort.
Initially I would have 2-pointers placed at 0th and 1th index of an array. 
Would be comparing both the elements and if anyone element is smaller would be swap and continue to next. 

TC: O(N^2) , SC: O(N)
'''
def bubbleSort(string):
    listString=list(string)
    for i in range(0,len(listString)):
        for j in range(len(listString)-i-1):
            if (listString[j]>listString[j+1]):
                listString[j],listString[j+1]=listString[j+1],listString[j]
    
    return "".join(listString)

print(bubbleSort("cba"))