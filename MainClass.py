import GoogleScraper as gs
import CombineSheets as cs
import pandas as pd
#IMPORT ALL FILES INTO THIS ONE SO THE COMPUTER CAN READ THE FILES QUICKLY
#WHERE ARE ALL THE KEYWORDS STORED, ENTER SHEET NAME
#MUST BE IN THE FIRST COLUMN WITH A HEADER
df = pd.read_excel('fitness-keywords-wordstream.xlsx', sheet_name='sheet1')
#THIS LOOP WILL RUN A2 IN THE EXCEL FILE THEN THE NEXT ROW AND SO ON UNTIL INDEX 'I' IS NULL
for i in df.index:
    #df['Keyword'][i] IS THE DATAFRAME AND COLUMN NAME
    #COLUMN NAME MUST MATCH EXACTLY
    #SINGLE QUOTES IN COLUMN HEADER NAME ONLY
    gs.GoogleSearch(df['Keyword'][i])
#MERGES ALL SHEETS FROM GoogleScrapingSEOKEYFINDER.xlsx FOUND IN ROOT DIRECTORY WHICH CAN BE CHANGED IN COMBINE SHEET BUT YOU MUST
#SHANGE IT IN GOOGLESCRAPER ALSO !!!!!!!!!!!!!IMPORTANT!!!!!!!!!
cs.MergeAllDataSheets()
#EXCEL BOOK CLOSED YOU SHOULD NOW HAVE AN EXCEL SHEET THAT CONTAINS ALL SHEETS IN ONE SHEET
#INDEXING MUST BE CHANGED AND ORGINZED THE WAY YOU SEE FIT
#TRY FINDING THE NUMBER OF WORDS THAT MATCHED KEYWORDS SEARCHED TO DESCRIPTION WOULD BE A GOOD PLACE TO START
#COMPARE KEYWORD PHRASING TO TITLE, DESC, AND URL SEPERATLY




