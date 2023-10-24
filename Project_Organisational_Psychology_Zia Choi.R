# "Exploring the Moderating Effect of Psychological Capital (Hope, Optimism, 
# Self-Efficacy, Resilience) on Occupational Stress as a Predictor of Burnout"

df<-read.csv("sample_survey_data.csv")
View(df)
class(df)
df<-as.data.frame(df)
str(df)

# Checking the size of data 
length(df) #49
nrow(df) #900

# Checking data distribution
summary(df)

#-------------------------DATA PREPROCESSING----------------------------------

# Converting characters to factors 
df$Gender<-factor(df$Gender, levels = c("Man", "Woman", "Non-binary"))
df$Ethnicity<-factor(df$Ethnicity, levels = c("Asian", "Black","Hispanic/Latino", "White", "Mixed/Other"))
df$EmploymentLevel<-factor(df$EmploymentLevel, levels = c("Entry-Level", "Mid-Level", "Supervisor", "Service Director"))

# Checking for missing values: sum() to check NAs 
sum(is.na(df))

# ---------------------------Convert likert scale to numbers-------------------

likert_responses_1 <- c("Strongly disagree", "Somewhat disagree", "Neither agree 
                        nor disagree", "Somewhat agree", "Strongly agree")
numeric_values_1 <- c(1, 2, 3, 4, 5)

df <- df %>%
  mutate_at(vars(8:35),
            ~recode(., !!!setNames(numeric_values_1, likert_responses_1)))

likert_responses_2 <- c("Never", "Rarely", "Sometimes", "Often", "Very often")
numeric_values_2 <- c(1, 2, 3, 4, 5)

df <- df %>%
  mutate_at(vars(36:49),
            ~recode(., !!!setNames(numeric_values_2, likert_responses_2)))
str(df)

# Create a vector of column names to reverse score
reverse_cols <- c("Optimism_2", "Optimism_5", "Optimism_7", "Hope_6", "Hope_7", "Resilience_2", "Resilience_6", "OccupationalStress_1", "OccupationalStress_4")

# Perform the reverse scoring (6 - value)
df[, reverse_cols] <- 6 - df[, reverse_cols]

# Check the structure of the dataframe
str(df)

#--------------------------Clustering-------------------------------------

# selfefficacy
df$selfefficacy<-rowMeans(df[8:13], na.rm =TRUE) 
df$selfefficacy
summary (df$selfefficacy)       

# optimism
df$optimism<-rowMeans(df[14:21], na.rm =TRUE)
df$optimism
summary (df$optimism)            

# hope
df$hope<-rowMeans(df[22:29],na.rm=TRUE)
df$hope
summary (df$hope)

# resilience
df$resilience<-rowMeans(df[30:35], na.rm=TRUE)
df$resilience
summary(df$resilience)

# stress
df$stress<-rowMeans(df[36:39],na.rm=TRUE)
df$stress
summary(df$stress)

# burnout
df$burnout<-rowMeans(df[40:49],na.rm=TRUE)
df$burnout
summary(df$burnout)

# psycap
df$psycap<-rowMeans(df[8:35], na.rm = TRUE)
df$psycap
summary(df$psycap)

library(semTools)

#--------------------Correlation----------------------
cor_matrix <- cor(df[c("selfefficacy", "optimism", "hope", "resilience", "stress", "burnout")])
print(cor_matrix)

# -------------------Moderated Regression--------------------------------
# Download PROCESS macro at https://haskayne.ucalgary.ca/CCRAM/resource-hub
process(data = df, y = "burnout", x = "stress", w = "psycap", 
        model = 1, center = 2, moments = 1, jn = 1, 
        modelbt = 1, boot = 10000, seed = 654321) 

process(data = df, y = "burnout", x = "stress", w = "selfefficacy", 
        model = 1, center = 2, moments = 1, jn = 1, 
        modelbt = 1, boot = 10000, seed = 654321)

process(data = df, y = "burnout", x = "stress", w = "optimism", 
        model = 1, center = 2, moments = 1, jn = 1, 
        modelbt = 1, boot = 10000, seed = 654321)

process(data = df, y = "burnout", x = "stress", w = "hope", 
        model = 1, center = 2, moments = 1, jn = 1, 
        modelbt = 1, boot = 10000, seed = 654321)

process(data = df, y = "burnout", x = "stress", w = "resilience", 
        model = 1, center = 2, moments = 1, jn = 1, 
        modelbt = 1, boot = 10000, seed = 654321)
