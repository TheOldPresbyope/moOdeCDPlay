# moOde CD play

This repo contains code to add a CD playback function to the Raspberry Pi-based moOde music player.

The code assumes that a CD drive suitable for audio playback is already connected to the Raspberry Pi hosting the moOde player and is recognized by Raspbian as device /dev/cdrom.
 
## History

This work began as a contribution to the moOde project from Ashley Cox, communicated in email correspondence in July 2019 with Tim Curtis and Kent Reed (TheOldPresbyope). That contribution subsequently has been modified and extended by Kent Reed. In his emails, Cox granted the moOde project full permission to use his contribution. An MIT license has been used in this repo explicitly to grant this permission by both authors to all users. It is believed to be compatible with the GPL license used in the moOde codebase.

Similar work is described in https://github.com/TongboZhang/Moode_Extension. See additional links there.

## Design Intent

We intend the moOde CD playback function to mimic the behavior of a standalone CD player.

When an audio CD is inserted in the drive, moOde playback stops, the moOde queue is cleared and then loaded with a track list corresponding to the audio tracks on the CD. The user can play the tracks in the normal way. When the CD is ejected, playback stops and the queue is cleared. In particular, moOde retains no memory of the CD or its tracks. Saving a track as a favorite or setting it for clock radio will lead to later error when moOde attempts to play it.

## Responsiveness

An optical CD drive is very slow compared to other storage devices. The nature of the CDDA (compact disk digital audio) encoding further complicates finding and extracting an audio track from the CD.

Some sample timings:

- Load a CD and display the track list: 12s
- Select track 1 and begin playing: 14s
- Change from track to track: 3s
- Return to track 1 from track 7: 14s

Moving backwards and forwards within a track also takes time, and the moOde time dial has to catch up.

Once extracted, of course, an audio CD track is played back at 44.1KHz/16bit just as if it were decoded from, say, a FLAC-encoded file.

## Planned Evolution of Releases

In Version 0 (the current release), the CD track list consists of primitive "cdda:///1", cdda:///2", etc., entries. The default moOde logo is displayed for all tracks, and, for each track played, the information displayed below the logo is the ugly "File does not exist" and "Unknown artist - Unknown album"

Version 1 (in progress), is a prettified Version 0. The track list consists of "CD Track 1", "CD Track 2", etc., entries. A CDDA logo is displayed for all tracks, and the information displayed below the logo is sanitized.

In Version 2 (still a pipe dream), external data services are queried to obtain actual track information and CD coverart. Given the current state of these data services, the results may be reasonably good for some genres and hit-or-miss for others.

## Installation

The Version 0 code is contained in two simple scripts, a udev ruleset, and a systemd service file.

