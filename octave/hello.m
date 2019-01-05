###########################################################################
#!/usr/bin/octave -qf
 # a sample Octave program
 printf ("Hello, world!\n");

###YES#####################################################################
#!/usr/bin/octave -qf
x = linspace(0, 2*pi, 100);
y = sin(x);
plot(x, y);
print -dpng -color "-S800,800" sin1.png
open ("sin1.png");

printf ("Hello, world!\n");

figure;
###########################################################################
# example octave script 2
#!/usr/bin/octave -qf
x = 0:0.01:3;
hf = figure ();
plot (x, erf (x));
hold on;
plot (x, x, "r");
axis ([0, 3, 0, 1]);
text (0.65, 0.6175, ['$\displaystyle\leftarrow x = {2\over\sqrt{\pi}}'...
                     '\int_{0}^{x}e^{-t^2} dt = 0.6175$']);
xlabel ("x");
ylabel ("erf (x)");
title ("erf (x) with text annotation");
set (hf, "visible", "off");

print -dpng -color "-S800,800" sin2.png
open ("sin2.png");

print (hf, "plot15_7.pdf", "-dpdflatexstandalone");
set (hf, "visible", "on");
system ("pdflatex plot15_7");
open ("plot15_7.pdf");


####YES####################################################################
# example octave script 3
#!/usr/bin/octave -qf
x=1:.1:10;
plot(sin(x));
xlabel("x")
ylabel("sin(x)")
print -dpng -color "-S800,800" setSize3.png
open ("setSize3.png");
##################################################

# example octave script 4
#!/usr/bin/octave -qf
x=0:.1:10;
plot(x,sin(x),"linewidth",4);
 
xlabel("x","fontweight","bold")
ylabel("sin(x)","fontweight","bold")
 
h=get (gcf, "currentaxes");
set(h,"fontweight","bold","linewidth",2)
 
print -dpng -color "-S500,500" linewidth.png
open ("linewidth.png");

###########################################################################
# example octave script 5
#!/usr/bin/octave -qf
subplot(1,2,1)
x=0:.1:30;
plot(x,sin(x),"linewidth",4)
set(gca,'xtick',[0 10 20 30])
box("off")
xlabel("x","fontweight","bold")
ylabel("sin(x)","fontweight","bold")
%get axes handle to use for setting properties
h=get (gcf, "currentaxes");
set(h,"fontweight","bold","linewidth",2)
 
subplot(1,2,2)
x=0:.1:4;
plot(x,exp(x),"linewidth",4)
set(gca,'xtick',[0 1 2 3])
box("off")
xlabel("x","fontweight","bold")
ylabel("exp(x)","fontweight","bold")
%get axes handle to use for setting properties
h=get (gcf, "currentaxes");
set(h,"fontweight","bold","linewidth",2)
 
print -dpng -color "-S800,600" subplots.png
open ("subplots.png");

###########################################################################
# example octave script 6
#!/usr/bin/octave -qf

#!/usr/bin/octave -qf
%%%%%%  first subplot  %%%%%%
subplot("position",[.15 0.13 .4 .8])
x=0:.1:30;
plot(x,sin(x),"linewidth",4)
set(gca,'xtick',[0 10 20 30])
box("off")
xlabel("x","fontweight","bold")
%ylabel
h=text(-8,-.12,"sin(x)")
set(h,"fontweight","bold","rotation",90)
%get axes handle to use for setting properties
h=get (gcf, "currentaxes");
set(h,"fontweight","bold","linewidth",2)
 
%%%%%%  second subplot  %%%%%%
subplot("position",[.7 0.13 .2 .8])
x=0:.1:4;
plot(x,exp(x),"linewidth",4)
set(gca,'xtick',[0 1 2 3])
box("off")
xlabel("x","fontweight","bold")
ylabel("exp(x)","fontweight","bold")
%get axes handle to use for setting properties
h=get (gcf, "currentaxes");
set(h,"fontweight","bold","linewidth",2)
 
print -dpng -color "-S500,500" subplots2.png
open ("subplots2.png");

###########################################################################
# example octave script 7
#!/usr/bin/octave -qf

%%%%%%  main plot  %%%%%%
x=0:.1:4;
plot(x,exp(x),"linewidth",4)
set(gca,'xtick',[0 1 2 3])
box("off")
xlabel("x","fontweight","bold")
ylabel("exp(x)","fontweight","bold")
%get axes handle to use for setting properties
h=get (gcf, "currentaxes");
set(h,"fontweight","bold","linewidth",2)
 
%%%%%%  inset  %%%%%%
axes("position",[.4 .75 .4 .2])
x=0:.1:30;
plot(x,sin(x),"linewidth",4)
set(gca,'xtick',[0 10 20 30])
box("off")
h=xlabel('x \Delta')
set(h,"fontweight","bold","interpreter","tex")
h=text(-10,-.5,"sin(x)")
set(h,"fontweight","bold","rotation",90)
%get axes handle to use for setting properties
h=get (gcf, "currentaxes");
set(h,"fontweight","bold","linewidth",2)
 
print -dpng -color "-S500,500" inset.png
open ("inset.png");

###########################################################################
###########################################################################
# example octave script 8
#!/usr/bin/octave -qf
x=[1 2 3];
y=[10 20 15;50 80 100];
h=bar(x,y');
set(h(1),"facecolor","r")
set(h(2),"facecolor","g")
box("off")
 
%make the legend
legend("x","y","location","northwest")
h2=legend('right');
%remember to use the handler from
%the last time you call legend()
set(h2,"fontweight","bold")
 
%change axis properties
h=get (gcf, "currentaxes");
set(h,"fontweight","bold")
set(h,"xtick",[1 2 3])
set(h,"xticklabel",['\Delta \phi';'a' ;'f'])
set(h,"interpreter","tex")
 
print -dpng -color "-S500,500" ticks.png
open ("ticks.png");

###########################################################################
# example octave script 9
#!/usr/bin/octave -qf
x = -10:0.1:10;
plot (x, sin (x));
title ("sin(x) for x = -10:0.1:10");
xlabel ("x");
ylabel ("sin (x)");
text (pi, 0.7, "arbitrary text");
legend ("sin (x)");

print -dpng -color "-S500,500" sin0.png
open ("sin0.png");

###########################################################################
# example octave script 10
#!/usr/bin/octave -qf

figure (1);
fplot (@sin, [-10, 10]);
figure (2);
fplot (@cos, [-10, 10]);

print -dpng -color "-S500,500" sin1.png
open ("sin1.png");
###########################################################################
# example octave script 11
#!/usr/bin/octave -qf
x  = linspace(0,10,50);         % für Symbole
xx = linspace(0,10,500);        % für Linien
figure;
for i=1:5
  plot(xx, besselj(i-1,xx), sprintf('%d;;',i));
  hold on
  plot(x, besselj(i-1,x), sprintf('%d%d;J_%d(x);',i, i, i-1));
end
print('bessel.png', 'png');

open ("bessel.png");

print('bessel.eps', 'eps', '-mono');
###########################################################################
# example octave script 12
#!/usr/bin/octave -qf

vx = linspace(0,10,500);
my = zeros(5, 500);
 
for i=1:5
  my(i,:) = bessely(i-1,vx);
end
 
 
figure;
vsi = 1:50:length(vx);	% Indizes für x-Koordinaten der Symbole
vs  = '+*ox^';          % Symbole
vls = {'-', '--', ':', '-.', '-'};  % Linientyp
vlw = {1,   1,    1,   1,    1};    % Linienstärke
 
for i=1:5
  plot(vx, my(i,:), sprintf('-%d', i), 'linestyle', vls{i}, ...
       'linewidth', vlw{i});
  hold on
  plot(vx(vsi), my(i,vsi), sprintf('@%c%d', vs(i), i), ...
       'markersize', 4);
end
 
xlabel('x');
ylabel('y');
title('Neumann-Funktionen');
 
legend('', 'Y_0(x)', ...
       '', 'Y_1(x)', ...
       '', 'Y_2(x)', ...
       '', 'Y_3(x)', ...
       '', 'Y_4(x)', ...
       'location', 'southeast');
axis([0,10,-2,0.6]);

print -dpng -color "-S500,500" sin2.png
open ("sin2.png");

###########################################################################
###########################################################################
# example octave script 14
#!/usr/bin/octave -qf
x = -10:.1:10;
y = sin(x).*exp(-abs(x));
plot(x,y)
grid

print -dpng -color "-S500,500" sin3.png
open ("sin3.png");


###########################################################################
# example octave script 14
#!/usr/bin/octave -qf




###########################################################################
# example octave script 14
#!/usr/bin/octave -qf



###########################################################################
# example octave script 14
#!/usr/bin/octave -qf


###########################################################################
# example octave script 14
#!/usr/bin/octave -qf



###########################################################################
# example octave script 14
#!/usr/bin/octave -qf



