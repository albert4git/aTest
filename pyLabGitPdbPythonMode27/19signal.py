#! /usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8
#
# Copyright © 2019 red <red@red-Swift-SF113-31>
#
# Distributed under terms of the MIT license.
"""

"""
import numpy as np
import matplotlib.pyplot as plt
from scipy import signal
a = np.linspace(0, 1, 1000)

signala = np.sin(2 * np.pi * 100 * a)  # with frequency of 100
#plt.plot(signala)

signalb = np.sin(2 * np.pi * 20 * a)  # frequency 20
plt.plot(signalb)

plt.show()

#=============================================================
import numpy as np
import matplotlib.pyplot as plt
from scipy import signal

fs = 1000  # Sampling frequency
# Generate the time vector properly
t = np.arange(1000) / fs
signala = np.sin(2 * np.pi * 100 * t)  # with frequency of 100
plt.plot(t, signala, label='a')

signalb = np.sin(2 * np.pi * 20 * t)  # frequency 20
plt.plot(t, signalb, label='b')

signalc = signala + signalb
plt.plot(t, signalc, label='c')

fc = 30  # Cut-off frequency of the filter
w = fc / (fs / 2)  # Normalize the frequency
b, a = signal.butter(5, w, 'low')
output = signal.filtfilt(b, a, signalc)
plt.plot(t, output, label='filtered')
plt.legend()
plt.show()
#==Err===========================================================
import numpy as np
import matplotlib.pyplot as plt
v_in = np.random.uniform(-0.005, 0.005, 150) + 5
v_out = 1 / (
    1 + 1 * 0.1E-6 * s) * v_in  #this line is wrong, no such thing as '*s'
plt.plot(v_in)
plt.plot(v_out)
plt.axis([0, 150, 4.95, 5.05])
plt.title('Bypass capacitor')
plt.ylabel('Volts')
plt.xticks(v_in, " ")
plt.show()
#===Err==========================================================
import matplotlib.pyplot as plt
from scipy import signal

sys = signal.lti(1, [1 * 0.1E-6, 1])
t = np.linspace(0, 5, 150)
v_in = np.random.uniform(-0.005, 0.005, 150) + 5
tout, y, x = signal.lsim(sys, v_in, t)

plt.plot(t, y)
#=============================================================
import numpy as np
import pandas as pd
from scipy import signal
import matplotlib.pyplot as plt


def sine_generator(fs, sinefreq, duration):
    T = duration
    nsamples = fs * T
    w = 2. * np.pi * sinefreq
    t_sine = np.linspace(0, T, nsamples, endpoint=False)
    y_sine = np.sin(w * t_sine)
    result = pd.DataFrame({'data': y_sine}, index=t_sine)
    return result


def butter_highpass(cutoff, fs, order=5):
    nyq = 0.5 * fs
    normal_cutoff = cutoff / nyq
    b, a = signal.butter(order, normal_cutoff, btype='high', analog=False)
    return b, a


def butter_highpass_filter(data, cutoff, fs, order=5):
    b, a = butter_highpass(cutoff, fs, order=order)
    y = signal.filtfilt(b, a, data)
    return y


fps = 30
sine_fq = 10  #Hz
duration = 10  #seconds
sine_5Hz = sine_generator(fps, sine_fq, duration)
sine_fq = 1  #Hz
duration = 10  #seconds
sine_1Hz = sine_generator(fps, sine_fq, duration)

sine = sine_5Hz + sine_1Hz

filtered_sine = butter_highpass_filter(sine.data, 10, fps)

plt.figure(figsize=(20, 10))
plt.subplot(211)
plt.plot(range(len(sine)), sine)
plt.title('generated signal')
plt.subplot(212)
plt.plot(range(len(filtered_sine)), filtered_sine)
plt.title('filtered signal')
plt.show()

#====Err=========================================================
import scipy.integrate


def showIfromV(fig, t, Linv, V, psi0list=[0], showV=False):
    N = len(psi0list)
    k = 1 if showV else 0
    if showV:
        ax = fig.add_subplot(N + k, 1, 1)
        ax.plot(t, V)
        ax.set_ylabel('V_L')
    for (i, psi0) in enumerate(psi0list):
        ax = fig.add_subplot(N + k, 1, i + k + 1)
        flux = scipy.integrate.cumtrapz(V, t, initial=0) + psi0
        ax.plot(t, Linv(flux), [min(t), max(t)], [Linv(psi0)] * 2, ':k')
        ax.set_ylabel('I_L (A)')


def pwm(t, T, D):
    tri = abs((t / T % 1) * 2 - 1)
    return tri < D


fig = figure(figsize=(8, 6), dpi=80)
t2 = np.arange(0, 1, 0.0001) * 1e-3
(Da, Db) = (0.75, 0.25)
Vdc = 24
T = 100e-6
V = ((pwm(t2, T, Da) - pwm(t2, T, Db)) - (Da - Db)) * Vdc
showIfromV(fig, t2, L1inv, V, psi0list=[L1(10)], showV=True)

#====Err=========================================================
from scipy.signal import butter, lfilter
from scipy.signal import freqs


def butter_lowpass(cutOff, fs, order=5):
    nyq = 0.5 * fs
    normalCutoff = cutOff / nyq
    b, a = butter(order, normalCutoff, btype='low', analog=True)
    return b, a


def butter_lowpass_filter(data, cutOff, fs, order=4):
    b, a = butter_lowpass(cutOff, fs, order=order)
    y = lfilter(b, a, data)
    return y


cutOff = 23.1  #cutoff frequency in rad/s
fs = 188.495559  #sampling frequency in rad/s
order = 20  #order of filter

#print sticker_data.ps1_dxdt2

y = butter_lowpass_filter(data, cutOff, fs, order)
plt.plot(y)

#https://docs.scipy.org/doc/scipy-0.14.0/reference/generated/scipy.signal.bessel.html
#====Yes=========================================================
import numpy as np
from scipy import signal
import matplotlib.pyplot as plt
b, a = signal.butter(4, 100, 'low', analog=True)
w, h = signal.freqs(b, a)
plt.plot(w, 20 * np.log10(np.abs(h)), color='silver', ls='dashed')
b, a = signal.bessel(4, 100, 'low', analog=True)
w, h = siVgnal.freqs(b, a)
plt.plot(w, 20 * np.log10(np.abs(h)))
plt.xscale('log')
plt.title('Bessel filter frequency response (with Butterworth)')
plt.xlabel('Frequency [radians / second]')
plt.ylabel('Amplitude [dB]')
plt.margins(0, 0.1)
plt.grid(which='both', axis='both')
plt.axvline(100, color='green')  # cutoff frequency
plt.show()

#====Yes=========================================================
#====Yes=========================================================
#https://stackoverflow.com/questions/25191620/creating-lowpass-filter-in-scipy-understanding-methods-and-units

import numpy as np
from scipy.signal import butter, lfilter, freqz
import matplotlib.pyplot as plt


def butter_lowpass(cutoff, fs, order=5):
    nyq = 0.5 * fs
    normal_cutoff = cutoff / nyq
    b, a = butter(order, normal_cutoff, btype='low', analog=False)
    return b, a


def butter_lowpass_filter(data, cutoff, fs, order=5):
    b, a = butter_lowpass(cutoff, fs, order=order)
    y = lfilter(b, a, data)
    return y


# Filter requirements.
order = 6
fs = 30.0  # sample rate, Hz
cutoff = 3.667  # desired cutoff frequency of the filter, Hz

# Get the filter coefficients so we can check its frequency response.
b, a = butter_lowpass(cutoff, fs, order)

# Plot the frequency response.
w, h = freqz(b, a, worN=8000)
plt.subplot(2, 1, 1)
plt.plot(0.5 * fs * w / np.pi, np.abs(h), 'b')
plt.plot(cutoff, 0.5 * np.sqrt(2), 'ko')
plt.axvline(cutoff, color='k')
plt.xlim(0, 0.5 * fs)
plt.title("Lowpass Filter Frequency Response")
plt.xlabel('Frequency [Hz]')
plt.grid()

# Demonstrate the use of the filter.
# First make some data to be filtered.
T = 5.0  # seconds
n = int(T * fs)  # total number of samples
t = np.linspace(0, T, n, endpoint=False)
# "Noisy" data.  We want to recover the 1.2 Hz signal from this.
data = np.sin(1.2 * 2 * np.pi * t) + 1.5 * np.cos(
    9 * 2 * np.pi * t) + 0.5 * np.sin(12.0 * 2 * np.pi * t)

# Filter the data, and plot both the original and filtered signals.
y = butter_lowpass_filter(data, cutoff, fs, order)

plt.subplot(2, 1, 2)
plt.plot(t, data, 'b-', label='data')
plt.plot(t, y, 'g-', linewidth=2, label='filtered data')
plt.xlabel('Time [sec]')
plt.grid()
plt.legend()

plt.subplots_adjust(hspace=0.35)
plt.show()
import numpy as np
from scipy import signal
import matplotlib.pyplot as plt

b, a = signal.bessel(4, 100, 'low', analog=True)
w, h = signal.freqs(b, a)
plt.plot(w, 20 * np.log10(abs(h)))
plt.xscale('log')
plt.title('Butterworth filter frequency response')
plt.xlabel('Frequency [radians / second]')
plt.ylabel('Amplitude [dB]')
plt.margins(0, 0.1)
plt.grid(which='both', axis='both')
plt.axvline(100, color='green')  # cutoff frequency
plt.show()
