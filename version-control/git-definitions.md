# Git Definitions

**Instructions: ** Define each of the following Git concepts.

* What is version control?  Why is it useful?
Version control is a way to manage changes made to code, both independently and collaboratively. It's a lot like making save points in a video game in that it makes places you can easily return to. In the case of code, it makes it much harder to have a catastrophic failure and limits the costs of experimentation.

* What is a branch and why would you use one?
A branch is separate version of your code base where you can try out things you're not completely convinced will work. It's a lot like editing on a photocopy of text rather than the original.

* What is a commit? What makes a good commit message?
A commit is a snapshot of your repo at the time it was made. Sticking with the game metaphor, it's the actual save point. When you create a commit, it's the same as telling Final Fantasy "I want to be right here with these exact settings the next time I resume." A good commit message is something that's descriptive and makes it easy to see what work was done at a glance.

* What is a merge conflict?
One of Git's biggest benefits that it pulls things back together for disparate versions of the same code base. If I have two feature branches, one of which is focused on a new navbar functionality, and another is targeting an image carousel, Git will pull those branch together into master neatly. Most of the time. If my changes contradict each other, Git will tell me there's a merge conflict, which is it's way of saying "I need an adult!" When that happen, it gives an annotated file that says what Suzy said as the head (current branch) and what Johnny said below as whatever branch I'm merging into. I have to tell Git what's true.