# Loading required packages first
# If not yet installed, please install first using install.packages("tidyverse")
library(tidyverse)
library(lubridate)

### Load and prepare data

tiktokdata <- read.csv("data/tiktokdata.csv", sep = ";")

# change createTime to an actual date

tiktokdata$uploaddate <-  NULL
tiktokdata$uploaddate <- as_datetime(tiktokdata$createTime)

#First descriptive analyses

mean(tiktokdata$heart) # average Likes per account

mean(tiktokdata$LikesPerVideo) # average Likes per video

mean(tiktokdata$followerCount)

min(tiktokdata$videoCount) # Billie Eilish

max(tiktokdata$videoCount) # LilHuddy

mean(tiktokdata$videoCount)

table(tiktokdata$language) # all english

table(tiktokdata$stitchSetting)
# Jojo Siwa is the only one who enabled stitching


## Plotting bar plots of distributions

following <- ggplot(tiktokdata, aes(x = reorder(Name, -followingCount), followingCount))
following +
  geom_segment(aes(x = reorder(Name, -followingCount), xend = Name, y = 0, yend = followingCount)) +
  geom_point(size = 4) +
  geom_label(aes(Name, followingCount, label = signif(followingCount)),
             colour = "darkred", nudge_x = 0.35, size = 3) +
  ggtitle("Artists' following other channels") +
  xlab("Artists on TikTok") +
  ylab("Number of followings") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        plot.title = element_text(hjust = 0.5, size = 20))

Diggs <- ggplot(tiktokdata, aes(x = reorder(Name, -diggCount), diggCount))
Diggs +
  geom_col(fill = "darkred") +
  ggtitle("Artists' diggs of other videos") +
  xlab("Artists on TikTok") +
  ylab("Total number of diggs") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        plot.title = element_text(hjust = 0.5, size = 20))

tiktokdata$LikesPerVideok <- tiktokdata$LikesPerVideo /1000000

Likes <- ggplot(tiktokdata, aes(x = reorder(Name, -LikesPerVideok), LikesPerVideok, fill = Name))
Likes +
  geom_col() +
  ggtitle("Artists' average Likes per video ") +
  xlab("Artists on TikTok") +
  ylab("Likes per video (in million)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        plot.title = element_text(hjust = 0.5, size = 20),
        legend.position = "none")
