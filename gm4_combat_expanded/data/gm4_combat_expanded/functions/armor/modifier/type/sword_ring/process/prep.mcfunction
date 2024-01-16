
tag @s add gm4_ce_target

# check for crouching
scoreboard players set $stats_set gm4_ce_data 0
execute if predicate gm4_combat_expanded:technical/crouching run function gm4_combat_expanded:armor/modifier/type/sword_ring/process/set_stats_crouching
execute if score $stats_set gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifier/type/sword_ring/process/set_stats

# rotate the spawn location
scoreboard players add @s gm4_ce_sword_ring.deg 5
scoreboard players remove @s[scores={gm4_ce_sword_ring.deg=360..}] gm4_ce_sword_ring.deg 360
execute store result storage gm4_combat_expanded:temp sword_ring.deg int 1 run scoreboard players get @s gm4_ce_sword_ring.deg

# get all swords that match this players id
scoreboard players operation $player_id gm4_ce_id = @s gm4_ce_id
execute as @e[type=item_display,tag=gm4_ce_sword_ring.sword] if score @s gm4_ce_id = $player_id gm4_ce_id run tag @s add gm4_ce_sword_ring.check_sword

# find location for the first sword
scoreboard players set $current_sword gm4_ce_data 1
function gm4_combat_expanded:armor/modifier/type/sword_ring/process/eval_deg with storage gm4_combat_expanded:temp sword_ring

tag @s remove gm4_ce_target
