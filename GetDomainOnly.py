import pandas as pd
from openpyxl import load_workbook

def DomainAdd(masterfile):
    df = pd.read_excel(masterfile, sheet_name='Add_Sum_Col')
    DomainArray = []
    column_leng = df.columns
    column_leng = len(column_leng)
    for i in df.index:
        link = df['Link'][i]
        link = str(link)
        #print(link)




        def find_nth(haystack, needle, n):
            start = haystack.find(needle)
            while start >= 0 and n > 1:
                start = haystack.find(needle, start+len(needle))
                n -= 1
            return start




        preurlcount = find_nth(link,'/',2)
        preurlcount = int(preurlcount+1)
        #print(preurlcount)
        baseurlcount = find_nth(link,'/',3)
        baseurlcount = int(baseurlcount)
        #print(baseurlcount)
        domain_only = link[preurlcount:baseurlcount]
        #print(domain_only)

        DomainArray.append(domain_only)
    print(DomainArray)



    path = masterfile
    book = load_workbook(path)
    writer = pd.ExcelWriter(path, engine='openpyxl')
    writer.book = book

    df.insert(column_leng, "Domain Only", DomainArray)
    df.to_excel(writer, sheet_name='Add_Domain_Col')
    writer.save()
    writer.close()



