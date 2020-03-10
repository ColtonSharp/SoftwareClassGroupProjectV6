import pandas as pd
# YOU MUST IMPORT PANDAS AND HAVE PANDAS INSTALLED CORRECTLY BEFORE THIS FUNCTION WILL WORK
def MergeAllDataSheets(blankfile,masterfile):
    input_file = blankfile  #WHAT SHEET HAS ALL THE DIFFERENT TABS IN IT
    output_file = masterfile #WHAT SHEET DO YOU WANT IT TO MAKE WHEN MERGED
    df = pd.read_excel(input_file, None) #READ ALL SHEETS THATS WHY YOU PUT 'NONE'
    all_df = []
    for key in df.keys():
        all_df.append(df[key])
    data_concatenated = pd.concat(all_df,axis=0,ignore_index=True)
    #WRITE TO EXCEL FILE NEW
    writer = pd.ExcelWriter(output_file)
    data_concatenated.to_excel(writer,sheet_name='merged',index=False)
    #CLOSE FILE AND SAVE
    writer.save()


