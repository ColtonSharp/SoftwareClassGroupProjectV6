import pandas as pd
from openpyxl import load_workbook




def Data_Clean_Up():
    #print(df.columns)
    df = pd.read_excel('SoftwareEngineeringMasterDataBase.xlsx', sheet_name='Merged_With_Count')
    column_leng = df.columns
    column_leng = len(column_leng)
    print(column_leng)
    rows_Delete = []
    count_total = []
    for i in df.index:
        row_number = i
        descr = df['Description'][i]
        descr = str(descr)
        print(descr)
        link = df['Link'][i]
        link = str(link)
        print(link)
        if descr == 'nan':
            print("dropped")
            rows_Delete.append(row_number)
        if link.startswith("http"):
            print("skip")
        else:
            print("dropped")
            rows_Delete.append(row_number)




    print(rows_Delete)





    path = r'SoftwareEngineeringMasterDataBase.xlsx'
    book = load_workbook(path)
    writer = pd.ExcelWriter(path, engine='openpyxl')
    writer.book = book
    df = df.drop(rows_Delete)
    df.to_excel(writer, sheet_name='Merged_With_Count_Cleaned_Data')
    writer.save()
    writer.close()








