"""
@author: Aethys256, 0tt3r
"""

#All the needed function are stored in plot.py
#We use this script as a simple driver
import sys
import os
import plotly
sys.path.append(os.path.join(os.path.dirname(sys.path[0]), 'lib'))
import plot_4d

os.chdir(os.path.join(os.path.dirname(sys.path[0]), 'src'))

# Sign in to plotly
plotly.plotly.sign_in('yourname', 'yourkey')

# FIXME: Consider only allowing valid options (i.e., 'fjarnskargle' is not a valid fightstyle')
# Input options here
inputParams = {}
inputParams['simcPath'] = 'yourpathtotheexe'
inputParams['steps'] = 20
inputParams['chunkSize'] = 77
inputParams['targetError'] = 0.1
inputParams['budget'] = '21k' #'17k': 16758, '21k': 21334, '27k': 27160
inputParams['tier'] = 't19m'
inputParams['class'] = 'rogue'
inputParams['specialization'] = 'subtlety'
inputParams['fightStyle'] = '1t'

plot_4d.runSimcProfiles(inputParams)
plot_4d.generatePlotly(inputParams)
