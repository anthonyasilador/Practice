import random
def computer_random():
    """let the computer create a list of 6 unique random integers from 1 to 50"""
    ci = random.sample(range(1,53), 6)
    return ci
    
def user_random():
    """let the user create a list of 6 unique random integers from 1 to 53"""
    print "Enter 6 unique random integers from 1 to 53:"
    ui = []
    while len(ui) < 6:
        print len(ui) + 1,
        try:
            i = input("--> ")
            # check if i is unique and has a value from 1 to 53
            # and is an integer, otherwise don't append
            if (i not in ui) and (1 <= i <= 53) and type(i) == type(7):
                ui.append(i)
        except:
            print "Enter an integer number!"
    return ui
def match_lists(list1, list2):
    """to find the number of matching items in each list use sets"""
    set1 = set(list1)
    set2 = set(list2)
    # set3 contains all items comon to set1 and set2
    set3 = set1.intersection(set2)
    # return number of matching items
    return len(set3)
    
# the user picks the 6 numbers
user_list = user_random()
print "Numbers picked from 1 to 53:", user_list
# set up counters for 1 to 6 matches
match1 = 0
match2 = 0
match3 = 0
match4 = 0
match5 = 0
match6 = 0
print
# the computer picks the numbers for the possible combinations
pos_comb = 22957480
print "Loading ..."
for k in range(pos_comb):
    comp_list = computer_random()
    matches = match_lists(comp_list, user_list)
    if matches == 1:
        match1 +=1
    elif matches == 2:
        match2 +=1
    elif matches == 3:
        match3 += 1
    elif matches == 4:
        match4 += 1
    elif matches == 5:
        match5 += 1
    elif matches == 6:
        match6 += 1
      
print; print
print "Out of %d possible combinations, the computer found these matches:" % pos_comb
print "1 matches = %d" % match1
print "2 matches = %d" % match2
print "3 matches = %d" % match3
print "4 matches = %d" % match4
print "5 matches = %d" % match5
print "6 matches = %d" % match6
