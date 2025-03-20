from ftplib import FTP

ftp_host = "192.168.0.21" 
ftp_user = "ftpuser"
ftp_pass = "password"
file_name = "ftp/flag.txt"
local_file = "downloaded_file.txt"

ftp = FTP(ftp_host)
ftp.login(ftp_user, ftp_pass)

with open(local_file, "wb") as f:
    ftp.retrbinary(f"RETR {file_name}", f.write)

ftp.quit()

print(f"File '{file_name}' downloaded successfully as '{local_file}'")

