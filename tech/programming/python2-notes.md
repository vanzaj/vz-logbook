---
title: Notes on Python 2 (2014)
date: 2014-02-07
---

## Info

- <https://github.com/faif/python-patterns>
- <http://planetpython.org/>
- <http://code.activestate.com/recipes/langs/python/>


## Command line tools

- [baker](https://bitbucket.org/mchaput/baker/overview)
- [docopt](http://docopt.org/)
- [cookiecutter](https://github.com/audreyr/cookiecutter)


## Databases

- [dataset](https://dataset.readthedocs.org/en/latest/)
- [sandman](https://github.com/jeffknupp/sandman)


## Deployment

py2app, py2exe, cx-freeze, pants.


## Documentation

- [mkdocs](http://www.mkdocs.org/)
- [pycco](https://github.com/fitzgen/pycco)


## Regular expressions

<https://developers.google.com/edu/python/regular-expressions>


gready vs non-gready search
```
s = '<b>bold</b> and <i>italic</i>'

re.search(r'<.*>', s).group()
'<b>bold</b> and <i>italic</i>'

re.search(r'<.*?>', s).group()
'<b>'
```

## Testing

[Test-Driven Web Development with Python](http://chimera.labs.oreilly.com/books/1234000000754/ch01.html) (O'Reilly, web, django).

- <https://wiki.python.org/moin/PythonTestingToolsTaxonomy>
- <https://twistedmatrix.com/documents/14.0.1/core/howto/trial.html>
- <http://testanything.org/>


## Idioms / Useful constructs

```python
#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import print_function

d = dict(zip(keys, values))

for k, _ in d.items():
    print k


with open(path_to_file, 'r') as fh:
    for line in fh:
        print line.strip()


from collections import defaultdict
d = defaultdict(list)
for a, b in data:
    d[a].append(b)  # will autocreate empty list on 1st key access attempt
```

- <http://python.net/~goodger/projects/pycon/2007/idiomatic/handout.html>
- <http://nbviewer.ipython.org/github/rasbt/python_reference/blob/master/not_so_obvious_python_stuff.ipynb>
- [Simple and profound Python Tricks](http://pansop.com/1014/)

## Set operations

```
a <= b  # a.issubset(b)
a < b   # a <= b and a != b
a >= b  # a.issuperset(b)
a | b   # a.union(b)
a & b   # a.intersection(b)
a - b   # a.difference(b)  ## elements in a that are not in b
a ^ b   # a.symmetric_difference(b)  # elements in a or b but not in both
```


## Testing with py.test

- <https://speakerdeck.com/pelme>
- <http://oddbird.net/python-testing-tools-preso>
- <https://github.com/Fluxx/exam>

```
import mymodule

def test_mymodule_myfunc():
    expected = 'ABC'
    assert test_mymodule_myfunc('abc') == expected
```

```
$ py.test
$ py.test -k test_foo   ## run all test_foo
```

```
$ pip install pytest-xdist  ## distributed test plugin
$ py.test -n 2  ## run in two processes
```


Use markers to select/deselect which tests to run
```
import pytest
import sys

import mymodule

@pytest.mark.thisone
def test_mymodule_myfunc():
    expected = 'ABC'
    assert test_mymodule_myfunc('abc') == expected

@pytest.mark.skipif(sys.platform == 'darwin', reason='unsupported on OSX')
def test_anotherfunc():
    expected = 'ABC'
    assert mymodule.anotherfunc() == expected
```

```
$ py.test -m thisone
$ py.test -m "not thisone"
```

Use fixtures
```
import pytest
import mymodule

@pytest.fixture(scope='module')
def mydata():
    return 'ABC'

def test_mymodule_myfunc(mydata):
    assert test_mymodule_myfunc('abc') == mydata
```

