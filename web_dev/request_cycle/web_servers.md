# Web Servers
## What are key design philosophies of Linux?
- Open-source
- Do one thing and do it well
- Write programs that work together

## What's a VPS (virtual private server)? What are the benefits and disadvantages of them?
A virtual private server is a virtual machine run by a hosting service. A single physical server is partitioned according to needs/commitments of the VPS users. It runs its own copy of a OS (usually Linux for the free.)

They're cheaper than dedicated hosting solutions and more performant than shared solutions. On the flipside, they share hardware with other VPSs and may be taxed harder or less-efficient than dedicated hardware.

A lot of that is nearly cribbed from corners of the internet. In my own word, A VPS is a section of a larger server that acts independently. A lot of like countries on a continent. Each individual server has its own OS (culture), resources (files) and output (exports), but they're all located in the same physical space. The VPSs benefit from economy of scale. It's easier to get started with a share of something purchased as a bloc than with a whole of something and no trade partners.

## Why's it a bad idea to run programs as root on Linux?
For starters, logs and accountability. Root can do anything and there's no way of identifying who did what when people share a user. Not everyone needs access to every option and creating users allows an admin to make sure the correct safeguards are in place. A user can't delete things on the root directory.

Secondly, security. If there's an issue at the user level, it's restricted in the way it accesses your system. That's not the case with root. Root can do anything on the system, often without those helpful dialog/permission issues. If someone wrote a crummy line of code designed to delete the desktop of a computer, on root that would happen.