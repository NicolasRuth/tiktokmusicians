

# link to documentation https://github.com/davidteather/TikTok-Api

musicians = ["willsmith", "lorengray", "jasonderulo", "bts_official_bighit", "lilhuddy", "selenagomez", "billieeilish",
             "arianagrande", "justinbieber", "karolsevillaokay", "mackenzieziegler", "marshmellomusic",
             "bp_tiktok", "lelepons", "camilo", "larrayeeee", "jacobsartorius", "itsjojosiwa", "babyariel",
             "kimberly.loaiza"]

with TikTokApi() as api:
    tiktok_data = [api.user(username=musician)
        for musician in musicians]

# list of top 100 TikTok users was investigated for accounts by musicians. The list above shows the handles of the
# 20 musicians. The list was taken from socialblade. https://socialblade.com/tiktok/top/100

tiktok_data = [api.get_user(username=musician)
               for musician in musicians]

# please check out the documentation and get your individual verify token and insert it after custom_verifyFp=
# The list comprehension above gathers all available data of the 20 users

data = pd.DataFrame(tiktok_data)  # save data as data frame

data.to_csv('tiktokdata.csv')  # save it as csv file

## new data 2023

musicians2023 = ["bellapoarch", "kimberly.loaiza", "willsmith", "bts_official_bighit", "selenagomez", "jasonderulo",
                 "dixiedamelio", "spencerx", "lorengray", "billieeilish", "karolg", "itsjojosiwa", "bp_tiktok",
                 "roses_are_rosie", "shakira", "babyariel", "qpark", "keemokazi", "jdpantonja", "rubentuestaok",
                 "rosalia", "arianagrande", "lelepons", "huddy", "badbunny", "kirakosarin", "naimdarrechilemete",
                 "camilo"]

# Charli D'amelio and Addison Rae released one single in 2022 and were not included. thatlittlepuff is ranked 76th
# and a cat. In 2023 28 musicians were found in the Top 100 on TikTok.
