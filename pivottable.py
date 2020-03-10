import pandas as pd
import numpy as np
from openpyxl import load_workbook
def GetPivotTable(masterfile,pivottablefile):
    df = pd.read_excel(masterfile, sheet_name='Master_Database')

    print(df.columns)


    #pd.pivot_table(df,index=["Name"])



    df1 = pd.pivot_table(df,index=["Keyword","Domain Only"],values=["Rank"],aggfunc=[np.mean,len])
    df2 = pd.pivot_table(df,index=["Keyword","Domain Only"],values=['Count Link','Count Description', 'Count Title', 'Count Total','Rank'],aggfunc=[np.mean])
    df3 = pd.pivot_table(df,index=["Domain Only","Keyword"],values=['Count Link','Count Description', 'Count Title', 'Count Total','Rank'],aggfunc=[np.mean])



    print(df1.head())
    print(df2.head())




    path = pivottablefile
    book = load_workbook(path)
    writer = pd.ExcelWriter(path, engine='openpyxl')
    writer.book = book
    df1.to_excel(writer, sheet_name='Keyword_By_Domain')
    df2.to_excel(writer, sheet_name='Keyword_Count_AVG')
    df3.to_excel(writer, sheet_name='Domain_Count_AVG')

    writer.save()
    writer.close()