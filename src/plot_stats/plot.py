# -*- coding: utf-8 -*-
"""
Created on Wed Sep 07 15:58:48 2016

@author: rmondoncancel
"""

import plotly.plotly as py
import plotly.graph_objs as go

import numpy as np

py.sign_in('skasch', '3sgh5go8tl')

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

def generateStats(nSteps):
    sp = []
    for c in range(nSteps + 1):
        for h in range(nSteps - c + 1):
            for m in range(nSteps - c - h + 1):
                v = nSteps - c - h - m
                sp = sp + [[float(c) / nSteps, float(h) / nSteps, float(m) / nSteps, float(v) / nSteps]]
    return np.array(sp)
    
def tooltipText(statPoint, value):
    return '%.1f%% Crit<br>%.1f%% Haste<br>%.1f%% Mastery<br>%.1f%% Versatility<br>DPS: %d' % (100 * statPoint[0], 100 * statPoint[1], 100 * statPoint[2], 100 * statPoint[3], value)

statPoints = generateCoords(8)

statCoords = np.array([np.dot(sp, COORDS) for sp in statPoints])


x, y, z = statCoords.transpose()
dps = 100000 * (1 + y + z)

statTooltips = np.array([tooltipText(sp, v) for (sp, v) in zip(statPoints, dps)])
trace1 = go.Scatter3d(
    x=x,
    y=y,
    z=z,
    text=statTooltips,
    hoverinfo='text',
    mode='markers',
    marker=dict(
        size=6,
        line=dict(
            color='rgba(217, 217, 217, 0.14)',
            width=0.5
        ),
        color=dps,
        colorscale='Bluered',
        opacity=0.8
    )
)

"""
x2, y2, z2 = np.random.multivariate_normal(np.array([0,0,0]), np.eye(3), 200).transpose()
trace2 = go.Scatter3d(
    x=x2,
    y=y2,
    z=z2,
    mode='markers',
    marker=dict(
        color='rgb(127, 127, 127)',
        size=12,
        symbol='circle',
        line=dict(
            color='rgb(204, 204, 204)',
            width=1
        ),
        opacity=0.9
    )
)
"""

data = [trace1]
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
