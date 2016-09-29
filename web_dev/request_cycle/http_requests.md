# HTTP Requests
## What are some common status codes?
- 200 Family
  - Generally mean something went right.
  - 200 = oll korrect. No issue. The resource was successfully retrieved
  - 201 = Resource created + the URI (path) to find the newly created resource
  - 202 = "Got it but not doing anything with it yet"
  - 204 = "Got it and not replying with anything more substantive" or "Me: I love you. Them: Thanks."
- 300 Family
  - Redirects: basically transferring a call to another person/department.
  - 301 = "It's not here, it's not coming back. Use this info instead"
  - 302 = "Call me on Shaniqua phone"
- 400 Family
  - Some sort of rejection. "I really believe you're a great guy, but this isn't working for me."
  - 401 = "Not my language/could you try again without muttering?"
  - 403 = "Members only playboy. Sorry" (no permissions)
  - 406 = Client can't process/understand the response. I ask a question in English and receive an answer in Cantonese.
- 500 Family
  - Server rejection. "It's not you. It's me."

## What is the difference between GET and POST requests
- GET is essentially "please give me x"
- POST is essentially "please accept x and add it to your collection"

GET requests info whereas POST adds info to the server (usually the database.)

## What is a cookie?
A piece of data stored on your computer with information about you. Initially used for user preferences, but have become much more sophisticated and contain a wider variety of data.

They're restricted to the site that created them (hence advertising through Google and Facebook).

Cookies can return information about the client making a given request and tailor the response to the stored preferences or interests of that client.

