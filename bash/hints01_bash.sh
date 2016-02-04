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

Продолжаем публикацию “однострочников” для bash, которые выполняют полезные и интересные действия :)

Список установленных расширений для Firefox

grep -hIr -m 1 em:name ~/.mozilla/firefox/*.default/extensions|sed 's#\s*##'|tr '<>=’ ‘”"”‘|cut -f3 -d’”‘|sort -u

Список установленных расширений для Chromium (с адресом страницы)

for i in $(find ~/.config/chromium/*/Extensions -name 'manifest.json'); do n=$(grep -hIr name $i| cut -f4 -d '"'| sort);u="https://chrome.google.com/extensions/detail/";ue=$(basename $(dirname $(dirname $i))); echo -e "$n:\n$u$ue\n" ; done

Уровень сигнала wifi

/sbin/iwconfig wlan0 | grep Quality | cut -d = -f2 | awk '{print $1}'

Оптимизация sqlite-баз, в которых Firefox хранит всякую служебную информацию. Позволяет немного ускорить его работу

find ~/.mozilla/firefox -name '*.sqlite' -print -exec sqlite3 {} "VACUUM; REINDEX;" \;

Количество процессов для пользователя (Linux only)

pgrep -cu boombick

Сравнить вывод двух команд

diff <(tail -10 file1) <(tail -10 file2)

Удалить все файлы, кроме одного :) Часто пригождается, чтобы не писать rm тут_куча-имен-файлов

ls -Q | grep -v "not-for-delete-file" | xargs rm -r

Собрать несколько тарболлов в один

cat 1.tar.gz 2.tar.gz | tar zxvif -

Размер окна терминала

echo $COLUMNS x $LINES

Вывести man-страницу как обычный текст. Удобно для распечатки

man need-man | col -bx





