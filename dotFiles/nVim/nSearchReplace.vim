:s/.*/<p>\r&\r<\/p>/ 	 Wrap the line between <p> and </p>
:-1s/–/\&mdash;/g 	 Replace every occurrence of the string ‘–‘ by ‘&mdash;’ in the preceding line

:/user-friendly/m$    Move match to the end of File

<div>

<table>

<tr><td>Pen name</td><td>Real name</td></tr>

<tr><td>Mark Twain</td><td>Samuel Clemens</td></tr>

<tr><td>Lewis Carroll</td><td>Charles Dodgson</td></tr>

<tr><td>Richard Bachman</td><td>Stephen King</td></tr>

</table>

<p>Many writers have chosen to write under a pen name.</p>

</div>
Commands
:/<table>/,/<\/table>/g/^$/d 	Delete empty lines between lines containing <table> and </table>
:/^$/;/^$/-1m1 	Move text between the next two empty lines after line 1 (notice the use of a semi-colon here)
:2,$-1> 	Raise indentation of text bewteen line 2 and the penultimate line

tee >(echo $(wc -l) most recent data) << EOT
Aug, 2016 2.11%
Sep, 2016 2.23%
Oct, 2016 2.18%
Nov, 2016 2.31%
Dec, 2016 2.21%
Jan, 2017 2.27%
Mar, 2016 1.78%
Apr, 2016 1.65%
May, 2016 1.79%
Jun, 2016 2.02%
Jul, 2016 2.33%
EOTLinux Market Share on Desktop
source: https://www.netmarketshare.com
Commands
:2,/^EOT/-1!sort -k2n -k1M 	Sort data by year and month
:$r! date “+Data obtained the \%c” 	Add the output of the date command at the end of the file
:1,/^EOT/!bash 	Execute the embedded script and replace it by its result
