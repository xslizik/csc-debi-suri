import requests
from flask import Flask, render_template

TIMEOUT = 3

app = Flask(__name__)

def send_request(url, method, headers, data=None, params=None, timeout=TIMEOUT):
    try:
        if method == "POST":
            response = requests.post(url, headers=headers, data=data, timeout=timeout)
            return response.text
        elif method == "GET":
            response = requests.get(url, headers=headers, params=params, timeout=timeout)
            return response.text
        return None
    except:
        return None

def exploit_sql_injection(payload="1' OR '1'='1"):
    url = "http://10.10.20.5/vulnerabilities/sqli/"
    method = "GET"
    headers = {
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36",
        "Upgrade-Insecure-Requests": "1",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
        "Referer": "http://10.10.20.5/vulnerabilities/sqli/",
        "Accept-Encoding": "gzip, deflate",
        "Accept-Language": "en-US,en;q=0.9",
        "Cookie": "security=low; PHPSESSID=7dccf9917ddd474182350af1da4f5327"
    }
    params = {
        "id": payload,
        "Submit": "Submit"
    }

    if send_request(url, method, headers, params=params) == None:
        return "$FLAG3"
    else:
        return None

def exploit_login(username="admin", password="password"):
    url = "http://10.10.20.5/vulnerabilities/brute/"
    method = "GET"
    headers = {
        "Host": "10.10.20.5",
        "Cache-Control": "max-age=0",
        "Upgrade-Insecure-Requests": "1",
        "Origin": "http://10.10.20.5",
        "Content-Type": "application/x-www-form-urlencoded",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
        "Referer": "http://10.10.20.5/vulnerabilities/brute/?username=uwu&password=123&Login=Login",
        "Accept-Encoding": "gzip, deflate",
        "Accept-Language": "en-US,en;q=0.9",
        "Cookie": "security=low; PHPSESSID=888ef19fd637baf5dfbff0590c0e6399",
        "Connection": "close"
    }
    params = {
        "username": username,
        "password": password,
        "Login": "Login"
    }

    if send_request(url, method, headers, params=params) == None:
        return "$FLAG4"
    else:
        return None

def exploit_reflected_xss(payload="<script> alert(\"uwu\"); </script>"):
    url = "http://10.10.20.5/vulnerabilities/xss_r/"
    method = "GET"
    headers = {
        "Host": "10.10.20.5",
        "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36",
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9",
        "Referer": "http://10.10.20.5/vulnerabilities/xss_r/",
        "Accept-Encoding": "gzip, deflate",
        "Accept-Language": "en-US,en;q=0.9",
        "Cookie": "security=low; PHPSESSID=888ef19fd637baf5dfbff0590c0e6399",
        "Connection": "close"
    }
    params = {
        "name": payload
    }

    if send_request(url, method, headers, params=params) == None:   
        return "$FLAG5"
    else:
        return None


@app.route('/')
def index():
    return render_template('index.html')

@app.route('/sql', methods = ['POST'])
def sql():
    if exploit_sql_injection(payload="1"):
        return render_template('result.html', result="make sure DVWA is working properly")
    
    response = exploit_sql_injection()
    if response == None:
        return render_template('result.html', result="rule does not work")
    else:
        return render_template('result.html', result=response)
    
@app.route('/login', methods = ['POST'])
def login():
    if exploit_login(username="uwu"):
        return render_template('result.html', result="make sure DVWA is working properly")
    
    response = exploit_login()
    if response == None:
        return render_template('result.html', result="rule does not work")
    else:
        return render_template('result.html', result=response)

@app.route('/xss', methods = ['POST'])
def xss():
    if exploit_reflected_xss(payload="owo"):
        return render_template('result.html', result="make sure DVWA is working properly")
    
    response = exploit_reflected_xss()
    if response == None:
        return render_template('result.html', result="rule does not work")
    else:
        return render_template('result.html', result=response)

app.run(host='0.0.0.0', port=8080)
