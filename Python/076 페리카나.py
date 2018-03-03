
import urllib.request
from bs4 import BeautifulSoup
import pandas as pd
import datatime
from itertools import count
import xml.etree.ElementTree as ET

def get_request_url(url, enc='utf-8'):

    req=urllib.request.Request(url)

    try:
        response = urllib.request.urlopen(req)
        if response.getcode()==200: 
            try:
                rcv = response.read()
                ret = rcv.decode(enc)
            except UnicodeDecodeError:
                ret = rcv.decode(enc, 'replace')

            return ret

    except Exception as e:
        print(e)
        print('[%s] Error for URL : %s' %(datetime.datetime.now(), url ))
        return None
def getPelicanaAddress(result):

    for page_idx in count():

        Pelicana_URL = 'http://www.pelicana.co.kr/store/stroe_search.html?=&page=%s' %str(page_idx+1)
        print('[Pericana Page] : [%s]' %(str(page_idx+1)))

        rcv_data =get_request_url_(Pelicana_URL)
        soupData =Beautifulsoup(rcv_data, 'html.parser')

        store_table = soupData.find('table', attrs = {'class':'table mt20'})
        tbody= store_table.find('tbody')
        bEnd=True

        for store_tr in tbody.findAll('tr'):
            bEnd = False
            tr_tag= list(store_tr.strings)
            store_name = tr_tag[1]
            store_address = tr_tag[3]
            store_sido_gu = store_address.split()[:2]

            result.append([store_name]+store_sido_gu+[store_address])
        if (b_End == True):
            return

    return



def main():

    result =[]

    print('PEROCANA ADDRESS CROWING START')
    getPelicanaAdress(result)
    print(result)
    pericana_table =pd.DataFrame(result, colums =('store','sido', 'gungu', 'store_address'))
    pericana_table.to_csv('c:/pericana.csv', encoding='cp949', mode='w', index=True)
    del result[:]

if __name__=='__main__':
    main()
