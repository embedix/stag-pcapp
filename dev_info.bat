@echo off
rem vytvari informacni soubor o projektu v Delphi
rem a upravi datum modifikace
echo Informace o projektu > readme.txt
echo ==================== >> readme.txt
echo. >>readme.txt
echo. >>readme.txt
echo Seznam souboru:>>readme.txt
ls >> readme.txt
echo. >>readme.txt
echo. >>readme.txt
echo Pocty radku:>>readme.txt
wc -l *.pas >>readme.txt
echo. >>readme.txt
echo. >>readme.txt
echo. >>readme.txt
echo -konec- >>readme.txt


touch --date=1200 *
