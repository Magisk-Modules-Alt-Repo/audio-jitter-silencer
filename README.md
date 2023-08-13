## Audio jitter silencer
This module disables very large audio jitter generators (i.e., the adaptive battery draining and charging management, the adaptive wireless connectivity management, and battery usage optimizations for audio related apps including system ones) for reducing audio jitter distortion effectively on all digital audio outputs (especially on bluetooth earphones) so that you could enjoy very hi-fi audio music without very short reverb or foggy sound like audio jitter distortion as much as possible in a simple manner. 
<br/>

Audio jitter has two types that one is for phase variations of a master clock and the other is for frequency variations of an audio data stream (an actual audio data rate) via a PLL. Only the latter is considered here. The normalized amount of such audio jitter can be defined as the standard deviation of an actual audio data rate (with a low-pass filter) divided by its average data rate. For example, the expected average audio data rate of a 16bit 44.1kHz stereo track is 1.4112Mbps (16 x 44.1 x 2 / 1000). If the standard deviation is 15.0kbps, then the (normalized) jitter is 1.06%. If assuming the adaptive mode (defined in the USB audio standard) is used between a host device and a USB DAC, and the PLL in this DAC attenuates the jitter down-to 1/2 times (this is usual for less than 10 Hz jitter such as the Doze and the battery draining management generate), then the standard 1kHz sine test signal will have the standard deviation of 5.3 Hz. This is the audio jitter distortion caused by the variation of an actual audio data rate.
<br/>

Finally, if you follow my request regarding to disabling battery optimizations written in README's of my other tools (["Audio misc. settings"](https://github.com/Magisk-Modules-Alt-Repo/audio-misc-settings), ["USB_SampleRate_Changer"](https://github.com/yzyhk904/USB_SampleRate_Changer), ["Hifi maximizer"](https://github.com/yzyhk904/hifi-maximizer-mod)), this module isn't needed at all and you could disable them manually by yourself. In short, on behalf of those who don't like to read the README's in detail this module will disable them automatically (but not completely). But additionally please manually uninstall "Digital Wellbeing" (system app; if it exists) itself or change "Battery usage" from "Optimized" to "Restricted" (this is very harmful for audio like camera servers) because this module cannot.
<br/>
<br/>

This module behaves as follows:
<ol>
    <li>disables the adaptive battery drain monitoring feature of the battery manager,</li>
    <li>disables the adaptive connectivity feature of the data network manager,</li>
    <li>disables the WI-FI suspend optimizations feature of the WI-FI network manager,</li>
    <li>merges your original Doze white-list "/data/system/deviceidle.xml" (you have made via the app section (the battery usage or battery optimization part) of the Android settings interface) with an audio specific Doze white-list while backing up the original one (so that it can be restored when uninstalling this module).</li>
</ol>
<br/>
<br/>

* This module has been tested on LineageOS and ArrowOS ROM's, and phh GSI's (11 ~ 13, Qualcomm & MediaTek SoC, and Arm32 & Arm64 combinations). 
<br/><br/>

* Remark: This module merges the above Doze white-list's only once at the first boot after installation, and also restores the backup to its original at the first boot after uninstallation. Please reboot immediately once after this first boot-up because the Device Idle Controller (the Doze battery saver) may fail to load hot "/data/system/deviceidle.xml" shortly after modified by this module. If you modify any battery optimization of  this kind after the installation, the Android system will filter out the white-list merged except existing apps on your device. So you will need manually maintain battery opyimization of new apps, or uninstall (reboot twice immediately) and reinstall this module (reboot once immediately after this reinstallation).

* Note: Entry class USB DAC's usually adopt an interface chip communicating with the adaptive mode or the synchronous one defined in the USB audio standard. As in these modes an Android host controller sends audio sampling rate clock signals to the DAC, jitter generated at the host side affects the audio quality of the DAC tremendously. Higher class DAC's communicate with the asynchronous mode (also defined in the standard) to a host controller, but they actually use a PLL to reduce jitter from the host not to stutter even in heavy jitter situations. As this result, they behave as the adaptive mode with a feedback loop to dynamically adjust the host side sampling clock signals while referring a DAC side clock in a real sense, so even with the asynchronous mode they are more or less affected by host side jitter. You can see the mode of your USB DAC by opening "/proc/asound/card1/stream0" on your phone while playing music. Please see a word in parentheses at "Endpoint:" lines; "SYNC", "ADAPTIVE" or "ASYNC" means that your DAC uses "synchronous", "adaptive" or "asynchronous" mode to communicate to your phone, respectively. Moreover, almost all audio peripherals, e.g., bluetooth earphones, internal DAC's, network audio devices have a PLL in themselves and are affected by host side jitter for the same reason.

* See also my companion magisk module ["Audio misc. settings"](https://github.com/Magisk-Modules-Alt-Repo/audio-misc-settings) for simply improving audio quality with respect to the number of media volume steps and resampling distortion of the Android OS mixer (AudioFlinger), and my root script ["USB_SampleRate_Changer"](https://github.com/yzyhk904/USB_SampleRate_Changer) to change the sample rate of the USB (HAL) audio class driver and a 3.5mm jack on the fly like Bluetooth LDAC or Windows mixer to enjoy high resolution sound or to reduce resampling distortion (actually pre-echo, ringing and intermodulation) ultimately. If annoying (perhaps, for many people) DRC (Dynamic Range Control, i.e., a kind of compression) has been enabled on your device (e.g., smart phones and tablets having an SDM??? or SM???? model numbered SoC internally), you can disable DRC by this script. Or you can use my magisk module ["DRC remover"](https://github.com/Magisk-Modules-Alt-Repo/drc-remover) to simply disable DRC only.
<br/><br/>


## DISCLAIMER

* I am not responsible for any damage that may occur to your device, so it is your own choice to attempt this module.
<br/>

##
