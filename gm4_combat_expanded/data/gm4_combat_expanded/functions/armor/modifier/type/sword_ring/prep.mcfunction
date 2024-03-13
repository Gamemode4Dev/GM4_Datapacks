# prepare everything needed to process sword_ring armor
# @s = player wearing armor
# at @s
# run from clocks/temp/sword_ring

scoreboard players set $keep_tick.sword_ring gm4_ce_keep_tick 1

tag @s add gm4_ce_target
execute store result score $player_creative gm4_ce_data if entity @s[gamemode=creative]

# grab armor data
data modify block 29999998 1 7134 Items set value []
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

function gm4_combat_expanded:armor/modifier/type/sword_ring/get_relevant_data
execute store result score $sword_ring.count gm4_ce_data run data get storage gm4_combat_expanded:temp sword_ring.data

# check for crouching
scoreboard players set $stats_set gm4_ce_data 0
execute if predicate gm4_combat_expanded:technical/crouching run function gm4_combat_expanded:armor/modifier/type/sword_ring/set_stats_crouching
execute if score $stats_set gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifier/type/sword_ring/set_stats

# rotate the spawn location
scoreboard players add @s gm4_ce_sword_ring.deg 5
scoreboard players remove @s[scores={gm4_ce_sword_ring.deg=360..}] gm4_ce_sword_ring.deg 360
execute store result storage gm4_combat_expanded:temp sword_ring.deg int 1 run scoreboard players get @s gm4_ce_sword_ring.deg

# get all swords that match this players id
scoreboard players operation $player_id gm4_ce_id = @s gm4_ce_id
execute as @e[type=item_display,tag=gm4_ce_sword_ring.sword,distance=..12] if score @s gm4_ce_id = $player_id gm4_ce_id run tag @s add gm4_ce_sword_ring.check_sword

# find location for the first sword
function gm4_combat_expanded:armor/modifier/type/sword_ring/eval_deg with storage gm4_combat_expanded:temp sword_ring

# cleanup
tag @s remove gm4_ce_target
data remove storage gm4_combat_expanded:temp sword_ring
