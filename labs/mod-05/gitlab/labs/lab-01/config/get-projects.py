# python /labs/lab-01/config/get-projects.py | jq
import http.client

conn = http.client.HTTPSConnection("gitlab-srv.gitlabcourse.io:4443")

payload = ""

headers = { 'PRIVATE-TOKEN': "GitLabAdmToken_4ALL" }

conn.request("GET", "/api/v4/projects", payload, headers)

res = conn.getresponse()
data = res.read()

print(data.decode("utf-8"))