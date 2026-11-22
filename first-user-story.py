from common import *

us = '''
*  First user story:

   As a: Customer
 I want: To see ticket prices for available seating options
So that: I can find appealing tickets within my budget

'''

print(us)

def list_tickets(event_name):
    cols = 't.cost s.seat_number s.row_number s.section'

    query = f'''
SELECT t.cost, s.seat_number, s.row_number, s.section
  FROM Event as e
       JOIN Ticket as t on e.event_id = t.event_id
       JOIN Seat as s on t.seat_id = s.seat_id
 WHERE e.name = %s AND
       t.availability = 'available'
'''

    cmd = cur.mogrify(query, (event_name,))
    print_cmd(cmd)
    cur.execute(cmd)
    rows = cur.fetchall()
    pp(rows)
    show_table(rows, cols)

event_name = input("Enter the event name: ")
list_tickets(event_name)
