import requests
from bs4 import BeautifulSoup
import pandas as pd
from openpyxl import load_workbook
from datetime import datetime
#YOU MUST HAVE REQUESTS,BS4,PANDAS,OPENPYXL,AND DATETIME TO CONTINUE DO NOT RUN WITHOUT INSTALLATION
# DEF GOOGLESEARCH(USERINPUT) IS THE MAIN CLASS THAT SCRAPES GOOGLE FOR THE SEARCH RESULTS
def GoogleSearch(userinput,blankfile):
    UserInputKeyword = userinput
    USER_AGENT = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/61.0.3163.100 Safari/537.36'}

    def fetch_results(search_term, number_results, language_code):
        assert isinstance(search_term, str), 'Search term must be a string'
        assert isinstance(number_results, int), 'Number of results must be an integer'
        escaped_search_term = search_term.replace(' ', '+')

        google_url = 'https://www.google.com/search?q={}&num={}&hl={}'.format(escaped_search_term, number_results,
                                                                              language_code)
        response = requests.get(google_url, headers=USER_AGENT)
        response.raise_for_status()

        return search_term, response.text
    #FETCH_RESULTS(KEYWORD YOU WANT TO SEARCH, NUMBER OF RESULTS,WHAT LANG DO YOU WANT IT IN
    keyword, html = fetch_results(UserInputKeyword, 10, 'en')

    def parse_results(html, keyword):
        soup = BeautifulSoup(html, 'html.parser')

        found_results = []
        rank = 1
        result_block = soup.find_all('div', attrs={'class': 'g'})
        for result in result_block:
            #FINDS LINK, TITLE, DESC, AND INDEX
            link = result.find('a', href=True)
            title = result.find('h3')
            description = result.find('span', attrs={'class': 'st'})
            if link and title:
                now = datetime.now()
                dt_string = now.strftime("%m/%d/%Y %H:%M:%S")
                link = link['href']
                title = title.get_text()
                if description:
                    description = description.get_text()
                if link != '#':
                    found_results.append({'Keyword': keyword, 'Rank': rank, 'Title': title, 'Description': description, 'Link': link})
                    #found_results.append({'keyword': keyword, 'rank': rank, 'title': title })
                    rank += 1
        return found_results

    # Create a Pandas dataframe from the data.
    df = pd.DataFrame(parse_results(html, keyword))
    path = blankfile
    # PATH = r'STARTING_EXCEL_WORKBOOK_NAME.xlsx'   THIS MUST MATH ONE ALL DOCS!!!!!
    book = load_workbook(path)
    writer = pd.ExcelWriter(path, engine = 'openpyxl')
    writer.book = book

    df1 = pd.DataFrame(parse_results(html, keyword))
    df1.to_excel(writer, sheet_name = keyword)

    writer.save()
    writer.close()




