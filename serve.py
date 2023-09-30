import http.server
import socketserver
import os

# Define the host and port
host = "localhost"
port = 8000

# Create a custom handler to send headers and serve files
class CustomHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Access-Control-Allow-Origin", "*")
        self.send_header("Cross-Origin-Embedder-Policy", "require-corp")
        self.send_header("Cross-Origin-Opener-Policy", "same-origin")
        super().end_headers()

    def do_GET(self):
        if self.path == "/":
            # If root ("/") is requested, list files in the current directory
            self.path = "./"
            super().do_GET()
        else:
            # Otherwise, serve the requested file
            super().do_GET()

# Create the HTTP server with the custom handler
with socketserver.TCPServer((host, port), CustomHandler) as httpd:
    print(f"Serving at http://{host}:{port}")
    httpd.serve_forever()
