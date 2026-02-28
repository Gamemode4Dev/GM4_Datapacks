# Utilities
Chances are, the tough problem you are trying to tackle has been solved by someone else working on Gamemode 4 long before you did.
This document will give you an overview of utilities and tools that have been developed over the years and which may help you when making a module.

## Table of contents
* [Common Tags](#common-tags)
  * [Blocks Tags](#block-tags)
  * [Entity Tags](#entity-tags)
* [Environment Checks]()
  * [Base Checks]()
  * [Other Notable Checks]()
  * [Creating New Checks]()
* [Upgrade Paths]()

## Common Tags
Selecting blocks or entities with common properties is an error prone task, and subsequent updates often miss module-specific, hardcoded tags.
As such, `base` provides various tags that are maintained through updates and which should be prioritized over module-specific solutions.

### Block Tags
Gamemode 4's default block tags are located at `base/data/gm4/tags/block/`.

| Tag Name            | Source              | Description                                                                                          |
|---------------------|---------------------|------------------------------------------------------------------------------------------------------|
| #gm4:air            | air.json            | All air types.                                                                                       |
| #gm4:foliage        | foliage.json        | Naturally generating decoration on surfaces, which are easily broken, i.e. are washed away by water. |
| #gm4:full_collision | full_collision.json | All blocks that have a full-block collision box.                                                     |
| #gm4:no_collision   | no_collision.json   | All blocks without any collision, including air.                                                     |
| #gm4:replaceable    | replaceable.json    | Blocks that can be replaced by placing another block inside it, including air.                       |
| #gm4:water          | water.json          | Blocks that act as a water source.                                                                   |
| #gm4:waterloggable  | waterloggable.json  | Blocks which can be water-logged.                                                                    |

### Entity Tags
Gamemode 4's default entity tags are located at `base/data/gm4/tags/block/`.

| Tag Name             | Source               | Description                                                                                                                          |
|----------------------|----------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| #gm4:boats           | boats.json           | All boat variations, including rafts.                                                                                                |
| #gm4:boss            | boss.json            | Bosses, namely the Ender Dragon and the Wither.                                                                                      |
| #gm4:chest_boats     | chest_boats.json     | All boat variations with a chest.                                                                                                    |
| #gm4:hostile         | hostile.json         | Living entities that are hostile towards player by default.                                                                          |
| #gm4:minecarts       | minecarts.json       | All minecart variations.                                                                                                             |
| #gm4:neutral_hostile | neutral_hostile.json | Hostile living entities that may be, given the right conditions, neutral towards the player by default but turn hostile if provoked. |
| #gm4:neutral_passive | neutral_passive.json | Entities that are normally neutral, but turn hostile if provoked.                                                                    |
| #gm4:neutral         | neutral.json         | Entities that may be neutral given the right conditions.                                                                             |
| #gm4:non-living      | non-living.json      | Entities that are not considered living.                                                                                             |
| #gm4:passive         | passive.json         | Entities that are normally friendly and do not turn hostile, even if provoked.                                                       |

## Environment Checks
The environment a data pack is installed into may affect its performance.
Servers may have command blocks disabled, or mods may change the way the game reacts to changes made by commands.
Not all users are aware of this, which can lead to rather frustrating debugging experiences.
To counteract this, modules may include environment checks which warn the user of the data pack if certain conditions are not met.

Environment checks are included by specifying them by name (including namespace) inside a module's `beet.yaml`, e.g.
```yaml
id: gm4_double_doors
name: Double Doors
version: 1.2.X

data_pack:
  load: .

require:
  - bolt

pipeline:
  - gm4_double_doors.generate
  - gm4.plugins.extend.module

meta:
  gm4:
    versioning:
      schedule_loops: []

      # List of environment checks to include
      echecks: [gm4:score_on_non_player_entity]
    website:
      description: Tired of clicking twice to open a double door? Annoyed by the fact that doors are only two blocks tall? This data pack automatically opens adjacent doors, making double doors fully functional! Additionally, bottom trapdoors of matching wood type placed above a door are opened alongside the door when it is opened by a player.
      recommended: []
      notes: []
    modrinth:
      project_id: Vx4zJ1Np
    smithed:
      pack_id: gm4_double_doors
    video: null
    wiki: https://wiki.gm4.co/wiki/Double_Doors
    credits:
      Creator:
        - Bloo
      Icon Design:
        - venomousbirds
```

Multiple checks may be included, however, the order they will be executed in is arbitrary:
```yaml
echecks: [gm4:score_on_non_player_entity, gm4_double_doors:bloo_is_not_online, lib_forceload:command_blocks_enabled]
```

On reload, `base` obtains a list of environment checks requested by all installed modules and libraries. During `post_load` this list is then executed.
Announcements of the test results are only made if at least one test did not succeed and may not be instantaneous, as environment checks are allowed 30s of runtime.
If any check does not return after 30s it is marked as "timed-out" and will be announced as such.

For debug purposes, you may inspect the contents of storage `gm4:log echecks` to see the results of the latest environment checks. This storage is only cleared before new checks are executed.

### Base Environment Checks
`base` comes with some fundamental environment checks that can be referenced by the `gm4:` namespace.

| Check Name                     | Description                                                                                                              |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| gm4:score_on_non_player_entity | Checks if non-player entities can be added to a scoreboard. Fails if a test marker's score can not be set and read back. |

### Creating New Environment Checks
Modules may also introduce their own environment checks. Environment checks are defined as a single `.mcfunction` entry point, but may call other `.mcfunction` files, predicates, etc. from their entry point.
Caching of environment check results is provided automatically, you do not have to implement caching.

When introducing an environment check, the corresponding module must add the environment check's entry point to the `#gm4:evaluate_echecks` function tag.
Upon completion of the test (failure or success), the environment check needs to add a `result` object to its entry in the `gm4:log echeck` storage.

For example, the test with entry point located at `gm4:echeck/score_on_non_player_entity` may indicate a test failure as follows
```mcfunction
data modify storage gm4:log echecks[{echeck_id:"gm4:echeck/score_on_non_player_entity"}].result set value {passed:0,probable_cause:"This may be caused by the Paper/Spigot setting 'scoreboards.allow-non-player-entities-on-scoreboards=false'."}
```
Or a test success as
```mcfunction
data modify storage gm4:log echecks[{echeck_id:"gm4:echeck/score_on_non_player_entity"}].result set value {passed:1,probable_cause:""}
```

The `result.probable_cause` is shown to the user in chat in case the test fails.

For a textbook example of an environment check, inspect `gm4:score_on_non_player_entity` in `base`.
