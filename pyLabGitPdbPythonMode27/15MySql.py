#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""
INSERT INTO `atest` (`ID`, `r1`, `r2`, `r3`) VALUES ('0', '1', '2', '3');
"""
import pyodbc
import pandas.io.sql as psql
import pandas
connection_info = "DRIVER={MySQL ODBC 3.51 \
    Driver};SERVER=http://localhost;DATABASE=adb;USER=root;PASSWORD=mypass;OPTION=3;"

cnxn = pyodbc.connect(connection_info)

cursor = cnxn.cursor()
sql = "select id,r1 from atest"
#cursor.execute(sql)
#dataframe = __processCursor(cursor, dataframe=True)
#df = psql.frame_query(sql, cnxn, coerce_float=False)
df = psql.read_frame(sql, cnxn)
print df
cnxn.close()

#===========================================================

import pymysql
import numpy

conn = pymysql.connect(
    host='localhost', port=88, user='root', passwd='mypass', db='adb')
cursor = conn.cursor()
cursor.execute("select id,r1 from atest")
rez = cursor.fetchall()
resarray = numpy.array(map(float, rez))
finalres = resarray.reshape((resarray.size / 2, 2))

#===========================================================
import MySQLdb
import pandas.io.sql as psql
from MySQLdb.converters import conversions
from MySQLdb.constants import FIELD_TYPE

conversions[FIELD_TYPE.DECIMAL] = float
conversions[FIELD_TYPE.NEWDECIMAL] = float
conn = MySQLdb.connect(host='', user='', passwd='', db='')
sql = "select * from NUMERICTABLE"
df = psql.read_frame(sql, conn)
