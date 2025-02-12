library(tidyverse)
library(haven)

demo <- read_xpt(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/DEMO_J.xpt")
dietary <- read_xpt(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/DR1TOT_J.XPT")
sup <- read_xpt(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/DSQTOT_J.XPT")
exam <- read_xpt(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/BMX_J.XPT")
lab <- read_xpt(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/TCHOL_J.XPT")
medical <- read_xpt(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/MCQ_J.XPT")
PA <- read_xpt(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/PAQ_J.XPT")
DM <- read_xpt(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/DIQ_J.XPT")
preg <- read_xpt(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/RHQ_J.XPT")
cig <- read_xpt(
  "https://wwwn.cdc.gov/Nchs/Data/Nhanes/Public/2017/DataFiles/SMQ_J.XPT")

demo_v <- demo %>%
  select(SEQN, RIDAGEYR, RIAGENDR, RIDRETH3, DMDEDUC2, INDFMIN2, SDMVPSU, 
         SDMVSTRA, WTMEC2YR) %>%
  mutate(SEQN = factor(SEQN))
summary(demo_v)

dietary_v <- dietary %>%
  select(SEQN, WTDRD1, DR1TCAFF, DR1TFIBE, DR1TTFAT, DR1TCHOL, DR1TVC, 
         DR1_320Z, DR1TALCO) %>% 
  mutate(SEQN = factor(SEQN)) 
summary(dietary_v)

sup_v <- sup %>%
  select(SEQN, DSQTCAFF, DSQTFIBE, DSQTVC) %>% 
  mutate(SEQN = factor(SEQN))
summary(sup_v)

exam_v <- exam %>%
  select(SEQN, BMXWT, BMXBMI, BMXWAIST)%>%
  mutate(SEQN = factor(SEQN))
summary(exam_v)

lab_v <- lab %>%
  select(SEQN, LBXTC)%>%
  mutate(SEQN = factor(SEQN))
summary(lab_v)

medical_v <- medical %>%
  select(SEQN, MCQ550, MCQ560)%>%
  mutate(SEQN = factor(SEQN))
summary(medical_v)

PA_v <- PA %>%
  select(SEQN, PAQ605, PAD615, PAQ620, PAD630, PAQ650, PAD660, PAQ665, PAD675) %>%
  mutate(SEQN = factor(SEQN)) #too many missing data
summary(PA_v)

DM_v <- DM %>%
  select(SEQN, DIQ010)%>%
  mutate(SEQN = factor(SEQN))
summary(DM_v)

preg_v <- preg %>%
  select(SEQN, RHD143)%>%
  mutate(SEQN = factor(SEQN))
summary(preg_v)

cig_v <- cig %>%
  select(SEQN, SMQ020, SMQ040)%>%
  mutate(SEQN = factor(SEQN))
summary(cig_v)

nhanes <- list(dietary_v, demo_v, medical_v, DM_v, PA_v, cig_v, exam_v, 
                  lab_v, preg_v) %>% 
  reduce(left_join, by= "SEQN") 

summary(nhanes)
write_csv(nhanes, "nhanes_processed.csv")