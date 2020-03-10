import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
from pandas import *
from openpyxl import load_workbook
df = pd.read_excel('SoftwareEngineeringMasterDataBase.xlsx', sheet_name='Comp_List')
print(df.columns)
i = 0




keyword = df['Keyword'][i]
keywordarray = []
rank = df['Rank'][i]
rankarray = []
title = df['Title'][i]
titlearray = []
description = df['Description'][i]
descarray = []
link = df['Link'][i]
linkarray = []
count_Link = df['Count Link'][i]
count_Linkarray = []
count_Description = df['Count Description'][i]
count_Descriptionarray = []
count_Title = df['Count Title'][i]
count_Titlearray = []
count_Total = df['Count Total'][i]
count_Totalarray = []
domain_Only = df['Domain Only'][i]
domain_Onlyarray = []
ip_Address = df['Ip_Address'][i]
ip_Addressarray = []
key_Word_Key = df['Key_Word_Key'][i]
key_Word_Keyarray = []
for i in df.index:
    keywordarray.append(df['Keyword'][i])
    rankarray.append(df['Rank'][i])
    titlearray.append(df['Title'][i])
    descarray.append(df['Description'][i])
    linkarray.append(df['Link'][i])
    count_Linkarray.append(df['Count Link'][i])
    count_Descriptionarray.append(df['Count Description'][i])
    count_Titlearray.append(df['Count Title'][i])
    domain_Onlyarray.append(df['Domain Only'][i])
    ip_Addressarray.append(df['Ip_Address'][i])
    key_Word_Keyarray.append(df['Key_Word_Key'][i])


#import plotly.graph_objects as go
#fig = go.Figure(
#    data=[go.Bar(x=rankarray, y=domain_Onlyarray)],
#    layout=go.Layout(
#        title=go.layout.Title(text="A Bar Chart")
#    )
#)
#fig.show()

print(rankarray)
print(domain_Onlyarray)