import pandas as pd
from openpyxl import load_workbook
import socket

df = pd.read_excel('KeywordSearchDataV3.xlsx', sheet_name='MASTER_SHEET')

ip_listing = []
for i in df.index:
    domain_name = df['Domain Only'][i]
    domain_name = domain_name.upper()
    print(socket.gethostbyname(domain_name))
    ip_listing.append(socket.gethostbyname(domain_name))

print(ip_listing)

df2 = df.assign(Ip_Address=ip_listing)

path = r'KeywordSearchDataV3.xlsx'
book = load_workbook(path)
writer = pd.ExcelWriter(path, engine='openpyxl')
writer.book = book
df2.to_excel(writer, sheet_name='PYTHON_IP_Address')
writer.save()
writer.close()

