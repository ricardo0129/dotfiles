#import <sys/sysctl.h>
#import <mach/host_info.h>
#import <mach/mach_host.h>
#import <mach/task_info.h>
#import <mach/task.h>
#include <stdio.h>

int main() {
    int mib[6]; 
    mib[0] = CTL_HW;
    mib[1] = HW_PAGESIZE;

    int pagesize;
    size_t length;
    length = sizeof (pagesize);
    if (sysctl (mib, 2, &pagesize, &length, NULL, 0) < 0)
    {
        fprintf (stderr, "getting page size");
    }

    mach_msg_type_number_t count = HOST_VM_INFO_COUNT;

    vm_statistics_data_t vmstat;
    if (host_statistics (mach_host_self (), HOST_VM_INFO, (host_info_t) &vmstat, &count) != KERN_SUCCESS)
    {
        fprintf (stderr, "Failed to get VM statistics.");
    }

    double total = vmstat.wire_count + vmstat.active_count + vmstat.inactive_count + vmstat.free_count;
    double wired = vmstat.wire_count ;
    double active = vmstat.active_count  ;
    double inactive = vmstat.inactive_count ;
    double free = vmstat.free_count ;

    task_basic_info_64_data_t info;
    unsigned size = sizeof (info);
    task_info (mach_task_self (), TASK_BASIC_INFO_64, (task_info_t) &info, &size);

    double unit = 1024 * 1024 * 1024;
    //memLabel.text = [NSString stringWithFormat: @"% 3.1f MB\n% 3.1f MB\n% 3.1f MB", vmstat.free_count * pagesize / unit, (vmstat.free_count + vmstat.inactive_count) * pagesize / unit, info.resident_size / unit];
    printf("free: %.8lf\n", free * pagesize / unit);
    printf("wired: %.8lf\n", wired * pagesize / unit);
    printf("total: %.8lf\n", total * pagesize / unit);
    return 0;
}
