import sys
import urllib2

URL = "http://dot.bjornrun.com"
url = urllib2.urlopen(URL).geturl()

if not url == "https://raw.githubusercontent.com/bjornrun/dotfiles-3/master/etc/install":
    sys.exit(1)

print 'ok: %s <-> %s' % (URL, url)
