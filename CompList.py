import pandas as pd
import numpy as np
from openpyxl import load_workbook
#masterfile = '/Users/Sharp_Col/Desktop/SoftwareFilePathsExample/MasterFile.xlsx'
#pivottablefile = '/Users/Sharp_Col/Desktop/SoftwareFilePathsExample/pivotfile.xlsx'
#domain = "verdurefitness.com"
def GetCompList(pivottablefile, masterfile, domain):
    domainlookup = domain
    df = pd.read_excel(pivottablefile, sheet_name='Domain_Count_AVG')

    domain_array = []
    keyword_array = []
    rank_array = []
    comp_keyword_array = []
    comp_rank_array = []
    for i in df.index:
        domain_array.append(df['Unnamed: 0'][i])
        keyword_array.append(df['Unnamed: 1'][i])
        rank_array.append(df['Unnamed: 6'][i])




    print(df.columns)
    #print(df['Unnamed: 0'][217])
    #print(domain_array)
    #print(keyword_array)
    #print(rank_array)


    x = len(domain_array)

    for i in range(x):
        if domain_array[i] != domainlookup:
            continue
        elif domain_array[i] == domainlookup:
            y = i
            comp_keyword_array.append(df['Unnamed: 1'][y])

            y = y+1
            #print("This is the starting Count for new loop",y)
            for y in range(y,x):
                #print(y)
                #print(domain_array[y])
                domain = str(domain_array[y])
                if domain == "nan":
                    #print(y)
                    comp_keyword_array.append(df['Unnamed: 1'][y])

                elif domain != "nan":
                    #print("done")
                    break

    print(comp_keyword_array)


    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################
    ###########################################


    df1 = pd.read_excel(masterfile, sheet_name='Master_Database_Calc')
    print(df1.columns)
    x = 0
    keep_array = []
    #change this to found array chs note only
    lookup_keyword = comp_keyword_array

    print(lookup_keyword)
    l = len(lookup_keyword)
    print(l)
    index_array = []
    while x != l:
        for i in df1.index:
            if df1['Keyword'][i] != lookup_keyword[x]:
                print("Keep this")
            elif df1['Keyword'][i] == lookup_keyword[x]:
                keep_array.append(i)
        x = x + 1

    print(keep_array)

    for i in df1.index:
        index_array.append(i)
    #print(index_array)



    # using list comprehension to perform task
    res = [i for i in index_array if i not in keep_array]







    path = masterfile
    book = load_workbook(path)
    writer = pd.ExcelWriter(path, engine='openpyxl')
    writer.book = book
    df1 = df1.drop(res)
    df1.to_excel(writer, sheet_name='Comp_List')
    writer.save()
    writer.close()

