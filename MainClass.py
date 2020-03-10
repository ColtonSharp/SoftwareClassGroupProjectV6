import GoogleScraper as gs
import CombineSheets as cs
import CountMasterKeywordsToExcel as cm
import AddCountToSheet as acts
import ExcelCleanUp as ecu
import SumCountTotalToExcel as sctte
import GetDomainOnly as gdo
import Domain_WhoIs as dom
import AddPrimaryKeytoKeyword as primekey
import pivottable as PT
import CompList as cl
import pandas as pd

def GetGoogle(keywordfile,blankfile,masterfile,pivottablefile,domainlookup):
    df = pd.read_excel(keywordfile, sheet_name='sheet1')
    for i in df.index:
        gs.GoogleSearch(df['Keyword'][i],blankfile)
    cs.MergeAllDataSheets(blankfile,masterfile)
    cm.GetCountOfKeyword(masterfile)
    acts.add_count_of(masterfile)
    ecu.Data_Clean_Up(masterfile)
    sctte.Add_Count(masterfile)
    gdo.DomainAdd(masterfile)
    dom.Ip_Add(masterfile)
    primekey.AddKeys(masterfile,keywordfile)
    PT.GetPivotTable(masterfile,pivottablefile)
    cl.GetCompList(pivottablefile,masterfile,domainlookup)