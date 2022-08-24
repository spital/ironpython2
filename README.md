# ironpython2
maybe ironpython2 docker one day

Check [Ironpython2 releases](https://github.com/IronLanguages/ironpython2/releases).
## some tests

``` python
import sys
print sys.version_info  # sys.version_info(major=2, minor=7, micro=12, releaselevel='final', serial=0)
```

``` python
import mmap
PAGESIZE = mmap.PAGESIZE
print PAGESIZE
m = mmap.mmap(-1, PAGESIZE)
```

``` python
class A:
  pass

A.__call__ = A()
a = A()
try:
  a() # This should not segfault
except RuntimeError:
  pass
else:
  print "Failed to raise RuntimeError"
```

``` python
def f():
  return f()

f()
```

``` python
d = {}
d[42] = d.viewvalues()
print len(repr(d))
```

``` python
import types
class A(object):
  pass

A.__mul__ = types.MethodType(lambda self, x: self * x, None, A)
try:
  A()*2
except RuntimeError:
  pass
else:
  print "expected a RuntimeError"
```

``` python
import sys
if sys.maxsize != 0x7fffffff:
  print 'can not try'
else:
  print "%0.3f e9" % (sys.maxint/1e9)
  x = list(xrange(sys.maxint//2))
```
