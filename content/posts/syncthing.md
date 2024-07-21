+++
title = 'Syncthing '
subtitle = "(or, why I stopped using cloud storage)"
summary = "Here, I sing my praises for Syncthing."
date = 2023-09-22T17:55:14-07:00
draft = false
author = "Daniel"
license = "<a rel='license external nofollow noopener noreffer' href='https://opensource.org/licenses/GPL-3.0' target='_blank'>GPL-3.0</a>"

tags = ["privacy", "software"]
categories = ["reviews"]
rssFullText = true
+++

Up until a few weeks ago, I was an ardent OneDrive user, mainly because I got a terabyte of storage for free from my school email. I put everything in there, from resumes to school assignments to my notes. There were a number of problems with it, however. The most glaring one was that everything was relegated to a single, OneDrive branded folder in my home directory, `~/OneDrive - [REDACTED COLLEGE SHAREPOINT ORGANISATION NAME]`. The sharepoint name appended to the folder was ugly and made it unwieldy to type into a terminal, which was a dealbreaker since I interact with my files via the command line the majority of the time. You are given the choice to sync your Documents and Desktop folders via OneDrive as well (only these two folders), but the implementation left much to be desired. OneDrive simply creates a Desktop and Document folder and symlinks those to your home directory. Symlinks break all kinds of things in the context of the command line and programming. Despite all these issues, I stuck with OneDrive, simply because I knew other cloud providers were no better.

Turns out, I was only looking at cloud storage providers, services that store my files on their servers. I don't really use OneDrive that way. I use it more of a syncing solution, so that I can share files between my Linux laptop, my MacBook, and my iPhone. So why don't I just use a service specifically for syncing? 

I'd heard of [Syncthing](https://syncthing.net/) before, but I'd never really tried it out for my own use. The first thing I noticed was how easy setting up Syncthing was. It's a two-step process; download Syncthing on each device to sync, then connect them together. It's that simple. In comparison, setting up OneDrive involves downloading OneDrive, signing in, opening the email confirmation link, skipping past the offer to sync my Documents and Desktop folders... It's just too much overhead for a simple file-syncing service.

Another thing I like about Syncthing is that it syncs over the local network. That way, our files aren't sitting on a server somewhere, and it's completely safe from the possibility of OneDrive going out of business or datacenter arson or something. Unlikely, but possible. It's also a much more private way to sync files, since it's peer to peer, and only travels between two devices instead of having sensitive documents on a server, which is just some other guy's computer.

The one caveat with Syncthing that some people don't really realize is that it's not a backup solution. If a file is deleted on one device, it's deleted on all the other ones connected to it. That's bad. Thankfully, I have physical backups on both a hard drive and a USB stick, as well as a daily Borg backup to my VPS. This might seem like overkill, but I've lost enough completed essays to accidental deletion than I'd like to admit, and I'd like to avoid that.

Use Syncthing. It good.

(Maybe I'll make a post about my backup system later. Maybe (No promises though.)).
