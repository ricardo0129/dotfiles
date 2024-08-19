import requests
from datetime import datetime

def hour():
    current_time = datetime.now()
    military_time = current_time.strftime("%H")
    return int(military_time)

url = "https://wttr.in/Richmond?format=j1"
res = requests.get(url)
dat = res.json()
t = hour() // 300

feels_like = dat['weather'][1]['hourly'][t]['FeelsLikeF']
out = f'󱣗 {feels_like}°F'
print(out)
