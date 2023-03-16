# Given an integer, return the integer with reversed digits.
# Note: The integer could be either positive or negative.

def solution(x):
    if x < 0:
        return -1 * int(str(abs(x))[::-1])
        # [::-1] means slice ,[ star:stop:step]
        # if start and stop aren't specified , it means to go trough the entire sequence 
    else:
        return int(str(x)[::-1])


print(solution(-2371))
print(solution(345))
