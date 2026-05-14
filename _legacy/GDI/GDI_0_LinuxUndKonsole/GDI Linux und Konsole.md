* [Folien](https://docs.google.com/presentation/d/19MA1rJMhHQ3hxtFDUrhXvZUuCBKEy5BkVZzXSs9koZM/edit?usp=sharing)
* [Video](https://www.youtube.com/watch?v=Lnm4wEzG7mQ)

#linux #operatingsystem #console #gdi

## Assignment 

1.) Installiere eine Linux (Ubuntu) auf deinem Rechner oder in einer Virtual Box.

2.) Erstelle unter Verwendung der Konsole einen neuen Ordner mit deinem Namen. In diesem Ordner soll weiters ein .txt - File erstellt werden, das den Namen "HelloLinux.txt" hat. Mache einen Screenshot davon und lade diesen auf Moodle hoch. 

* Hast du ein macOS dann führe 2.) mit der bereits vorhanden Konsole durch (https://www.youtube.com/watch?v=aKRYQsKR46I). Die Virtual Box auszuprobieren ist aber dennoch sinnvoll.
  
* Du brauchst die Konsole für spätere Aufgaben in den Assignments. 

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

 **LINUX COMMANDS**

<table>
  <tr>
   <td><strong><em>Command + Syntax</em></strong>
   </td>
   <td><strong><em>Description</em></strong>
   </td>
   <td><strong><em>Addendum/Examples</em></strong>
   </td>
  </tr>
  <tr>
   <td><strong>whoami</strong>
   </td>
   <td>Show your username
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>pwd </strong>
   </td>
   <td>Show current directory
   </td>
   <td>‘Print working directory’
   </td>
  </tr>
  <tr>
   <td><strong>cd <em>dir</em></strong>
   </td>
   <td>Change directory
   </td>
   <td><strong>cd gams-local</strong>
<p>
  You will go to directory gams-local  \
(given that you are currently located in the parent directory)
<p>
<strong>cd ..</strong>
<p>
  Brings you to the parent directory
<p>
 <strong>Note: </strong>



<pre class="prettyprint">Navigating through directories
  If your path is like 'home/user/Documents/data/samples' and you are currently in the directory 'Documents', you will not be able to go to the directory 'samples' using the command cd samples - you will need to enter the full path from your current location:
 cd data/sample

  You can also navigate back one level in the hierarchy of your directories. For example, to go back from the current directory ('samples') to another directory with the path
'home/user/Documents/data/results/results2022' you could use:
cd ../results/results2022</pre>


   </td>
  </tr>
  <tr>
   <td><strong>.</strong>
   </td>
   <td>Reference to your current directory in a path 
   </td>
   <td><strong>./start.sh</strong>
<p>
<strong>   </strong>To run a program in the same folder you need to add the path reference.
   </td>
  </tr>
  <tr>
   <td><strong>cat <em>file</em></strong>
   </td>
   <td>Catalogue (=display) file content
   </td>
   <td><strong>cat start.sh</strong>
<p>
   Displays the content of start.sh
<p>
<strong> Small excursus: </strong>



<pre class="prettyprint">File endings .sh or .batch
  Files with this ending contain a package of commands to run. So, you don't have to enter these commands separately in the terminal.</pre>


   </td>
  </tr>
  <tr>
   <td><strong>mkdir<em> dir</em></strong>
   </td>
   <td>Make directory and set directory name
   </td>
   <td><strong>mkdir gams-local</strong>
<p>
<strong>  </strong>Makes a directory with the name <em>gams-local.</em>
   </td>
  </tr>
  <tr>
   <td><strong>git clone <em>URL project</em></strong>
   </td>
   <td>Clone a project to your local environment using git
   </td>
   <td><strong>git clone <a href="https://zimlab.uni-graz.at/gams/projects/projectname/gams-www.git">https://zimlab.uni-graz.at/gams/projects/corema/gams-www.git</a> corema</strong>
<p>
   You will need to name the URL and after this your project name which should also be a directory in your local system
   </td>
  </tr>
  <tr>
   <td><strong>sudo apt update</strong>
   </td>
   <td>Update the metadata from all software packages as root (administrator)
   </td>
   <td>You will be asked to enter your user password. 
<p>
 <strong>Note: </strong>



<pre class="prettyprint">Cursor not moving
  Even though the cursor will not move while typing, your input is registered.</pre>


   </td>
  </tr>
  <tr>
   <td><strong>sudo apt -y upgrade</strong>
   </td>
   <td>Upgrade all software packages as root (administrator)
   </td>
   <td>You will be asked to enter your user password. 
<p>
<strong>Options:</strong>

<table>
  <tr>
   <td><strong>-y</strong>
   </td>
   <td>Automatic ‘yes’ to prompts during upgrade
   </td>
  </tr>
</table>


**Note:**


```
About options/ parameters
  Commands can be used with certain parameters or options that are marked with dashes. You can always use the command man followed by a to 
```


**Small excursus:**


```
Yes-no-questions during installations
  When installing a program you might have to make decisions. Usually the terminal provides answers in this format [Y/n] or [y/N] - the letter that is capitalized is the default answer. So, if you want to say yes and your choice looks like [Y/n], you don't have to type 'Y', but you may just hit enter. 
```


   </td>
  </tr>
  <tr>
   <td>**&& **

   </td>
   <td>Run _cmd2_ if _cmd1_ is successful

   </td>
   <td>**sudo apt update && sudo apt -y upgrade**

** ** Runs update first and then the upgrade

   </td>
  </tr>
  <tr>
   <td>**sudo apt install _program_**

   </td>
   <td>Install a program as root (administrator)

   </td>
   <td>**install dos2unix **

**  **This command will install the program dos2unix (without packaging tool)

**Note: **


```
Avoiding format problems 
  DOS-based text files use other new-line delimiters than UNIX-based files. 
So, you might want to install the dos2unix package to convert text files in DOS format to UNIX format. 
```


   </td>
  </tr>
  <tr>
   <td>**apt-get install _program_**

   </td>
   <td>Install a program using the advanced packaging tool

   </td>
   <td>**apt-get install git **

  This command will install the git package using the packaging tool of Ubuntu

**Note:**


```
About apt (advanced packaging tool)
  Ubuntu uses a packaging system to provide programs and applications for installation and apt is the command line to interact with this packaging system.

Most common apt commands:
apt-get (for installing, upgrading and cleaning) 
apt-cache search (for finding new packages)
```


   </td>
  </tr>
  <tr>
   <td>**brew install _program_**

   </td>
   <td>Install a program on Mac \


   </td>
   <td>**brew install git**

**  **This command will install git using the homebrew package manager

**Note:                                       **[MAC ONLY]


```
Homebrew
  This software package management system simplifies the installation of software on the Mac OS X operating system. 
```


   </td>
  </tr>
  <tr>
   <td>_program** --version**_

   </td>
   <td>Provide info about version; 

   </td>
   <td>**docker --version**

** ** You can find out the version of Docker

   </td>
  </tr>
  <tr>
   <td>_program** --list **_

   </td>
   <td>See a list of distributions of a program

   </td>
   <td>**wsl --list **

**  **Get a list of Linux distributions

**Note:**


```
Single and double dash
  Options can be specified with either a single dash (-) or a double dash (--). A single dash can be followed by any number of single-character flags, while a double dash can be followed only by a single, multi-character option.

This would be the same options chosen, but in different notations:
wsl --list --size 
wsl -ls
```


   </td>
  </tr>
  <tr>
   <td>_program **--verbose**_

   </td>
   <td>Provide additional details as to what the computer is doing and what drivers and software it is loading during startup

   </td>
   <td>**wsl --list --verbose**

  You will get additional information as described about the program WSL 

**Note:                                       **


```
It should always show Version 2
```


   </td>
  </tr>
</table>


**Docker Commands**


<table>
  <tr>
   <td><strong><em>Abbreviation</em></strong>
   </td>
   <td><strong><em>Description</em></strong>
   </td>
   <td><strong><em>Addendum/Syntax/Examples</em></strong>
   </td>
  </tr>
  <tr>
   <td><strong>docker-compose ps</strong> 
   </td>
   <td>Show running processes
   </td>
   <td rowspan="3" ><strong>Note:</strong>
<p>
   You can always use Docker Desktop to see the processes and to start/stop containers instead of entering commands in the terminal                                



<pre class="prettyprint">Check Docker process 
  All process state should be "Up"


Please shut down 
and don't shoot down Docker
  You should always terminate Docker properly and use the command above
OR shut down Docker using the command shut down docker OR just close Docker Desktop.

Alternatively use: ./stop.sh   </pre>


   </td>
  </tr>
  <tr>
   <td><strong>docker-compose up</strong>
   </td>
   <td>Builds, (re)creates, starts & attaches to containers for a service
   </td>
  </tr>
  <tr>
   <td><strong>docker-compose down</strong>
   </td>
   <td>Stops containers and removes containers, networks, volumes etc.
   </td>
  </tr>
</table>


**Permissions (How to read them)**


<table>
  <tr>
   <td><strong><em>Abbreviation</em></strong>
   </td>
   <td><strong><em>Description</em></strong>
   </td>
   <td><strong><em>Addendum/Syntax/Examples</em></strong>
   </td>
  </tr>
  <tr>
   <td><strong>r</strong>
   </td>
   <td>read
   </td>
   <td rowspan="4" ><strong>d rwx rwx rwx  </strong>
<p>
 
<p>
permission order: 
<p>
1<sup>st </sup>triple = for user(owner)
<p>
2<sup>nd </sup>triple = for group 
<p>
3<sup>rd </sup>triple = for others
   </td>
  </tr>
  <tr>
   <td><strong>w</strong>
   </td>
   <td>write
   </td>
  </tr>
  <tr>
   <td><strong>x</strong>
   </td>
   <td>execute
   </td>
  </tr>
  <tr>
   <td><strong>d </strong>
   </td>
   <td>directory
   </td>
  </tr>
</table>


**Important Shell Shortcuts**


<table>
  <tr>
   <td>TAB
   </td>
   <td>Autocomplete file and directory names
   </td>
  </tr>
  <tr>
   <td>Right click
   </td>
   <td>Paste copied text  \
Note: [CTRL]+[V] is not working on the command line
   </td>
  </tr>
  <tr>
   <td>Arrow key Up
   </td>
   <td>Recall previously-entered commands to command line, edit and re-issue them
   </td>
  </tr>
  <tr>
   <td>CTRL + [C]
   </td>
   <td>Stop current command
   </td>
  </tr>
  <tr>
   <td>[CTRL]+[A]
   </td>
   <td>Go to start of line
   </td>
  </tr>
  <tr>
   <td>[CTRL]+[E]
   </td>
   <td>Go to end of line
   </td>
  </tr>
  <tr>
   <td>!!
   </td>
   <td>Repeat last command
   </td>
  </tr>
</table>




**General Overview of Important Commands**

**Software**


<table>
  <tr>
   <td><strong><em>Command</em></strong>
   </td>
   <td><strong><em>Description</em></strong>
   </td>
   <td><strong><em>Addendum/Syntax/Examples</em></strong>
   </td>
  </tr>
  <tr>
   <td><strong>apt-get install</strong>
   </td>
   <td>Install software
   </td>
   <td><strong>apt-get install <em>package</em></strong>
<p>
<em>   </em>Install <em>package</em>
   </td>
  </tr>
  <tr>
   <td><strong>apt-get update</strong>
   </td>
   <td>Update all packages
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>apt-get upgrade</strong>
   </td>
   <td>Upgrade all packages
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>apt-get dist-upgrade</strong>
   </td>
   <td>Upgrade packages and handle changing dependencies with new versions of a package
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>apt-get remove</strong>
   </td>
   <td>Remove software
   </td>
   <td><strong>apt-get remove <em>package</em></strong>
<p>
<em>   </em>Remove <em>package</em>
   </td>
  </tr>
  <tr>
   <td><strong>apt-cache search</strong>
   </td>
   <td>Search for software
   </td>
   <td><strong>apt-cache search <em>package \
  </em></strong>Search for <em>package - </em>you must at least enter one letter to start the search. 
<p>
 \
Example: 



<pre class="prettyprint">apt-cache search python
  This will show you all available software that have 'python' in their name</pre>


   </td>
  </tr>
</table>


**Note: **Usually for these commands you need root permissions. In Ubuntu you can put** sudo** before those apt commands. (Some of these commands are only available for certain Linux distributions.)

**(User) Administration**


<table>
  <tr>
   <td><strong><em>Command</em></strong>
   </td>
   <td><strong><em>Description</em></strong>
   </td>
   <td><strong><em>Addendum/Syntax/Examples</em></strong>
   </td>
  </tr>
  <tr>
   <td><strong>sudo</strong> 
   </td>
   <td>Do something as root
<p>
(“substitute user do”)
   </td>
   <td><strong>sudo</strong> <em>cmd</em>
<p>
  Start <em>cmd</em> as root
   </td>
  </tr>
  <tr>
   <td><strong>sudo -s</strong>
   </td>
   <td>Open shell as root
   </td>
   <td><strong>sudo -s -u</strong> <em>user</em>
<p>
<em>  </em>Open shell as <em>user</em>
<p>
<strong>Note:</strong>



<pre class="prettyprint">About $ and #
If there is a dollar sign $ after the path in your terminal, you are using the shell as user
A hashtag # indicates that you are currently working as root</pre>


   </td>
  </tr>
  <tr>
   <td><strong>whoami</strong>
   </td>
   <td>Show your username
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>passwd</strong>
   </td>
   <td>Change your password
   </td>
   <td>
   </td>
  </tr>
</table>




**Shell Commands**


<table>
  <tr>
   <td><strong><em>Command</em></strong>
   </td>
   <td><strong><em>Description</em></strong>
   </td>
   <td><strong><em>Addendum/Syntax/Examples</em></strong>
   </td>
  </tr>
  <tr>
   <td><strong>uname -a</strong>
   </td>
   <td>Show system and kernel
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>date</strong>
   </td>
   <td>Show system date
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>uptime</strong>
   </td>
   <td>Show uptime
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>man </strong>
   </td>
   <td>Show manual (for a command or an application)
   </td>
   <td><strong>man <em>command</em></strong>
<p>
  Show manual for <em>command</em>
<p>
<strong>Example:</strong>



<pre class="prettyprint">man ls
  Show manual with all options for the command ls.</pre>


   </td>
  </tr>
  <tr>
   <td><strong>which</strong>
   </td>
   <td>Identify the location of a given executable file or program
   </td>
   <td><strong>which <em>executable</em></strong>
<p>
<em>  </em>Show location of the executable file
<p>
<strong>Example:</strong>



<pre class="prettyprint">which man
  Show location of manual (eg. /usr/bin/man)</pre>


   </td>
  </tr>
</table>



### **Directory Operations**


<table>
  <tr>
   <td><strong><em>Command</em></strong>
   </td>
   <td><strong><em>Description</em></strong>
   </td>
   <td><strong><em>Addendum/Syntax/Examples</em></strong>
   </td>
  </tr>
  <tr>
   <td><strong>pwd</strong>
   </td>
   <td>Show current directory
   </td>
   <td>‘Print working directory’
   </td>
  </tr>
  <tr>
   <td><strong>mkdir</strong>
   </td>
   <td>Make directory
   </td>
   <td><strong>mkdir <em>dir</em></strong>
<p>
  Make directory with the name <em>dir</em>
<p>
<strong><em>mkdir -p dir1/dir2</em></strong>
<p>
<em>  </em>Make a directory with the name <em>dir1</em> and in this parent directory make another one named <em>dir2</em>
   </td>
  </tr>
  <tr>
   <td><strong>cd</strong>
   </td>
   <td>Change directory
   </td>
   <td><strong>cd <em>dir</em></strong>
<p>
  Go to directory with the name <em>dir</em>
<p>
<strong>Path options:</strong>

<table>
  <tr>
   <td><strong>cd .</strong>
   </td>
   <td>Used in path as reference to current directory - so you will not move
   </td>
  </tr>
  <tr>
   <td><strong>cd ..</strong>
   </td>
   <td>Used in path as reference to parent directory - so you will move to the parent directory
   </td>
  </tr>
  <tr>
   <td><strong>cd ~</strong>
   </td>
   <td>Used in path as reference for user’s home directory - so you will get back to the home directory
   </td>
  </tr>
</table>


   </td>
  </tr>
  <tr>
   <td>**ls**

   </td>
   <td>List files

   </td>
   <td>**ls _dir_**

  This command will show you all directories and files in the directory with the name _dir_

**Options:**


<table>
  <tr>
   <td><strong>-a</strong>
   </td>
   <td>Show all (including hidden)
   </td>
  </tr>
  <tr>
   <td><strong>-h</strong>
   </td>
   <td>Human-readable
   </td>
  </tr>
  <tr>
   <td><strong>-l</strong>
   </td>
   <td>Long listing format (with details)
   </td>
  </tr>
  <tr>
   <td><strong>-1</strong>
   </td>
   <td>One file per line
   </td>
  </tr>
  <tr>
   <td><strong>-t</strong>
   </td>
   <td>Sort by last modified
   </td>
  </tr>
  <tr>
   <td><strong>-S</strong>
   </td>
   <td>Sort by file size
   </td>
  </tr>
  <tr>
   <td><strong>-m</strong>
   </td>
   <td>Comma-­sep­arated output
   </td>
  </tr>
  <tr>
   <td><strong>-Q</strong>
   </td>
   <td>Quoted output
   </td>
  </tr>
</table>


**Examples:**


<table>
  <tr>
   <td><strong>ls Documents</strong> \
  You will see all directories and files in the directory Documents
   </td>
  </tr>
  <tr>
   <td><strong>ls -alh /home</strong>
<p>
  This command will list the size of all files (-a) in the <em>home </em>directory in a long listing (-l) and human-readable (-h) format 
   </td>
  </tr>
</table>


   </td>
  </tr>
  <tr>
   <td>**tree**

   </td>
   <td>Display directory structure as tree

   </td>
   <td>You will maybe first have to install it: \
**sudo apt install tree**

   </td>
  </tr>
  <tr>
   <td>**locate**

   </td>
   <td>Find file

   </td>
   <td>**locate _file_**

_  _Quick search of system index - it will show you the full path to the wanted file

   </td>
  </tr>
  <tr>
   <td>**find**

   </td>
   <td>Find certain files in directory structure

   </td>
   <td>**find _dir_ -iname _file  _**

  Shows you file location (path from your current position) - similar to cmd _locate_

   </td>
  </tr>
</table>



### 


### **File Operations**


<table>
  <tr>
   <td><strong><em>Command</em></strong>
   </td>
   <td><strong><em>Description</em></strong>
   </td>
   <td><strong><em>Addendum/Syntax/Examples</em></strong>
   </td>
  </tr>
  <tr>
   <td><strong>touch</strong>
   </td>
   <td>Create a file
   </td>
   <td><strong>touch</strong> <em>file1</em>
<p>
  Create <em>file1</em>
   </td>
  </tr>
  <tr>
   <td rowspan="2" ><strong>cat</strong>
   </td>
   <td>Concat­enate output of two files
   </td>
   <td><strong>cat <em>file1</em></strong> <em>file2</em>
<p>
<em>  </em>Shows concatenated content of <em>file1</em> and <em>file2 </em>as output in terminal
   </td>
  </tr>
  <tr>
   <td>Catalogue (=display) file content
   </td>
   <td><strong>cat <em>file1</em></strong>
<p>
<em>  </em>Show content of <em>file1</em>
   </td>
  </tr>
  <tr>
   <td><strong>file</strong>
   </td>
   <td>Get type of a file
   </td>
   <td><strong>file</strong> <em>file1</em>
<p>
  Get type of <em>file1</em>
   </td>
  </tr>
  <tr>
   <td><strong>nano</strong>
   </td>
   <td>Edit text file
   </td>
   <td><strong>nano<em> file1</em></strong>
<p>
<em>  </em>Edit text of <em>file1 </em>
   </td>
  </tr>
  <tr>
   <td><strong>grep</strong>
   </td>
   <td>Find a search term or pattern in a file
   </td>
   <td><strong>grep <em>pattern file1</em></strong>
<p>
<em>  </em>It will show you the whole line containing the wanted pattern (colored in red)
<p>
<strong>Options:</strong>

<table>
  <tr>
   <td>-i
   </td>
   <td>Case insens­itive search
   </td>
  </tr>
  <tr>
   <td>-o
   </td>
   <td>Show matched part of file only
   </td>
  </tr>
  <tr>
   <td>-r
   </td>
   <td>Recursive search
   </td>
  </tr>
</table>


   </td>
  </tr>
  <tr>
   <td>**cp**

   </td>
   <td>Copy files

   </td>
   <td>**cp** _file1_ _file2_

  Copy content of _file1_ to _file2 _

**Important: **


```
  The content of file1 will be overwritten!
```


   </td>
  </tr>
  <tr>
   <td rowspan="2" >**mv**

   </td>
   <td>Move a file

   </td>
   <td>**mv _file1_** _dir1_


    Move _file1_ to _dir1 _

**Important: **


```
  You have to be in the directory where the file that you want to move is currently stored.
Also, if the directory where you want to move the file to does not exist, your file will be renamed (see option above for the cmd mv.
```


   </td>
  </tr>
  <tr>
   <td>Change file name

   </td>
   <td>**mv _file1_** _file2_

 Change file with name _file1_ to _file2_

   </td>
  </tr>
  <tr>
   <td>**unlink**

   </td>
   <td>Delete a file

   </td>
   <td>Without options (unlike with rm)

   </td>
  </tr>
  <tr>
   <td>**rm**

   </td>
   <td>Delete a file or directory (without recovery option!)

   </td>
   <td>**rm** _file1_


    Delete _file1_

**rm -r_ dir1_**


      Delete _dir1_

**rmdir _dir1_**

_  _Delete_ dir1 _if this directory is empty

**rm_ *.txt_**

_  _Delete all files ending on_ ‘.txt’_

**Important: **


```
  Be very careful with rm commands! You will not be asked, if you are sure to delete all these files and there is no undo! 
```


   </td>
  </tr>
  <tr>
   <td>**shred**

   </td>
   <td>Overwrite your file in a way that makes them very difficult to recover by a third party

   </td>
   <td>**shred** _file1_

  Shreds your file and makes it unreadable.

**Note: **


```
  When you just delete a file, that portion of the disk is marked as being ready for another file to be written to it, but the data is still there. Using advanced techniques a third party with physical access to your disk could still access your "deleted" data.
```


   </td>
  </tr>
  <tr>
   <td>**head**

   </td>
   <td>Show first 10 lines of a file

   </td>
   <td>**head** _file1_


    Show first 10 lines of _file1_

**Options:**


<table>
  <tr>
   <td>-n<em>NUM</em>
   </td>
   <td>Show the first NUM lines
<p>
Example: <em>head -n20</em> (shows first 20 lines)
   </td>
  </tr>
</table>


   </td>
  </tr>
  <tr>
   <td>**tail**

   </td>
   <td>Show last 10 lines of a file

   </td>
   <td>**tail** _file1_


    Show last 10 lines of _file1_

**Options:**


<table>
  <tr>
   <td>-n<em>NUM</em>
   </td>
   <td>Show the last NUM lines 
   </td>
  </tr>
  <tr>
   <td>-f
   </td>
   <td>Show appended data as the file grows
   </td>
  </tr>
</table>


   </td>
  </tr>
  <tr>
   <td>**less**

   </td>
   <td>View and paginate

   </td>
   <td>**less** _file1_


    View and paginate _file1_


    (Use “q” for quit to get out of the file)

   </td>
  </tr>
</table>


**Process Management**


<table>
  <tr>
   <td><strong><em>Command</em></strong>
   </td>
   <td><strong><em>Description</em></strong>
   </td>
   <td><strong><em>Addendum/Syntax/Examples</em></strong>
   </td>
  </tr>
  <tr>
   <td><strong>ps</strong>
   </td>
   <td>Show snapshot of all running processes
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>htop</strong>
   </td>
   <td>Show real time processes/memory
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>mount</strong>
   </td>
   <td>Show mounted filesystems
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>df</strong>
   </td>
   <td>Display the amount of free disk space on the file system
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>du</strong>
   </td>
   <td>Display the amount of disk usage
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>free</strong>
   </td>
   <td>Display use of RAM
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>info</strong>
   </td>
   <td>Show a help file
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>clear</strong>
   </td>
   <td>Clear current input screen
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td><strong>whatis</strong>
   </td>
   <td>Short description of a program
   </td>
   <td><strong>whatis <em>program</em></strong>
<p>
<em>  </em>Gives you a short description of a program
   </td>
  </tr>
  <tr>
   <td><strong>whereis </strong>
   </td>
   <td>Find binary / source / manual for <em>command</em>
   </td>
   <td><strong>whereis <em>comm</em></strong>
<p>
<em>   </em>Displays the path to <em>command</em>
<p>
<strong>whereis<em> package</em></strong>
<p>
<em>   </em>Displays the path to <em>package</em>
   </td>
  </tr>
  <tr>
   <td><strong>kill</strong>
   </td>
   <td>Kill a process
   </td>
   <td><strong>Options:</strong>

<table>
  <tr>
   <td><strong>kill</strong> <em>pid</em>
   </td>
   <td>Kill process with id <em>pid</em>
   </td>
  </tr>
  <tr>
   <td><strong>pkill <em>name</em></strong>
   </td>
   <td>Kill process with name <em>name</em>
   </td>
  </tr>
  <tr>
   <td><strong>killall</strong> <em>name</em>
   </td>
   <td>Kill all processes with names beginning <em>name</em>
   </td>
  </tr>
</table>


   </td>
  </tr>
  <tr>
   <td>**exit**

   </td>
   <td>Terminate a script, a terminal or a unix-network

   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>**reboot**

   </td>
   <td>Reboot computer

   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>**shutdown**

   </td>
   <td>Shut down computer

   </td>
   <td>**shutdown -h now**

**shutdown halt**

**    **Shut down immediately

**shutdown -h _mm_**

_   _Shut down in _mm_ minutes

**shutdown -h _hh:mm_**

_   _Shut down at certain time _hh:mm_

   </td>
  </tr>
</table>




**Redirections**


<table>
  <tr>
   <td><em>cmd</em> <strong>&lt;</strong> <em>file</em>
   </td>
   <td>Input of <em>cmd</em> from <em>file</em>
   </td>
  </tr>
  <tr>
   <td><em>cmd1</em> <strong>&lt;</strong>(<em>cmd2</em>)
   </td>
   <td>Output of <em>cmd2</em> as file input to <em>cmd1</em>
   </td>
  </tr>
  <tr>
   <td><em>cmd</em> <strong>></strong> <em>file</em>
   </td>
   <td>Standard output (stdout) of <em>cmd</em> to <em>file</em>
   </td>
  </tr>
  <tr>
   <td><em>cmd</em> <strong>></strong> /dev/null
   </td>
   <td>Discard standard output of <em>cmd</em>
   </td>
  </tr>
  <tr>
   <td><em>cmd</em> <strong>>></strong> <em>file</em>
   </td>
   <td>Append standard output to <em>file</em>
   </td>
  </tr>
  <tr>
   <td><em>cmd</em> 2 <strong>></strong> <em>file</em>
   </td>
   <td>Error output of <em>cmd</em> to <em>file</em>
   </td>
  </tr>
  <tr>
   <td><em>cmd</em> <strong>&></strong> <em>file</em>
   </td>
   <td>Every output of <em>cmd</em> to <em>file</em>
   </td>
  </tr>
</table>



### **Pipes**


<table>
  <tr>
   <td><em>cmd1<strong> |</strong></em> <em>cmd2</em>
   </td>
   <td>Standard output of <em>cmd1</em> to <em>cmd2</em>
   </td>
  </tr>
  <tr>
   <td><em>cmd1</em> <strong>|&</strong> <em>cmd2</em>
   </td>
   <td>Standard error messages of <em>cmd1</em> to <em>cmd2</em>
   </td>
  </tr>
</table>



### **Command Lists**


<table>
  <tr>
   <td><em>cmd1</em> <strong>;</strong> <em>cmd2</em>
   </td>
   <td>Run <em>cmd1</em> then <em>cmd2</em>
   </td>
  </tr>
  <tr>
   <td><em>cmd1</em> <strong>&&</strong> <em>cmd2</em>
   </td>
   <td>Run <em>cmd2</em> if <em>cmd1</em> is successful
   </td>
  </tr>
  <tr>
   <td><em>cmd1</em> <strong>|| <em>cmd2</em></strong>
   </td>
   <td>Run <em>cmd2</em> if <em>cmd1</em> is not successful
   </td>
  </tr>
  <tr>
   <td><em>cmd</em> <strong>&</strong>
   </td>
   <td>Run <em>cmd</em> in a subshell
   </td>
  </tr>
</table>


**Nano Shortcuts**


<table>
  <tr>
   <td colspan="2" ><strong>Files</strong>
   </td>
   <td colspan="2" ><strong>Cut and Paste</strong>
   </td>
  </tr>
  <tr>
   <td>[CTRL]+[R]
   </td>
   <td>Read file
   </td>
   <td>[ALT]+[A]
   </td>
   <td>Start marking text
   </td>
  </tr>
  <tr>
   <td>[CTRL]+[O]
   </td>
   <td>Save file
   </td>
   <td>[CTRL]+[K]
   </td>
   <td>Cut marked text or line
   </td>
  </tr>
  <tr>
   <td>[CTRL]+[X]
   </td>
   <td>Close file
   </td>
   <td>[CTRL]+[U]
   </td>
   <td>Paste text
   </td>
  </tr>
  <tr>
   <td colspan="2" >
   </td>
   <td colspan="2" >
   </td>
  </tr>
  <tr>
   <td colspan="2" ><strong>Navigate File</strong>
   </td>
   <td colspan="2" ><strong>Search File</strong>
   </td>
  </tr>
  <tr>
   <td>[ALT]+[/]
   </td>
   <td>End of file
   </td>
   <td>[CTRL]+[W]
   </td>
   <td>Find
   </td>
  </tr>
  <tr>
   <td>[CTRL]+[A]
   </td>
   <td>Beginning of line
   </td>
   <td>[ALT]+[W]
   </td>
   <td>Find next
   </td>
  </tr>
  <tr>
   <td>[CTRL]+[E]
   </td>
   <td>End of line
   </td>
   <td>[CTRL]+[\]
   </td>
   <td>Search and replace
   </td>
  </tr>
  <tr>
   <td>[CTRL]+[C]
   </td>
   <td>Show line number
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
  <tr>
   <td>[CTRL]+[_]
   </td>
   <td>Go to line number
   </td>
   <td>
   </td>
   <td>
   </td>
  </tr>
</table>


 
 