import time

import redis
from flask import Flask
from flask import render_template

app = Flask(__name__)
cache = redis.Redis(host='redis', port=6379)

def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)

@app.route('/')
def hello():
    #return "AHHHHHHHH!!!! HELP!!"
    count = get_hit_count()
    html = f"""
            <html>
            <head>
            <title>A Test Container!</title>
             
            </style>
            </head>
            <body>A Test Container!
            <br />{count} hits</body>
            </html>
            """
    return html
    #return 'Hello Docker World! I have been seen {} times.\n'.format(count)

@app.route('/htmltest')
def htmltest():
    hitcount = get_hit_count()
    return render_template("hello.html", count=hitcount)
