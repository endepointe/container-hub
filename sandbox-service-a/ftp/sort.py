import sys

'''
url: http://vsftpd.beasts.org/vsftpd_conf.html
Same as this co-file: readconf.py...

Use this file after running readconf.py.

This url and package may change but at least, by setting all values to 
either a default, or otherwise, paranoia can be satisfied.

Remember to has the conf file and monitor it for any changes skid.
'''

if len(sys.argv) != 2:
    print(f"Usage: {sys.argv[0]} run")
    sys.exit()

sorted_file = "sorted.default.vsftpd.conf"

if sys.argv[1] == "run":
    text = f"Press enter to overwrite {sorted_file}..."
    try:
        input(text)
    except KeyboardInterrupt:
        print(f"\n{sorted_file} unchanged...\t Exiting.")
        sys.exit()
    except EOFError:
        print("Exiting...")
        sys.exit()

    with open("default.vsftpd.conf","r") as uf:
        lines = uf.readlines()
        lines.sort(key=str.casefold)
        with open(sorted_file,"w") as sf:
            for line in lines:
                sf.write(line)
            sf.close()
        uf.close()
    print("s0r7ed vsftpd conf1g")
else:
    print(f"Usage: {sys.argv[0]} run")
    sys.exit()
from bs4 import BeautifulSoup

