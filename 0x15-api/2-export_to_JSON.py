#!/usr/bin/python3
"""Exports to-do list information for a given employee ID (json format)."""
import json
import requests
import sys

if __name__ == "__main__":
    url = "https://jsonplaceholder.typicode.com/"
    employee_id = sys.argv[1]
    employee = requests.get(url + "users/{}".format(employee_id)).json()
    employeeName = employee.get("username")
    todos = requests.get(url + "todos", params={"userId": employee_id}).json()

    with open("{}.json".format(employee_id), "w") as jsonfile:
        json.dump({employee_id: [{
                "task": t.get("title"),
                "completed": t.get("completed"),
                "username": employeeName
            } for t in todos]}, jsonfile)
