import pandas as pd
from openpyxl import load_workbook
def Add_Count():

    df = pd.read_excel('SoftwareEngineeringMasterDataBase.xlsx', sheet_name='Merged_With_Count_Cleaned_Data')
    count_total = []
    column_leng = df.columns
    column_leng = len(column_leng)
    print(column_leng)
    for i in df.index:
        count_sum = int(df['Count Link'][i]) + int(df['Count Description'][i]) + int(df['Count Title'][i])
        count_total.append(count_sum)
    print(count_total)


    path = r'SoftwareEngineeringMasterDataBase.xlsx'
    book = load_workbook(path)
    writer = pd.ExcelWriter(path, engine='openpyxl')
    writer.book = book

    df.insert(column_leng, "Count Total", count_total)
    df.to_excel(writer, sheet_name='Add_Sum_Col')
    writer.save()
    writer.close()



