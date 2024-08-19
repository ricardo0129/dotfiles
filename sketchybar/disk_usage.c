#include <stdio.h>
#include <sys/param.h>
#include <sys/mount.h>
#define ull unsigned long long

int main() {
    struct statfs buffer;

    // Get the filesystem statistics
    ull unit = 1024 * 1024 * 1024;
    if (statfs("/", &buffer) == 0) {
        // Print the results
        printf("Free Size: %llu bytes\n", (ull)buffer.f_bfree * buffer.f_bsize / unit);
        printf("total Size: %llu bytes\n", (ull)buffer.f_blocks * buffer.f_bsize / unit);
    } else {
        perror("statfs");
    }
    return 0;
}
