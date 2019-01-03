???Tabular is a Vim script for text alignment.
"----------------------------------------------------------------------------------

:TableModeToggle
:Tableize/;
"----------------------------------------------------------------------------------
<Leader>t	This is a prefix defined by the option |table-mode-map-prefix|
            used before all other table mode commands.
<Leader>tm	Toggle table mode for the current buffer. You can change this
            using the |toggle-mode-options-toggle-map| option.
<Leader>tt	Triggers |table-mode-commands-tableize| on the visually
            selected content.
<Leader>T	Triggers |table-mode-commands-tableize| on the visually
            selected asking for user to input the delimiter.
<Leader>tr	Realigns table columns
"----------------------------------------------------------------------------------


+------+---------+-------+
| name | address | phone |
+======+=========+=======+
| Alf  | teueto  | 0179  |
+------+---------+-------+
| Bob  | usa     | 0176  |
+------+---------+-------+
Enter the first line, delimiting columns by the | symbol.
The plugin reacts by inserting spaces between the text and the separator if you omit them:

| name | address | phone |

In the second line (without leaving Insert mode), enter | twice.
The plugin will write a properly formatted horizontal line:

+-----+-----+-----+
| bbc | def | ghi |
+=====+=====+=====+
| c   | b   | d   |
+-----+-----+-----+
| a   | b   | c   |
+-----+-----+-----+

  :Tabularize /,/r1c1l0

    abc , def, ghi
      c , b ,a
      a , b  ,  c

  :Tabularize /,


    abc , def, ghi
      c , b ,a
      a , b  ,  c

    abc ,def, ghi
      c , b,a
      a, b  ,  c


    abc , def
      c , b 
      a , b  ,  c
