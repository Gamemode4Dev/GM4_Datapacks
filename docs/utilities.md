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
The environment a data pack is installed into can affect its performance.
Servers may have command blocks disabled, or mods may change the way the game reacts to changes made by commands.
Not all users are aware of this, which can lead to rather frustrating debugging experiences.
To counteract this, modules can include environment checks which warn the user and block installation of the data pack if certain conditions are not met.

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
      environment_checks: [gm4:score_on_non_player_entity]
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

Multiple checks may be included and are executed in-order:
```yaml
environment_checks: [gm4:score_on_non_player_entity, gm4_double_doors:bloo_is_not_online, lib_forceload:command_blocks_enabled]
```

As shown above, environment checks are namespaced. If the namespace is omitted, the namespace of the parent module is used.

Environment checks are run on every reload, with each check only running once per reload even if multiple modules require it.
For testing purposes, environment checks may be bypassed by setting a positive test result before reloading data packs.
To do this run
```mcfunction
/data modify storage {namespace}:environment_checks result.{check name}.passed set value 1b
```
and run `/reload`.
This has to be repeated before each reload.

### Base Environment Checks
`base` comes with some fundamental environment checks that can be referenced by the `gm4:` namespace.

| Check Name                     | Description                                                                                                              |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| gm4:score_on_non_player_entity | Checks if non-player entities can be added to a scoreboard. Fails if a test marker's score can not be set and read back. |

### Other Notable Environment Checks
Some libraries also implement checks, which are inherited by all modules requiring said libraries, as a failed library install will prevent the dependent module from installing.
Hence, you probably don't need to add these checks to your module if you already depend on the library.

| Library       | Check Name                 | Description                                                                                                         |
|---------------|----------------------------|---------------------------------------------------------------------------------------------------------------------|
| lib_forceload | gm4:command_blocks_enabled | Checks if command blocks are enabled. Fails if the command block in the forceloaded chunk can not execute commands. |

### Creating New Environment Checks
Modules may also introduce their own environment checks.
Any functions contained directly within the `function/environment_check/` folder of a module are treated as environment checks and may be mentioned within 'beet.yaml`.
Functions in subfolders within `function/environment_check/` are ignored and can therefore be used as helper functions.

To indicate a successful environment check include
```mcfunction
data modify storage <namespace>:environment_checks result set value {<check name>: {passed: 1b}}
```
within your check, replacing `<namespace>` and `<check name>` with the module's namespace and the new check's name (identical to the file name without the `.mcfunction` suffix) respectively.
Optionally, a failed environment check can display a message to the user by including
```mcfunction
data modify storage <namespace>:environment_checks result set value {<check name>: {probable_cause: "This may be caused by the programmer not expecting you to run this on a potato."}}
```
within your check, once again replacing the `<namespace>` and `<check name>` with the module's and the new check's name respectively, as well as adding a more adequate message.
