"AAA----------------------------------------------------------------------------------
"AAA----------------------------------------------------------------------------------
bash$
Make () { command make "$@" |& tee make.errors || gvim -q make.errors -c :copen ; }
"AAA----------------------------------------------------------------------------------
My own code templates for C/C++ insert a triple percent (%%%) where you are
supposed to enter something. I mapped ;; to find the next %%% and change them.
All the template mappings are insert-mode only, while the "skip to next
placeholder" is both insert and normal mode enabled.

A complete for-loop template for C++ looks like:

:imap <buffer> ;fo <C-O>mzfor( %%%; %%%; %%%)<CR>{ // %%%<CR>%%%<CR>}<CR><C-O>'z;;

The command to go to the next placeholder is this:

:imap <buffer> ;; <C-O>/%%%<CR><C-O>c3l
:nmap <buffer> ;; /%%%<CR>c3l


Every time I need a for-loop ;fo produces this ( _ is the cursor position) :
for( _; %%% ; %%%)
{ // %%%
  %%%
}

Now I enter starting value (i=0):
for( i=0_; %%% ; %%%)
{ // %%%
  %%%
}

and go to the condition using ;;
for( i=0; _ ; %%%)
{ // %%%
  %%%
}


"AAA----------------------------------------------------------------------------------
VimTip	{{{1 624: Insert template files into buffer ( HTML editing for example)
http://vim.sourceforge.net/tip_view.php?tip_id=

While editing HTML I want to use template files to be expanded on my html
pages. Say for example I have something like this on my html file:

<!--"header.html"-->
<p>html code here</p>
<p>more html code here...</p>
<!--"footer.tml"-->

I want the files "header.html" and "footer.html" to be inserted on my page, you
can do this with the following global command:

:g%<!--"\w\+.\w\+"--\>%exe ":r " . matchstr(getline("."), "\\w\\+\\.\\w\\+")


VimTip	{{{1 710: Save time by typing and running templates instead of routine code.
http://vim.sourceforge.net/tip_view.php?tip_id=

The idea is pretty simple.
1.There's template script written in perl (see sources below.)
2. and  mapping in visual mode:
vnoremap <F6> :!perl E:\\Devtools\\vim\\vimfiles\\template\truler.pl<CR>

The template markers are:
TS:<Single string template here>
TB:
<multistring template here>
TE:
TF: <template file name >

So now we are typing following templates and get them transformed :-).

Typing this :
TS:public final static int PROXY_TYPE_{$p2}={$p1};  
1;HTTP
2;SOCKS
3;SSH
4;HTTPS
5;NOPROXY

Now select this template with values below,  press magic button and 'ta-da',
we have this code :

public final static int PROXY_TYPE_HTTP=1;  
public final static int PROXY_TYPE_SOCKS=2;  
public final static int PROXY_TYPE_SSH=3;  
public final static int PROXY_TYPE_HTTPS=4;  
public final static int PROXY_TYPE_NOPROXY=5;  

Here's the same with multiline template, type following: 
TB:
public {$p1} is{$p2}Established() \{ 
    return m{$p2}; 
\}
TE:
boolean;DirectConnection
boolean;SockConnection
boolean;HTTPConnection

and after transforming we'll got this :
protected boolean isDirectConnectionEstablished() { 
    return m_DirectConnection; 
}

protected boolean isSockConnectionEstablished() { 
    return m_SockConnection; 
}

protected boolean isHTTPConnectionEstablished() { 
    return m_HTTPConnection; 
}

I know it's stupid 'copy-paste' and I don't like it, but sometimes  It's required 
and that simple script saving my time. Everthing working under Windoze.
Text::Template you can download it from http://search.cpan.org.

Source below:
---truler.pl-------
use Text::Template;
$tb=0; $te=0;$template_str="";
$template_dir="E:\\Devtools\\vim\\vimfiles\\template\\";
while (<STDIN>){

	if (/^TF:.*/){#file
		
		$_=~/^TF:(.*?)$/;
		$template_file=$1;
		$template = Text::Template->new(SOURCE => $template_dir.$template_file)
		or die "Couldn't construct template: $Text::Template::ERROR";

	}elsif (/^TS:.*/){#line
		$_=~/^TS:(.*?)$/;
		$template_str=$1;
		$template = Text::Template->new(TYPE=> STRING ,SOURCE => "$template_str\n")
		or die "Couldn't construct template: $Text::Template::ERROR";

	}elsif (/^TB:.*/){#line
		$tb=1;
	}elsif (/^TE:.*/){#line
		$te=1;
		$template = Text::Template->new(TYPE=> STRING ,SOURCE => "$template_str\n")
		or die "Couldn't construct template: $Text::Template::ERROR";
	}elsif ($tb==1 && $te==0 ) {
		$template_str.="$_";
	}else {
		
		if (defined $template) {
			chomp($_);
			@p=split /;/;	
			#if ($p > 0) { print "$_\n";
							
				my %vars = (
					p1 => $p[0],
					p2 => $p[1], 
					p3 => $p[2], 
					p4 => $p[3], 
					p5 => $p[4], 
					p6 => $p[5], 
					p7 => $p[6], 
					p8 => $p[7], 
					p9 => $p[8] 	
				   );
				my $result = $template->fill_in(HASH => \%vars);
				if (defined $result) { print $result }
			#}
	 	} #template_file defined
	}#else of TF
}#end while 
--- truler.pl-------
