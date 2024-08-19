#include <unistd.h>
#include "sketchybar.h"
#include "network.h"

int main (int argc, char** argv) {
  float update_freq = 2.0;
  //if (argc < 4 || (sscanf(argv[3], "%f", &update_freq) != 1)) {
  //  printf("Usage: %s \"<interface>\" \"<event-name>\" \"<event_freq>\"\n", argv[0]);
  //  exit(1);
  //}

  //alarm(0);
  // Setup the event in sketchybar
  char event_message[512];
  snprintf(event_message, 512, "--add event '%s'", "network_update");
  //sketchybar(event_message);

  struct network network;
  network_init(&network, "en0");
  char trigger_message[512];
  for (;;) {
    // Acquire new info
    network_update(&network);

    // Prepare the event message
    printf("upload=%d%s download=%d%s\n",
             network.up,
             unit_str[network.up_unit],
             network.down,
             unit_str[network.down_unit]);

    snprintf(trigger_message,
             512,
             "--trigger '%s' upload='%03d %s' download='%03d %s'",
             "network_update",
             network.up,
             unit_str[network.up_unit],
             network.down,
             unit_str[network.down_unit]);

    // Trigger the event
    //sketchybar(trigger_message);

    // Trigger the event
    //sketchybar(trigger_message);

    // Wait
    usleep(update_freq * 1000000);
  }
  return 0;
}
