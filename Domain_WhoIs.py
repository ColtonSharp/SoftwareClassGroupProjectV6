import pandas as pd
from openpyxl import load_workbook
import socket
def Ip_Add(masterfile):
    df = pd.read_excel(masterfile, sheet_name='Add_Domain_Col')

    ip_listing = []
    for i in df.index:
        domain_name = df['Domain Only'][i]
        domain_name = domain_name.upper()
        print(socket.gethostbyname(domain_name))
        ip_listing.append(socket.gethostbyname(domain_name))

    print(ip_listing)

    df2 = df.assign(Ip_Address=ip_listing)

    path = masterfile
    book = load_workbook(path)
    writer = pd.ExcelWriter(path, engine='openpyxl')
    writer.book = book
    df2.to_excel(writer, sheet_name='Master_Database')
    writer.save()
    writer.close()

