# GDI_0_Linux_Konsole

[Folien](https://docs.google.com/presentation/d/19MA1rJMhHQ3hxtFDUrhXvZUuCBKEy5BkVZzXSs9koZM/edit?usp=sharing)

[Video](https://www.youtube.com/watch?v=Lnm4wEzG7mQ)

## Hands-on

### `ls` 

+ Akronym für "list"
+ Dient zum Anzeigen einer Liste der aktuellen Verzeichnisse/Dateien innerhalb des Verzeichnisses, in dem man sich gerade befindet

`ls -l h*` 

Auflisten des Inhalts aller Dateiverzeichnisse, die mit "h" beginnen, im aktuellen Verzeichnis.

`-l` ist ein Parameter. Neben dem Dateinamen werden auch die Dateiberechtigungen, der Eigentümer, die Dateigröße usw. detailliert aufgelistet.

`ls  -alh  /home`

Listet die Größe aller Dateiverzeichnisse im /home-Verzeichnis in einem leicht verständlichen Format auf.
 
 ### `cd`
 
  Der Befehl cd ist eine Abkürzung für change directory, der das aktuelle Verzeichnis in das angegebene Verzeichnis wechselt.
 
 * `cd  /` ... system root directory
 * `cd ..` ... parent directory
 * `cd ~` ... user's home directory
 * `cd /hands-on` ... directory mit dem Namen "hands-on"
 
 ### `pwd`
 
Um den Pfad des aktuellen Verzeichnisses anzuzeigen.
 
 ### `mkdir`
 
 + `mkdir [options] directory`
 + Erzeugt ein neues Verzeichnis.
 + `mkdir  -p  directory1/directory2` ... -p --parents
 
 ### `rm`
  
  + Eine oder mehrere Dateien oder Verzeichnisse in einem Verzeichnis löschen
  + `rm` ist ein gefährlicher Befehl. Du kannst damit das gesamte System löschen.
  + `rm helloWorld.txt`
  + `rm   *.txt` Alle .txt Files mit der Endung .txt löschen.
   
 ### `mv`
 
 * Verschiebt Dateien oder ändert Dateinamen
 * `mv helloWorld.txt helloChristopher.txt` ... ändert den Dateinamen
 * `mv  helloWorld.txt directory1`
 
 ### `cp`
  
  * Kopieren eines Files.
  * `cp  -i  test1/*  test2` ... Kopieren Sie alle Dateien aus dem Verzeichnis test1 in das Verzeichnis test2.
 
 ### `cat`
 
 * Ausgabe eines Files oder standard input / standard output
 * Der Befehl cat ist eine Abkürzung für concatenate
 * `cat -n helloWorld.txt > helloWorldNew.txt`
 * `tac helloWorld.txt` ... So kehrst du den Inhalt von helloWorld.txt um.
 
 
 ###  `hexdump`
 
 