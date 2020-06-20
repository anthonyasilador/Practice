import sys
import random

def number_picker():
	options = []
	for i in range(1,53):
		options.append(i)
	number = {}
	base = []
	while len(base) < 6:
		num = random.choice(options)
		base.append(num)
		options.remove(num)
	number['base']=base
	return number

def list_of_numbers(rng):
	numbers = []
	for i in range(1, rng):
		number = number_picker()
		numbers.append(number)
	return numbers

def winning_number():
	options = []
	for i in range(1,53):
		options.append(i)
	number = {}
	base = []
	powerball = []
	while len(base) < 6:
		num = random.choice(options)
		base.append(num)
		options.remove(num)
	number['base']=base
	return number

def simulator(tickets, p):
	cost = 0
	win = 0
	w = 0
	matched1 = 0
	matched2 = 0
	matched3 = 0
	matched4 = 0
	matched5 = 0
	matched6 = 0
	highest_win = 0
	highest_match = {}
	winning_num = winning_number()
	list_of_num = list_of_numbers(tickets+1)
	for i in list_of_num:
		base_matches = len(list(set(i['base']) & set(winning_num['base'])))
		if base_matches == 1:
			win += 4
			w = 1
			matched1 += 1
		if base_matches == 2:
			win += 4
			w = 2
			matched2 += 1
		if base_matches == 3:
			win += 7
			w = 3
			matched3 += 1
		if base_matches == 4:
			win += 100
			w = 4
			matched4 +=1
		if base_matches == 5:
			win += 7000
			w = 5
			matched5 +=1
		if base_matches == 6:
			win += 6500000
			w = 6
			matched6 +=1
		if w > highest_win:
			highest_win = w
			highest_match['mynumber'] = {"base":i['base']}
			highest_match['winning_number'] = {"base":winning_num['base']}
		cost += 2
		if p == True and w>0:
			print winning_num['base'], w
	if p == True:
		print "cost:%s win:%s highest_match:%s" % (cost, win, highest_match)
	else:
		results = {"matched1":matched1, "matched2":matched2, "matched3":matched3, "matched4":matched4, "matched5":matched5, "matched6":matched6}
		return cost, win, highest_match, highest_win, results


#print simulator(1000, False)
#simulator(1000, True)

def runner(runs, tickets, printit):
	cost = 0
	win = 0
	highest_match = {}
	highest_win = 0
	results = {}
	results["matched1"]=0
	results["matched2"]=0
	results["matched3"]=0
	results["matched4"]=0
	results["matched5"]=0
	results["matched6"]=0
	for i in range(1, runs):
		sim = simulator(tickets, printit)
		cost += sim[0]
		win += sim[1]
		results["matched1"]+=sim[4]["matched1"]
		results["matched2"]+=sim[4]["matched2"]
		results["matched3"]+=sim[4]["matched3"]
		results["matched4"]+=sim[4]["matched4"]
		results["matched5"]+=sim[4]["matched5"]
		results["matched6"]+=sim[4]["matched6"]
		if sim[3] > highest_win:
			highest_win = sim[3]
			highest_match = sim[2]
	rate = float(win)/cost*100
	return "Cost:%s Winings:%s ROI:%s \nHighest Numbers:\n %s \n Matched:%s\n Results:\n 1:-%s \n 2:-%s \n 3:-%s \n 4:-%s \n 5:-%s \n 6:-%s" % (cost, win, rate, highest_match, highest_win, results["matched1"],results["matched2"],results["matched3"],results["matched4"],results["matched5"],results["matched6"])

how_many_tickets = raw_input('How many tickets would you like to buy?:')
try:
	how_many_tickets = int(how_many_tickets)
except:
	while not isinstance(how_many_tickets, int):
		how_many_tickets = raw_input('How many tickets would you like to buy?(a number please):')
		try:
			how_many_tickets = int(how_many_tickets)
		except:
			pass


how_many_simulations = raw_input('How many times would you like to run the simulation?:')
try:
	how_many_simulations = int(how_many_simulations)
except:	
	while not isinstance(how_many_simulations, int):
		how_many_simulations = raw_input('How many times would you like to run the simulation? (a number please):')
		try:
			how_many_simulations = int(how_many_simulations)
		except:
			pass
how_many_simulations += 1
print runner(how_many_simulations, how_many_tickets, False)
