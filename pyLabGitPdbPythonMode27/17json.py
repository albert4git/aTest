#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
try:
    import simplejson as json
except:
    import json

book = {}
book[
    'title'] = 'Light Science and Magic: An Introduction to Photographic Lighting, Kindle Edition'
book['tags'] = ('Photography', 'Kindle', 'Light')
book['published'] = True
book['comment_link'] = None
book['id'] = 1024

with open('ebook.json', 'w') as f:
    json.dump(book, f)

#========================================================================
import json
import codecs
with codecs.open('ebook.json', 'r', encoding='utf-8') as f:
    data_from_jason = json.load(f)

print data_from_jason
#========================================================================
