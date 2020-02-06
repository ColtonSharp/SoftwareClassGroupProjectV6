import pandas as pd
from openpyxl import load_workbook

df1 = pd.read_excel('SoftwareEngineeringMasterDataBase.xlsx', sheet_name='merged')
df2 = pd.read_excel('SoftwareEngineeringMasterDataBase.xlsx', sheet_name='merged_link')
df3 = pd.read_excel('SoftwareEngineeringMasterDataBase.xlsx', sheet_name='merged_desc')
df4 = pd.read_excel('SoftwareEngineeringMasterDataBase.xlsx', sheet_name='merged_title')



# displying  dataframe - Output 1
print(df1.columns)
print(df2.columns)
column_leng = df1.columns
column_leng = len(column_leng)
print(column_leng)

#create Array to add to merged
column_link = []
for i in df2.index:
    column_add = df2['Count_Link'][i]
    column_link.append(column_add)
print(column_link)

#create Array to add to merged
column_desc = []
for i in df3.index:
    column_add1 = df3['Count1_Description'][i]
    column_desc.append(column_add1)
print(column_desc)

#create Array to add to merged
column_title = []
for i in df4.index:
    column_add2 = df4['Count2_Title'][i]
    column_title.append(column_add2)
print(column_desc)



# inserting column with static value in data frame
df1.insert(column_leng, "Count Link", column_link)




path = r'SoftwareEngineeringMasterDataBase.xlsx'
book = load_workbook(path)
writer = pd.ExcelWriter(path, engine='openpyxl')
writer.book = book
df1.to_excel(writer, sheet_name='Merged With Count')

df1.insert(column_leng+1, "Count Description", column_desc)
df1.to_excel(writer, sheet_name='Merged With Count')

df1.insert(column_leng+2, "Count Title", column_title)
df1.to_excel(writer, sheet_name='Merged With Count')

#df2.to_excel(writer, sheet_name='merged_desc')
#df3.to_excel(writer, sheet_name='merged_title')
writer.save()
writer.close()
