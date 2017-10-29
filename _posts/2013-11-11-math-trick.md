---
layout: post
title: Math trick?
date: 2013-11-11
categories: code
tags: python
---

## Problem

A few years ago, I read the following tweet:

> Math trick: works with any number <br>
> ![16/64 = 1/4 and 26/65 = 2/5](/assets/images/posts/math-trick.jpg)<br>
> — Destroying Stuff [November 11, 2013](https://twitter.com/DestroyingCIips/status/399718664540520448)

It looked pretty obvious that the statement “works with any number” was wrong, but I wanted to make sure of that, and find all numbers which match this rule.

## Code

Here is a naive python3.6 script (because f-strings just rock!) to find all solutions:

{% highlight python %}
for i in range(1, 10):
    for j in range(1, 10):
        for k in range(1, 10):
            dividend = int(f'{i}{j}')
            divisor  = int(f'{j}{k}')
            if dividend / divisor == i / k:
                print(f'{dividend}/{divisor} = {i}/{k}')

"""
Solutions: 

11/11 = 1/1
16/64 = 1/4
19/95 = 1/5
22/22 = 2/2
26/65 = 2/5
33/33 = 3/3
44/44 = 4/4
49/98 = 4/8
55/55 = 5/5
66/66 = 6/6
77/77 = 7/7
88/88 = 8/8
99/99 = 9/9

"""
{% endhighlight %}

## Alternative

If some help from unicode characters to strikethrough, we can even display the actual result, like the picture. I also used `itertools.product()` to generate the tuple with a generator (it avoids using 3 for-loops).

{% highlight python %}
from itertools import product

s = '—'  # Separator for division

for i, j, k in product(range(1, 10), repeat=3):
    if i == j == k:
        continue

    dividend = int(f'{i}{j}')
    divisor  = int(f'{j}{k}')

    if dividend / divisor == i / k:
        print(f' {i}{j}   {i}{j}̶   {i}\n'
              f' {s}{s} = {s}{s} = {s}\n'
              f' {j}{k}   {j}̶{k}   {k}\n')


"""
Solutions: 

 16   16̶   1
 —— = —— = —
 64   6̶4   4

 19   19̶   1
 —— = —— = —
 95   9̶5   5

 26   26̶   2
 —— = —— = —
 65   6̶5   5

 49   49̶   4
 —— = —— = —
 98   9̶8   8

"""
{% endhighlight %}




