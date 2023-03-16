#!/usr/bin/python

class Employee:
  'Common base class fro all employees'
  empCount = 0

  def __init__(self, name, salary):
    self.name = name
    self.salary = salary

    Employee.empCount += 1

  def displayCount(self):
    print "Total Employee %d" % Employee.empCount


  def displayEmployee(self):
    print "Name: ", self.name, ", Salary: ", self.salary


# This would create first object of Employee class
emp1 = Employee("Zara", 2000)


print "Total Employee %d" % Employee.empCount



if hasattr(emp1, 'age'):
  print " Instance emp1 has age attribute"
else:
  print " Instance emp1 don't have age attribute"

emp1.age = 7
emp1.age = 9

if hasattr(emp1, 'age'):
  print " Instance emp1 has age attribute"

print " TEST: ", getattr(emp1, 'age')

setattr(emp1, 'age', 0)
print " TEST: ", getattr(emp1, 'age')

# delattr(emp1, 'age')
del emp1.age


# This would create seconf object of Employee class
emp2 = Employee("Manni", 5000)


emp1.displayEmployee()
emp2.displayEmployee()
print "Total Employee %d" % Employee.empCount
