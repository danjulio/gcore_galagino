#ifndef _CONFIG_H_
#define _CONFIG_H_

// game config
//#define FREEPLAY     // define for free play, no coin button required, but also no attract mode

// update rate - undefine to try 60 Hz instead of 30 Hz
#define FAST_FPS

// x and y offset of 224x288 pixels at the middle bottom of the 320x480 screen
#define TFT_X_OFFSET 48
#define TFT_Y_OFFSET 192

// audio config
#define SND_DIFF   // set to output differential audio on GPIO25 _and_ inverted on GPIO26

// pins used for buttons
#define BTN_START_PIN  34
#define BTN_COIN_PIN   36
#define BTN_LEFT_PIN   39
#define BTN_RIGHT_PIN  35
#define BTN_FIRE_PIN   33

#endif // _CONFIG_H_
