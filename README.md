minetest game Legend of Minetest
==================================

```
 _                               _        _____  ____            _            _   
| |                             | |      / _|  \/  (_)          | |          | |  
| |     ___  __ _  ___ _ __   __| | ___ | |_| .  . |_ _ __   ___| |_ ___  ___| |_ 
| |    / _ \/ _` |/ _ \ '_ \ / _` |/ _ \|  _| |\/| | | '_ \ / _ \ __/ _ \/ __| __|
| |___|  __/ (_| |  __/ | | | (_| | (_) | | | |  | | | | | |  __/ ||  __/\__ \ |_ 
\_____/\___|\__, |\___|_| |_|\__,_|\___/|_| \_|  |_/_|_| |_|\___|\__\___||___/\__|
             __/ |                                                                
            |___/                                                                 
```
## Information
--------------

Game inspired in the Legend of Zelda.

Created by D00Med, but with a lot of help from tobyplowy (aka toby109tt),
and also help from Noah K.(aka WinkingBaby)(https://www.youtube.com/channel/UCu8MTAFrihYO9PxKm-pk_xw), Mastersyfodiaz, and Sam Labbato(https://soundcloud.com/sam-labbato)

![menu/header.png]([menu/header.png)

#### Gameplay information:

In addition to the usual mining and building objectives of the game, there 
are now bosses and the triforce as objectives. 

The triforce can be obtained either by mining mese, searching dungeons, 
or by defeating Ganon. Scattered throughout the dungeons are triforce shards, 
and magic pendants. These pendants can be used to craft boss spawners. 
Once placed, the bosses will spawn after 5 seconds. 

Currently there are three minor bosses, spawned with blocks crafted with 
the three pendants. These bosses drop the three stones required to obtain 
the mastersword, which will turn any boss spawner into a Ganon spawner 
when right clicked. 

The bosses are tough so be prepared! Also, in an attempt to break away from 
the usual mining aspect, some materials can be traded with npc's.

## Technical info
-----------------

To use this (sub)game with the Minetest engine, insert this repository 
at the path of `.minetest/games` or `/usr/share/minetest/games` or `<PATH OF MINETEST>/games`.

The Minetest engine can be found at https://github.com/minetest/minetest/

This reposritoy has a mirror at https://github.com/minenux/minetest-game-LegendofMinetest 
many of the updated mobs come from the minenux project

#### Compatibility

This mod implements their own default mods set, if you have similar or 
extra ones, then must be explicit disabled.

This game its already tested again following engines:

* minetest 5.0, 5.2 : https://github.com/minetest/minetest/releases/tag/5.2.0
* minetest 0.4.15, 0.4.16 : https://github.com/minetest/minetest/releases/tag/0.4.16
* minetest 0.4.17.1 : https://github.com/minetest/minetest/releases/tag/0.4.17.1
* minenux4 4.0.17+ : https://codeberg.org/minenux/minetest-engine-minetest/src/branch/stable-4.0
* minenux5 5.2+ : https://codeberg.org/minenux/minetest-engine-minetest/src/branch/stable-5.2
* multicraft 2 : not tested yet, should work
* multicraft 1 : https://codeberg.org/minenux/minetest-engine-multicraft1/src/tag/v1.10.0

The Minetest Game github master HEAD is generally not compatible with this game
master HEAD because of the changed nature of developers of minetest, 
they break so many things and never care about the others.

#### mods packaged

Mods by D00Med:

* doomshrooms
* hyrule_mapgen
* hyruletools
* icetools
* mobs_fairy(based on mobs_bat)
* mobs_loz
* moreplants
* kblocks
* twilight
* vehicles_loz
* witchcraft
* music
* masks
* clawshot

Mods by minenux

* TODO will be upgraded some due provide backguard compat for both engines (v0.4 and v5)

Default ones (not upgradable due nature modifications)

* give_initial_stuff 

Others:

* TODO list of mods contribution (fill an issue well described please)

## LICENSE

* License of code: GNU GPL v3 (C) 2016-2017,2022 D00Med
* License of code: GNU GPL v3 (C) 2022 PICCORO Lenz McKAY
* License of textures: CC BY-SA 3.0 (C) 2016-2017 D00Med and tobyplowy(aka toby109tt)

For other mods see license.txt in the folder of each mod.

An edit of Minetest Game all code licensed as shown below unless otherwise stated.

#### License of source code of mods from default minetest game first mods

Copyright (C) 2010-2012 celeron55, Perttu Ahola <celeron55@gmail.com>
See README.txt/README.md in each mod directory for information about other authors.

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation; either version 2.1 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

#### License of media (textures and sounds) from default mientest game first mods

Copyright (C) 2010-2012 celeron55, Perttu Ahola <celeron55@gmail.com>
See README.txt in each mod directory for information about other authors.

Attribution-ShareAlike 3.0 Unported (CC BY-SA 3.0)
http://creativecommons.org/licenses/by-sa/3.0/

