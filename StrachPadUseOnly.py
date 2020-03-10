
print("File must contain 'Keyword' header in column 'A' ")
print("File must contain 'Primary Key' header in column 'B' ")
print("Sheet name for key word file is 'sheet1'")
print("File must be called 'keywordFile.xlsx'")
print("Make sure all spelling and capitalization is exact")
keywordfile = input("Insert File Path of Keyword File 'keywordFile.xlsx' :")
blankfile = input("Insert File Path to blank excel sheet: ")
masterfile = input("Insert File Path to Master DataBase File:")



blankfile = 'r' + blankfile

print(blankfile)



####/Users/Sharp_Col/Desktop/SoftwareFilePathsExample/keywordFile.xlsx
####/Users/Sharp_Col/Desktop/SoftwareFilePathsExample/workingfile.xlsx
####/Users/Sharp_Col/Desktop/SoftwareFilePathsExample/MasterFile.xlsx
####/Users/Sharp_Col/Desktop/SoftwareFilePathsExample/pivotfile.xlsx