
#All the needed function are stored in plot.py
#We use this script as a simple driver
import sys
sys.path.insert(0,'src/plot_stats')
import plot_lib
from subprocess import call #To run simc from this file
import os
import numpy as np
import glob
import re

#From plain text to numbers, for reference
STAT_BUDGET = {
    '17k': 16758,
    '21k': 21334,
    '27k': 27160,
}

# FIXME: Consider only allowing valid options (i.e., 'fjarnskargle' is not a valid fightstyle')
# Input options here
inputParams = {}
inputParams['steps'] = 10
inputParams['chunkSize'] = 50
inputParams['targetError'] = 0.2
inputParams['budget'] = '21k'
inputParams['tier'] = 't19p'
inputParams['class'] = 'warlock'
inputParams['specialization'] = 'destruction'
inputParams['fightStyle'] = '1t'

#plot_lib.runSimcProfiles(inputParams)
plot_lib.generatePlotly(inputParams)


