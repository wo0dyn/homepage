---
title: What would my python look like?
original_title: À quoi ressemblerait mon python ?
type: LT
date: 2013-06-22
conference: Pytong
place: Toulon, France
lang: fr
---

Sharing few (not really serious) thoughts about how to make python better, by using unicode operators.


## Unicode operators

| Old python operator | New awesome one |
|:-------------------:|:---------------:|
| >=                  | ≥               |
| <=                  | ≤               |
| !=                  | ≠               |
| not                 | ¬               |
| x ** 1/2            | √x              |
| x ** 2              | x²              |
| x ** 3              | x³              |

{% highlight python %}
if x ≥ 10 and ¬found:
    # code

if x² ≠ 10:
    # code
{% endhighlight %}

## More greek letters

Because, it would be awesome to write:

{% highlight python %}
from datetime import datetime

start = datetime.now()
# code
∆t = datetime.now() - start
print("Time: {}ms".format(∆t))
{% endhighlight %}

## Redefine assignment/equality

| Operation  | Old python | New awesome one |
|:----------:|:----------:|:---------------:|
| Assignment | =          | :               |
| Equality   | ==         | =               |

{% highlight python %}
start: datetime.now()
# code
∆t: datetime.now() - start

if ∆t = 0:
    print("WOW, that was fast!")
{% endhighlight %}