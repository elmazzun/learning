#include <linux/kernel.h>
#include <linux/init.h>
#include <linux/module.h>
#include <linux/sched.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("elmazzun");
MODULE_DESCRIPTION("Get running process");

static int current_init(void)
{
	// Gather info from task_struct
	long state = current->state;
	unsigned int current_cpu = current->cpu;
	unsigned int pid = current->pid;
	char *name = current->comm;

	// Printk
	printk("[current] name: \"%s\"\n", name);
	printk("[current] Running on CPU: %u\n", current_cpu);
	printk("[current] PID: %u\n", pid);
	switch (state) {
	case -1:
		printk("[current] Process: unrunnable\n");
		break;
	case 0:
		printk("[current] Process: runnable\n");
		break;
	default:
		printk("[current] Process: stopped\n");
		break;	
	}
	return 0;
}

static void current_exit(void)
{
        printk("[current] bye bye\n");
}

module_init(current_init);
module_exit(current_exit);
