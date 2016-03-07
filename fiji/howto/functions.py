# basic idea of function
def func_name(input_var): # can have multiple input vars
    return 

# length function
def length(x):
    c = 0
    for i in x:
        c = c + 1
    return c

# compare to the built-in len function
my_array = [1,2,4,2,1,2,4,5,6]
my_str = 'hello world'

# items in brackets should be the same
print(len(my_array), length(my_array))
print(len(my_str), length(my_str))


## HOMEWORK ##

# Write functions for range, max, and sum
# They have to work for the following examples (and similar examples) 
# but they do not have to throw errors the same way 

def numrange():
    return


def listmax():
    return


def summation():
    return


my_list = [8, 99, 52, 3, 0, -16, -101]

print(numrange(2, 9), range(2, 9))
print(listmax(my_list), max(my_list))
print(summation(my_list), sum(my_list))

# Write a function for the posterior probability of disease testing below
def posterior_bayes():
    return

# Using this function, what is the posterior probability of disease 
# given a positive test if the test is 99.9% accurate?

# What if the disease has an occurance rate of 30%? 0.03%? 
# (The test is still 99% accurate)

# How would you re-write the function if the test had *three* outcomes?
# (Instead of just diseased and healthy)

def multi_bayes():
    return
