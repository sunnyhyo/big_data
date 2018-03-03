import urllib.request
import urllib.parse
from bs4 import BeautifulSoup


defaultURL = 'https://openapi.naver.com/v1/search/'

sort= 'sort=sim'
start= '&start=1'
display= '&display=100'
query= '&query=' +urllib.parse.quote_plus(str(input('검색어를 입력하세요.')))
fullURL= defaultURL +sort + start+ display +query
print(fullURL)


file=open('C:\\python36\\naver_news3.txt','w',encoding='utf-8')
headers={
    'Host':'openapi.naver.com',
    'User-Agent':"curl/7.43.0",
    'Accept':'*/*',
    'Content-Type':'application/xml',
    'X-Naver-Client-Id':'h3y4EsanndWZIsgumI2N',
    'X-Naver-Client-Secret':'5ke7FjAxBU'
    }
req=urllib.request.Request(fullURL,headers=headers)
f=urllib.request.urlopen(req)
resultXML=f.read()
xmlsoup=BeautifulSoup(resultXML,'html.parser')

items=xmlsoup.find_all('item')




for item in items:
    file.write('----------------\n')
    file.write('뉴스제목:' +item.title.get_text(strip=True)+'\n')
    file.write('요약내용:' +item.description.get_text(strip=True)+'\n')




    file.write('\n')
file.close()





