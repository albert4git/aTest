
###########################################################################
# example octave script 1
###########################################################################
#!/usr/bin/octave -qf

 printf ("Hello, world!\n");

#!/usr/bin/octave -qf
x = linspace(0, 2*pi, 100);
y = sin(x);
plot(x, y);
figure;
printf ("Hello, world!\n");

###########################################################################
# example octave script 9
###########################################################################
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
