:10,20!python what.py

---------------------------------------------------------------------------------
16. How I Can Clean Up Disk Space

The 'clean' command is used to free up the disk space by cleaning retrieved
(downloaded) .deb files (packages) from the local repository.

$ sudo apt-get clean
 sudo apt-get remove --purge vsftpd
---------------------------------------------------------------------------------
14. How Do I Remove Packages Without Configuration

$ sudo apt-get remove vsftpd

---------------------------------------------------------------------------------
13. How Do I Install Specific Package Version?
= with the package-name and append desired version.

$ sudo apt-get install vsftpd=2.3.5-3ubuntu1


---------------------------------------------------------------------------------
12. How to Upgrade Only Specific Packages

$ sudo apt-get install packageName --only-upgrade
---------------------------------------------------------------------------------
10. How to Install Several Packages using Wildcard
$ sudo apt-get install '*name*'
---------------------------------------------------------------------------------
8. How Do I Install or Upgrade Specific Packages?
$ sudo apt-get install netcat
---------------------------------------------------------------------------------
4. How Do I Check Dependencies for Specific Packages?
$ apt-cache showpkg vsftpd
---------------------------------------------------------------------------------
5. How Do I Check statistics of Cache
$ apt-cache stats
---------------------------------------------------------------------------------
3. How Do I Check Package Information?
$ apt-cache show netcat
---------------------------------------------------------------------------------
2. How Do I Find Out Package Name and Description of Software?
$ apt-cache search vsftpd
$ apt-cache pkgnames vsftpd
---------------------------------------------------------------------------------
1. How Do I List All Available Packages?
$ apt-cache pkgnames
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------
