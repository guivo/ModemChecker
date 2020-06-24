from bs4 import BeautifulSoup

baseurl = "http://192.168.1.1"
uname = "admin"
pwd = "1BellaPassword!"

soup = BeautifulSoup(html_doc, 'html.parser')

print(soup.prettify())



with requests.Session() as s:
    h = hashlib.sha1(pwd.encode())
    print(h.hexdigest())
    s.get(baseurl+"/login.lp")