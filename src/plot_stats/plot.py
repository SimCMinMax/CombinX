# -*- coding: utf-8 -*-
"""
Created on Wed Sep 07 15:58:48 2016

@author: rmondoncancel
"""

# Imports
import plotly.plotly as py
import plotly.graph_objs as go

import numpy as np
import json

# Sign in to plotly
py.sign_in('skasch', '3sgh5go8tl')

# Constants
CRIT_COORDS = np.array([ - np.sqrt(6.) / 3., - np.sqrt(2.) / 3., -1. / 3. ])
HAST_COORDS = np.array([ np.sqrt(6.) / 3., - np.sqrt(2.) / 3., -1. / 3. ])
MAST_COORDS = np.array([ 0., 2. * np.sqrt(2.) / 3., -1. / 3. ])
VERS_COORDS = np.array([ 0., 0., 1. ])

COORDS = np.array([
    CRIT_COORDS,
    HAST_COORDS,
    MAST_COORDS,
    VERS_COORDS,
])

STAT_CAPITAL = {
    't19p': 15708,
    't19h': 17103,
    't19m': 18644,
}

# Functions
def generateStats(nSteps, statRange = 1., nominalValues = np.array([ 0.25, 0.25, 0.25, 0.25 ])):
    statRange = min(statRange, 4 * min(nominalValues))
    baseValues = nominalValues - statRange / 4
    sp = []
    for c in range(nSteps + 1):
        for h in range(nSteps - c + 1):
            for m in range(nSteps - c - h + 1):
                v = nSteps - c - h - m
                sp = sp + [ baseValues + statRange * np.array([float(c) / nSteps, float(h) / nSteps, float(m) / nSteps, float(v) / nSteps]) ]
    return np.array(sp)
    
def tooltipText(statPoint, value):
    return '%.1f%% Crit<br>%.1f%% Haste<br>%.1f%% Mastery<br>%.1f%% Versatility<br>DPS: %d' % (100 * statPoint[0], 100 * statPoint[1], 100 * statPoint[2], 100 * statPoint[3], value)

def traceStatsPoints(statPoints, dps):
    statCoords = np.array([np.dot(sp, COORDS) for sp in statPoints])
    x, y, z = statCoords.transpose()
    statTooltips = np.array([tooltipText(sp, v) for (sp, v) in zip(statPoints, dps)])
    sizes = 6 + 6 * (dps == max(dps))
    return go.Scatter3d(
        x=x,
        y=y,
        z=z,
        text=statTooltips,
        hoverinfo='text',
        mode='markers',
        marker=dict(
            size=sizes,
            line=dict(
                color='rgba(217, 217, 217, 0.14)',
                width=0.5
            ),
            color=dps,
            colorscale='Bluered',
            opacity=0.8
        )
    )
    
def generatePlot(trace):
    data = [trace]
    layout = go.Layout(
        margin=dict(
            l=0,
            r=0,
            b=0,
            t=0
        )
    )
    fig = go.Figure(data=data, layout=layout)
    py.iplot(fig, filename='simple-3d-scatter')
    
def generateStatRatings(statPoints, statCapital):
    return np.array([ np.round(sp * statCapital) for sp in statPoints ])

def statRatingSuffix(statRating):
    return '%icrit_%ihaste_%imast_%ivers' % (statRating[0], statRating[1], statRating[2], statRating[3])

def statRatingSimc(statRating):
    return 'gear_crit_rating=%i\ngear_haste_rating=%i\ngear_mastery_rating=%i\ngear_versatility_rating=%i' % (statRating[0], statRating[1], statRating[2], statRating[3])

def generateStatsSimc(statRatings, filename):
    if filename[-5:] != '.simc':
        filename = filename + '.simc'
    with open(filename, 'w') as f:
        f.write( 'name=$(root)_%s\n' % statRatingSuffix(statRatings[0]) )
        f.write( '$(base_name)=$(root)_%s\n' % statRatingSuffix(statRatings[0]) )
        f.write( statRatingSimc(statRatings[0]) + '\n' )
        for sp in statRatings[1:]:
            f.write( 'copy=$(root)_%s,$(base_name)\n%s\n' % (statRatingSuffix(sp), statRatingSimc(sp)) )

with open('rog_sub_t19p_1t_plot.json') as f:
    simData = json.load(f)

dps = np.array([p['collected_data']['dps']['mean'] for p in simData['sim']['players']])

# Main
steps = 20
tier = 't19m'

statPoints = generateStats(steps)
# statPoints = generateStats(8, statRange = 0.25, nominalValues = np.array([0.125, 0.125, 0.375, 0.375]))

statRatings = generateStatRatings(statPoints, STAT_CAPITAL[tier])
generateStatsSimc(statRatings, 'stats_%ssteps_%s' % (steps, tier))

statCoords = np.array([np.dot(sp, COORDS) for sp in statPoints])
x, y, z = statCoords.transpose()

trace = traceStatsPoints(statPoints, dps)
generatePlot(trace)
