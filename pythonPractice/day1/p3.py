'''
Qos: You are given a string containing balanced parentheses ('(', ')', '{', '}', '[', ']'). Your task is to write a function that takes this string and returns True if the parentheses are balanced, False otherwise.

For example:

Python
string = "(()())"  # Balanced, returns True
string = "([)]"      # Unbalanced, returns False
string = "([{}])"    # Balanced, returns True
string = "((())"   # Unbalanced, returns False
'''

'''
Balancing the stack: 
Approach(1): 
-> I would first insert the brackets into stack, meanwhile while iterating if I encounter closed brackets like: "),},]" then I would be popping that current element from the stack and moving to next. 

-> If stack is empty after iterating the while array: returing true, else giving false. 

TC: O(N), SC:O(N)
'''
def stackBalancer(array):
    stack=[]
    seen={'(':')','{':'}','[':']'}
    for i in array:
        if i in seen: 
            stack.append(i)

        elif len(stack)==0 or seen[stack.pop()]!=i:
                                   return False
    return len(stack)==0

print(stackBalancer("((())"))