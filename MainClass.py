import GoogleScraper as gs
import CombineSheets as cs
import CountMasterKeywordsToExcel as cm
import AddCountToSheet as acts
import ExcelCleanUp as ecu
import SumCountTotalToExcel as sctte
import GetDomainOnly as gdo
import Domain_WhoIs as dom
import pandas as pd
#IMPORT ALL FILES INTO THIS ONE SO THE COMPUTER CAN READ THE FILES QUICKLY
#WHERE ARE ALL THE KEYWORDS STORED, ENTER SHEET NAME
#MUST BE IN THE FIRST COLUMN WITH A HEADER
#!!!!!!!!!!!GOOGLE CAN REVOKE YOUR INTERNET SEARCH IF RUNNING THIS TO OFTEN!!!!!!!!!
df = pd.read_excel('fitness-keywords-wordstream.xlsx', sheet_name='sheet1')
#df = pd.read_excel('EXCEL_WORKBOOK_NAME.xlsx', sheet_name='SHEET_NAME')
#THIS LOOP WILL RUN A2 IN THE EXCEL FILE THEN THE NEXT ROW AND SO ON UNTIL INDEX 'I' IS NULL
for i in df.index:
    #df['Keyword'][i] IS THE DATAFRAME AND COLUMN NAME
    #COLUMN NAME MUST MATCH EXACTLY
    #SINGLE QUOTES IN COLUMN HEADER NAME ONLY
    gs.GoogleSearch(df['Keyword'][i])
cs.MergeAllDataSheets()
cm.GetCountOfKeyword()
acts.add_count_of()
ecu.Data_Clean_Up()
sctte.Add_Count()
gdo.DomainAdd()
dom.Ip_Add()

