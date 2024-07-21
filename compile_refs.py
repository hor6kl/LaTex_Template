#!/usr/bin/python
# python compile_refs.py main_file_name
import subprocess
import sys

commands = [
    ["pdflatex", sys.argv[1] + ".tex"],
    ["bibtex", sys.argv[1] + ".aux"],
    ["pdflatex", sys.argv[1] + ".tex"],
    ["pdflatex", sys.argv[1] + ".tex"],
    # makeglossaries used for basic glossaries without sort thrue bib2gls
    # ['makeglossaries', sys.argv[1]],
    ["bib2gls", sys.argv[1]],
    ["pdflatex", sys.argv[1] + ".tex"],
]

for c in commands:
    subprocess.call(c)
