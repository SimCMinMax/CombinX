# -*- coding: utf-8 -*-
# pylint: disable=C0103
# pylint: disable=C0301

"""
@author: skasch, Aethys256, 0tt3r
"""

# Imports
import glob
import json
import re
import os
import shutil
import subprocess
import numpy as np
import plotly

### Constants
CRIT_COORDS = np.array([- np.sqrt(6.) / 3., - np.sqrt(2.) / 3., -1. / 3.])
HAST_COORDS = np.array([np.sqrt(6.) / 3., - np.sqrt(2.) / 3., -1. / 3.])
MAST_COORDS = np.array([0., 2. * np.sqrt(2.) / 3., -1. / 3.])
VERS_COORDS = np.array([0., 0., 1.])

COORDS = np.array([
    CRIT_COORDS,
    HAST_COORDS,
    MAST_COORDS,
    VERS_COORDS,
])

STAT_BUDGET = {
    '17k': 16758,
    '21k': 21334,
    '27k': 27160,
}

### Functions

#This allows us to sort files numerically. sorted() puts chunk11 before chunk2
numbers = re.compile(r'(\d+)')
def numericalSort(value):
    parts = numbers.split(value)
    parts[1::2] = map(int, parts[1::2])
    return parts

def generateStats(nSteps, statRange=1., nominalValues=np.array([0.25, 0.25, 0.25, 0.25])):
    statRange = min(statRange, 4 * min(nominalValues))
    baseValues = nominalValues - statRange / 4
    sp = []
    for c in range(nSteps + 1):
        for h in range(nSteps - c + 1):
            for m in range(nSteps - c - h + 1):
                v = nSteps - c - h - m
                sp = sp + [baseValues + statRange * np.array([float(c) / nSteps, float(h) / nSteps, float(m) / nSteps, float(v) / nSteps])]
    return np.array(sp)

def tooltipText(statPoint, value, maxDps):
    return '%.1f%% Crit<br>%.1f%% Haste<br>%.1f%% Mastery<br>%.1f%% Versatility<br>DPS: %d [%.1f%%]' % (100 * statPoint[0], 100 * statPoint[1], 100 * statPoint[2], 100 * statPoint[3], value, 100. * value / maxDps)

def generateTickStep(dps):
    coeff = [1., 2., 5.]
    coeffIdx = 0
    mult = 1.
    step = coeff[coeffIdx] * mult

    #Replaces 0 by NaN to ignore 0 as min
    dps_new = dps
    dps_new[dps_new == 0] = np.nan

    dpsRange = max(dps) - min(dps_new)
    while dpsRange / step >= 8:
        coeffIdx = (coeffIdx + 1) % 3
        if coeffIdx == 0:
            mult = mult * 10.
        step = coeff[coeffIdx] * mult
    return step

def generateTickValues(dps, tickStep):
    dpsTickValues = [tickStep * c for c in range(int(np.ceil(min(dps) / tickStep)), int(np.floor(max(dps) / tickStep) + 1))]
    return [min(dps)] + dpsTickValues + [max(dps)]

def generateTickTexts(dps, tickValues):
    return [generateTickText(tickValues[idx], tickValues[idx] / max(dps), idx == len(tickValues) - 1) for idx in range(len(tickValues))]

def generateTickText(tickValue, ratio, baseline=False):
    multStep = 1000.
    multipliers = [
        dict(suffix='', mult=pow(multStep, 0)),
        dict(suffix='k', mult=pow(multStep, 1)),
        dict(suffix='M', mult=pow(multStep, 2)),
        dict(suffix='G', mult=pow(multStep, 3)),
    ]
    multiplier = multipliers[0]
    for m in multipliers:
        if np.round(tickValue / m['mult'], decimals=2) >= 1:
            multiplier = m
    baseText = float('%.3g' % np.round(tickValue / multiplier['mult'], decimals=2))
    baseText = int(baseText) if int(baseText) == baseText else baseText
    suffix = multiplier['suffix']
    percent = float('%.1f' % (100 * ratio))
    percent = int(percent) if percent == int(percent) else percent
    return '%s%s [%s%%]' % (baseText, suffix, percent)

def traceStatsPoints(statPoints, dps):
    statCoords = np.array([np.dot(sp, COORDS) for sp in statPoints])
    x, y, z = statCoords.transpose()
    statTooltips = np.array([tooltipText(sp, v, max(dps)) for (sp, v) in zip(statPoints, dps)])
    sizes = 6 + 6 * (dps >= max(dps) - (max(dps) - min(dps)) * 0.05) + 6 * (dps == max(dps))
    colors = dps
    tickValues = generateTickValues(dps, generateTickStep(dps))
    tickTexts = generateTickTexts(dps, tickValues)
    return plotly.graph_objs.Scatter3d(
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
            colorbar=plotly.graph_objs.ColorBar(
                title='DPS',
                tickvals=tickValues,
                ticktext=tickTexts,
            ),
            colorscale=[
                [0., 'rgba(40,55,255, 0.3)'],
                [0.95, 'rgba(255, 60, 25, 0.7)'],
                [0.9501, 'rgba(255, 60, 25, 1)'],
                [0.9999, 'rgba(255, 60, 25, 1)'],
                [1., 'rgba(25, 225, 55, 1)']
            ],
        ),
        showlegend=False,
    )

def traceStatLabels():
    x, y, z = COORDS.transpose()
    return plotly.graph_objs.Scatter3d(
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
    layout = plotly.graph_objs.Layout(
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
    fig = plotly.graph_objs.Figure(data=data, layout=layout)
    return plotly.plotly.plot(fig, filename=plotname, auto_open=False) #Online
    #return plotly.offline.plot(fig, show_link=False, output_type='file', filename=plotname+'.html') #Offline with JS included
    #return plotly.offline.plot(fig, show_link=False, output_type='div', include_plotlyjs=False) #Only the div container

def generateStatRatings(statPoints, statBudget):
    return np.array([np.round(sp * statBudget) for sp in statPoints])

def statRatingSuffix(statRating):
    return '%icrit_%ihaste_%imast_%ivers' % (statRating[0], statRating[1], statRating[2], statRating[3])

def statRatingSimc(statRating):
    return 'gear_crit_rating=%i\ngear_haste_rating=%i\ngear_mastery_rating=%i\ngear_versatility_rating=%i' % (statRating[0], statRating[1], statRating[2], statRating[3])

def generateStatsSimc(statRatings, filename, budget, statStep):
    if filename[-5:] != '.simc':
        filename = filename + '.simc'
    with open(filename, 'w') as f:
        f.write('$(sim_type)=plot_%sstats_by%s\n' % (budget, statStep))
        f.write('name=$(root)_%s\n' % statRatingSuffix(statRatings[0]))
        f.write('$(base_name)=$(root)_%s\n' % statRatingSuffix(statRatings[0]))
        f.write(statRatingSimc(statRatings[0]) + '\n')
        for sp in statRatings[1:]:
            f.write('copy=$(root)_%s,$(base_name)\n%s\n' % (statRatingSuffix(sp), statRatingSimc(sp)))

#This function generates many small simc files, each having a chunk of the
#total parameter space to be searched.
def generateStatsSimcChunk(statRatings, filename, budget, statStep, chunkSize):
    counter = 0
    fileCounter = 0
    for sp in statRatings[0:]:
        if counter%chunkSize == 0:
            f = open(filename + '_chunk' + str(fileCounter) + '.simc', 'w')
            f.write('$(sim_type)=plot_%sstats_by%s\n' % (budget, statStep))
            f.write('name=$(root)_%s\n' % statRatingSuffix(statRatings[counter]))
            f.write('$(base_name)=$(root)_%s\n' % statRatingSuffix(statRatings[counter]))
            f.write(statRatingSimc(statRatings[counter]) + '\n')
            fileCounter += 1
        else:
            f.write('copy=$(root)_%s,$(base_name)\n%s\n' % (statRatingSuffix(sp), statRatingSimc(sp)))
        counter += 1

def readDps(filename):
    if filename[-5:] != '.json':
        filename = filename + '.json'
    with open(filename) as f:
        simData = json.load(f)
    return np.array([p['collected_data']['dps']['mean'] for p in simData['sim']['players']])


#This routine reads in each chunk and appends it to a single DPS array.
#The chunks are stored in a subdirectory within reports
#numericalSort allows us to sort the files in the correct order,
#since the default sort would put chunk11 before chunk2. This would mess up the plot
def readDpsChunk(reports_subdir):
    simData = np.array([])
    for filename in sorted(glob.glob("../reports/" + reports_subdir  + "/*.json"), key=numericalSort):
        with open(filename) as f:
            simDataChunk = json.load(f)
            simData = np.append(simData, np.array([p['collected_data']['dps']['mean'] for p in simDataChunk['sim']['players']]))
    return simData

def runSimcProfiles(inputParams):
    simcPath = inputParams['simcPath']
    steps = inputParams['steps']
    chunkSize = inputParams['chunkSize']
    targetError = inputParams['targetError']
    budget = inputParams['budget']
    tier = inputParams['tier']
    specialization = inputParams['specialization']
    classs = inputParams['class']
    fightStyle = inputParams['fightStyle']
    #Make abbreviations
    spec = specialization[0:3]
    clas = classs[0:3]
    #Generate specializtion file - I don't know that this is necessary, but I did not
    #want to change the main.simc file
    with open("specialization/" + classs + "_" + specialization + ".simc", "w") as myfile:
        data = "$(class)=" + classs + "\n$(Class)=" + classs.capitalize()
        data += "\n$(clas)=" + clas + "\n$(Clas)=" + clas.capitalize()
        data += "\n$(specialization)=" + specialization
        data += "\n$(Specialization)=" + specialization.capitalize()
        data += "\n$(spec)=" + spec + "\n$(Spec)=" + spec.capitalize()
        myfile.write(data)

    #Change the config.simc file
    with open("../config.simc", "r") as myfile:
        data = myfile.read()
    data = re.sub(r"(\$\(class\)=).+",r"\g<1>" + classs,data)
    data = re.sub(r"(target_error=).+",r"\g<1>" + str(targetError),data)
    with open("../config.simc", "w") as myfile:
        myfile.write(data)

    statStep = int(STAT_BUDGET[budget] / steps)

    #generate simC files - store them in a temporary directory
    tmpDir = 'tmp_simc_files'
    if not os.path.exists(tmpDir):
        os.makedirs(tmpDir)
    fileRoot = '%s_%s_%s_%s_plot_%sstats_by%s' % (classs, specialization, tier, fightStyle, budget, statStep)
    simcFile = tmpDir + "/" + fileRoot
    statPoints = generateStats(steps)
    statRatings = generateStatRatings(statPoints, STAT_BUDGET[budget])
    generateStatsSimcChunk(statRatings, simcFile, budget, statStep, chunkSize)

    #Make a subdirectory in the reports directory to keep it more organized when running many classes
    reportsSubdir = fileRoot
    if not os.path.exists("../reports/" + reportsSubdir):
        os.makedirs("../reports/" + reportsSubdir)

    #run simc on all of the chunks
    for filename in sorted(glob.glob(simcFile + "*.simc"), key=numericalSort):
        simc_command = simcPath + ' input=..\config.simc output=nul "$(fight_style)=' + fightStyle + '" "$(specialization)=' + specialization + '" "$(tier)=' + tier + '" input=main.simc input=report_json.simc input=' + filename
        subprocess.run(simc_command)
        #Get just the chunk## part of the file, since the directory stores most of the information
        reportFile = os.path.splitext(os.path.basename(filename))[0].replace(fileRoot + "_", "")
        shutil.move('../reports/%s_%s_%s_%s_default.json' % (clas, spec, tier, fightStyle), '../reports/' + reportsSubdir +  '/' + reportFile + '.json')

        
def generatePlotly(inputParams):
    simcPath = inputParams['simcPath']
    steps = inputParams['steps']
    chunkSize = inputParams['chunkSize']
    targetError = inputParams['targetError']
    budget = inputParams['budget']
    tier = inputParams['tier']
    specialization = inputParams['specialization']
    classs = inputParams['class']
    fightStyle = inputParams['fightStyle']
    #Make abbreviations
    spec = specialization[0:3]
    clas = classs[0:3]
    statPoints = generateStats(steps)
    statStep = int(STAT_BUDGET[budget] / steps)
    statCoords = np.array([np.dot(sp, COORDS) for sp in statPoints])
    x, y, z = statCoords.transpose()
    fileRoot = '%s_%s_%s_%s_plot_%sstats_by%s' % (classs, specialization, tier, fightStyle, budget, statStep)
    reportsSubdir = fileRoot
    dps = readDpsChunk(reportsSubdir)

    trace = traceStatsPoints(statPoints, dps)
    traceLabels = traceStatLabels()
    return generatePlot(trace, traceLabels, fileRoot)
