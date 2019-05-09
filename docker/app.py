from flask import Flask, render_template
import random

app = Flask(__name__)

# Resolution 1600x900
images = [
   "https://cdn-images-1.medium.com/max/1600/1*EwIH3EtSSzJ_ULQG-wDWNA.png",
   "https://cdn.allwallpaper.in/wallpapers/1600x900/3899/chronicles-of-narnia-movies-sea-ships-1600x900-wallpaper.jpg",
   "http://coolvibe.com/wp-content/uploads/2010/07/star-wars-wallpapers1.jpg",
   "https://4.bp.blogspot.com/-2cArSWaCMLQ/XCDv-oOA9YI/AAAAAAAAAfw/ADfspwYMCEc5bAD5RdFpy1svgzznSynMQCLcBGAs/s1600/avengers-infinity-war-poster-2018.jpg",
   "https://images3.alphacoders.com/239/thumb-1920-239705.jpg"
]

@app.route('/')
def index():
    url = random.choice(images)
    return render_template('index.html', url=url)

if __name__ == "__main__":
    app.run(host="0.0.0.0")
