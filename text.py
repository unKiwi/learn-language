# {
#     "People": {
#       "selected": true,
#       "lsWord": {
#         "1 [one]": {
#           "lang": "enRusse",
#           "phonetique": "enPhonetique",
#           "audio": "0001",
#         },
#         "People": {
#           "lang": "enRusse",
#           "phonetique": "enPhonetique",
#           "audio": "0002",
#         },
#       },
#     },
#   };

# includes
import requests
from bs4 import BeautifulSoup

# config
URL = "https://www.50languages.com/phrasebook/lesson/en/ru/"

# function
def get_html_from_url(url):
    print(url)
    html = requests.get(url).text
    soup = BeautifulSoup(html, "html.parser")
    return soup

# traitement
# init file
file1 = open("output.txt", "a", encoding="utf-8")
file1.write('[')

# add a lesson
for i in range(1, 101):
    soup = get_html_from_url(URL + str(i))

    # add title
    # file1.write('"' + soup.select_one("h1 span").get_text() + '": {"selected":false,"lsWord":{')

    # add 2 first word
    firstWord = soup.find("h3").get_text()
    firstWordPhonetique = soup.find_all("h3", limit=3)[2].find("span").get_text()
    firstWordLang = soup.find_all("h3", limit=3)[2].get_text().replace("+", "").replace(firstWordPhonetique, '').strip()
    nb = str((i - 1) * 20 + 1)
    while (len(nb) < 4):
        nb = "0" + nb
    file1.write('{"audio":"' + nb + '","lang":"' + firstWordLang + '","phonetique":"' + firstWordPhonetique + '","en":"' + firstWord + '","readRu_writeEn": 0,"readEn_writeRu": 0,"hearRu_writeEn": 0,"readEn_speakRu": 0,},')

    secondWord = soup.find_all("h3", limit=2)[1].get_text()
    secondWordPhonetique = soup.find_all("h3", limit=4)[3].find("span").get_text()
    secondWordLang = soup.find_all("h3", limit=4)[3].get_text().replace("+", "").replace(secondWordPhonetique, '').strip()
    nb = str((i - 1) * 20 + 2)
    while (len(nb) < 4):
        nb = "0" + nb
    file1.write('{"audio":"' + nb + '","lang":"' + secondWordLang + '","phonetique":"' + secondWordPhonetique + '","en":"' + secondWord + '","readRu_writeEn": 0,"readEn_writeRu": 0,"hearRu_writeEn": 0,"readEn_speakRu": 0,},')

    # add other word
    for j in range((i - 1) * 20 + 3, i * 20 + 1):
        nb = str(j)
        while (len(nb) < 4):
            nb = "0" + nb
        
        tr = soup.find("a", {"offset_text": nb}).parent.parent
        
        word = tr.select_one("td:first-child").get_text().strip()
        wordPhonetique = tr.find_all("td", limit=2)[1].find_all("a")[1].find("span").get_text()
        wordLang = tr.find_all("td", limit=2)[1].find_all("a")[1].get_text().replace(wordPhonetique, "")
        file1.write('{"audio":"' + nb + '","lang":"' + wordLang + '","phonetique":"' + wordPhonetique + '","en":"' + word + '","readRu_writeEn": 0,"readEn_writeRu": 0,"hearRu_writeEn": 0,"readEn_speakRu": 0,},')
    
    # file1.write('}},')
    
# finish file
file1.write('];')
file1.close()