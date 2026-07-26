#!/usr/bin/env python3

import json
import subprocess

STATUS_FILE = "/tmp/mcq_status"

i3status = subprocess.Popen(
    ["i3status"],
    stdout=subprocess.PIPE,
    text=True
)

print(i3status.stdout.readline(), end="")  # version header
print(i3status.stdout.readline(), end="")  # opening [

for line in i3status.stdout:
    line = line.strip()

    prefix = ""
    if line.startswith(","):
        prefix = ","
        line = line[1:]

    try:
        blocks = json.loads(line)

        try:
            with open(STATUS_FILE) as f:
                status = f.read().strip()
        except Exception:
            status = "0.00"

        blocks.insert(0, {
            "full_text": f"MCQ: {status}"
        })

        print(prefix + json.dumps(blocks), flush=True)

    except Exception:
        print(prefix + line, flush=True)
