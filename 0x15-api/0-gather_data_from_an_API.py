#!/usr/bin/python3
"""
Module that requests, for a given
employee id a number of information
"""

import requests
import sys

if __name__ == "__main__":

    employee_id = sys.argv[1]
    employee_url = "https://jsonplaceholder.typicode.com/users"
    todos_url = "https://jsonplaceholder.typicode.com/todos"

    employee = requests.get(employee_url).json()
    todos = requests.get(todos_url).json()

    completed = [task.get("title") for task in todos if
                 task.get("completed") is True]
    print("Employee {} is done with tasks ({}/{}):".format(
        employee.get("name"), len(completed), len(todos)))
    [print("\t {}".format(comp)) for comp in completed]
