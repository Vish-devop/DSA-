'''
Approach(1): 
- Iterating inside the array, and would be checking if first 2 elements having the sum as target, then return the first 2 elements else continue with other elements present into the array. 

TC: O(n), SC: O(1) 
'''
def targetSum(array,target):
    for i in range(len(array)-1):
        if (array[i]+array[i+1]==target):
            return [array[i],array[i+1]]
    
print(targetSum([3,3],6))
