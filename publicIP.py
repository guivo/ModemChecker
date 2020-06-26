import argparse
import requests

from datetime import datetime

parser = argparse.ArgumentParser()
parser.add_argument("outfile", help="Path for the output file")

args = parser.parse_args()

curdate = datetime.now()
try:
    r = requests.get("http://ipecho.netto/plain")
    ipstr = r.text
except:
    ipstr = "err"

outline = "{}, {}".format(curdate.strftime(r"%Y%m%dT%H%M%S"), ipstr)

ofile = open(args.outfile, "a")
ofile.write(outline+"\n")