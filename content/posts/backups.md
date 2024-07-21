+++
title = 'Backups'
subtitle = "How I implement my backups (from the perspective someone who's lost way too much data)."
summary = "Here, I explain my backup system."
date = 2023-10-14T22:03:54-07:00
draft = false

author = "Daniel"
license = "<a rel='license external nofollow noopener noreffer' href='https://opensource.org/licenses/GPL-3.0' target='_blank'>GPL-3.0</a>"

tags = ["privacy", "backups"]
categories = ["Guides"]
rssFullText = true
+++

Backups are important. If you're not making them regularly, you should start. That's something everyone learns at one point, the hard way. If you haven't already, start making backups.

Backups are something that should be implemented securely, though. Chances are, some parts of the the data you're backing up are sensitive. For me, I'm backing up all my ssh keys, my gpg keys, and my Keepass database. I need a backup solution that's secure and sovereign. A good rule for making backups is the 3-2-1 rule. 3 copies of your data, stored on two different types of media, with one copy kept off-site (not in my house).

All things said, there isn't much I need to back up. All of my code is already on GitHub and most of my school assignments don't need to be backed up once they're submitted. However, I do have files that, if I lose, may compromise the online identity I'm building. I use my keys in `~/.ssh` to access my server, which this website is hosted on. My GPG keys are stored on a Yubikey nowadays, but my certify key still needs to be securely backed up so that I can provision new subkeys once my current ones expire (as they always should, I might write a guide on GPG in general later). I need to back up my Borg key, which I'll explain later. I need to back up my Obsidian vault, which stores all the notes I've racked up over the course of two years. I ned to back up my Gopass store, where I keep all my API keys and any passwords I might need to access in the CLI. Finally, I need to backup my `~/Documents` folder, which is where I keep all my important files.

All of this data is sensitive, and I'd rather it not fall into the wrong hands. That rules out cloud storage providers such as Google Drive, Dropbox, OneDrive, etc. I'd rather not use those services anyway, as their user experience isn't exactly what I'm looking for. That also rules out non-encrypted backup solutions, so just copying everything over to an external drive or a server is out. I think I've found an optimal backup solution that checks all these boxes.

My first backup is onto a Veracrypt container stored on a Lexar flash drive, kept on my keychain. The container is secured using a strong passphrase, and I wrote a script that `rsyncs` all of the aforementioned folders, with versioning, to the flash drive. It also gives me the option to generate a hash, in case I ever need to validate the container to ensure it hasn't been tampered with. If you ever want to set this up for yourself, I followed [this](https://www.youtube.com/watch?v=qPAOMczcuZw) guide.

My second backup is onto a Lexar SSD, using Time Machine. Time Machine is by far the best builtin backup solution I've ever seen on any operating system. It backs up my Mac's entire filesystem to a drive. It's pretty easy to set up, so I won't spend too much time explaining it, but I made sure that I formatted the drive so that it is an encrypted APFS volume, again with a strong passphrase.

My third backup is onto my VPS, with Borg. To back up to the Borg repository, I need the SSH key to access the server (which is set up using the GPG SSH agent (which is set up with my Yubikey (https://github.com/drduh/yubikey-guide))), the repo passphrase (which is stored in my Keepass database and my Gopass store), and the repo key (which is stored in my Keepass database and my USB drive). It's really secure. If you need a guide on getting set up with Borg, I recommend [this one](https://www.youtube.com/watch?v=rzEaxL6F2Eg&pp=ygUQc3VuIGtudWRzZW4gYm9yZw%3D%3D) to set up the server, and [Borgmatic](https://torsion.org/borgmatic/) as a convenient wrapper around Borg to make backing up much easier.

I recognize that my backup system might be slightly over-the-top, and I'm not encouraging any of you to follow my example. Nevertheless, I do emphasize again that you should always be making backups, in any way you prefer. Try not to learn the hard way.
