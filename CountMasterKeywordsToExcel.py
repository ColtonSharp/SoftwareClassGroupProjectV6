import pandas as pd
from openpyxl import load_workbook
def GetCountOfKeyword():
    df = pd.read_excel('SoftwareEngineeringMasterDataBase.xlsx', sheet_name='merged')
    arraycount = []
    arraycount1 = []
    arraycount2 = []
    for i in df.index:
        string = str(df['Link'][i])
        string = string.upper()
        string1 = str(df['Description'][i])
        string1 = string1.upper()
        string2 = str(df['Title'][i])
        string2 = string2.upper()
        #print(string)
        #print(string1)
        #print(string2)
        keyword = df['Keyword'][i]
        keyword = keyword.upper()
        keywordsplit = keyword.split()
        #print(keyword)
        count = 0
        count1 = 0
        count2 = 0
        for x in keywordsplit:
            count += string.count(x)
            count1 += string1.count(x)
            count2 += string2.count(x)
        #print(count)
        #print(count1)
        #print(count2)
        arraycount.append(count)
        arraycount1.append(count1)
        arraycount2.append(count2)
        # dataframe Name and Age columns


    #print(arraycount)
    #print(arraycount1)
    #print(arraycount2)
    #print(df.columns)
    df4 = df.assign(Count_Link = arraycount)
    df2 = df.assign(Count1_Description = arraycount1)
    df3 = df.assign(Count2_Title = arraycount2)


    path = r'SoftwareEngineeringMasterDataBase.xlsx'
    book = load_workbook(path)
    writer = pd.ExcelWriter(path, engine='openpyxl')
    writer.book = book
    df4.to_excel(writer, sheet_name='merged_link')
    df2.to_excel(writer, sheet_name='merged_desc')
    df3.to_excel(writer, sheet_name='merged_title')
    writer.save()
    writer.close()


