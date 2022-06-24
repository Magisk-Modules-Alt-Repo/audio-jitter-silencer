## Audio jitter silencer
This module disables very large audio jitter generators (i.e., the adaptive battery draining management, the adaptive wireless connectivity management, and battery usage optimizations for audio related apps including system ones) for reducing audio jitter distortion effectively on all digital audio outputs (especially bluetooth earphones) so that you could enjoy very hi-fi audio music without very short reverb or foggy sound like digital audio distortion as much as possible in a simple manner. If you follow my request regarding to disabling battery optimizations written in README's of my other tools (["Audio misc. settings"](https://github.com/Magisk-Modules-Alt-Repo/audio-misc-settings), ["USB_SampleRate_Changer"](https://github.com/yzyhk904/USB_SampleRate_Changer), ["Hifi maximizer"](https://github.com/yzyhk904/hifi-maximizer-mod)), this module isn't needed at all and you could disable them manually by yourself. In short, on behalf of those who don't like to read the README's in detail this module will disable them automatically (but not completely).
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

* This module has been tested on LineageOS and ArrowOS ROM's, and phh GSI's (11 & 12, Qualcomm & MediaTek SoC, and Arm32 & Arm64 combinations). 
<br/><br/>

* Remark: This module runs only once at the first boot after installation and uninstallation. Please reboot immediately once after this first boot-up because the Device Idle Controller (the Doze battery saver) may fail to load hot "/data/system/deviceidle.xml" shortly after modified by this module.

* Note: Entry class USB DAC's usually adopt an interface chip communicating with the adaptive mode or the synchronous one defined in the USB audio standard. As in these modes an Android host controller sends audio sampling rate clock signals to the DAC, jitter generated at the host side affects the audio quality of the DAC tremendously. Higher class DAC's communicate with the asynchronous mode (also defined in the standard) to a host controller, but they actually use a PLL to reduce jitter from the host not to stutter even in heavy jitter situations. As this result, they behave as the adaptive mode with a feedback loop to dynamically adjust the host side sampling clock signals while referring a DAC side clock in a real sense, so even with the asynchronous mode they are more or less affected by host side jitter. You can see the mode of your USB DAC by opening "/proc/asound/card1/stream0" on your phone while playing music. Please see a word in parentheses at "Endpoint:" lines; "SYNC", "ADAPTIVE" or "ASYNC" means that your DAC uses "synchronous", "adaptive" or "asynchronous" mode to communicate to your phone, respectively. Moreover, almost all audio peripherals, e.g., bluetooth earphones, internal DAC's, network audio devices have a PLL in themselves and are affected by host side jitter for the same reason.

* See also my companion magisk module ["Audio misc. settings"](https://github.com/Magisk-Modules-Alt-Repo/audio-misc-settings) for simply improving audio quality with respect to the number of media volume steps and resampling distortion of the Android OS mixer (AudioFlinger), and my root script ["USB_SampleRate_Changer"](https://github.com/yzyhk904/USB_SampleRate_Changer) to change the sample rate of the USB (HAL) audio class driver and a 3.5mm jack on the fly like Bluetooth LDAC or Windows mixer to enjoy high resolution sound or to reduce resampling distortion (actually pre-echo, ringing and intermodulation) ultimately. If annoying (perhaps, for many people) DRC (Dynamic Range Control, i.e., a kind of compression) has been enabled on your device (e.g., smart phones and tablets having an SDM??? or SM???? model numbered SoC internally), you can disable DRC by this script. Or you can use my magisk module ["DRC remover"](https://github.com/Magisk-Modules-Alt-Repo/drc-remover) to simply disable DRC only.
<br/><br/>


## DISCLAIMER

* I am not responsible for any damage that may occur to your device, so it is your own choice to attempt this module.
<br/>

## Change logs

# v1.0.0
* Initial Release

##