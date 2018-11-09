
"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
"AAA----------------------------------------------------------------------------------------------"
VimTip	{{{1 651: Edit gnupg-encrypted files.
http://vim.sourceforge.net/tip_view.php?tip_id=

It can be somewhat laborious to edit a file which you have encrypted: first you
have to decrypt to plaintext, then use vim and save; then encrypt again.  The
method below lets vim take care of some of the dirty work.

First, be sure you have gnupg setup to the point where you can ascii-armor
encrypt a file using your own public key, and decrypt it again.

Then put this into your .vimrc (don't duplicate the 'if has("autocmd")' part if it is already there):
  if has("autocmd")
      augroup GPGASCII
         au!
         au BufReadPost *.asc  :%!gpg -q -d
         au BufReadPost *.asc  |redraw
         au BufWritePre *.asc  :%!gpg -q -e -a
         au BufWritePost *.asc u
         au VimLeave *.asc :!clear
      augroup END
  endif " has ("autocmd")
 
you might also want to add these options to your ~/.gnupg/options file to
decrease the messages gnupg outputs:

    no-greeting
    quiet
    default-recipient-self  #to always encrypt for yourself.

Now vim a new file, the name of which ends with .asc:
     vim important.asc

and edit.  When you save and quit, gnupg may prompt for gnupg ids to encrypt
for (if you don't have default-recipient-self set).  Enter your own.  To edit,
  just vim it again and you'll be prompted for your passphrase.

This isn't perfect -- in particular, you occasionally have to tell vim to
redraw with ctrl-L to get rid of gnupg crud -- but it works pretty well for me.
I'd love to hear about improvements!

