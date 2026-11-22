# Common utils for all user stories

import psycopg2
from pprint import pprint as pp
from prettytable import PrettyTable

import re

def c(s):
    return re.sub('\s+', ', ', s)

# Given some table, prints it out in a pretty format
def show_table(rows, cols='', ncols=None):
    if ncols != None:
        cols = [('c%d' % i) for i in range(1, ncols+1)]
    else:
        cols = cols.split()
    table = PrettyTable( cols )
    table.add_rows(rows)
    print(table)


SHOW_CMD = True

def print_cmd(cmd):
    if SHOW_CMD:
        print(cmd.decode('utf-8'))

# connects to the database
conn = psycopg2.connect(database='ticketmaster', user='isdb')
conn.autocommit = True
cur = conn.cursor()
