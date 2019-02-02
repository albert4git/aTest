1. Копирование файлов с указанием прогресса. Всегда чертовски не хватало информативности в cp
rsync --progress file1 file2

2. Преобразование текста в картинку. Использовал для создания простенькой капчи

echo -e "Some Text Line1\nSome Text Line 2" | convert -background none -density 196 -resample 72 -unsharp 0x.5 -font "Courier" text:- -trim +repage -bordercolor white -border 3 text.gif

3. Поиск и замена в текстовых файлах

find . -iname "FILENAME" -exec sed -i 's/SEARCH_STRING/REPLACE_STRING/g' {} \;

4. Метод Столлмана! Отправка веб-странички по почте :)

{ u="http://twitter.com/boombick"; echo "Subject: $u"; echo "Mime-Version: 1.0"; echo -e "Content-Type: text/html; charset=utf-8\n\n"; curl $u ; } | sendmail recipient@example.com

5. Запись iso-файла на диск

cdrecord -v speed=4 driveropts=burnfree dev=/dev/scd0 cd.iso

6. Ограничение канала для scp. В данном случае ограничен 10kbps

scp -l10 boombick@srv02:/home/svnstat/* .

7. Скриншот на удаленной машине :) (С запущенными иксами конечно)

DISPLAY=":0.0" import -window root screenshot.png

8. Качаем и сразу распаковываем :)

wget -qO - http://example.com/path/to/blah.tar.gz | tar xzf -

9. url_encode :) Достаточно примитивно, но часто помогает

echo "$url" | sed 's/%/%25/g;s/ /%20/g;s/!/%21/g;s/"/%22/g;s/#/%23/g;s/\$/%24/g;s/\&/%26/g;s/'\''/%27/g;s/(/%28/g;s/)/%29/g'

10. Погода в Москве :) Подставьте свой город

curl -s "http://www.google.com/ig/api?weather=Moscow" | sed 's|.*<temp_c data="\([^"]*\)"/>.*|\1|'

Пока все, to be continued


Консольные хитрости #2
echo "HHHHHallo"
echo "HHHHHallo"
echo "HHHHHallo"

Продолжаем публикацию “однострочников” для bash, которые выполняют полезные и интересные действия :)


Список установленных расширений для Chromium (с адресом страницы)

for i in $(find ~/.config/chromium/*/Extensions -name 'manifest.json'); do n=$(grep -hIr name $i| cut -f4 -d '"'| sort);u="https://chrome.google.com/extensions/detail/";ue=$(basename $(dirname $(dirname $i))); echo -e "$n:\n$u$ue\n" ; done

Уровень сигнала wifi

/sbin/iwconfig wlan0 | grep Quality | cut -d = -f2 | awk '{print $1}'

Оптимизация sqlite-баз, в которых Firefox хранит всякую служебную информацию. Позволяет немного ускорить его работу

find ~/.mozilla/firefox -name '*.sqlite' -print -exec sqlite3 {} "VACUUM; REINDEX;" \;

Количество процессов для пользователя (Linux only)

pgrep -cu red

Сравнить вывод двух команд

diff <(tail -10 file1) <(tail -10 file2)

Удалить все файлы, кроме одного :) Часто пригождается, чтобы не писать rm тут_куча-имен-файлов

ls -Q | grep -v "not-for-delete-file" | xargs rm -r

Собрать несколько тарболлов в один

cat 1.tar.gz 2.tar.gz | tar zxvif -

Размер окна терминала

echo $COLUMNS x $LINES

Вывести man-страницу как обычный текст. Удобно для распечатки

man ls | col -bx

########################################################
# Color 4Mac Terminal

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

#
########################################################
# Mount
mount /dev/sdb1 /u01
примеры использования loop

iso образ
mount -o loop ./image.iso /mnt/iso

можно сделать файлик а в нем свою файловую систему, … ну например на 20 мегабайт

#делаем файлик 5120*4096=20mb
dd if=/dev/zero of=./myfs count=5120 bs=4096
#форматируем его
mkfs.ext2 ./myfs
#монтируем
mount -o loop ./myfs /mnt/myfs/
клонирую машины обычно с помощью rsync, но если тупо отдать / клонированная система не будет работать,
т.к. подмонтированны некоторые системные файловые системы
выручает —bind можно прибиндить корень, таким как он есть в оригинале, без примонтированных файловых систем, например в /mnt/clone
или некоторое ПО слишком дословно понимает симлинки хочеш скопровать папку а оно симлинк копирует, тут тоже помогает bind

mount --bind / mnt/clone
также есть —rbind в отличае от —bind он будет биндить рекусивно все ФС которые были в источнике, отмонтировать потом тяжко обычно :)

еще очень интересная команда —move атомарно перенесет точку монтирования в другую папку
mount --move /u01 /u02

1. Ведение лога истории с datestampом:
export HISTTIMEFORMAT='%F %T'

2. Занесение команды в .bash_history сразу же, после нажатия enter (а не после завершения сеанса), что весьма удобно при одновременной работе в нескол#
PROMPT_COMMAND='history -a;history -n'

3. Удобная настройка PS1 (чтобы было видно и юзера/хост и желательно дату и время [у меня некоторые сессии висят неделями])
export PS1='\033[00;32m\][`date +%d" "%h" "%Y" "%T`] \u@\h \w\n \$\[\033[00m\] '
•
4. Увеличение размера хистори (при активной работе 500 — это очень мало)
export HISTSIZE=100500

5. Говорим башу не заносить в хистори повторяющиеся друг за другом команды:
export HISTCONTROL=ignoredups

6. Отключаем занесение «бесполезных» с точки зрения истории команд:
export HISTIGNORE="&:ls:[bf]g:exit:[  ]*:ssh:history"

7. Используем «сокращения» для популярных комманд:
alias u='sudo pacman -Syu'
alias extmonitor='xrandr --output VGA1 --auto --primary && xrandr --rate 72 && xrandr --output LVDS1 --off'
alias intmonitor='xrandr --output LVDS1 --auto --primary && xrandr --output VGA1 --offdd'

#=====================================
echo $SHELL
which bash

echo `date`
echo $(date)
echo $[365*24]
# use backticks " ` ` " to execute shell command

#=====================================
if [ -f /tmp/foo.txt ]
then
    echo the file exists
fi

if [ -f /tmp/foo.txt ]
then
    echo the file exists
else
    echo the file does not exist
fi

# And finally, if you want to check if a file does not exist, then you can do this:
if [ ! -f /tmp/foo.txt ]
then
    echo the file does not exist
fi
#=====================================
#!/bin/sh 
set -x 
COUNT=0 
while [ ${COUNT} -le 5 ] 
do 
  echo "COUNT=${COUNT}" 
  read 
  COUNT=`expr ${COUNT} + 1` 
done
#=====================================
   #!/bin/bash
    for i in $( ls ); do
        echo item: $i
    done
#=====================================
    #!/bin/bash 
     COUNTER=0
     while [  $COUNTER -lt 10 ]; do
         echo The counter is $COUNTER
         let COUNTER=COUNTER+1 
     done
#=====================================
    #!/bin/bash 
     COUNTER=20
     until [  $COUNTER -lt 10 ]; do
         echo COUNTER $COUNTER
         let COUNTER-=1
     done
#=====================================
FILES="file1 /path/to/
file2 /etc/resolv.conf"
for f in $FILES
do
	echo "Processing $f"
done
#=====================================
#!/bin/bash
FILES=/Users/neuro/aTest/aTest/bash/*
for f in $FILES
do
  echo "Processing $f file..."
  # take action on each file. $f store current file name
  cat $f
done
#=====================================
#!/bin/bash
for i in {1..5}
do
   echo "Welcome $i times"
done
#=====================================
#!/bin/bash
echo "Bash version ${BASH_VERSION}..."
#=====================================
#!/bin/bash #evry thecond
for i in $(seq 1 2 20)
do
   echo "Welcome $i times"
done
#=====================================
#!/bin/bash
FILES="$@"
for f in $FILES
do
        # if .bak backup file exists, read next file
	if [ -f ${f}.bak ]
	then
		echo "Skiping $f file..."
		continue  # read next file and skip cp command
	fi
        # we are hear means no backup file exists, just use cp command to copy file
	/bin/cp $f $f.bak
done
#=====================================
printenv
#=====================================
full_name="Franky M. Singh"
# bash
echo $full_name
# exit
export full_name
echo $full_name
export full_name="Charles the Great"
echo $full_name
#=====================================
grep dictionary /usr/share/dict/words
grep dictionary /home/red/Desktop/dikis/words.txt
echo $_
echo $$
echo $0
#=====================================
# create an archive of a directory
tar cf directory.tar directory/
# create an archive of a bunch of files
tar cf directory.tar file1 file2 file3
# tar only the .mp3s in the current directory into a bzip compressed archive
tar -cvf mp3collection.tar ./*.mp3
# create an archive of the /home/daniel/ directory while preserving permissions
tar cvpf daniel.tar /home/daniel/
# create an archive of the /etc directory, but exclude the apache2 directory
tar cvf etc_without_apache.tar –exclude=’/etc/apache2/’

# create a bzip2 compressed archive, verbosely
tar cjvf directory.tar.bz2 directory/
# create a gzip compressed archive, verbosely
tar czvf directory.tar.gz directory/

# view the contents of the directory archive
tar tvf directory.tar.bz2
#=====================================
## Extracting Archives
# extract the directory archive, veosely 1
tar xvf directory.tar.bz2
# extract only the passwd file out of the etc.tar.bz2 archive
tar xvf etc.tar.bz2 passwd
# extract only the passwd file out of the etc.tar.bz2 archive
tar xvf etc.tar.bz2 passwd
# extract only the postfix directory out of the etc.tar.bz2 archive
tar xvf etc.tar.bz2 /etc/postfix/
# extract only the php files out of the htdocs.tar.bz2 archive
tar xvf htdocs.tar.bz2 –wildcards ‘*.php’

Diffing
# diff the archive against the filesystem
tar df directory.tar.bz2
#=====================================
#=====================================
echo "run run ..."
echo "run run ..."
echo "run run ..."
echo "run run ..."
