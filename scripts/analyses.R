# Loading required packages first
# If not yet installed, please install first using install.packages("tidyverse")
library(tidyverse)
library(lubridate)
library(ggpubr)

### Load and prepare data

tiktokdata <- read.csv("data/tiktokdata.csv", sep = ";")

# change createTime to an actual date

tiktokdata$uploaddate <-  NULL
tiktokdata$uploaddate <- as_datetime(tiktokdata$createTime)

# subset data sets for 2021 and 2021

tt_data_2021 <- subset(tiktokdata, year == 2021)
tt_data_2023 <- subset(tiktokdata, year == 2023)

#First descriptive analyses

mean(tt_data_2021$heart) # average Likes per account 2021
mean(tt_data_2023$heart) # 2021

mean(tt_data_2021$LikesPerVideo) # average Likes per video
mean(tt_data_2023$LikesPerVideo)

mean(tt_data_2021$followerCount) # average number of followers
mean(tt_data_2023$followerCount)

mean(tt_data_2021$videoCount) # average number of videos per account
mean(tt_data_2023$videoCount)

min(tiktokdata$videoCount) # Billie Eilish
max(tiktokdata$videoCount) # Huddy in 2021

table(tt_data_2021$Name, tt_data_2021$diggCount) # how many likes were given by
                                                 # account to others
table(tt_data_2023$Name, tt_data_2023$diggCount)

## Plotting bar plots of distributions

following2021 <- ggplot(tt_data_2021,
                        aes(x = reorder(Name, -followingCount),
                            followingCount))
following2021 <- following2021 +
  geom_segment(aes(x = reorder(Name, -followingCount),
                   xend = Name,
                   y = 0,
                   yend = followingCount)) +
  geom_point(size = 1) +
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

following2023 <- ggplot(tt_data_2023,
                        aes(x = reorder(Name, -followingCount),
                            followingCount))
following2023 <- following2023 +
  geom_segment(aes(x = reorder(Name, -followingCount),
                   xend = Name,
                   y = 0,
                   yend = followingCount)) +
  geom_point(size = 1) +
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

combinedFollowing <- ggarrange(following2021, following2023,
                           labels = c("2021", "2023"),
                           ncol = 2, nrow = 1)

combinedFollowing

tiktokdata$LikesPerVideok <- tiktokdata$LikesPerVideo /1000000

Likes2021 <- ggplot(tiktokdata[tiktokdata$year == 2021,],
                    aes(x = reorder(Name, -LikesPerVideok),
                        LikesPerVideok, fill = Name))
Likes2021 <- Likes2021 +
  geom_col() +
  ggtitle("Average likes per video") +
  xlab("Top artists on TikTok") +
  ylab("Likes per video (in million)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        plot.title = element_text(hjust = 0.5, size = 20),
        legend.position = "none")

Likes2023 <- ggplot(tiktokdata[tiktokdata$year == 2023,],
                    aes(x = reorder(Name, -LikesPerVideok),
                        LikesPerVideok, fill = Name))
Likes2023 <- Likes2023 +
  geom_col() +
  ggtitle("Average likes per video") +
  xlab("Top artists on TikTok") +
  ylab("Likes per video (in million)") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, size = 12),
        axis.text.y = element_text(size = 12),
        axis.title.x = element_text(size = 16),
        axis.title.y = element_text(size = 16),
        plot.title = element_text(hjust = 0.5, size = 20),
        legend.position = "none")

combinedLikes <- ggarrange(Likes2021, Likes2023,
                           labels = c("2021", "2023"),
                           ncol = 2, nrow = 1)

combinedLikes
