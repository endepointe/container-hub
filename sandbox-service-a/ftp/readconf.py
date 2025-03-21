from bs4 import BeautifulSoup

'''
Use this file after wget http://vsftpd.beasts.org/vsftpd_conf.html
This url and package may change but at least, by setting all values to 
either a default, or otherwise, paranoia can be satisfied.

Remember to has the conf file and monitor it for any changes skid.
'''

def parse_vsftpd_html_interactive(html_file, of):

    with open(html_file, 'r', encoding='utf-8') as f:
        html_content = f.read()

    soup = BeautifulSoup(html_content, 'html.parser')


    text = soup.get_text()
    text = text.split('\n')
    setting_default = False
    key = str()
    value = str()

    for line in text:
        if len(line) < 4:
            continue
        if '_' in line:
            key = line
            setting_default = True
            continue
        if setting_default:
            if "Default" in line:
                l = line.split(':')[1]
                value = l.strip()
                setting_default = False
                of.write(key + "=" + value + '\n')
            else:
                continue

if __name__ == "__main__":
    unsorted = unsorted.split(' ')
    for item in unsorted:
        print(item)
    print("Now c134n^7h3f113")
