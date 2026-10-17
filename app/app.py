import os
from http.server import BaseHTTPRequestHandler, HTTPServer

name = os.getenv("STUDENT_NAME", "Dias")
surname = os.getenv("STUDENT_SURNAME", "Kuzhakhmetov")
group = os.getenv("STUDENT_GROUP", "IT2310")
student_id = os.getenv("STUDENT_ID", "31935")

message = f"""
================================
DevOps Student Application
================================

Name: {name}
Surname: {surname}
Group: {group}
Student ID: {student_id}

Application is running successfully!
"""

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write(message.encode())

print(message)

server = HTTPServer(("0.0.0.0", 8000), Handler)
server.serve_forever()

