1) Connect to your PBX via SSH.
2) Verify that nano is installed, then open the custom extensions configuration file: nano /etc/asterisk/extensions_custom.conf
3) Copy the contents of extensions_custom.conf from this repository and paste them into /etc/asterisk/extensions_custom.conf | Replace 1234 with your actual operator queue number.
4) Save and close the file (Ctrl + O, then Enter, then Ctrl + X)
5) Apply your dialplan changes to Asterisk: fwconsole reload
6) Open the AGI script location for the Discord notifier: nano /var/lib/asterisk/agi-bin/send_discord.sh
7) Paste the contents of the notifier script from this repository into the file.
8) Update the webhook URL variable with your own Discord webhook, and customize the embed footer if desired.
9) Save and close the file (Ctrl + O, then Enter, then Ctrl + X)
10) Set the proper executable permissions on the script so Asterisk can run it: 
chmod +x /var/lib/asterisk/agi-bin/send_discord.sh
chown asterisk:asterisk /var/lib/asterisk/agi-bin/send_discord.sh
11) Run a final reload to apply everything: fwconsole reload

Experiencing issues? Reach out on Discord at @firealarmbrokeboy.
