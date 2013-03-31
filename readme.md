Prey Motion Mod
===============

By mrwonko

Adding Motion Control to Prey

Also Stereo Rendering / VR

Todo
----

* Just about everything!

Done
----

* Initial Stereo Rendering tests. Limited success, see Known Issues.

Known Issues
------------

* Glow is broken in Stereo Rendering, both views use the same offset. This is a problem in the engine - g_skipViewEffects 1 makes the effects in question disappear, but disabling everything g_skipViewEffects controls in the mod code doesn't. Also, some effects (e.g. leechgun ammo) are only rendered in the first view. The whole glowStage stuff was apparently added by Human Head, I find no reference to it in Doom 3's source.