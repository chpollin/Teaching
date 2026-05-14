import http.server
import socketserver
import os

PORT = 8081
PREFIX = "/Teaching/"
ROOT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "docs")


class PrefixHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=ROOT, **kwargs)

    def translate_path(self, path):
        if path.startswith(PREFIX):
            path = "/" + path[len(PREFIX):]
        elif path == PREFIX.rstrip("/"):
            path = "/"
        return super().translate_path(path)

    def do_GET(self):
        if self.path == "/" or self.path == "":
            self.send_response(302)
            self.send_header("Location", PREFIX)
            self.end_headers()
            return
        return super().do_GET()


with socketserver.TCPServer(("", PORT), PrefixHandler) as httpd:
    print(f"Serving {ROOT} at http://localhost:{PORT}{PREFIX}")
    httpd.serve_forever()
