# This is a demo task.
#
# Write a function:
#
#    def solution(A)

# that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

# For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

# Given A = [1, 2, 3], the function should return 4.

# Given A = [−1, −3], the function should return 1.

# Write an efficient algorithm for the following assumptions:

#        N is an integer within the range [1..100,000];
#        each element of array A is an integer within the range [−1,000,000..1,000,000].



def solution(A):
    # write your code in Python 3.6
    #start = min(A)
    #end = abs(max(A))
    #print(f"min is {start} and max is {end}")
    return sorted(set(range(1, abs(max(A)) + 1 + 1 )).difference(A))[0]

    return magic_number



A = [1, 3, 6, 4, 1, 2]

B = [1, 2, 3]

C = [-1, -3]

print(solution(B))
