---
layout: post
title: WHO Challenge
date: 2012-08-13
categories: code
tags: bash clojure html java javascript perl php python ruby
---

## Principle

The WHO challenge — formely launched as a _famous american restaurant_ challenge — is very simple: write a oneliner to generate “WHO” string from “World Health Organization” which is written only once.

![WHO Logo](/assets/images/posts/who-logo.png)

## Codes

### Bash

{% highlight shell %}
for w in $(echo "World Health Organization" | tr " " "\n"); do echo -n ${w:0:1}; done;
{% endhighlight %}
— [@xi-ao](https://github.com/xi-ao)

{% highlight shell %}
echo "World Health Organization" | sed 's/[a-z ]//g'
{% endhighlight %}
— [@avernois](https://github.com/avernois)

### Clojure

{% highlight clojure %}
(prn (clojure.string/replace "World Health Organization" #"[a-z ]" ""))
;; or 
(prn (apply str (map first (clojure.string/split "World Health Organization" #"\s"))))
;; or
(prn (apply str (filter #(and (not= \space %) (= (clojure.string/upper-case (str %)) (str %))) "World Health Organization")))
;; or
(prn (apply str (remove #(= \space %) (map first (partition-by #(= \space %) "World Health Organization")))))
;; or
(prn (apply str (for [x (seq "World Health Organization") :when (and (= (clojure.string/upper-case (str x)) (str x)) (not= \space x))] x)))
;; or
(prn (apply str (remove #(= \space %) (for [x (seq "World Health Organization") :when (= (clojure.string/upper-case (str x)) (str x))] x))))
;; or
(prn (apply str (re-seq #"[A-Z]" "World Health Organization")))
;; or
(prn (apply str (filter #(Character/isUpperCase %) "World Health Organization")))
{% endhighlight %}
— [@magopian](https://github.com/magopian)

### HTML

{% highlight html %}
<style>span {display:none}</style>
<p>W<span>orld </span>H<span>ealth </span>O<span>rganization</span></p>
{% endhighlight %}
— [@n1k0](https://github.com/n1k0) + [@kud](https://github.com/kud)

### Java

{% highlight java %}
public class WHO { public static void main(String[] args) { System.out.println(new String("World Health Organization").replaceAll("([^A-Z])", ""));}}
{% endhighlight %}
— Cyril

### JavaScript (1.2)

{% highlight javascript %}
print(Array.prototype.map.call("World Health Organization".split(' '), function(w) { return w[0] }).join(''))
{% endhighlight %}
— [@wo0dyn](https://github.com/wo0dyn)

### Perl (5.10.1)

{% highlight perl %}
print "World Health Organization" =~ m/\b(\w)/g;
{% endhighlight %}
— [@jroussel](https://github.com/jroussel)

### PHP (5.3)

{% highlight php %}
<?php print join(array_map(function ($w){return $w[0];}, explode(' ', 'World Health Organization')));
{% endhighlight %}
— [@jroussel](https://github.com/jroussel)

{% highlight php %}
<?php array_map(function($w) { print $w[0]; }, explode(' ', 'World Health Organization'));
{% endhighlight %}
— [@wo0dyn](https://github.com/wo0dyn)

{% highlight php %}
<?php echo str_replace(' ', '', join(array_intersect(str_split($s = "World Health Organization"), str_split(strtoupper($s)))));
{% endhighlight %}
— [@xi-ao](https://github.com/xi-ao)

{% highlight php %}
<?php echo preg_replace('/[a-z]| /', '', "World Health Organization") ?>
{% endhighlight %}
— [@jeremyFreeAgent](https://github.com/jeremyFreeAgent)

{% highlight php %}
<?php echo preg_replace('([^A-Z])', '', 'World Health Organization');
{% endhighlight %}
— [@SaniOKh](https://github.com/SaniOKh)

{% highlight php %}
<?php foreach(explode(' ', "World Health Organization") as $w) echo $w[0];
{% endhighlight %}
— [@jeremyFreeAgent](https://github.com/jeremyFreeAgent)

### Python (2.7.1+)

{% highlight python %}
print ''.join(w[0] for w in 'World Health Organization'.split())
# or
import re; print re.sub('[^A-Z]', '', 'World Health Organization')
# or short-crappiest version ever (sorry!)
print 'WHO'#World Health Organization
# → yeah, we need more rules on that exercise…
{% endhighlight %}
— [@wo0dyn](https://github.com/wo0dyn)

{% highlight python %}
print ''.join(c for c in "World Health Organization" if c.isupper())
# or
import re; print ''.join(re.findall(r'\b\w', 'World Health Organization'))
# or
import re; print ''.join(re.findall(r'[A-Z]', 'World Health Organization'))
{% endhighlight %}
— [@magopian](https://github.com/magopian)

### Ruby

{% highlight ruby %}
print "World Health Organization".gsub /[^A-Z]/, ''
# or
"World Health Organization".each_char{|c| print(('Z' >= c && 'A' <= c)?c:'')}
{% endhighlight %}
— Cyril