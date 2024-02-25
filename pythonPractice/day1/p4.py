'''
Qos: 
You are given a string containing lowercase letters and spaces. Your task is to write a function that takes this string and returns a new string with the first non-repeating character. If there are no non-repeating characters, the function should return an empty string "".

For example:

Python
input_string = "hello world"
output_string = "o"  # "o" is the first non-repeating character

input_string = "aabbcc"
output_string = ""     # No non-repeating characters

input_string = "leetcode"
output_string = "l"  # "l" is the first non-repeating character
'''

'''
Approach: 
-> Using a dictionary, and appending all the elements of the string as a key into it. 
-> returning the key having value as 1 that is the lowest value means non-repeating character.

TC: O(N), SC:O(N)
'''
def nonRepeatingChar(string):
    
    seen={}
    if string=="": return ""
    for i in string:
        if i in seen: 
            seen[i]+=1
        else: 
            seen[i]=1
    
    
    for char in string:
        if seen[char]==1: 
            return char
    return " "

print(nonRepeatingChar("leetcode"))