import re
url='<a href="C:\\python36\Koala.jpg"> 그림 </a> <fontsize="10">'
print(re.search('href="(*?)">', url).group(1))
