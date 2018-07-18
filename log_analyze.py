#!/usr/bin/env python
import re
import sys
from collections import defaultdict

file_path = "/var/log/system.log"
args = sys.argv

if args == 3:
    if args[1] == "-f":
        file_path = args[2]

count = defaultdict(int)

with open(file_path) as f:
    for line in f:
        match = re.search(r'\w+ \d{0,2} (?:\d{2}:?){3} (?:anatofuzMBP|anatofuz-15) ([\w.]+)\[\d+\]',line)
        if match:
            count[match.group(1)]+=1

total = 0

for key in count.keys():
    total +=count[key]

print(total)
