/*
 * video.cpp
 */

#include <Arduino.h>
#include "video.h"
#include "config.h"
#include "galaga_bg_h_320_480.h"


Video::Video() {
}

void Video::begin(void) {
  tft.begin();
  
  // Set rotation
  tft.setRotation(0);
  
  // Draw background
  tft.setAddrWindow(0, 0, 320, 480);
  tft.startWrite();
  tft.pushPixels((uint16_t*) galaga_bg_h_320_480_map, 320*480);
  tft.endWrite();
  
  // set active screen area to 224x288 pixels
  tft.setAddrWindow(TFT_X_OFFSET, TFT_Y_OFFSET, 224, 288);
}

void Video::write(uint16_t *colors, uint32_t len) {
  tft.startWrite();
  tft.pushPixels(colors, len);
  tft.endWrite();
}
