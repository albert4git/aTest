#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
# NguyenU

#import vimpdb; vimpdb.set_trace()
import pdb
import logging


def find_max(nums):
    #pdb.set_trace()
    pdb.set_trace()

    max = nums[0]
    for x in nums:
        if x > max:
            max = x
    print(max)


def main():
    find_max([2, 4, 9, 7, 19, 94, 5])


if __name__ == '__main__':
    main()
