#!/usr/local/bin/python3
#  https://macromates.com/manual/en/language_grammars
import plistlib
import os.path
import os

textmateLibrary = os.path.expanduser('~/Library/Application Support/TextMate')
for path, dirs, files in os.walk(textmateLibrary):
    for file in files:
        if path.endswith('/Syntaxes') and file.endswith('.plist'):
            print(path,file)
            plist = plistlib.load(open(os.path.join(path,file),'rb'))
            #print(plist)
            break
        elif path.endswith('/Themes') and file.endswith('.tmTheme'):
            #print(path,file)
            pass

def rule(indent, pattern):
    for key in ['name', 'match', 'begin', 'end', 'contentName', 'captures', 'beginCaptures', 'endCaptures', 'include']:
        if key in pattern:
            print(indent, key, pattern[key])
    if 'patterns' in pattern:
        patterns(indent+'    ', pattern['patterns'])
        
def patterns(indent, list):
    for pattern in list:
        print(indent, '- - - -')
        rule(indent, pattern)

def process(plist):
    # ['fileTypes', 'firstLineMatch', 'repository', 'keyEquivalent', 'uuid', 'patterns', 'name', 'scopeName']
    for key in ['name', 'scopeName', 'fileTypes', 'firstLineMatch', 'keyEquivalent']:
        if key in plist:
            print(key, repr(plist[key]))
    patterns('', plist['patterns'])
    if 'repository' in plist:
        for (key,defn) in plist['repository'].items():
            print(key)
            rule('    ', defn)

plist = plistlib.load(open(os.path.join(textmateLibrary, 'Managed/Bundles/C.tmbundle/Syntaxes/C.plist'), 'rb'))
process(plist)
