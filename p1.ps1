$path = "$env:TEMP\info.txt"
"--- SYSTEM INFO ---" > $path
whoami /all >> $path
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" >> $path
"--- WIFI PASSWORDS ---" >> $path
netsh wlan show profiles | Select-String "\:(.+)$" | %{$name=$_.Matches.Groups[1].Value.Trim(); netsh wlan show profile name="$name" key=clear} | Select-String "Key Content\W+\:(.+)$" | %{$pass=$_.Matches.Groups[1].Value.Trim(); "SSID: $name | PASS: $pass"} >> $path
# Optional: Notepad mein result dikhane ke liye
notepad $path
