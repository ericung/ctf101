(gdb) break <location_before_fork>
(gdb) run
(gdb) continue
(gdb) set follow-fork-mode child
(gdb) set detach-on-fork off
(gdb) continue  // Now debugging the child, and the parent is also stopped
(gdb) info threads  // See both processes (potentially as threads)
(gdb) thread <thread_number_of_parent>
(gdb) continue  // Continue the parent process
(gdb) thread <thread_number_of_child>
(gdb) continue  // Continue the child process
