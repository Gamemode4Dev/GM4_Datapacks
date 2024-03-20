# cast frost orb spell when trident lands
# @s = spell trident
# at @s positioned ~ ~1 ~
# run from spell_trident/process

# return trident to owner
tag @s remove gm4_hy_spell_trident.process
tag @s add gm4_hy_spell_trident.frost_casting

# spawn forst orb
# spawn discs
execute rotated 0 0 positioned ^ ^ ^4 run function gm4_hydromancy:spell_trident/frost/spawn_disc
execute rotated 90 0 positioned ^ ^ ^4 run function gm4_hydromancy:spell_trident/frost/spawn_disc
execute rotated 180 0 positioned ^ ^ ^4 run function gm4_hydromancy:spell_trident/frost/spawn_disc
execute rotated -90 0 positioned ^ ^ ^4 run function gm4_hydromancy:spell_trident/frost/spawn_disc
execute rotated 0 90 positioned ^ ^ ^4 run function gm4_hydromancy:spell_trident/frost/spawn_disc
execute rotated 0 -90 positioned ^ ^ ^4 run function gm4_hydromancy:spell_trident/frost/spawn_disc
# spawn edges
execute positioned ~3 ~-3 ~ if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~-3 ~1 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~-3 ~-1 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~3 ~ if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~3 ~1 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~3 ~-1 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~-3 ~ if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~-3 ~1 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~-3 ~-1 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~3 ~ if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~3 ~1 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~3 ~-1 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~ ~-3 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~1 ~-3 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-1 ~-3 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~ ~3 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~1 ~3 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-1 ~3 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~ ~-3 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~1 ~-3 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-1 ~-3 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~ ~3 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~1 ~3 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-1 ~3 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~ ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~1 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~-1 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~ ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~1 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~-1 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~ ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~1 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~-1 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~ ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~1 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~-1 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
# spawn corners
execute positioned ~2 ~3 ~2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-2 ~3 ~2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~2 ~3 ~-2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-2 ~3 ~-2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~2 ~-3 ~2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-2 ~-3 ~2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~2 ~-3 ~-2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-2 ~-3 ~-2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~2 ~2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~2 ~2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~2 ~-2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~2 ~-2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~2 ~2 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-2 ~2 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~2 ~2 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-2 ~2 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~-2 ~2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~-2 ~2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~3 ~-2 ~-2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-3 ~-2 ~-2 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~2 ~-2 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-2 ~-2 ~3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~2 ~-2 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
execute positioned ~-2 ~-2 ~-3 if block ~ ~ ~ #gm4:replaceable align xyz positioned ~.5 ~.5 ~.5 summon marker run function gm4_hydromancy:spell_trident/frost/frost_block/spawn
