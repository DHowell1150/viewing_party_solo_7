# Docs:
- V3
- limit 50request/second
- basic authentication: 

`curl --request GET \
     --url 'https://api.themoviedb.org/3/movie/11?api_key=API_KEY'`

### Example request per docs: 
```
require 'uri'
require 'net/http'

url = URI("https://api.themoviedb.org/3/configuration")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMmU2ZTVhNTQ2NGQyZDAyMTlmMjdmMGFlMzVkZDI1OCIsIm5iZiI6MTcxOTg3MzU0OC45MTcwMjUsInN1YiI6IjY2ODMyZWNjMzI4NjZkZDE2ZDAyNGFhNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.p6uSpJSxmccGIpEFK9Lk5BYXsrzeFGmgs8LJMUpe28Y'

response = http.request(request)
puts response.read_body
```

