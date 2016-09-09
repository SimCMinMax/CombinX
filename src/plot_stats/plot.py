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
    
def tooltipText(statPoint, value, maxDps):
    return '%.1f%% Crit<br>%.1f%% Haste<br>%.1f%% Mastery<br>%.1f%% Versatility<br>DPS: %d [%.1f%%]' % (100 * statPoint[0], 100 * statPoint[1], 100 * statPoint[2], 100 * statPoint[3], value, 100. * value / maxDps)

def generateTickStep(dps):
    coeff = [1., 2., 5.]
    coeffIdx = 0
    mult = 1.
    step = coeff[coeffIdx] * mult
    dpsRange = max(dps) - min(dps)
    while dpsRange / step >= 8:
        coeffIdx = (coeffIdx + 1) % 3
        if coeffIdx == 0:
            mult = mult * 10.
        step = coeff[coeffIdx] * mult
    return step

def generateTickValues(dps, tickStep, baselineDps):
    dpsTickValues = [ tickStep * c for c in range(int(np.ceil(min(dps) / tickStep)), int(np.floor(max(dps) / tickStep) + 1)) ]
    return [ min(dps) ] + dpsTickValues + [ max(dps) ] + [ baselineDps ]

def generateTickTexts(dps, tickValues):
    return [ generateTickText(tickValues[idx], tickValues[idx] / max(dps), idx == len(tickValues) - 1) for idx in range(len(tickValues)) ]

def generateTickText(tickValue, ratio, baseline = False):
    if baseline:
        baseText = 'Baseline'
        suffix = ''
    else:
        multStep = 1000.
        multipliers = [
            dict(suffix='', mult=pow(multStep, 0)),
            dict(suffix='k', mult=pow(multStep, 1)),
            dict(suffix='M', mult=pow(multStep, 2)),
            dict(suffix='G', mult=pow(multStep, 3)),
        ]
        multiplier = multipliers[0]
        for m in multipliers:
            if np.round(tickValue / m['mult']) >= 1:
                multiplier = m
        baseText = float('%.3g' % np.round(tickValue / multiplier['mult']))
        baseText = int(baseText) if int(baseText) == baseText else baseText
        suffix = multiplier['suffix']
    percent = float('%.1f' % (100 * ratio))
    percent = int(percent) if percent == int(percent) else percent
    return '%s%s [%s%%]' % (baseText, suffix, percent)

def traceStatsPoints(statPoints, dps, baselineDps = -1):
    if baselineDps == -1:
        baselineDps = max(dps)
    statCoords = np.array([np.dot(sp, COORDS) for sp in statPoints])
    x, y, z = statCoords.transpose()
    statTooltips = np.array([tooltipText(sp, v, max(dps)) for (sp, v) in zip(statPoints, dps)])
    sizes = 6 + 6 * (dps >= max(dps) - (max(dps) - min(dps)) * 0.05) + 6 * (dps == max(dps))
    colors = dps
    tickValues = generateTickValues(dps, generateTickStep(dps), baselineDps)
    tickTexts = generateTickTexts(dps, tickValues)
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
                color='rgba(32, 32, 32, 0.3)',
                width=0.5
            ),
            color=colors,
            colorbar=go.ColorBar(
                title='DPS',
                tickvals=tickValues,
                ticktext=tickTexts,
            ),
            colorscale=[[0., 'rgba(40,55,255, 0.3)'], [0.95, 'rgba(255, 60, 25, 0.7)'], [0.9501, 'rgba(255, 60, 25, 1)'], [0.9999, 'rgba(255, 60, 25, 1)'], [1., 'rgba(25, 225, 55, 1)']],
        ),
        showlegend=False,
    )

def traceStatLabels():
    x, y, z = COORDS.transpose()
    return go.Scatter3d(
        x=x,
        y=y,
        z=z,
        hoverinfo='none',
        mode='text',
        text=['Crit', 'Haste', 'Mastery', 'Versatility'],
        textposition='top',
        showlegend=False,
    )
    
def generatePlot(trace, traceLabels, plotname):
    data = [trace, traceLabels]
    layout = go.Layout(
        margin=dict(
            l=0,
            r=0,
            b=0,
            t=32,
        ),
        title=plotname,
        scene=dict(
            xaxis=dict(
                showgrid=False,
                showticklabels=False,
                showspikes=False,
                showline=False,
                showaxeslabels=False,
                zeroline=False,
                title='',
            ),
            yaxis=dict(
                showgrid=False,
                showticklabels=False,
                showspikes=False,
                showline=False,
                showaxeslabels=False,
                zeroline=False,
                title='',
            ),
            zaxis=dict(
                showgrid=False,
                showticklabels=False,
                showspikes=False,
                showline=False,
                showaxeslabels=False,
                zeroline=False,
                title='',
            ),
        )
    )
    fig = go.Figure(data=data, layout=layout)
    return py.plot(fig, filename=plotname, auto_open=False)
    
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

def readDps(filename):
    if filename[-5:] != '.json':
        filename = filename + '.json'
    with open(filename) as f:
        simData = json.load(f)
    return np.array([p['collected_data']['dps']['mean'] for p in simData['sim']['players']])

# Main
steps = 20
tier = 't19h'
spec = 'sub'
jsonFile = 'rog_%s_%s_1t_plot_stats.json' % (spec, tier)
plotname = 'rog_%s_%s_1t_plot_%ssteps' % (spec, tier, steps)
baselineDps = 288000

statPoints = generateStats(steps)
# statPoints = generateStats(8, statRange = 0.25, nominalValues = np.array([0.125, 0.125, 0.375, 0.375]))

statRatings = generateStatRatings(statPoints, STAT_CAPITAL[tier])
generateStatsSimc(statRatings, 'stats_%ssteps_%s' % (steps, tier))

statCoords = np.array([np.dot(sp, COORDS) for sp in statPoints])
x, y, z = statCoords.transpose()
dps = readDps(jsonFile)

trace = traceStatsPoints(statPoints, dps, baselineDps)
traceLabels = traceStatLabels()
generatePlot(trace, traceLabels, plotname)
