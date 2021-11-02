from TikTokApi import TikTokApi
import pandas

api = TikTokApi.get_instance()  # link to documentation https://davidteather.github.io/TikTok-Api/docs/tiktok.html

musicians = ["willsmith", "lorengray", "jasonderulo", "bts_official_bighit", "lilhuddy", "selenagomez", "billieeilish",
             "arianagrande", "justinbieber", "karolsevillaokay", "mackenzieziegler", "marshmellomusic",
             "blackpinkofficial", "lelepons", "camilo", "larrayeeee", "jacobsartorius", "itsjojosiwa", "babyariel",
             "kimberly.loaiza"]

# list of top 100 TikTok users was investigated for accounts by musicians. The list above shows the handles of the
# 20 musicians.

tiktok_data = [api.get_user(username=musician, custom_verifyFp="insert_your_custom_verifyFb_here")
               for musician in musicians]


# please check out the documentation and get your individual verify token and insert it after custom_verifyFp=
# The list comprehension above gathers all available data of the 20 users

data = pandas.DataFrame(tiktok_data)  # save data as data frame

data.to_csv('tiktokdata.csv')  # save it as csv file


