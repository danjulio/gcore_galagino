/*
 * Wrapper for TFT_eSPI
 */
#include "Adafruit_GFX.h"
#include "TFT_eSPI.h"

#ifndef VIDEO_H
#define VIDEO_H

class Video {
public:
  Video();

  void begin(void);
  void write(uint16_t *colors, uint32_t len);

private:
  TFT_eSPI tft;
};

#endif // VIDEO_H
