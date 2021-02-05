from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.desired_capabilities import DesiredCapabilities

opt = Options()
opt.add_argument('--headless')
opt.add_argument('--use-fake-ui-for-media-stream')
opt.add_argument('--disable-web-security')
opt.add_argument("--remote-debugging-port=9222")
#Pass the argument 1 to allow and 2 to block
opt.add_experimental_option("prefs", { \
    "profile.default_content_setting_values.media_stream_mic": 2, 
    "profile.default_content_setting_values.media_stream_camera": 1,
    "profile.default_content_setting_values.geolocation": 2, 
    "profile.default_content_setting_values.notifications": 2 
  })

driver = webdriver.Chrome(executable_path='/usr/bin/chromedriver', options=opt)

driver.get('https://<my-opentreat-project>.herokuapp.com/broadcast.html')