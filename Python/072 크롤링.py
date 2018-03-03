import urllib.parse
import urllib.request
import re

def input_query():
    q= urllib.parse.quote_plus(str(input('검색할 단어를 입력하세요:')))   ##quote 내가 검색하고 싶은 것
    return '&query='+q

def bind_url():
    default_url='https://openapi.naver.com/v1/search/image.xml?'
    start= '&start=1'
    sort= 'sort=sim'
    display='&display=10'
    query= input_query()
    full_url= default_url+sort+start+ display+query
    print('default_url : '+default_url)
    print('full_url : '+full_url)
    return full_url

def fetch_contents_form_url():
    url=bind_url()
    headers={
    'Host':'openapi.naver.com',
    'User-Agent':"curl/7.43.0",
    'Accept':'*/*',
    'Content-Type':'application/xml',
    'X-Naver-Client-Id':'h3y4EsanndWZIsgumI2N',
    'X-Naver-Client-Secret':'5ke7FjAxBU'
    }
    r=urllib.request.Request(url,headers=headers)  # 요청 url,headers=headers
    m=urllib.request.urlopen(r)
    html=m.read()
    print(html)
    return html

def extract_text_in_tags(tags,tagname='title'):
    txt=[]
    reg='[^<'+tagname+'>][^<]+'
  
    for tag in tags:
        txt.append(re.search(reg,tag).group())
    return txt

def get_contents_from_html():
    html=fetch_contents_form_url()
    
    title_tags= re.findall('<title>[^<]+</title>', html.decode('utf-8'))   #읽을 수 없는 글씨를 decode 한 뒤에 <title> tag 안에 입력
    link_tags= re.findall('<link>[^<]+</link>', html.decode('utf-8'))
    print(title_tags)
    print(link_tags)
    
    titles= extract_text_in_tags(title_tags,tagname='title')
    links=extract_text_in_tags(link_tags,tagname='link')
    
    f=open('image.html','w')
    f.write('<html><body>')
    for i in range(1,len(titles)):
        f.write('<p>'+titles[i]+'</p>')
        f.write('<img src=' +links[i]+'/>')
    f.write('</html></body>')
    f.close()

get_contents_from_html()


