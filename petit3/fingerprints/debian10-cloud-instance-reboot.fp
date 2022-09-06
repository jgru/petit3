Sep  6 10:22:55 host kernel: [    0.000000] Linux version 4.19.0-20-amd64 (debian-kernel@lists.debian.org) (gcc version 8.3.0 (Debian 8.3.0-6)) #1 SMP Debian 4.19.235-1 (2022-03-17)
Sep  6 10:22:55 host kernel: [    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-4.19.0-20-amd64 root=UUID=4236cc65-d07b-4264-8ae6-ff71b870d7cc ro consoleblank=0 systemd.show_status=true elevator=noop console=tty1 console=ttyS0
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: xstate_offset[5]: 1088, xstate_sizes[5]:   64
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: xstate_offset[6]: 1152, xstate_sizes[6]:  512
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: xstate_offset[7]: 1664, xstate_sizes[7]: 1024
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: xstate_offset[9]: 2688, xstate_sizes[9]:    8
Sep  6 10:22:55 host kernel: [    0.000000] x86/fpu: Enabled xstate features 0x2e7, context size is 2696 bytes, using 'standard' format.
Sep  6 10:22:55 host systemd-tmpfiles[298]: [/usr/lib/tmpfiles.d/fail2ban-tmpfiles.conf:1] Line references path below legacy directory /var/run/, updating /var/run/fail2ban → /run/fail2ban; please update the tmpfiles.d/ drop-in file accordingly.
Sep  6 10:22:55 host systemd[1]: Starting Flush Journal to Persistent Storage...
Sep  6 10:22:55 host systemd[1]: Started Flush Journal to Persistent Storage.
Sep  6 10:22:55 host systemd-udevd[321]: Using default interface naming scheme 'v240'.
Sep  6 10:22:55 host systemd-udevd[321]: link_config: autonegotiation is unset or enabled, the speed and duplex are not writable.
Sep  6 10:22:55 host systemd[1]: Found device /dev/ttyS0.
Sep  6 10:22:55 host systemd-udevd[318]: link_config: autonegotiation is unset or enabled, the speed and duplex are not writable.
Sep  6 10:22:55 host systemd[1]: Condition check resulted in File System Check on Root Device being skipped.
Sep  6 10:22:55 host systemd[1]: Condition check resulted in FUSE Control File System being skipped.
Sep  6 10:22:55 host systemd[1]: Condition check resulted in Kernel Configuration File System being skipped.
Sep  6 10:22:55 host systemd[1]: Condition check resulted in Rebuild Hardware Database being skipped.
Sep  6 10:22:55 host systemd[1]: Condition check resulted in Set Up Additional Binary Formats being skipped.
Sep  6 10:22:55 host systemd[1]: Found device QEMU_HARDDISK 15.
Sep  6 10:22:55 host systemd[1]: Starting File System Check on /dev/disk/by-uuid/9BE0-60DB...
Sep  6 10:22:55 host systemd[1]: Started File System Check Daemon to report status.
Sep  6 10:22:55 host systemd[1]: Started Helper to synchronize boot up for ifupdown.
Sep  6 10:22:55 host systemd-fsck[381]: fsck.fat 4.1 (2017-01-24)
Sep  6 10:22:55 host systemd-fsck[381]: /dev/sda15: 3 files, 259/245980 clusters
Sep  6 10:22:55 host systemd[1]: Started File System Check on /dev/disk/by-uuid/9BE0-60DB.
Sep  6 10:22:55 host systemd[1]: Mounting /boot/efi...
Sep  6 10:22:55 host systemd[1]: Mounted /boot/efi.
Sep  6 10:22:55 host systemd[1]: Reached target Local File Systems.
Sep  6 10:22:55 host systemd[1]: Starting netfilter persistent configuration...
Sep  6 10:22:55 host systemd[1]: Starting Set console font and keymap...
Sep  6 10:22:55 host systemd[1]: Starting Create Volatile Files and Directories...
Sep  6 10:22:55 host systemd[1]: Condition check resulted in Commit a transient machine-id on disk being skipped.
Sep  6 10:22:55 host systemd[1]: Started Set console font and keymap.
Sep  6 10:22:55 host netfilter-persistent[394]: run-parts: executing /usr/share/netfilter-persistent/plugins.d/15-ip4tables start
Sep  6 10:22:55 host systemd-tmpfiles[398]: [/usr/lib/tmpfiles.d/fail2ban-tmpfiles.conf:1] Line references path below legacy directory /var/run/, updating /var/run/fail2ban → /run/fail2ban; please update the tmpfiles.d/ drop-in file accordingly.
Sep  6 10:22:55 host systemd[1]: Started Create Volatile Files and Directories.
Sep  6 10:22:55 host systemd[1]: Starting Network Time Synchronization...
Sep  6 10:22:55 host systemd[1]: Starting Update UTMP about System Boot/Shutdown...
Sep  6 10:22:55 host systemd[1]: Started Update UTMP about System Boot/Shutdown.
Sep  6 10:22:55 host netfilter-persistent[394]: run-parts: executing /usr/share/netfilter-persistent/plugins.d/25-ip6tables start
Sep  6 10:22:55 host systemd[1]: Started netfilter persistent configuration.
Sep  6 10:22:55 host systemd[1]: Started Network Time Synchronization.
Sep  6 10:22:55 host systemd[1]: Reached target System Time Synchronized.
Sep  6 10:22:55 host cloud-init[294]: Cloud-init v. 20.2 running 'init-local' at Tue, 06 Sep 2022 10:22:52 +0000. Up 6.35 seconds.
Sep  6 10:22:55 host systemd[1]: Started Initial cloud-init job (pre-networking).
Sep  6 10:22:55 host systemd[1]: Reached target Network (Pre).
Sep  6 10:22:55 host systemd[1]: Starting Raise network interfaces...
Sep  6 10:22:55 host dhclient[463]: Internet Systems Consortium DHCP Client 4.4.1
Sep  6 10:22:55 host ifup[435]: Internet Systems Consortium DHCP Client 4.4.1
Sep  6 10:22:55 host ifup[435]: Copyright 2004-2018 Internet Systems Consortium.
Sep  6 10:22:55 host ifup[435]: All rights reserved.
Sep  6 10:22:55 host ifup[435]: For info, please visit https://www.isc.org/software/dhcp/
Sep  6 10:22:55 host dhclient[463]: Copyright 2004-2018 Internet Systems Consortium.
Sep  6 10:22:55 host dhclient[463]: All rights reserved.
Sep  6 10:22:55 host dhclient[463]: For info, please visit https://www.isc.org/software/dhcp/
Sep  6 10:22:55 host kernel: [    0.000000] BIOS-provided physical RAM map:
Sep  6 10:22:55 host kernel: [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
Sep  6 10:22:55 host kernel: [    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff] reserved
Sep  6 10:22:55 host kernel: [    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved
Sep  6 10:22:55 host kernel: [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000bffdbfff] usable
Sep  6 10:22:55 host kernel: [    0.000000] BIOS-e820: [mem 0x00000000bffdc000-0x00000000bfffffff] reserved
Sep  6 10:22:55 host kernel: [    0.000000] BIOS-e820: [mem 0x00000000feffc000-0x00000000feffffff] reserved
Sep  6 10:22:55 host kernel: [    0.000000] BIOS-e820: [mem 0x00000000fffc0000-0x00000000ffffffff] reserved
Sep  6 10:22:55 host kernel: [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x0000000139ffffff] usable
Sep  6 10:22:55 host kernel: [    0.000000] NX (Execute Disable) protection: active
Sep  6 10:22:55 host kernel: [    0.000000] SMBIOS 2.8 present.
Sep  6 10:22:55 host kernel: [    0.000000] DMI: Hoster vServer, BIOS 20171111 11/11/2017
Sep  6 10:22:55 host kernel: [    0.000000] Hypervisor detected: KVM
Sep  6 10:22:55 host kernel: [    0.000000] kvm-clock: Using msrs 4b564d01 and 4b564d00
Sep  6 10:22:55 host kernel: [    0.000000] kvm-clock: cpu 0, msr 5fff3001, primary cpu clock
Sep  6 10:22:55 host kernel: [    0.000000] kvm-clock: using sched offset of 47924763259593986 cycles
Sep  6 10:22:55 host kernel: [    0.000011] clocksource: kvm-clock: mask: 0xffffffffffffffff max_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns
Sep  6 10:22:55 host kernel: [    0.000023] tsc: Detected 2099.998 MHz processor
Sep  6 10:22:55 host kernel: [    0.002526] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
Sep  6 10:22:55 host kernel: [    0.002530] e820: remove [mem 0x000a0000-0x000fffff] usable
Sep  6 10:22:55 host kernel: [    0.002536] last_pfn = 0x13a000 max_arch_pfn = 0x400000000
Sep  6 10:22:55 host kernel: [    0.002602] MTRR default type: write-back
Sep  6 10:22:55 host kernel: [    0.002603] MTRR fixed ranges enabled:
Sep  6 10:22:55 host kernel: [    0.002605]   00000-9FFFF write-back
Sep  6 10:22:55 host kernel: [    0.002606]   A0000-BFFFF uncachable
Sep  6 10:22:55 host kernel: [    0.002607]   C0000-FFFFF write-protect
Sep  6 10:22:55 host kernel: [    0.002608] MTRR variable ranges enabled:
Sep  6 10:22:55 host kernel: [    0.002609]   0 base 00C0000000 mask FFC0000000 uncachable
Sep  6 10:22:55 host kernel: [    0.002610]   1 disabled
Sep  6 10:22:55 host kernel: [    0.002611]   2 disabled
Sep  6 10:22:55 host kernel: [    0.002612]   3 disabled
Sep  6 10:22:55 host kernel: [    0.002612]   4 disabled
Sep  6 10:22:55 host kernel: [    0.002613]   5 disabled
Sep  6 10:22:55 host kernel: [    0.002614]   6 disabled
Sep  6 10:22:55 host kernel: [    0.002614]   7 disabled
Sep  6 10:22:55 host kernel: [    0.002638] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
Sep  6 10:22:55 host kernel: [    0.002655] last_pfn = 0xbffdc max_arch_pfn = 0x400000000
Sep  6 10:22:55 host kernel: [    0.011949] found SMP MP-table at [mem 0x000f5c80-0x000f5c8f]
Sep  6 10:22:55 host kernel: [    0.015460] Using GB pages for direct mapping
Sep  6 10:22:55 host kernel: [    0.015669] RAMDISK: [mem 0x345d5000-0x362e1fff]
Sep  6 10:22:55 host kernel: [    0.015688] ACPI: Early table checksum verification disabled
Sep  6 10:22:55 host kernel: [    0.015774] ACPI: RSDP 0x00000000000F5AA0 000014 (v00 BOCHS )
Sep  6 10:22:55 host kernel: [    0.015787] ACPI: RSDT 0x00000000BFFE157C 000030 (v01 BOCHS  BXPCRSDT 00000001 BXPC 00000001)
Sep  6 10:22:55 host kernel: [    0.015800] ACPI: FACP 0x00000000BFFE1450 000074 (v01 BOCHS  BXPCFACP 00000001 BXPC 00000001)
Sep  6 10:22:55 host kernel: [    0.015808] ACPI: DSDT 0x00000000BFFE0040 001410 (v01 BOCHS  BXPCDSDT 00000001 BXPC 00000001)
Sep  6 10:22:55 host kernel: [    0.015813] ACPI: FACS 0x00000000BFFE0000 000040
Sep  6 10:22:55 host kernel: [    0.015817] ACPI: APIC 0x00000000BFFE14C4 000080 (v01 BOCHS  BXPCAPIC 00000001 BXPC 00000001)
Sep  6 10:22:55 host kernel: [    0.015820] ACPI: HPET 0x00000000BFFE1544 000038 (v01 BOCHS  BXPCHPET 00000001 BXPC 00000001)
Sep  6 10:22:55 host kernel: [    0.015824] ACPI: Reserving FACP table memory at [mem 0xbffe1450-0xbffe14c3]
Sep  6 10:22:55 host kernel: [    0.015825] ACPI: Reserving DSDT table memory at [mem 0xbffe0040-0xbffe144f]
Sep  6 10:22:55 host kernel: [    0.015826] ACPI: Reserving FACS table memory at [mem 0xbffe0000-0xbffe003f]
Sep  6 10:22:55 host kernel: [    0.015827] ACPI: Reserving APIC table memory at [mem 0xbffe14c4-0xbffe1543]
Sep  6 10:22:55 host kernel: [    0.015827] ACPI: Reserving HPET table memory at [mem 0xbffe1544-0xbffe157b]
Sep  6 10:22:55 host kernel: [    0.015855] ACPI: Local APIC address 0xfee00000
Sep  6 10:22:55 host kernel: [    0.016392] No NUMA configuration found
Sep  6 10:22:55 host kernel: [    0.016394] Faking a node at [mem 0x0000000000000000-0x0000000139ffffff]
Sep  6 10:22:55 host kernel: [    0.016404] NODE_DATA(0) allocated [mem 0x139ff9000-0x139ffdfff]
Sep  6 10:22:55 host kernel: [    0.016463] Zone ranges:
Sep  6 10:22:55 host kernel: [    0.016465]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
Sep  6 10:22:55 host kernel: [    0.016467]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
Sep  6 10:22:55 host kernel: [    0.016468]   Normal   [mem 0x0000000100000000-0x0000000139ffffff]
Sep  6 10:22:55 host kernel: [    0.016470]   Device   empty
Sep  6 10:22:55 host kernel: [    0.016472] Movable zone start for each node
Sep  6 10:22:55 host kernel: [    0.016473] Early memory node ranges
Sep  6 10:22:55 host kernel: [    0.016475]   node   0: [mem 0x0000000000001000-0x000000000009efff]
Sep  6 10:22:55 host kernel: [    0.016476]   node   0: [mem 0x0000000000100000-0x00000000bffdbfff]
Sep  6 10:22:55 host kernel: [    0.016478]   node   0: [mem 0x0000000100000000-0x0000000139ffffff]
Sep  6 10:22:55 host kernel: [    0.017082] Zeroed struct page in unavailable ranges: 24710 pages
Sep  6 10:22:55 host kernel: [    0.017085] Initmem setup node 0 [mem 0x0000000000001000-0x0000000139ffffff]
Sep  6 10:22:55 host kernel: [    0.017088] On node 0 totalpages: 1023866
Sep  6 10:22:55 host kernel: [    0.017098]   DMA zone: 64 pages used for memmap
Sep  6 10:22:55 host kernel: [    0.017099]   DMA zone: 21 pages reserved
Sep  6 10:22:55 host kernel: [    0.017103]   DMA zone: 3998 pages, LIFO batch:0
Sep  6 10:22:55 host kernel: [    0.017226]   DMA32 zone: 12224 pages used for memmap
Sep  6 10:22:55 host kernel: [    0.017227]   DMA32 zone: 782300 pages, LIFO batch:63
Sep  6 10:22:55 host kernel: [    0.038159]   Normal zone: 3712 pages used for memmap
Sep  6 10:22:55 host kernel: [    0.038161]   Normal zone: 237568 pages, LIFO batch:63
Sep  6 10:22:55 host kernel: [    0.043733] ACPI: PM-Timer IO Port: 0x608
Sep  6 10:22:55 host kernel: [    0.043739] ACPI: Local APIC address 0xfee00000
Sep  6 10:22:55 host kernel: [    0.043758] ACPI: LAPIC_NMI (acpi_id[0xff] dfl dfl lint[0x1])
Sep  6 10:22:55 host kernel: [    0.043811] IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
Sep  6 10:22:55 host kernel: [    0.043814] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
Sep  6 10:22:55 host kernel: [    0.043816] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
Sep  6 10:22:55 host kernel: [    0.043817] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
Sep  6 10:22:55 host kernel: [    0.043822] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
Sep  6 10:22:55 host kernel: [    0.043823] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
Sep  6 10:22:55 host kernel: [    0.043824] ACPI: IRQ0 used by override.
Sep  6 10:22:55 host kernel: [    0.043825] ACPI: IRQ5 used by override.
Sep  6 10:22:55 host kernel: [    0.043826] ACPI: IRQ9 used by override.
Sep  6 10:22:55 host kernel: [    0.043826] ACPI: IRQ10 used by override.
Sep  6 10:22:55 host kernel: [    0.043826] ACPI: IRQ11 used by override.
Sep  6 10:22:55 host kernel: [    0.043829] Using ACPI (MADT) for SMP configuration information
Sep  6 10:22:55 host kernel: [    0.043830] ACPI: HPET id: 0x8086a201 base: 0xfed00000
Sep  6 10:22:55 host kernel: [    0.043836] TSC deadline timer available
Sep  6 10:22:55 host kernel: [    0.043838] smpboot: Allowing 2 CPUs, 0 hotplug CPUs
Sep  6 10:22:55 host kernel: [    0.043867] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
Sep  6 10:22:55 host kernel: [    0.043869] PM: Registered nosave memory: [mem 0x0009f000-0x0009ffff]
Sep  6 10:22:55 host kernel: [    0.043870] PM: Registered nosave memory: [mem 0x000a0000-0x000effff]
Sep  6 10:22:55 host kernel: [    0.043872] PM: Registered nosave memory: [mem 0x000f0000-0x000fffff]
Sep  6 10:22:55 host kernel: [    0.043874] PM: Registered nosave memory: [mem 0xbffdc000-0xbfffffff]
Sep  6 10:22:55 host kernel: [    0.043875] PM: Registered nosave memory: [mem 0xc0000000-0xfeffbfff]
Sep  6 10:22:55 host kernel: [    0.043876] PM: Registered nosave memory: [mem 0xfeffc000-0xfeffffff]
Sep  6 10:22:55 host kernel: [    0.043877] PM: Registered nosave memory: [mem 0xff000000-0xfffbffff]
Sep  6 10:22:55 host kernel: [    0.043878] PM: Registered nosave memory: [mem 0xfffc0000-0xffffffff]
Sep  6 10:22:55 host kernel: [    0.043880] [mem 0xc0000000-0xfeffbfff] available for PCI devices
Sep  6 10:22:55 host kernel: [    0.043881] Booting paravirtualized kernel on KVM
Sep  6 10:22:55 host kernel: [    0.043889] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
Sep  6 10:22:55 host kernel: [    0.142572] random: get_random_bytes called from start_kernel+0x93/0x52a with crng_init=0
Sep  6 10:22:55 host kernel: [    0.142584] setup_percpu: NR_CPUS:512 nr_cpumask_bits:512 nr_cpu_ids:2 nr_node_ids:1
Sep  6 10:22:55 host kernel: [    0.142991] percpu: Embedded 50 pages/cpu s165016 r8192 d31592 u1048576
Sep  6 10:22:55 host kernel: [    0.142996] pcpu-alloc: s165016 r8192 d31592 u1048576 alloc=1*2097152
Sep  6 10:22:55 host kernel: [    0.142997] pcpu-alloc: [0] 0 1 
Sep  6 10:22:55 host kernel: [    0.143032] KVM setup async PF for cpu 0
Sep  6 10:22:55 host kernel: [    0.143049] Built 1 zonelists, mobility grouping on.  Total pages: 1007845
Sep  6 10:22:55 host kernel: [    0.143050] Policy zone: Normal
Sep  6 10:22:55 host kernel: [    0.143053] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-4.19.0-20-amd64 root=UUID=4236cc65-d07b-4264-8ae6-ff71b870d7cc ro consoleblank=0 systemd.show_status=true elevator=noop console=tty1 console=ttyS0
Sep  6 10:22:55 host kernel: [    0.160993] Calgary: detecting Calgary via BIOS EBDA area
Sep  6 10:22:55 host kernel: [    0.160996] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
Sep  6 10:22:55 host kernel: [    0.170182] Memory: 3908956K/4095464K available (10252K kernel code, 1243K rwdata, 3328K rodata, 1620K init, 2232K bss, 186508K reserved, 0K cma-reserved)
Sep  6 10:22:55 host kernel: [    0.170313] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
Sep  6 10:22:55 host kernel: [    0.170321] Kernel/User page tables isolation: enabled
Sep  6 10:22:55 host kernel: [    0.182269] ftrace: allocating 32023 entries in 126 pages
Sep  6 10:22:55 host kernel: [    0.197534] rcu: Hierarchical RCU implementation.
Sep  6 10:22:55 host kernel: [    0.197537] rcu: 	RCU restricting CPUs from NR_CPUS=512 to nr_cpu_ids=2.
Sep  6 10:22:55 host kernel: [    0.197539] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
Sep  6 10:22:55 host kernel: [    0.200065] NR_IRQS: 33024, nr_irqs: 440, preallocated irqs: 16
Sep  6 10:22:55 host kernel: [    0.218444] Console: colour VGA+ 80x25
Sep  6 10:22:55 host kernel: [    0.263535] console [tty1] enabled
Sep  6 10:22:55 host kernel: [    0.362237] console [ttyS0] enabled
Sep  6 10:22:55 host kernel: [    0.363089] ACPI: Core revision 20180810
Sep  6 10:22:55 host kernel: [    0.364202] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604467 ns
Sep  6 10:22:55 host kernel: [    0.366482] hpet clockevent registered
Sep  6 10:22:55 host kernel: [    0.366523] APIC: Switch to symmetric I/O mode setup
Sep  6 10:22:55 host kernel: [    0.368041] x2apic enabled
Sep  6 10:22:55 host kernel: [    0.369055] Switched APIC routing to physical x2apic.
Sep  6 10:22:55 host kernel: [    0.371721] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
Sep  6 10:22:55 host kernel: [    0.372993] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x1e452ea631d, max_idle_ns: 440795244572 ns
Sep  6 10:22:55 host kernel: [    0.374995] Calibrating delay loop (skipped) preset value.. 4199.99 BogoMIPS (lpj=8399992)
Sep  6 10:22:55 host kernel: [    0.376629] pid_max: default: 32768 minimum: 301
Sep  6 10:22:55 host kernel: [    0.377684] Security Framework initialized
Sep  6 10:22:55 host kernel: [    0.378987] Yama: disabled by default; enable with sysctl kernel.yama.*
Sep  6 10:22:55 host kernel: [    0.380437] AppArmor: AppArmor initialized
Sep  6 10:22:55 host kernel: [    0.381853] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
Sep  6 10:22:55 host kernel: [    0.383256] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
Sep  6 10:22:55 host kernel: [    0.384631] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
Sep  6 10:22:55 host kernel: [    0.385878] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes)
Sep  6 10:22:55 host kernel: [    0.387352] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
Sep  6 10:22:55 host kernel: [    0.388415] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
Sep  6 10:22:55 host kernel: [    0.389544] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
Sep  6 10:22:55 host kernel: [    0.390984] Spectre V2 : Mitigation: Retpolines
Sep  6 10:22:55 host kernel: [    0.391904] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB on context switch
Sep  6 10:22:55 host kernel: [    0.393532] Spectre V2 : Enabling Restricted Speculation for firmware calls
Sep  6 10:22:55 host kernel: [    0.394993] Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
Sep  6 10:22:55 host kernel: [    0.396650] Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl and seccomp
Sep  6 10:22:55 host kernel: [    0.399016] TAA: Mitigation: Clear CPU buffers
Sep  6 10:22:55 host kernel: [    0.399898] MDS: Mitigation: Clear CPU buffers
Sep  6 10:22:55 host kernel: [    0.406661] Freeing SMP alternatives memory: 24K
Sep  6 10:22:55 host kernel: [    0.408835] smpboot: CPU0: Intel Xeon Processor (Skylake, IBRS) (family: 0x6, model: 0x55, stepping: 0x4)
Sep  6 10:22:55 host kernel: [    0.410769] Performance Events: unsupported p6 CPU model 85 no PMU driver, software events only.
Sep  6 10:22:55 host kernel: [    0.410980] rcu: Hierarchical SRCU implementation.
Sep  6 10:22:55 host kernel: [    0.411670] random: crng done (trusting CPU's manufacturer)
Sep  6 10:22:55 host kernel: [    0.412759] NMI watchdog: Perf NMI watchdog permanently disabled
Sep  6 10:22:55 host kernel: [    0.414007] smp: Bringing up secondary CPUs ...
Sep  6 10:22:55 host kernel: [    0.415085] x86: Booting SMP configuration:
Sep  6 10:22:55 host kernel: [    0.415930] .... node  #0, CPUs:      #1
Sep  6 10:22:55 host kernel: [    0.170713] kvm-clock: cpu 1, msr 5fff3041, secondary cpu clock
Sep  6 10:22:55 host kernel: [    0.419029] KVM setup async PF for cpu 1
Sep  6 10:22:55 host kernel: [    0.423001] smp: Brought up 1 node, 2 CPUs
Sep  6 10:22:55 host kernel: [    0.423914] smpboot: Max logical packages: 1
Sep  6 10:22:55 host kernel: [    0.424878] smpboot: Total of 2 processors activated (8399.99 BogoMIPS)
Sep  6 10:22:55 host dhclient[463]: 
Sep  6 10:22:55 host dhclient[463]: Listening on LPF/eth0/93:00:11:40:1f:ac
Sep  6 10:22:55 host ifup[435]: Listening on LPF/eth0/93:00:11:40:1f:ac
Sep  6 10:22:55 host ifup[435]: Sending on   LPF/eth0/93:00:11:40:1f:ac
Sep  6 10:22:55 host ifup[435]: Sending on   Socket/fallback
Sep  6 10:22:55 host ifup[435]: DHCPDISCOVER on eth0 to 255.255.255.255 port 67 interval 7
Sep  6 10:22:55 host dhclient[463]: Sending on   LPF/eth0/93:00:11:40:1f:ac
Sep  6 10:22:55 host dhclient[463]: Sending on   Socket/fallback
Sep  6 10:22:55 host dhclient[463]: DHCPDISCOVER on eth0 to 255.255.255.255 port 67 interval 7
Sep  6 10:22:55 host dhclient[463]: DHCPOFFER of 111.222.133.144 from 172.31.1.1
Sep  6 10:22:55 host ifup[435]: DHCPOFFER of 111.222.133.144 from 172.31.1.1
Sep  6 10:22:55 host ifup[435]: DHCPREQUEST for 111.222.133.144 on eth0 to 255.255.255.255 port 67
Sep  6 10:22:55 host dhclient[463]: DHCPREQUEST for 111.222.133.144 on eth0 to 255.255.255.255 port 67
Sep  6 10:22:55 host dhclient[463]: DHCPACK of 111.222.133.144 from 172.31.1.1
Sep  6 10:22:55 host ifup[435]: DHCPACK of 111.222.133.144 from 172.31.1.1
Sep  6 10:22:55 host dhclient[463]: bound to 111.222.133.144 -- renewal in 37908 seconds.
Sep  6 10:22:55 host ifup[435]: bound to 111.222.133.144 -- renewal in 37908 seconds.
Sep  6 10:22:55 host ifup[435]: Waiting for DAD... Done
Sep  6 10:22:55 host systemd[1]: Started Raise network interfaces.
Sep  6 10:22:55 host systemd[1]: Reached target Network.
Sep  6 10:22:55 host systemd[1]: Starting Initial cloud-init job (metadata service crawler)...
Sep  6 10:22:55 host cloud-init[596]: Cloud-init v. 20.2 running 'init' at Tue, 06 Sep 2022 10:22:54 +0000. Up 8.59 seconds.
Sep  6 10:22:55 host cloud-init[596]: ci-info: +++++++++++++++++++++++++++++++++++++++Net device info+++++++++++++++++++++++++++++++++++++++
Sep  6 10:22:55 host cloud-init[596]: ci-info: +--------+------+----------------------------+-----------------+--------+-------------------+
Sep  6 10:22:55 host cloud-init[596]: ci-info: | Device |  Up  |          Address           |       Mask      | Scope  |     Hw-Address    |
Sep  6 10:22:55 host cloud-init[596]: ci-info: +--------+------+----------------------------+-----------------+--------+-------------------+
Sep  6 10:22:55 host cloud-init[596]: ci-info: |  eth0  | True |      111.222.133.144       | 255.255.255.255 | global | 14:00:01:70:8a:fa |
Sep  6 10:22:55 host cloud-init[596]: ci-info: |  eth0  | True |  2a03:1a8:b011:3437::1/64  |        .        | global | 14:00:01:70:8a:fa |
Sep  6 10:22:55 host cloud-init[596]: ci-info: |  eth0  | True | fe80::9400:ff:fe80:7deb/64 |        .        |  link  | 14:00:01:70:8a:fa |
Sep  6 10:22:55 host cloud-init[596]: ci-info: |   lo   | True |         127.0.0.1          |    255.0.0.0    |  host  |         .         |
Sep  6 10:22:55 host cloud-init[596]: ci-info: |   lo   | True |          ::1/128           |        .        |  host  |         .         |
Sep  6 10:22:55 host cloud-init[596]: ci-info: +--------+------+----------------------------+-----------------+--------+-------------------+
Sep  6 10:22:55 host cloud-init[596]: ci-info: +++++++++++++++++++++++++++++Route IPv4 info++++++++++++++++++++++++++++++
Sep  6 10:22:55 host cloud-init[596]: ci-info: +-------+-------------+------------+-----------------+-----------+-------+
Sep  6 10:22:55 host cloud-init[596]: ci-info: | Route | Destination |  Gateway   |     Genmask     | Interface | Flags |
Sep  6 10:22:55 host cloud-init[596]: ci-info: +-------+-------------+------------+-----------------+-----------+-------+
Sep  6 10:22:55 host cloud-init[596]: ci-info: |   0   |   0.0.0.0   | 172.31.1.1 |     0.0.0.0     |    eth0   |   UG  |
Sep  6 10:22:55 host cloud-init[596]: ci-info: |   1   |  172.31.1.1 |  0.0.0.0   | 255.255.255.255 |    eth0   |   UH  |
Sep  6 10:22:55 host cloud-init[596]: ci-info: +-------+-------------+------------+-----------------+-----------+-------+
Sep  6 10:22:55 host cloud-init[596]: ci-info: +++++++++++++++++++++++++Route IPv6 info+++++++++++++++++++++++++
Sep  6 10:22:55 host cloud-init[596]: ci-info: +-------+-------------------------+---------+-----------+-------+
Sep  6 10:22:55 host cloud-init[596]: ci-info: | Route |       Destination       | Gateway | Interface | Flags |
Sep  6 10:22:55 host cloud-init[596]: ci-info: +-------+-------------------------+---------+-----------+-------+
Sep  6 10:22:55 host cloud-init[596]: ci-info: |   1   | 2a02:4e8:d011:3837::/64 |    ::   |    eth0   |   U   |
Sep  6 10:22:55 host cloud-init[596]: ci-info: |   2   |        fe80::/64        |    ::   |    eth0   |   U   |
Sep  6 10:22:55 host cloud-init[596]: ci-info: |   3   |           ::/0          | fe80::1 |    eth0   |   UG  |
Sep  6 10:22:55 host cloud-init[596]: ci-info: |   5   |          local          |    ::   |    eth0   |   U   |
Sep  6 10:22:55 host cloud-init[596]: ci-info: |   6   |          local          |    ::   |    eth0   |   U   |
Sep  6 10:22:55 host cloud-init[596]: ci-info: |   7   |        multicast        |    ::   |    eth0   |   U   |
Sep  6 10:22:55 host cloud-init[596]: ci-info: +-------+-------------------------+---------+-----------+-------+
Sep  6 10:22:55 host systemd[1]: Started Initial cloud-init job (metadata service crawler).
Sep  6 10:22:55 host systemd[1]: Reached target Cloud-config availability.
Sep  6 10:22:55 host systemd[1]: Reached target Network is Online.
Sep  6 10:22:55 host systemd[1]: Reached target System Initialization.
Sep  6 10:22:55 host systemd[1]: Started Daily man-db regeneration.
Sep  6 10:22:55 host systemd[1]: Listening on D-Bus System Message Bus Socket.
Sep  6 10:22:55 host systemd[1]: Started Daily apt download activities.
Sep  6 10:22:55 host systemd[1]: Started Discard unused blocks once a week.
Sep  6 10:22:55 host systemd[1]: Starting Docker Socket for the API.
Sep  6 10:22:55 host systemd[1]: Started Daily apt upgrade and clean activities.
Sep  6 10:22:55 host systemd[1]: Started Run certbot twice daily.
Sep  6 10:22:55 host systemd[1]: Started Daily Cleanup of Temporary Directories.
Sep  6 10:22:55 host systemd[1]: Started Daily rotation of log files.
Sep  6 10:22:55 host systemd[1]: Reached target Timers.
Sep  6 10:22:55 host systemd[1]: Listening on Docker Socket for the API.
Sep  6 10:22:55 host systemd[1]: Reached target Sockets.
Sep  6 10:22:55 host systemd[1]: Reached target Basic System.
Sep  6 10:22:55 host systemd[1]: Condition check resulted in getty on tty2-tty6 if dbus and logind are not available being skipped.
Sep  6 10:22:55 host systemd[1]: Starting Fail2Ban Service...
Sep  6 10:22:55 host systemd[1]: Starting Finds and configures Hoster Cloud private network interfaces...
Sep  6 10:22:55 host systemd[1]: Starting OpenBSD Secure Shell server...
Sep  6 10:22:55 host systemd[1]: Starting Apply the settings specified in cloud-config...
Sep  6 10:22:55 host systemd[1]: Starting System Logging Service...
Sep  6 10:22:55 host kernel: [    0.427587] devtmpfs: initialized
Sep  6 10:22:55 host kernel: [    0.428493] x86/mm: Memory block size: 128MB
Sep  6 10:22:55 host kernel: [    0.431428] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
Sep  6 10:22:55 host kernel: [    0.433419] futex hash table entries: 512 (order: 3, 32768 bytes)
Sep  6 10:22:55 host kernel: [    0.435041] pinctrl core: initialized pinctrl subsystem
Sep  6 10:22:55 host kernel: [    0.436568] NET: Registered protocol family 16
Sep  6 10:22:55 host kernel: [    0.438111] audit: initializing netlink subsys (disabled)
Sep  6 10:22:55 host kernel: [    0.439067] audit: type=2000 audit(1662459765.093:1): state=initialized audit_enabled=0 res=1
Sep  6 10:22:55 host kernel: [    0.441428] cpuidle: using governor ladder
Sep  6 10:22:55 host kernel: [    0.443041] cpuidle: using governor menu
Sep  6 10:22:55 host kernel: [    0.444045] ACPI: bus type PCI registered
Sep  6 10:22:55 host kernel: [    0.444892] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
Sep  6 10:22:55 host kernel: [    0.446413] PCI: Using configuration type 1 for base access
Sep  6 10:22:55 host kernel: [    0.447583] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
Sep  6 10:22:55 host kernel: [    0.450533] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
Sep  6 10:22:55 host kernel: [    0.455171] ACPI: Added _OSI(Module Device)
Sep  6 10:22:55 host kernel: [    0.456375] ACPI: Added _OSI(Processor Device)
Sep  6 10:22:55 host kernel: [    0.457524] ACPI: Added _OSI(3.0 _SCP Extensions)
Sep  6 10:22:55 host kernel: [    0.458574] ACPI: Added _OSI(Processor Aggregator Device)
Sep  6 10:22:55 host kernel: [    0.458994] ACPI: Added _OSI(Linux-Dell-Video)
Sep  6 10:22:55 host kernel: [    0.459907] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
Sep  6 10:22:55 host kernel: [    0.461630] ACPI: 1 ACPI AML tables successfully acquired and loaded
Sep  6 10:22:55 host kernel: [    0.463697] ACPI: Interpreter enabled
Sep  6 10:22:55 host kernel: [    0.464750] ACPI: (supports S0 S5)
Sep  6 10:22:55 host kernel: [    0.466990] ACPI: Using IOAPIC for interrupt routing
Sep  6 10:22:55 host kernel: [    0.468011] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
Sep  6 10:22:55 host kernel: [    0.469937] ACPI: Enabled 2 GPEs in block 00 to 0F
Sep  6 10:22:55 host kernel: [    0.472935] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
Sep  6 10:22:55 host kernel: [    0.474243] acpi PNP0A03:00: _OSC: OS supports [ASPM ClockPM Segments MSI]
Sep  6 10:22:55 host kernel: [    0.474991] acpi PNP0A03:00: _OSC failed (AE_NOT_FOUND); disabling ASPM
Sep  6 10:22:55 host kernel: [    0.476358] acpi PNP0A03:00: fail to add MMCONFIG information, can't access extended PCI configuration space under this bridge.
Sep  6 10:22:55 host kernel: [    0.478728] acpiphp: Slot [3] registered
Sep  6 10:22:55 host kernel: [    0.479030] acpiphp: Slot [4] registered
Sep  6 10:22:55 host kernel: [    0.479897] acpiphp: Slot [5] registered
Sep  6 10:22:55 host kernel: [    0.480732] acpiphp: Slot [6] registered
Sep  6 10:22:55 host kernel: [    0.481572] acpiphp: Slot [7] registered
Sep  6 10:22:55 host kernel: [    0.482412] acpiphp: Slot [8] registered
Sep  6 10:22:55 host kernel: [    0.483022] acpiphp: Slot [9] registered
Sep  6 10:22:55 host kernel: [    0.483860] acpiphp: Slot [10] registered
Sep  6 10:22:55 host kernel: [    0.484717] acpiphp: Slot [11] registered
Sep  6 10:22:55 host kernel: [    0.485562] acpiphp: Slot [12] registered
Sep  6 10:22:55 host kernel: [    0.486425] acpiphp: Slot [13] registered
Sep  6 10:22:55 host kernel: [    0.487018] acpiphp: Slot [14] registered
Sep  6 10:22:55 host kernel: [    0.487866] acpiphp: Slot [15] registered
Sep  6 10:22:55 host kernel: [    0.488709] acpiphp: Slot [16] registered
Sep  6 10:22:55 host kernel: [    0.489578] acpiphp: Slot [17] registered
Sep  6 10:22:55 host kernel: [    0.490535] acpiphp: Slot [18] registered
Sep  6 10:22:55 host kernel: [    0.491020] acpiphp: Slot [19] registered
Sep  6 10:22:55 host kernel: [    0.491879] acpiphp: Slot [20] registered
Sep  6 10:22:55 host kernel: [    0.492794] acpiphp: Slot [21] registered
Sep  6 10:22:55 host kernel: [    0.493648] acpiphp: Slot [22] registered
Sep  6 10:22:55 host kernel: [    0.494502] acpiphp: Slot [23] registered
Sep  6 10:22:55 host kernel: [    0.495020] acpiphp: Slot [24] registered
Sep  6 10:22:55 host kernel: [    0.495903] acpiphp: Slot [25] registered
Sep  6 10:22:55 host kernel: [    0.496855] acpiphp: Slot [26] registered
Sep  6 10:22:55 host kernel: [    0.497721] acpiphp: Slot [27] registered
Sep  6 10:22:55 host kernel: [    0.498600] acpiphp: Slot [28] registered
Sep  6 10:22:55 host kernel: [    0.499032] acpiphp: Slot [29] registered
Sep  6 10:22:55 host kernel: [    0.499885] acpiphp: Slot [30] registered
Sep  6 10:22:55 host kernel: [    0.500745] acpiphp: Slot [31] registered
Sep  6 10:22:55 host kernel: [    0.501623] PCI host bridge to bus 0000:00
Sep  6 10:22:55 host kernel: [    0.502457] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
Sep  6 10:22:55 host kernel: [    0.502987] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
Sep  6 10:22:55 host kernel: [    0.504276] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
Sep  6 10:22:55 host kernel: [    0.505719] pci_bus 0000:00: root bus resource [mem 0xc0000000-0xfebfffff window]
Sep  6 10:22:55 host kernel: [    0.506987] pci_bus 0000:00: root bus resource [mem 0x140000000-0x1bfffffff window]
Sep  6 10:22:55 host kernel: [    0.508528] pci_bus 0000:00: root bus resource [bus 00-ff]
Sep  6 10:22:55 host kernel: [    0.509632] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
Sep  6 10:22:55 host kernel: [    0.510252] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
Sep  6 10:22:55 host kernel: [    0.511129] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
Sep  6 10:22:55 host kernel: [    0.515877] pci 0000:00:01.1: reg 0x20: [io  0xc0c0-0xc0cf]
Sep  6 10:22:55 host kernel: [    0.517568] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
Sep  6 10:22:55 host kernel: [    0.518989] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
Sep  6 10:22:55 host kernel: [    0.520224] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
Sep  6 10:22:55 host kernel: [    0.521533] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
Sep  6 10:22:55 host kernel: [    0.523257] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
Sep  6 10:22:55 host kernel: [    0.523878] pci 0000:00:01.3: quirk: [io  0x0600-0x063f] claimed by PIIX4 ACPI
Sep  6 10:22:55 host kernel: [    0.525384] pci 0000:00:01.3: quirk: [io  0x0700-0x070f] claimed by PIIX4 SMB
Sep  6 10:22:55 host kernel: [    0.527142] pci 0000:00:02.0: [1234:1111] type 00 class 0x030000
Sep  6 10:22:55 host kernel: [    0.529401] pci 0000:00:02.0: reg 0x10: [mem 0xfd000000-0xfdffffff pref]
Sep  6 10:22:55 host kernel: [    0.531877] pci 0000:00:02.0: reg 0x18: [mem 0xfeb94000-0xfeb94fff]
Sep  6 10:22:55 host kernel: [    0.537479] pci 0000:00:02.0: reg 0x30: [mem 0xfeb80000-0xfeb8ffff pref]
Sep  6 10:22:55 host kernel: [    0.537950] pci 0000:00:03.0: [1af4:1000] type 00 class 0x020000
Sep  6 10:22:55 host kernel: [    0.540205] pci 0000:00:03.0: reg 0x10: [io  0xc080-0xc09f]
Sep  6 10:22:55 host kernel: [    0.542577] pci 0000:00:03.0: reg 0x14: [mem 0xfeb95000-0xfeb95fff]
Sep  6 10:22:55 host kernel: [    0.546991] pci 0000:00:03.0: reg 0x20: [mem 0xfe000000-0xfe003fff 64bit pref]
Sep  6 10:22:55 host kernel: [    0.548363] pci 0000:00:03.0: reg 0x30: [mem 0xfeb00000-0xfeb7ffff pref]
Sep  6 10:22:55 host kernel: [    0.549135] pci 0000:00:04.0: [1af4:1004] type 00 class 0x010000
Sep  6 10:22:55 host kernel: [    0.550740] pci 0000:00:04.0: reg 0x10: [io  0xc000-0xc03f]
Sep  6 10:22:55 host kernel: [    0.552277] pci 0000:00:04.0: reg 0x14: [mem 0xfeb96000-0xfeb96fff]
Sep  6 10:22:55 host kernel: [    0.558993] pci 0000:00:04.0: reg 0x20: [mem 0xfe004000-0xfe007fff 64bit pref]
Sep  6 10:22:55 host kernel: [    0.561638] pci 0000:00:05.0: [1af4:1002] type 00 class 0x00ff00
Sep  6 10:22:55 host kernel: [    0.562794] pci 0000:00:05.0: reg 0x10: [io  0xc0a0-0xc0bf]
Sep  6 10:22:55 host kernel: [    0.568300] pci 0000:00:05.0: reg 0x20: [mem 0xfe008000-0xfe00bfff 64bit pref]
Sep  6 10:22:55 host kernel: [    0.569998] pci 0000:00:06.0: [1af4:1003] type 00 class 0x078000
Sep  6 10:22:55 host kernel: [    0.571005] pci 0000:00:06.0: reg 0x10: [io  0xc040-0xc07f]
Sep  6 10:22:55 host kernel: [    0.572393] pci 0000:00:06.0: reg 0x14: [mem 0xfeb97000-0xfeb97fff]
Sep  6 10:22:55 host kernel: [    0.581104] pci 0000:00:06.0: reg 0x20: [mem 0xfe00c000-0xfe00ffff 64bit pref]
Sep  6 10:22:55 host kernel: [    0.584677] pci 0000:00:07.0: [1b36:000d] type 00 class 0x0c0330
Sep  6 10:22:55 host kernel: [    0.586117] pci 0000:00:07.0: reg 0x10: [mem 0xfeb90000-0xfeb93fff 64bit]
Sep  6 10:22:55 host kernel: [    0.593668] ACPI: PCI Interrupt Link [LNKA] (IRQs 5 *10 11)
Sep  6 10:22:55 host kernel: [    0.595153] ACPI: PCI Interrupt Link [LNKB] (IRQs 5 *10 11)
Sep  6 10:22:55 host kernel: [    0.596958] ACPI: PCI Interrupt Link [LNKC] (IRQs 5 10 *11)
Sep  6 10:22:55 host kernel: [    0.599121] ACPI: PCI Interrupt Link [LNKD] (IRQs 5 10 *11)
Sep  6 10:22:55 host kernel: [    0.600485] ACPI: PCI Interrupt Link [LNKS] (IRQs *9)
Sep  6 10:22:55 host kernel: [    0.601867] pci 0000:00:02.0: vgaarb: setting as boot VGA device
Sep  6 10:22:55 host kernel: [    0.601867] pci 0000:00:02.0: vgaarb: VGA device added: decodes=io+mem,owns=io+mem,locks=none
Sep  6 10:22:55 host kernel: [    0.602990] pci 0000:00:02.0: vgaarb: bridge control possible
Sep  6 10:22:55 host kernel: [    0.604130] vgaarb: loaded
Sep  6 10:22:55 host kernel: [    0.604913] pps_core: LinuxPPS API ver. 1 registered
Sep  6 10:22:55 host kernel: [    0.605978] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
Sep  6 10:22:55 host kernel: [    0.606996] PTP clock support registered
Sep  6 10:22:55 host kernel: [    0.607846] EDAC MC: Ver: 3.0.0
Sep  6 10:22:55 host kernel: [    0.608773] PCI: Using ACPI for IRQ routing
Sep  6 10:22:55 host kernel: [    0.608773] PCI: pci_cache_line_size set to 64 bytes
Sep  6 10:22:55 host kernel: [    0.608773] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
Sep  6 10:22:55 host kernel: [    0.608773] e820: reserve RAM buffer [mem 0xbffdc000-0xbfffffff]
Sep  6 10:22:55 host kernel: [    0.608773] e820: reserve RAM buffer [mem 0x13a000000-0x13bffffff]
Sep  6 10:22:55 host kernel: [    0.608773] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
Sep  6 10:22:55 host kernel: [    0.610987] hpet0: 3 comparators, 64-bit 100.000000 MHz counter
Sep  6 10:22:55 host kernel: [    0.614345] clocksource: Switched to clocksource kvm-clock
Sep  6 10:22:55 host kernel: [    0.622334] VFS: Disk quotas dquot_6.6.0
Sep  6 10:22:55 host kernel: [    0.623266] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
Sep  6 10:22:55 host kernel: [    0.624817] AppArmor: AppArmor Filesystem Enabled
Sep  6 10:22:55 host kernel: [    0.625929] pnp: PnP ACPI init
Sep  6 10:22:55 host kernel: [    0.626713] pnp 00:00: Plug and Play ACPI device, IDs PNP0b00 (active)
Sep  6 10:22:55 host kernel: [    0.626749] pnp 00:01: Plug and Play ACPI device, IDs PNP0303 (active)
Sep  6 10:22:55 host kernel: [    0.626769] pnp 00:02: Plug and Play ACPI device, IDs PNP0f13 (active)
Sep  6 10:22:55 host kernel: [    0.626776] pnp 00:03: [dma 2]
Sep  6 10:22:55 host kernel: [    0.626785] pnp 00:03: Plug and Play ACPI device, IDs PNP0700 (active)
Sep  6 10:22:55 host kernel: [    0.626859] pnp 00:04: Plug and Play ACPI device, IDs PNP0501 (active)
Sep  6 10:22:55 host kernel: [    0.627068] pnp: PnP ACPI: found 5 devices
Sep  6 10:22:55 host kernel: [    0.636066] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
Sep  6 10:22:55 host kernel: [    0.637765] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
Sep  6 10:22:55 host kernel: [    0.637766] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
Sep  6 10:22:55 host kernel: [    0.637767] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
Sep  6 10:22:55 host kernel: [    0.637768] pci_bus 0000:00: resource 7 [mem 0xc0000000-0xfebfffff window]
Sep  6 10:22:55 host kernel: [    0.637769] pci_bus 0000:00: resource 8 [mem 0x140000000-0x1bfffffff window]
Sep  6 10:22:55 host kernel: [    0.637840] NET: Registered protocol family 2
Sep  6 10:22:55 host kernel: [    0.638953] IP idents hash table entries: 65536 (order: 7, 524288 bytes)
Sep  6 10:22:55 host kernel: [    0.640934] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3, 32768 bytes)
Sep  6 10:22:55 host kernel: [    0.642706] TCP established hash table entries: 32768 (order: 6, 262144 bytes)
Sep  6 10:22:55 host kernel: [    0.644448] TCP bind hash table entries: 32768 (order: 7, 524288 bytes)
Sep  6 10:22:55 host kernel: [    0.646191] TCP: Hash tables configured (established 32768 bind 32768)
Sep  6 10:22:55 host kernel: [    0.647920] UDP hash table entries: 2048 (order: 4, 65536 bytes)
Sep  6 10:22:55 host kernel: [    0.649488] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
Sep  6 10:22:55 host kernel: [    0.651371] NET: Registered protocol family 1
Sep  6 10:22:55 host kernel: [    0.652553] NET: Registered protocol family 44
Sep  6 10:22:55 host kernel: [    0.653765] pci 0000:00:01.0: PIIX3: Enabling Passive Release
Sep  6 10:22:55 host kernel: [    0.655181] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
Sep  6 10:22:55 host kernel: [    0.656608] pci 0000:00:01.0: Activating ISA DMA hang workarounds
Sep  6 10:22:55 host kernel: [    0.658057] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x000c0000-0x000dffff]
Sep  6 10:22:55 host kernel: [    0.681926] PCI Interrupt Link [LNKC] enabled at IRQ 11
Sep  6 10:22:55 host kernel: [    0.703241] pci 0000:00:07.0: quirk_usb_early_handoff+0x0/0x6d0 took 42399 usecs
Sep  6 10:22:55 host kernel: [    0.705153] PCI: CLS 0 bytes, default 64
Sep  6 10:22:55 host kernel: [    0.705243] Unpacking initramfs...
Sep  6 10:22:55 host kernel: [    1.244019] Freeing initrd memory: 29748K
Sep  6 10:22:55 host kernel: [    1.250847] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
Sep  6 10:22:55 host kernel: [    1.252152] software IO TLB: mapped [mem 0xbbfdc000-0xbffdc000] (64MB)
Sep  6 10:22:55 host kernel: [    1.253534] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x1e452ea631d, max_idle_ns: 440795244572 ns
Sep  6 10:22:55 host kernel: [    1.256081] Initialise system trusted keyrings
Sep  6 10:22:55 host kernel: [    1.257081] Key type blacklist registered
Sep  6 10:22:55 host kernel: [    1.258103] workingset: timestamp_bits=40 max_order=20 bucket_order=0
Sep  6 10:22:55 host kernel: [    1.260404] zbud: loaded
Sep  6 10:22:55 host kernel: [    1.393823] Key type asymmetric registered
Sep  6 10:22:55 host kernel: [    1.396142] Asymmetric key parser 'x509' registered
Sep  6 10:22:55 host kernel: [    1.399009] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 247)
Sep  6 10:22:55 host kernel: [    1.402644] io scheduler noop registered (default)
Sep  6 10:22:55 host kernel: [    1.404667] io scheduler deadline registered
Sep  6 10:22:55 host kernel: [    1.406811] io scheduler cfq registered
Sep  6 10:22:55 host kernel: [    1.408745] io scheduler mq-deadline registered
Sep  6 10:22:55 host kernel: [    1.410584] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
Sep  6 10:22:55 host kernel: [    1.412263] intel_idle: Please enable MWAIT in BIOS SETUP
Sep  6 10:22:55 host kernel: [    1.412513] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
Sep  6 10:22:55 host kernel: [    1.439904] 00:04: ttyS0 at I/O 0x3f8 (irq = 4, base_baud = 115200) is a 16550A
Sep  6 10:22:55 host kernel: [    1.441978] Linux agpgart interface v0.103
Sep  6 10:22:55 host kernel: [    1.443075] AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
Sep  6 10:22:55 host kernel: [    1.444214] AMD IOMMUv2 functionality not available on this system
Sep  6 10:22:55 host kernel: [    1.445668] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 irq 1,12
Sep  6 10:22:55 host kernel: [    1.448171] serio: i8042 KBD port at 0x60,0x64 irq 1
Sep  6 10:22:55 host kernel: [    1.449192] serio: i8042 AUX port at 0x60,0x64 irq 12
Sep  6 10:22:55 host kernel: [    1.450332] mousedev: PS/2 mouse device common for all mice
Sep  6 10:22:55 host kernel: [    1.451710] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
Sep  6 10:22:55 host kernel: [    1.453527] rtc_cmos 00:00: RTC can wake from S4
Sep  6 10:22:55 host kernel: [    1.455213] rtc_cmos 00:00: registered as rtc0
Sep  6 10:22:55 host kernel: [    1.456129] rtc_cmos 00:00: alarms up to one day, y3k, 114 bytes nvram, hpet irqs
Sep  6 10:22:55 host kernel: [    1.457801] ledtrig-cpu: registered to indicate activity on CPUs
Sep  6 10:22:55 host kernel: [    1.459327] NET: Registered protocol family 10
Sep  6 10:22:55 host kernel: [    1.477394] Segment Routing with IPv6
Sep  6 10:22:55 host kernel: [    1.479697] mip6: Mobile IPv6
Sep  6 10:22:55 host kernel: [    1.481206] NET: Registered protocol family 17
Sep  6 10:22:55 host kernel: [    1.483087] mpls_gso: MPLS GSO support
Sep  6 10:22:55 host kernel: [    1.486246] mce: Using 10 MCE banks
Sep  6 10:22:55 host kernel: [    1.489112] sched_clock: Marking stable (1322278051, 166713957)->(1535190292, -46198284)
Sep  6 10:22:55 host kernel: [    1.494427] registered taskstats version 1
Sep  6 10:22:55 host kernel: [    1.496541] Loading compiled-in X.509 certificates
Sep  6 10:22:55 host kernel: [    1.534859] Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
Sep  6 10:22:55 host kernel: [    1.536777] Loaded X.509 cert 'Debian Secure Boot Signer 2021 - linux: 4b6ef5abca669825178e052c84667ccbc0531f8c'
Sep  6 10:22:55 host kernel: [    1.539184] zswap: loaded using pool lzo/zbud
Sep  6 10:22:55 host kernel: [    1.540277] AppArmor: AppArmor sha1 policy hashing enabled
Sep  6 10:22:55 host kernel: [    1.541915] rtc_cmos 00:00: setting system clock to 2022-09-06 10:22:47 UTC (1662459767)
Sep  6 10:22:55 host kernel: [    1.944012] Freeing unused kernel image memory: 1620K
Sep  6 10:22:55 host kernel: [    1.963091] Write protecting the kernel read-only data: 16384k
Sep  6 10:22:55 host kernel: [    1.972925] Freeing unused kernel image memory: 2028K
Sep  6 10:22:55 host kernel: [    1.975245] Freeing unused kernel image memory: 768K
Sep  6 10:22:55 host kernel: [    1.986329] x86/mm: Checked W+X mappings: passed, no W+X pages found.
Sep  6 10:22:55 host kernel: [    1.987716] x86/mm: Checking user space page tables
Sep  6 10:22:55 host kernel: [    1.995318] x86/mm: Checked W+X mappings: passed, no W+X pages found.
Sep  6 10:22:55 host kernel: [    1.996537] Run /init as init process
Sep  6 10:22:55 host kernel: [    2.172318] SCSI subsystem initialized
Sep  6 10:22:55 host kernel: [    2.182743] input: VirtualPS/2 VMware VMMouse as /devices/platform/i8042/serio1/input/input3
Sep  6 10:22:55 host kernel: [    2.185152] input: VirtualPS/2 VMware VMMouse as /devices/platform/i8042/serio1/input/input2
Sep  6 10:22:55 host kernel: [    2.185320] libata version 3.00 loaded.
Sep  6 10:22:55 host kernel: [    2.187560] FDC 0 is a S82078B
Sep  6 10:22:55 host kernel: [    2.189818] ata_piix 0000:00:01.1: version 2.13
Sep  6 10:22:55 host kernel: [    2.190680] cryptd: max_cpu_qlen set to 1000
Sep  6 10:22:55 host kernel: [    2.190802] scsi host0: ata_piix
Sep  6 10:22:55 host kernel: [    2.192471] scsi host1: ata_piix
Sep  6 10:22:55 host kernel: [    2.193283] ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0xc0c0 irq 14
Sep  6 10:22:55 host kernel: [    2.194705] ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0xc0c8 irq 15
Sep  6 10:22:55 host kernel: [    2.203514] ACPI: bus type USB registered
Sep  6 10:22:55 host kernel: [    2.204399] usbcore: registered new interface driver usbfs
Sep  6 10:22:55 host kernel: [    2.205469] usbcore: registered new interface driver hub
Sep  6 10:22:55 host kernel: [    2.206643] usbcore: registered new device driver usb
Sep  6 10:22:55 host kernel: [    2.221401] piix4_smbus 0000:00:01.3: SMBus Host Controller at 0x700, revision 0
Sep  6 10:22:55 host kernel: [    2.241242] PCI Interrupt Link [LNKD] enabled at IRQ 10
Sep  6 10:22:55 host kernel: [    2.261740] PCI Interrupt Link [LNKA] enabled at IRQ 10
Sep  6 10:22:55 host kernel: [    2.284653] PCI Interrupt Link [LNKB] enabled at IRQ 11
Sep  6 10:22:55 host kernel: [    2.355734] ata2.01: NODEV after polling detection
Sep  6 10:22:55 host kernel: [    2.356076] ata2.00: ATAPI: QEMU DVD-ROM, 2.5+, max UDMA/100
Sep  6 10:22:55 host kernel: [    2.367599] scsi 1:0:0:0: CD-ROM            QEMU     QEMU DVD-ROM     2.5+ PQ: 0 ANSI: 5
Sep  6 10:22:55 host kernel: [    2.387277] AVX2 version of gcm_enc/dec engaged.
Sep  6 10:22:55 host kernel: [    2.389117] AES CTR mode by8 optimization enabled
Sep  6 10:22:55 host kernel: [    2.393137] scsi host2: Virtio SCSI HBA
Sep  6 10:22:55 host kernel: [    2.398903] scsi 2:0:0:0: Direct-Access     QEMU     QEMU HARDDISK    2.5+ PQ: 0 ANSI: 5
Sep  6 10:22:55 host kernel: [    2.479693] xhci_hcd 0000:00:07.0: xHCI Host Controller
Sep  6 10:22:55 host kernel: [    2.480813] xhci_hcd 0000:00:07.0: new USB bus registered, assigned bus number 1
Sep  6 10:22:55 host kernel: [    2.483137] xhci_hcd 0000:00:07.0: hcc params 0x00087001 hci version 0x100 quirks 0x0000000000000010
Sep  6 10:22:55 host kernel: [    2.486560] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 4.19
Sep  6 10:22:55 host kernel: [    2.488710] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Sep  6 10:22:55 host kernel: [    2.490591] sr 1:0:0:0: [sr0] scsi3-mmc drive: 4x/4x cd/rw xa/form2 tray
Sep  6 10:22:55 host kernel: [    2.490859] usb usb1: Product: xHCI Host Controller
Sep  6 10:22:55 host kernel: [    2.494751] cdrom: Uniform CD-ROM driver Revision: 3.20
Sep  6 10:22:55 host kernel: [    2.496102] usb usb1: Manufacturer: Linux 4.19.0-20-amd64 xhci-hcd
Sep  6 10:22:55 host kernel: [    2.500423] sr 1:0:0:0: Attached scsi CD-ROM sr0
Sep  6 10:22:55 host kernel: [    2.500803] usb usb1: SerialNumber: 0000:00:07.0
Sep  6 10:22:55 host kernel: [    2.502145] sd 2:0:0:0: Power-on or device reset occurred
Sep  6 10:22:55 host kernel: [    2.505361] hub 1-0:1.0: USB hub found
Sep  6 10:22:55 host kernel: [    2.506664] hub 1-0:1.0: 4 ports detected
Sep  6 10:22:55 host kernel: [    2.506722] sd 2:0:0:0: [sda] 80003072 512-byte logical blocks: (41.0 GB/38.1 GiB)
Sep  6 10:22:55 host kernel: [    2.508390] xhci_hcd 0000:00:07.0: xHCI Host Controller
Sep  6 10:22:55 host kernel: [    2.510520] sd 2:0:0:0: [sda] Write Protect is off
Sep  6 10:22:55 host kernel: [    2.511745] xhci_hcd 0000:00:07.0: new USB bus registered, assigned bus number 2
Sep  6 10:22:55 host kernel: [    2.513220] sd 2:0:0:0: [sda] Mode Sense: 63 00 00 08
Sep  6 10:22:55 host kernel: [    2.515425] xhci_hcd 0000:00:07.0: Host supports USB 3.0 SuperSpeed
Sep  6 10:22:55 host kernel: [    2.515545] sd 2:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
Sep  6 10:22:55 host kernel: [    2.517354] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
Sep  6 10:22:55 host kernel: [    2.523175]  sda: sda1 sda14 sda15
Sep  6 10:22:55 host kernel: [    2.527105] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 4.19
Sep  6 10:22:55 host kernel: [    2.528465] sd 2:0:0:0: [sda] Attached SCSI disk
Sep  6 10:22:55 host kernel: [    2.533194] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
Sep  6 10:22:55 host kernel: [    2.538238] usb usb2: Product: xHCI Host Controller
Sep  6 10:22:55 host kernel: [    2.540145] usb usb2: Manufacturer: Linux 4.19.0-20-amd64 xhci-hcd
Sep  6 10:22:55 host kernel: [    2.542577] usb usb2: SerialNumber: 0000:00:07.0
Sep  6 10:22:55 host kernel: [    2.546476] hub 2-0:1.0: USB hub found
Sep  6 10:22:55 host kernel: [    2.548662] hub 2-0:1.0: 4 ports detected
Sep  6 10:22:55 host kernel: [    2.783076] usb 1-1: new high-speed USB device number 2 using xhci_hcd
Sep  6 10:22:55 host kernel: [    2.891043] raid6: sse2x1   gen()  6987 MB/s
Sep  6 10:22:55 host kernel: [    2.943813] usb 1-1: New USB device found, idVendor=0627, idProduct=0001, bcdDevice= 0.00
Sep  6 10:22:55 host kernel: [    2.949118] usb 1-1: New USB device strings: Mfr=1, Product=3, SerialNumber=10
Sep  6 10:22:55 host kernel: [    2.953182] usb 1-1: Product: QEMU USB Tablet
Sep  6 10:22:55 host kernel: [    2.956098] usb 1-1: Manufacturer: QEMU
Sep  6 10:22:55 host kernel: [    2.958951] usb 1-1: SerialNumber: 28754-0000:00:07.0-1
Sep  6 10:22:55 host kernel: [    2.961979] raid6: sse2x1   xor()  5085 MB/s
Sep  6 10:22:55 host kernel: [    2.972683] hidraw: raw HID events driver (C) Jiri Kosina
Sep  6 10:22:55 host kernel: [    2.977226] usbcore: registered new interface driver usbhid
Sep  6 10:22:55 host kernel: [    2.978482] usbhid: USB HID core driver
Sep  6 10:22:55 host kernel: [    2.980789] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:07.0/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input4
Sep  6 10:22:55 host kernel: [    2.983110] hid-generic 0003:0627:0001.0001: input,hidraw0: USB HID v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:07.0-1/input0
Sep  6 10:22:55 host kernel: [    3.027029] raid6: sse2x2   gen()  7974 MB/s
Sep  6 10:22:55 host kernel: [    3.095009] raid6: sse2x2   xor()  6145 MB/s
Sep  6 10:22:55 host kernel: [    3.163042] raid6: sse2x4   gen() 11768 MB/s
Sep  6 10:22:55 host kernel: [    3.234875] raid6: sse2x4   xor()  6785 MB/s
Sep  6 10:22:55 host kernel: [    3.303027] raid6: avx2x1   gen() 15409 MB/s
Sep  6 10:22:55 host kernel: [    3.371126] raid6: avx2x1   xor() 13408 MB/s
Sep  6 10:22:55 host kernel: [    3.439033] raid6: avx2x2   gen() 21708 MB/s
Sep  6 10:22:55 host kernel: [    3.507023] raid6: avx2x2   xor() 13219 MB/s
Sep  6 10:22:55 host kernel: [    3.575021] raid6: avx2x4   gen() 22275 MB/s
Sep  6 10:22:55 host kernel: [    3.643026] raid6: avx2x4   xor() 13254 MB/s
Sep  6 10:22:55 host kernel: [    3.711048] raid6: avx512x1 gen() 21371 MB/s
Sep  6 10:22:55 host kernel: [    3.779010] raid6: avx512x1 xor() 11977 MB/s
Sep  6 10:22:55 host kernel: [    3.847011] raid6: avx512x2 gen() 25771 MB/s
Sep  6 10:22:55 host kernel: [    3.915021] raid6: avx512x2 xor() 14906 MB/s
Sep  6 10:22:55 host kernel: [    3.983032] raid6: avx512x4 gen() 28088 MB/s
Sep  6 10:22:55 host kernel: [    4.051035] raid6: avx512x4 xor() 16726 MB/s
Sep  6 10:22:55 host kernel: [    4.052076] raid6: using algorithm avx512x4 gen() 28088 MB/s
Sep  6 10:22:55 host kernel: [    4.053321] raid6: .... xor() 16726 MB/s, rmw enabled
Sep  6 10:22:55 host kernel: [    4.054518] raid6: using avx512x2 recovery algorithm
Sep  6 10:22:55 host kernel: [    4.058116] xor: automatically using best checksumming function   avx       
Sep  6 10:22:55 host kernel: [    4.073693] async_tx: api initialized (async)
Sep  6 10:22:55 host kernel: [    4.178788] Btrfs loaded, crc32c=crc32c-intel
Sep  6 10:22:55 host kernel: [    4.441381] EXT4-fs (sda1): mounted filesystem with ordered data mode. Opts: (null)
Sep  6 10:22:55 host kernel: [    5.193155] EXT4-fs (sda1): re-mounted. Opts: errors=remount-ro
Sep  6 10:22:55 host kernel: [    5.434313] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input5
Sep  6 10:22:55 host kernel: [    5.436280] ACPI: Power Button [PWRF]
Sep  6 10:22:55 host kernel: [    5.523253] input: PC Speaker as /devices/platform/pcspkr/input/input6
Sep  6 10:22:55 host kernel: [    5.554085] sr 1:0:0:0: Attached scsi generic sg0 type 5
Sep  6 10:22:55 host kernel: [    5.555535] sd 2:0:0:0: Attached scsi generic sg1 type 0
Sep  6 10:22:55 host kernel: [    5.749107] [drm] Found bochs VGA, ID 0xb0c0.
Sep  6 10:22:55 host kernel: [    5.750350] [drm] Framebuffer size 16384 kB @ 0xfd000000, mmio @ 0xfeb94000.
Sep  6 10:22:55 host kernel: [    5.776961] [TTM] Zone  kernel: Available graphics memory: 1971572 kiB
Sep  6 10:22:55 host kernel: [    5.776962] [TTM] Initializing pool allocator
Sep  6 10:22:55 host kernel: [    5.776966] [TTM] Initializing DMA pool allocator
Sep  6 10:22:55 host kernel: [    5.979797] fbcon: bochsdrmfb (fb0) is primary device
Sep  6 10:22:55 host kernel: [    5.999520] Console: switching to colour frame buffer device 128x48
Sep  6 10:22:55 host kernel: [    6.009392] bochs-drm 0000:00:02.0: fb0: bochsdrmfb frame buffer device
Sep  6 10:22:55 host kernel: [    6.027045] [drm] Initialized bochs-drm 1.0.0 20130925 for 0000:00:02.0 on minor 0
Sep  6 10:22:55 host systemd[1]: Starting Permit User Sessions...
Sep  6 10:22:55 host systemd[1]: Condition check resulted in fast remote file copy program daemon being skipped.
Sep  6 10:22:55 host hc-ifscan: Scanning for unconfigured interfaces
Sep  6 10:22:55 host systemd[1]: Started Regular background program processing daemon.
Sep  6 10:22:55 host systemd[1]: Started D-Bus System Message Bus.
Sep  6 10:22:55 host cron[645]: (CRON) INFO (pidfile fd = 3)
Sep  6 10:22:55 host systemd[1]: Starting Deferred execution scheduler...
Sep  6 10:22:55 host cron[645]: (CRON) INFO (Running @reboot jobs)
Sep  6 10:22:55 host systemd[1]: Started QEMU Guest Agent.
Sep  6 10:22:55 host systemd[1]: Starting Login Service...
Sep  6 10:22:55 host systemd[1]: Started urlhaus2stats.
Sep  6 10:22:55 host systemd[1]: Starting Docker Application Container Engine...
Sep  6 10:22:55 host systemd[1]: Started Fail2Ban Service.
Sep  6 10:22:55 host hc-ifscan[639]: find: ‘/sys/class/net/en*’: No such file or directory
Sep  6 10:22:55 host rsyslogd: imuxsock: Acquired UNIX socket '/run/systemd/journal/syslog' (fd 3) from systemd.  [v8.1901.0]
Sep  6 10:22:55 host rsyslogd:  [origin software="rsyslogd" swVersion="8.1901.0" x-pid="642" x-info="https://www.rsyslog.com"] start
Sep  6 10:22:55 host systemd[1]: Started System Logging Service.
Sep  6 10:22:55 host systemd[1]: hc-net-scan.service: Succeeded.
Sep  6 10:22:55 host systemd[1]: Started Finds and configures Hoster Cloud private network interfaces.
Sep  6 10:22:55 host systemd[1]: Started Permit User Sessions.
Sep  6 10:22:55 host systemd[1]: Started Deferred execution scheduler.
Sep  6 10:22:55 host systemd[1]: Started Serial Getty on ttyS0.
Sep  6 10:22:55 host systemd[1]: Started Getty on tty1.
Sep  6 10:22:55 host systemd[1]: Reached target Login Prompts.
Sep  6 10:22:58 host systemd[1]: Started Docker Application Container Engine.
Sep  6 10:22:58 host systemd[1]: Reached target Multi-User System.
Sep  6 10:22:58 host systemd[1]: Starting Execute cloud user/final scripts...
Sep  6 10:22:58 host systemd[1]: Reached target Graphical Interface.
Sep  6 10:22:58 host dockerd[653]: time="2022-09-06T10:22:58.559320519Z" level=info msg="API listen on /var/run/docker.sock"
Sep  6 10:22:58 host systemd[1]: Starting Update UTMP about System Runlevel Changes...
Sep  6 10:22:58 host systemd[1]: systemd-update-utmp-runlevel.service: Succeeded.
Sep  6 10:22:58 host systemd[1]: Started Update UTMP about System Runlevel Changes.
Sep  6 10:22:59 host cloud-init[903]: Cloud-init v. 20.2 running 'modules:final' at Tue, 06 Sep 2022 10:22:58 +0000. Up 12.83 seconds.
Sep  6 10:22:59 host cloud-init[903]: Cloud-init v. 20.2 finished at Tue, 06 Sep 2022 10:22:59 +0000. Datasource DataSource.  Up 12.98 seconds
Sep  6 10:22:59 host systemd[1]: Started Execute cloud user/final scripts.
Sep  6 10:22:59 host systemd[1]: Reached target Cloud-init target.
Sep  6 10:22:59 host systemd[1]: Startup finished in 4.520s (kernel) + 8.547s (userspace) = 13.068s.
Sep  6 10:23:22 host systemd[1]: systemd-fsckd.service: Succeeded.
Sep  6 10:23:21 host systemd-timesyncd[406]: Synchronized to time server for the first time [2a01:4f9:6a:44ef:1053:da50:3536:1]:123 (2.debian.pool.ntp.org).
Sep  6 10:25:40 host systemd[1]: Created slice User Slice of UID 1000.
Sep  6 10:25:40 host systemd[1]: Starting User Runtime Directory /run/user/1000...
Sep  6 10:25:40 host systemd[1]: Started User Runtime Directory /run/user/1000.
Sep  6 10:25:40 host systemd[1]: Starting User Manager for UID 1000...
Sep  6 10:25:40 host systemd[918]: Listening on GnuPG cryptographic agent (ssh-agent emulation).
Sep  6 10:25:40 host systemd[918]: Listening on GnuPG cryptographic agent and passphrase cache (restricted).
Sep  6 10:25:40 host systemd[918]: Listening on GnuPG network certificate management daemon.
Sep  6 10:25:40 host systemd[918]: Listening on GnuPG cryptographic agent and passphrase cache.
Sep  6 10:25:40 host systemd[918]: Listening on GnuPG cryptographic agent and passphrase cache (access for web browsers).
Sep  6 10:25:40 host systemd[918]: Reached target Paths.
Sep  6 10:25:40 host systemd[918]: Starting D-Bus User Message Bus Socket.
Sep  6 10:25:40 host systemd[918]: Reached target Timers.
Sep  6 10:25:40 host systemd[918]: Listening on D-Bus User Message Bus Socket.
Sep  6 10:25:40 host systemd[918]: Reached target Sockets.
Sep  6 10:25:40 host systemd[918]: Reached target Basic System.
Sep  6 10:25:40 host systemd[1]: Started User Manager for UID 1000.
Sep  6 10:25:40 host systemd[918]: Started powerline-daemon - Daemon that improves powerline performance.
Sep  6 10:25:40 host systemd[918]: Reached target Default.
Sep  6 10:25:40 host systemd[918]: Startup finished in 78ms.
Sep  6 10:25:40 host systemd[1]: Started Session 1 of user user.
