'''
Question: 
You are given a string and an array of words. Your task is to write a function that takes this string and the array as input and returns a new string where all occurrences of words in the array are replaced with "REDACTED".

For example:

Python
input_string = "This is a confidential message."
words = ["confidential", "message"]

expected_output = "This is a REDACTED REDACTED."

input_string = "The quick brown fox jumps over the lazy dog."
words = ["the", "dog"]

expected_output = "REDACTED quick brown fox jumps over REDACTED."
'''

'''
Approach: 
-> I would be iterating inside the string, and would be checking the the current word/element of the string is equal to the words(array) element, then replace both of them. 
-> and return the string. 
'''
def occurencess_of_words(string, words):
    
    string = string.lower()
    words = [word.lower() for word in words]
    
    listString=string.split()
    for i in range(len(listString)):
            if listString[i] in words:
                listString[i]="REDACTED"
    
    return " ".join(listString)
print(occurencess_of_words("The quick brown fox jumps over the lazy dog.",["the", "dog"]))

