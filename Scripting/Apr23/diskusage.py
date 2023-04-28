#!/usr/bin/env python3

import shutil
path = "/"
total, used, free = shutil.disk_usage(path)
print("Total: %d GiB" % (total // (2**30)))
print("used: %d GiB" % (used // (2**30)))
print("free: %d GiB" % (free // (2**30)))

