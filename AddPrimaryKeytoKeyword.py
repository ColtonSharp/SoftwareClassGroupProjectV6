import pandas as pd
from openpyxl import load_workbook
def AddKeys(masterfile,keywordfile):
    df = pd.read_excel(keywordfile, sheet_name='sheet1')
    df1 = pd.read_excel(masterfile, sheet_name='Master_Database')
    keyword_cat_array = []

    print(df.head())
    print(df.columns)
    print(df1.columns)
    x = len(df1.index)
    k = 0
    for i in df1.index:

        keyword_cat = df['Keyword'][k]
        primary_key = df['Primary Key'][k]

        keyword_list = df1['Keyword'][i]

        print(keyword_cat)
        print(keyword_list)
        print(primary_key)
        if df['Keyword'][k] == df1['Keyword'][i]:
            keyword_key = df['Primary Key'][k]
            keyword_key = str(keyword_key)
            keyword_cat_array.append(keyword_key)
            print("matched")
            print(keyword_key)
        elif df['Keyword'][k] != df1['Keyword'][i]:
            print("does not match")
            k = k+1
            i = i-1
            keyword_key = df['Primary Key'][k]
            keyword_key = str(keyword_key)
            keyword_cat_array.append(keyword_key)
            print("matched2")



    print(keyword_cat_array)
    print(len(keyword_cat_array))
    print(len(df1.index))
    df2 = df1.assign(Key_Word_Key = keyword_cat_array)


    path = masterfile
    book = load_workbook(path)
    writer = pd.ExcelWriter(path, engine='openpyxl')
    writer.book = book

    df2.to_excel(writer, sheet_name='Master_Database_Calc')

    writer.save()
    writer.close()