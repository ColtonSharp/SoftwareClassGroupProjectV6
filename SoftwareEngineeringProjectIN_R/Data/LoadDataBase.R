
# # or just readxl
#install.packages("readxl")
#install.packages("plotly")
#install.packages("ggplot2")
############################################LOAD ALL PACKAGES###############################################
############################################LOAD ALL PACKAGES###############################################
############################################LOAD ALL PACKAGES###############################################
library("readxl")
############################################LOAD ALL DATA FILES###############################################
############################################LOAD ALL DATA FILES###############################################
############################################LOAD ALL DATA FILES###############################################
my_data <- read_excel("/Users/Sharp_Col/Desktop/SoftwareEngineeringMasterDataBase.xlsx", sheet = "Comp_List")
head(my_data)

KeywordList <- as.array(my_data$Keyword)
RankList <- as.array(my_data$Rank)
TitleList <- as.array(my_data$Title)
DescriptionList <- as.array(my_data$Description)
LinkList <- as.array(my_data$Link)
CntTotalList <- as.array(my_data$`Count Total`)
CntLinkList <- as.array(my_data$`Count Link`)
CntDescrList <- as.array(my_data$`Count Description`)
CntTitleList <- as.array(my_data$`Count Title`)
DomainList <- as.array(my_data$`Domain Only`)
IpList <- as.array(my_data$Ip_Address)
KeywordCatList <- as.array(my_data$Key_Word_Key)