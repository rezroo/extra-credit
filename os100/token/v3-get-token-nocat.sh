#curl -si -X POST -H "Content-Type: application/json" -d '{"auth": {"scope": {"domain": {"id": "XXXXX"}}, "identity": {"password": {"user": {"domain": {"name": "default"}, "password": "qwerty", "id": "YYYYYY"}}, "methods": ["password"]}}}" http://127.0.0.1:5000/v3/auth/tokens | awk '/X-Subject-Token/ {print $2}'| tr -d '\r'


curl -si -X POST -H "Content-Type: application/json" -d @$1 http://127.0.0.1:5000/v3/auth/tokens?nocatalog

