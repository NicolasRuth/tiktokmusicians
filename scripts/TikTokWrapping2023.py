from TikTokApi import TikTokApi
import asyncio
import os

ms_token = os.environ.get("AuZTDGk1V177D9hzJsgZ43l_vkI57nnzN5P39njoTAbFmBrYXwaLzco6yKkVm__2Jh-rK-iBCBpbnr10MKN_kr9C3savghF_BJ8bxPAvv_Z2h2j1kmGEcnfzp-w839ejNqu2", None)

# please check out the documentation and get your individual ms_token https://github.com/davidteather/TikTok-Api

musicians2023 = ["bellapoarch", "kimberly.loaiza", "willsmith", "bts_official_bighit", "selenagomez", "jasonderulo",
                 "dixiedamelio", "spencerx", "lorengray", "billieeilish", "karolg", "itsjojosiwa", "bp_tiktok",
                 "roses_are_rosie", "shakira", "babyariel", "qpark", "keemokazi", "jdpantoja", "rubentuestaok",
                 "rosalia", "arianagrande", "lelepons", "huddy", "badbunny", "kirakosarin", "naimdarrechilemete",
                 "camilo"]

# list of top 100 TikTok users was investigated for accounts by musicians. The list above shows the handles of the
# 28 musicians. The list was taken from socialblade. https://socialblade.com/tiktok/top/100
# Charli D'amelio and Addison Rae released one single in 2022 and were not included. thatlittlepuff is ranked 76th
# and a cat. In 2023 28 musicians were found in the Top 100 on TikTok.

async def user_example():
    async with TikTokApi() as api:
        await api.create_sessions(ms_tokens=[ms_token], num_sessions=1, sleep_after=3)
        user = api.user("camilo") # insert user_ids of musicians in musicians2023
        user_data = await user.info()
        print(user_data)

if __name__ == "__main__":
    asyncio.run(user_example())

