		    ===============================
		      SSSS   TTTTT    AA     GGGG
		     S	       T     A	A   G	  
		      SSSS     T    A	 A  G  GG
			  S    T    AAAAAA  G	 G
		      SSSS     T    A	 A   GGGG
		    ===============================

		    ===============================
		    |	Editor JR pro Stanicare   |
		    ===============================
				       verze 1.20

 ***	POZOR:	Dokumentace je nyni v souboru Editor-help.pdf	 ***
 *** v tomto souboru se informujte o zmenach od verze 1.17 STAGu ***

 Tento soubor obsahuje predevsim seznam novinek v nejnovejsi verzi.

 NOVINKY
 =======

1.22:
(únor 2007)
 + zobrazuje predponu M (MOs, MSv) u vlaku, ktere jsou tvoreny ucelenou jednotkou
   (je zaskrtnuta tato volba v razeni)
   Jde jen o zobrazeni v seznamu vlaku a v HTML vypisu, jinde se to neprojevi.
 + kontrola doplnena o kontrolu nevyplneni popisu v/v bodu a seznamu stanic, dale se
   zobrazi varovani pri editaci XML bez dat stanice
 + kontrola se spousti pri kazdem ukladani, pri chybach se zobrazuje jako velke okno.
   Lze vypnout v nastaveni editoru.
 ~ snad opravena nemoznost zadavani razeni pri tecce nastavene jako des. oddelovac
   ve Windows
 + editace dat v tabulce (zatim vhodne hlavne pro import CSV z excelu a vyuziti
   jako zaklad pro dalsi editaci ve stagu). Menu Soubor/Tabulka vlaku.

V tabulce je pevne usporadani sloupcu v poradi:

Typ vlaku (Os, Sp...)
Cislo vlaku (4001)
Oznam. smeru prijezdu
Oznam. smeru odjezdu
Vstupni bod nebo text VZNIK
Zastavky oddelene strednikem
Casy odjezdu oddelene strednikem
Cisla nastupist oddelena strednikem, znak * za cislem nastupiste = povinne nast.
Vystupni bod nebo text KONEC nebo text KONEC/171 (171 - cislo noveho vlaku)
Cas vstupu (vjezdu) do oblasti
Cas odjezdu z oblasti

Pro vlozeni vlaku z tabulky do seznamu je jedinna povinna polozka Cislo vlaku.

Pokud zaskrtnete "prepsat vlaky", zmeni se jen ty polozky vlaku, kde je zadan aspon
jeden znak (nevyplnena pole nezpusobi zadnou zmenu na puvodnim zaznamu).

Import/export do Excelu je prozatim mozny jenom pres format CSV
(v Excelu Ulozit jako...).


1.21b2:
(4.1.2007)
 + doplnen jeste rusici Lv

1.21b:
(1.1.2007)
 ~ oprava nacitani seznamu typu vlaku
 ~ pri zadavani razeni se pri ovladani sipkama v hledacim policku zobrazuje
   nahled vozu a info o nem
 + doplneni ostatnich typu rus. vlaku

1.21:
(prosinec 2006)
 - po dost dlouhe odmlce (prace, zenske, ztrata pripravene nove verze - zdechly disk
   a blbe nastavene zalohovani, takze jsem prisel (v podstate jen) o veci ke STAGu a
   k webovkam Stanicare - celkem vezme chut neco delat) v podstate jen oprava
   nastradanych chyb...
 ~ update vozy.ini z Internetu ted funguje s adresou rozhrani pro editaci
   stag.stanicar.cz
   (mozno nastavit ve stag.ini - polozka update/base)
 + pri zadavani razeni je z vyhledavaciho policka mozne Enterem potvrdit 1. polozku
   v seznamu nalezenych vozu, i kdyz je jich vic, prip. pomoci sipek nahoru/dolu
   na klavesnici vybirat polozku v okne nalezenych a pak Enterem vlozit.
 + kopirovaci tlacitko v dialogu razeni
 + export JR do HTML - pokud je kolej povinna, ma hvezdicku
 + do dialogu razeni pridano pole "Vjizdi sunuty"



1.20c:
(leden 2006)
 - pouze bugfixy...
 ~ razeni podle casu prijezdu radi i vznikajici vlaky podle casu vzniku
 ~ nejake upravy okna, aby se pri nastaveni obskurnich rozmeru neprekryvaly prvky
 ~ odstraneno blikani zobrazeni hl. okna po zmene rozmeru a posunuti pricky
 ~ text o vznikajicim vlaku se nekdy schoval a byl videt jenom posledni radek -
   odstraneno

1.20b:
(leden 2006)
 + !!! webovy update vozy.ini a obrazku !!! (Soubor/Aktualizovat)

   Navstivte http://stanicar.ic.cz/vini - toto je nyni centralni misto pro
   doplnovani udaju do vozy.ini. Tyto upravy pak nactete do sveho Stagu
   pomoci aktualizace z webu.

 + rozsireni leveho vyberu o informace o predchozim a navaznem vlaku, kliknutim
   na hlavicku sloupce se seradi.
 + moznost mit vic variant obrazku jednoho vozu a mit horizontalne prevraceny
   obrazek (ceka na implementaci ve Stanicari - zatim se tam zobrazi "hlavni"
   obrazek vozu)
 + filtr skupiny vozu v dialogu razeni - lze si nechat zobrazit pouze vozy CD/CSD/ZSR
   (bez podtrzitka v nazvu) nebo cizi, resp. fiktivni vozy (Pack68...), ktere jsou
   v nazvu oznaceny na konci "_sprava", napr. 817_Pack68.
 ~ z tohoto duvodu doslo ke zmene oznaceni nekterych cizich vozu v stanicar.ic.cz/vini
   a tedy i v prilozenem souboru vozy.ini!  STAG automaticky pri nacteni stanice
   a ulozeni prejmenuje vozy podle tabulky ve stag.ini.
 + kontrola spravnosti (Soubor/Kontrola spravnosti) hleda vozy, ktere jsou definovane
   v gvd, ale nejsou v aktualnim vozy.ini (vyrazeny...) -> tyto vozy muzete
   a) vytvorit ve webovem rozhrani vini: http://stanicar.ic.cz/vini
   b) prejmenovat na existujici vuz pridanim prislusneho radku do stag.ini, zavrenim
      a otevrenim Stagu a nactenim + ulozenim stanice.

 ~ upraveno nacitani obrazku vozu, nyni se nacitaji do pameti i obrazky, ktere
   nejsou definovany ve vozy.ini


1.20a: POZOR - TOTO JE NEVEREJNA VYVOJOVA VERZE (pre-release pro v. 1.20)
(prosinec 2005)

 + pridana moznost seradit seznam vlaku podle typu vlaku a podle casu prijezdu
   do oblasti (kliknout pravym na seznam vlaku, Radit podle/...)
 + pridana polozka Jmeno vlaku do XML dat
 + pridana moznost definovat v nahodne nakl. doprave soupravy nahodnych vlaku
 + Soubor/Update vozy.ini z internetu - zatim experimentalni, nekontroluje chyby
   a nenahrává ze serveru obrázky!
   Nehrejte si s tím, pokud máte vlastní vozy.ini! Pøepíše ho to!
 + ikonky v menu
 ~ moznost zapnout vice sexy menu (v nastaveni)...kdosi to chtel...


1.18: drobna uprava ve formatu dat
 + pøidáno tlaèítko "Zmìnit na posun" v nastavení konèícího vlaku
   (alternativa k výbìru "posun" ze seznamu navazujícívh vlakù)
 ~ v XML datech pribyva polozka "konciposunem" - ve Stanicari bude fungovat
   nastaveni vlaku, kdy se po konci jizdy vlaku vlak meni na posun, pouze
   po nacteni a ulozeni souboru v teto nebo vyssi verzi STAGu.

1.17: pouze drobne opravy chyb + oprava PDF dokumentace
 + aktualizace PDF dokumentace
 ~ oprava chyby pri ukladani souboru s teckou v nazvu
 ~ lehke zkulturneni dialogu spravce sekci GVD, nedalo se na to divat:)
 ~ protoze je nacitani zdlouhave, doplnen splashscreen
 ~ nepta se, kterou sekci GVD otevrit, kdyz je jenom jedna:)

1.16: nutna udrzba, hlavne kvuli uzivatelskemu komfortu

=== UPOZORNENI
 (1) Od teto verze STAG defaultne NEUKLADA GVD ve formatu pro stare verze Stanicare 
     (< 1.70) - ukladani je mozno zapnout v menu Nastaveni/Nastaveni editoru
 (2) Utilita EXTRACTTOOL !!! NEBUDE FUNKCNI !!! pro grafikony s vice sekcemi 
     (viz nize)

=== tipy a triky:)
 - POUZIVEJTE NABIDKU NASTAVENI / STANICE A ZASTAVKY
   ... vyplneni seznamu stanic a zastavek na Vasi trati umozni jejich lidstejsi
   zpusob zobrazovani, automaticke doplnovani v poli Stanice v seznamu zastavek
   a funkci zobrazeni obsazeni nastupist v nabidce Soubor/Vytvor nakresny JR.

=== upravy datoveho formatu
 + pridana moznost mit vice SEKCI grafikonu - tim jsou mysleny napr. jednotlive roky
   provozu, ktere maji odlisne jizdni rady, ale jsou na stejnem kolejisti. Seznam 
   stanic je take spolecny.
   > pri otevirani souboru se zobrazi volba sekci grafikonu
   > sekci, kterou editujete, muzete zmenit volbou Soubor/Edituj jinou sekci...
   > nove sekce lze vytvaret, prejmenovavat a mazat po volbe v menu Soubor/Zmìna sekcí
     grafikonu
   > stavajici soubory maji automaticky pojmenovanou prvni sekci jako "Novy grafikon"
   > editaci ve starsich verzich STAGu se data neposkodi, je ale mozne editovat jen
     tu sekci, ktera byla vytvorena nejdrive (ostatni program ignoruje)
 + STAG uklada zalohy XML souboru s koncovkou .xml.bak (lze vypnout v menu Nastaveni/
   Nastaveni editoru)
 + Mozno zadat priznak k zastavce vlaku, ze kolej je povinna (rola, postovni vlaky...)
   (atribut kpov v XML datech) - pozor, editaci ve starsi verzi Stagu se tato nastaveni
   zrusi

=== razeni vlaku   
 + pridano vyhledavani vozu do okna razeni vlaku (pole pod seznamem), vlozit vuz lze
   klavesou Enter
 + ke kazdemu vozu je mozne pridat textovou poznamku (v souvislosti se zavedenim
   moznosti razeni vlaku ve Stanicari - pro Balika)


=== vylepseni okna grafikonu
 + okno grafikonu neni modalni, jeho obsah je mozne z hl. okna obnovit zkratkou Ctrl+G
   (pro MaBa)
 + pridano zaskrtavatko na svazani casovych udaju vlaku (zmena jednoho udaje zmeni
   i vsechny dalsi casy smerem "dolu" v JR)  (pro MaBa)
 + ve zobrazeni obsazeni nastupist maji nyni vychozi vlaky zelene vyplnene kolecko,
   koncici vlaky maji kolecko vyplnene cervene, obrys kolecka je cerveny pro rychliky,
   modry pro nakladni vlaky (Pn, Pv, Rn, Sn, NEx) a cerny pro ostatni.
 + pridano zaskrtavaci policko "vice mista pro cisla vlaku"

=== vylepseni hlavniho okna
 + v hlavnim okne se zobrazuje v textove podobe cele razeni vlaku (pro Balika)
 + zobrazuje se informace o vlaku, ze ktereho vlak vznika a o vlaku, ktery vznika 
   z nej (chapete, ze?)
 + v editacnich polich zastavek je mozne vyuzit klavesove zkratky:
   > shift + nahoru/dolu - posun v seznamu zastavek
   > enter - vlozi novou zastavku
   kazda zmena v editacnich polich se nyni ihned prenasi do seznamu
 ~~~~~~ grr! program existuje uz dlouho a doted nikdo neoznamil, ze se zastavky v 
   seznamu zastavek neradi podle casu, ale chaoticky, protoze jsem magor a razeni
   porovnavalo cas odjezdu z jedne zastavky vuci cislu koleje na druhe zastavce...

=== bugfixy, drobnosti
 ~ zprovoznena zapomenuta funkce Otoc vlak v okne razeni vlaku 
   (jinak je uz dlouho mozne pretahovat vozy v seznamu mysi a tim menit jejich
   poradi)
 ~ hl. okno lepe reaguje na zmenu rozmeru
 ~ minimalni pouzitelne rozliseni je 800x600 (rozsireni hl. okna)
 ~ update anglicke lokalizace, lokalizovany jsou i hlaseni z hlavniho okna
   (krome exportu do HTML), zbyvaji hlaseni modalnich oken a jednotky TGVD.pas
 ~ zrusena podpora hnusnych vzhledu Windows XP

1.15: drobny predvanocni update
 + doplneno pole Poznamka
 + zcela predelany export do HTML (uz to vypada slusne)

1.14: doplneni obrazku vozu, oprava nacitani souboru s teckou v nazvu

=== doplneny obrazky vozu a soubor vozy.ini
 + udaje ve vozy.ini jsou ted jiz pravdive (az na par vyjimek)
 + mame celkem 364 obrazku vozu - DIKY MOC!!! - zaslal Zbynek Kypta
 + obrazky vozu prevedeny do 16-ti barev, cimz klesla velikost na 
   cca 1/4. Pokud nekde najdete viditelne zmeny barevnosti,
   napiste, dam konkretnimu vozu puvodni soubor.
 ~ nazvy souboru .bmp jsou malymi pismeny kvuli kompatibilite s unixovymi systemy
 - nejake vozy jeste nejsou zapracovany do vozy.ini, i kdyz mame obrazek-kdo se toho ujme?
   005 cd	771		bdbmrsee	E489
   005 jhmd	811		bdmee		etr680
   422		admnu		bdmnu		gbgs
   486		ahee		bdt		iacqrs
   675		apeer		bdt279		M498
   705 cd	apmz		bhee		S
   705 jhmdc	baim		bmto		WR
   705 jhmdm	balm-u		brk
   725		bc		E46x
   735		bcmz		E47x
   
 - nemame obrazky k vozum: (vuz muzete normalne vlozit, ale nebude se zobrazovat)
   870		Iacqr		Z		ZSR WLAB
   Bp		Lp		Zaz		Zts
   Bpb		Ra		ZSR ARpeer	Ztsc
   Bpee 	Sqs		ZSR Bpeer	Ztsc_post
   Gbqs 	Vte		ZSR BRcm

=== uprava formatu dat - ctete!
 + aby mohl Stanicar zobrazovat obrazky vozu (kde je definovane razeni), je nutne XML
   soubor stanice aspon otevrit a ULOZIT ve Stagu verze 1.13 nebo vyssi.

=== oprava chyb
 ~ nazev souboru XML muze nyni obsahovat tecku (napr. plzen.jih.xml)
   (vedlo k padu programu)

1.13: drobne bugfixy, prizpusobeni se Stanicari, pøevod øazení vlakù

=== opraveny ukazkove stanice
 + o razeni aspon casti vlaku a datumove poznamky byly doplneny stanice
   Ceska Trebova a Kyjov

=== prevod razeni vlaku
 + funkce Nastaveni/Prevod razeni... prevede razeni vlaku, ktere si odpovidaji 
   cislem, do jine stanice (musi byt XML data). Priklad: v Brne mam spoustu vlaku
   s razenim, ktere mi jezdi i v Kyjove -> otevru Brno, dam Nastroje/Prevod 
   razeni, vyberu v dialogu Kyjov. Otevru ve Stagu Kyjov, potesene na to mrknu
   a dam jeste jednou ULOZIT, aby se dokoncil prevod. Hotovo :) - zrovna v 
   tomto pripade mam asi 70% vlaku vyresenych.

=== automaticke prirazovani datumovych poznamek (zejmena po importu z Idosu)
 + viz strana 9 editor-help.pdf; je uz od 1.12, ale zapomnel jsem to sem napsat

=== uprava formatu dat - ctete!
 + aby mohl Stanicar zobrazovat obrazky vozu (kde je definovane razeni), je nutne XML
   soubor stanice aspon otevrit a ULOZIT ve Stagu verze 1.13 nebo vyssi.

=== dalsi upravy formatu dat (pro lidi mimo tym Stanicare: funkcnost se nijak nemeni)
 ~ soubory XML jsou nyni nacitany a ukladany jen ve formatu UTF-8, format
   XML je striktne kontrolovan.
 ~ doplnen "rovnak na vohejbak" - Stanicar dava na zacatek XML dokumentu
   nepochopitelnou sekvenci [EF] [BB] [BF] hexa, kterou ted STAG odstranuje
 ~ pozor: UTF-7 STAG nenacte! Nutno prepsat rucne na UTF-8
 + mimo UTF-8 nacte STAG i ISO-8859-2 a prevede automaticky na UTF-8
 - bohuzel, temito upravami se jeste vice zpomalilo uz tak silene dlouhe
   otevirani a ukladani souboru

 + STAG uklada do dat stanice i popisy pouzitych vozu, ktere si nacita z
   vozy.ini - mam prislibeny nove obrazky a kvalitne zpracovany vozy.ini,
   bude nejspise v pristi verzi
 + vyhoda tohoto reseni je, ze pokud si autor nejake exoticke stanice nadefinuje
   vlastni vozy ve vozy.ini, budou tyto automaticky preneseny v souboru stanice.


1.12: doplnen editor datumovych poznamek (viz Editor-help.pdf)
 * Data datum. poznamek se ukladaji v XML datech pod gvd/dates jako polozka
   date(name...jmeno poznamky), obsahuji elementy stop a run (neni-li zadny
   element run, jede vlak denne mimo stop), ktere maji parametry
   at...od (datum ve formatu 1.12. nebo cislo dne v tydnu napr. 5 nebo spec.
   zaznam + (svatky + nedele) nebo X (pracovni dny)

1.11: doladeni kompatibility s novym (C#) Stanicarem
 * uprava XML formatu do vetsi prehlednosti, zustava stale stary i novy
   zpusob ukladani (.gvd i .xml)

 * POZOR: pokud upravite data ve STAGu verze 1.11, verze 1.10 nenacte
   zastavky a razeni vlaku (jiny zpusob ulozeni techto informaci)!  
   STAG bude data ukladat obema zpusoby pro umozneni editace ve v. 1.10,
   kdyz nastavite ve Stag.INI radek "OnlyStructured=0"

 + XML data navic obsahuji informaci o pouzitem editoru a verzi
   (gvd/gvd_ver; gvd/gvd_editor)
   

1.10: uprava pro novy format dat
=== upravy datoveho formatu
 ~ dost podstatne upravy programu, aby byl schopen
   ukladat a nacitat XML format dat, ktery budou
   pouzivat nove test verze Stanicare (v C#)
   --- pravdepodobne vznikly i nejake chyby---
   budu rad, kdyz mi je oznamite
 
   PROSIM PRECTETE SI POPIS KONVERZE GVD -> XML na konci
   souboru Editor-help.pdf, pokud potrebujete prevest
   stare kolejiste v .dat a .gvd do .xml

 + pridana dokumentace syntaxe vozy.ini a mirne upravena syntaxe
   .. je mozne urceni delky vozu realnym cislem (povolena desetinna carka)
   .. je mozne pouzivat mezeru v nazvech rad vozu
   .. pridany polozky pro pocet osob (osob), taznou silu (sila), vyrobce atd.

=== nove funkce editoru
 + dialog pro nastaveni nahodne nakladni dopravy
   (Nastaveni/Nahodna nakl. doprava)
   .. funguje jen v XML formatu!

=== dokumentace
 + vytvoren soubor napovedy Editor-help.pdf, upraveno menu Napoveda v
   editoru
 ~ opraveny spatne dokumentovane veci, napr. ze je nutne
   zmacknout sipku dolu na pridani stanice v Nastaveni/stanice
   a zastavky. (Diky za upozorneni)

=== ostatni
 + dialog razeni vlaku zobrazuje parametry vozu i pri klikani na
   seznam dostupnych typu
 + parametry vozu se zobrazuji ponekud polidstene
 + pridat MRU list (naposledy otevrene soubory)
 + upraven soubor vozy.ini - dekuji za pomoc!
 ~ dialog "opravdu chces skoncit - neni ulozen soubor" se zobrazuje
   i v pripade zmeny razeni nebo nakladni dopravy (Diky za upozorneni)

 btw, program ma uz pres 4100 radku.

1.07:
 + OBRAZKY VLAKU KONECNE V PROVOZU
 + uz mame obrazky vozu, jsou v podadresari \vozy
   (pozdeji by se mely obrazky vozu a soubor vozy.ini
   distribuovat pravdepodobne se Stanicarem, ktery
   z nich bude hlavne cerpat)
   Obrazku mame daleko vice nez je v teto verzi, jen
   je musim roztridit.
 + rozsiren seznam v vozy.ini
 - pozor: data o vozech ve vozy.ini jsou vetsinou zcestna,
   az bude soubor vozy.ini opraven, bude stacit nacist a
   ulozit JR a ono se to samo opravi. Data o loko jsou
   vetsinou OK
 + vlaky bez definovaneho razeni jsou zobrazeny v seznamu
   kurzivou
 ~ opraveno nezhasinani hvezdicky "neulozeno"
 ~ opraveno nekolik dalsich bugu ktere vznikly s implementaci
   zmeny jazyka
 ~ zmenena funkce 3. tlacitka na toolbaru z kontroly JR na editaci
   v Builderu - zruseno (vono tam uz to tlacitko bylo::))


1.06:
 + vytvari grafikon v JPG, velmi zjednodusene, kresli jen
   usek od vstupne/vyst. bodu, zatim nerozlisuje rychlosti
   vlaku. Dale vytvari seznam odjezdu z jednotlivych
   nastupist ve forme casove osy. V pristi verzi toto bude
   vyrazne vylepsene.
 + moznost zvolit si jazyk, zatim je zmena jazyka funkcni jen
   v uzivatelskem rozhrani, hlasky atd. prijdou na radu
   pozdeji
 + podstatne vylepseno zobrazovani obrazku vozu - zarovnani
   dolu, transparentni bitmapy, stale ale nemame nikoho kdo
   by dodal obrazky vlaku. Vlastni obrazky muzete ulozit do
   podadresare programu \vozy se jmenem vuz_rada.bmp (napr.
   vuz_810.bmp). Jednotlive vozy se musi definovat v souboru
   vozy.ini (musi se urcit ruzne parametry vozu).
 - POZOR - parametry vozu v souboru vozy.ini jsou az na lokomotivy
   vymyslene a nepravdive - slouzi hlavne k odladeni funkce.
   Muzete ale bez problemu vytvaret vlaky vcetne razeni,
   az budou spravne udaje k vozum, program si je automaticky
   prevezme z noveho vozy.ini.
 ~ oprava chyby, kdy se zobrazila sestava vlaku v hlavnim okne az
   po kliknuti na seznam
 ~ zmenena funkce 3. tlacitka na toolbaru z kontroly JR na editaci
   v Builderu.	 

1.05:
 + implementovano nacitani obrazku vozu, bohuzel zatim nemame
   grafika ktery by je nakreslil - o ziskani obrazku zatim
   jedna autor Stanicare. Vlastni obrazky muzete ulozit do
   podadresare programu \vozy se jmenem vuz_rada.bmp (napr.
   vuz_810.bmp). Jednotlive vozy se musi definovat v souboru
   vozy.ini (musi se urcit ruzne parametry vozu).
   Jako ukazka jsou k dispozici obrazky loko 242 a vozu Bymee.
   Kdo je jejich puvodnim autorem nevim, a tak doufam ze mi jejich
   zverejneni promine, v pristi verzi uz budou jine.
 + informacni oknenko o sestave, hmotnosti atd. vlaku vedle tlacitka
   razeni vlaku
 + cislo koleje vedle okenka seznamu zastavek je mozne kliknutim
   zvolit v rozsahu 1-30 (jina cisla - ne pismena! - je mozne
   primo vypsat do editacniho pole).
 + v seznamu spoju se zobrazuje za smerem prijezdu cas prijezdu do
   oblasti, pokud seradite podle smeru prijezdu, seradi se automaticky
   i podle casu. Tato uprava usnadnuje vyhledavani duplicitnich spoju.
 + mala nastrojova lista na Eidzovo prani
 + lehke zkulturneni dialogu sestavy vlaku, jeste na nem budu pracovat
 + sekce Budoucnost v dokumentaci: pridany terminy

1.04:
 + pridana sekce Budoucnost v dokumentaci
 + automaticky nastavuje cas, odkdy muze vzniknout vlak prirazenim
   cisla souprave (stisknete tlacitko "Auto" pod prislusnou polozkou),
   pro vice vlaku, ktere maji cas vzniku od 0:00 (defaultne napr. po
   importu), oznacte tyto vlaky a kliknete pravym tl. mysi na seznam,
   zvolte Automaticky nastavit cas vzniku. Prijizdejici vlaky nebo vlaky,
   ktere jiz maji cas vzniku nastaveny, nebudou zmeneny.
 + tento cas lze nastavit v menu Nastaveni/Nastaveni editoru
 + drobne bugfixy, opravy preklepu
 + priprava na razeni vlaku
   + je mozne zvolit krome zadani jen delky vlaku i zadani vlaku po 
     jednotlivych vozech
   - funkce je v beta-verzi pro overeni zakladni funkce
   - NENI implementovano zobrazovani obrazku jednotlivych vozu
   - NENI hotovy seznam typu vozu a jejich parametru (vozy.ini)
   - NENI funkcni tlacitko Kopiruj z vlaku...
   - NENI to zatim prilis user-friendly - v 1.05 bude dialog hezci
   + je funkcni nastavovani cilu zbozi u nakladnich vozu
     (predpoklada se ze Stanicar nahodne vybere jednu ze zaskrtnutych moznosti)
   + je funkcni manipulace se seznamem vozu, presouvani vozu, nacitani
     typu vozu, vypocet maximalni rychlosti, hmotnosti, delky atd.
 +++ PROSBA +++
   Kdo ma k dispozici obrazky vozu jako bocni pohled v rozumnem rozmeru pro
   zobrazeni ve forme jako napr. v Kolejari nebo v simulatoru Brna, at se ozve
   autorum (simulator: flint@centrum.cz, editor: ivo.strasil@centrum.cz)

1.03:
 + moznost nastavit delku vlaku jako nahodnou nebo pevne cislo
   (priprava na nastavovani razeni vlaku z jednotlivych vozu)
 + delku vice vlaku (napr. po importu) lze nastavit pomoci tlacitka
   Nastav delku vice vlaku (s Ctrl nebo Shiftem lze vybrat v seznamu
   vice vlaku) - pouzijte napr. po importu z idosu.
 + pop-up menu na seznamu vlaku (pravym tlacitkem)
 + program si asociuje priponu .gvd (mozno potlacit NoReg=1 v INI)
 + pri nacitani souboru je programu jedno, jestli zadate .gvd nebo .dat,
   hlaska pri neexistenci .dat pro dany soubor .gvd
 + sloupce Z a Do se mohou zobrazovat vzdy netucne, nebo s "tucnosti"
   podle cisla vlaku (Nastaveni/Nastaveni editoru) - uspora sirky v
   ListView
 + dotaz pri mazani vlaku, mazani vlaku funguje i pro vice oznacenych vlaku
 + na volbu Editovat kolejiste oblasti hleda program Stanicar i v nadrazenem
   adresari (stag muze byt v podadresari, nemusi byt v adresari kde je
   Builder)
 + napoveda k menu ve stavovem radku, stav. radek zobrazuje pocet vlaku
 + napoveda doplnena o popis instalace
 + napoveda doplnena o poznamku o licenci GPL/GNU (cti dole)
 ~ oprava pomaleho nacitani seznamu vlaku (od 1.02) - pomalost ve winapi

1.02:
 + drobna uprava datoveho formatu, jiz vytvorene JR staci nacist a
   ulozit (vlaky se seradi podle casu prijezdu).
 + sirka sloupce Cislo vlaku se sama nastavuje podle nejdelsiho textu
 + vylepseni chybovych hlasek pri importu, vetsi okno konzole,
   oznami kdyz uzivatel nevyplni nejake pole, pta se na ulozeni
   pri ukonceni a dalsi drobnosti
 + pri importu datumove poznamky na vice nez 1 radek se zobrazi
   varovani.
 ~ drobné opravy: Sn není smìšný, ale spìšný nákladní vlak,
   doplnìn seznam typù vlakù tak, aby tam byly všechny typy
   podle D2 kromì Vleè. a Služ.
 ~ nejake upravy v manualu - dekuji Eidzovi

1.01:
 + IMPORT Z IDOSU! Sice pracne, ale daleko mene pracne nez rucni
   editace. Uspesnost odhadem 90% pro oblasti, 99% pro simulace
   jediné stanice
 + barvy vlakù, nastavení barev jednotlivých typù vlakù
 + dtto - ownerdraw listbox a listview se seznamem vlakù
 + ukládání poslední polohy okna
 + tlaèítka na posun všech èasù vlaku zároveò
 + vlaky v seznamu jsou už seøazeny poøádnì podle èísla
 + podpora hnusných vzhledù ala WinXP (pøidán soubor
   stag.exe.manifest)
 + pøidána nápovìda
 + pøidán konfiguraèní soubor stag.ini
 + v O programu odkaz na web Stanièáøe
 + zmìna na 2 balíèky, bin a src


Omezeni:
--------

*zkratka stanice a vstup/vystup.bodu nesmi obsahovat mezery
*cislo vlaku musi byt >=10
*jmeno souboru .gvd a .dat nesmi obsahovat tecku jinde nez v .gvd/.dat
*dtto pro .xml
*zadne texty nesmi obsahovat znak = (!!!)
*delka vlaku musi byt mezi 5-999m
*zkratka stanice a v/v bodu nesmi byt stejna


BUDOUCNOST
==========

Sem pisu funkce, ktere chci drive nebo pozdeji implementovat do Editoru.
(stav ve v. 1.16, cervenec 2005)
Pokud mate o nejakou funkci zajem, napiste mi e-mail.

* doplneni obrazku do editoru razeni vlaku ... HOTOVO v 1.14
  zbyva snad jen opravit vozy.ini kde jsou ted nesmysly
  uz se mi ozval jeden dobrovolnik, ktery nabidl i obrazky - super!

* zobrazeni a tisk seznamu prijezdu a odjezdu z jednoho v/v bodu ve
  forme tabulky nebo kousku GVD ... HOTOVO v 1.06
  (v menu Soubor/Vytvor nakresny JR)

* seznamy odjezdu z jednotlivych stanic ... bude po naprogramovani
  predchoziho bodu ... (sorry, nestiham, nikdo mne jeste 
  nenadal ze to neni)

* doplneni funkce Kontrola spravnosti (zustava stejna od v. 1.00)
  ... upraveno, nedokonale 

* komfortni editor a kontrola datumovych poznamek (diky - Eidz)
  ... hotovo

* moznost jinych jazykovych verzi - mozna, nekdy (moc prace, zpomaleni)
   ... castecna podpora v 1.06, 1.07

LICENCE
=======

    Editor JØ Stanièáøe - STAG
    Copyright (C) 2004	Ivo Strasil

    Tento program je volné programové vybavení; mùžete jej šíøit a
modifikovat podle ustanovení Obecné veøejné licence GNU, vydávané Free
Software Foundation; a to buï verze 2 této licence anebo (podle vašeho
uvážení) kterékoli pozdìjší verze.

    Tento program je rozšiøován v nadìji, že bude užiteèný, avšak BEZ
JAKÉKOLI ZÁRUKY; neposkytují se ani odvozené záruky PRODEJNOSTI anebo
VHODNOSTI PRO URÈITÝ ÚÈEL.
Další podrobnosti hledejte v Obecné veøejné licenci GNU.

   Kopii Obecné veøejné licence GNU jste mìl obdržet spolu s tímto
programem; pokud se tak nestalo, napište o ni Free Software Foundation,
Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

PODEKOVANI
==========

Vyvojari simulatoru dekuji (zavinac nahrazen mezerou kvuli virum):
(posledne pridani jsou nahore)

Zdenek Svacina - sprava novych obrazku vozu a komunikace s Zelpage.cz
tym Zelpage.cz - nove obrazky vozu
Zbynek Kypta - obrazky vozu + vozy.ini
vsem, kteri jsou zmineni v souboru Editor-help.pdf
