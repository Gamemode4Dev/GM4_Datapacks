# find this players sword and move it
# @s = player wearing armor
# at @s rotated ~x ~
# run from armor/modifier/type/sword_ring/eval_deg
# run from here

# find sword that should be moved
execute store result score $sword_id gm4_ce_data run data get storage gm4_combat_expanded:temp sword_ring.data[0].tag.gm4_combat_expanded.slot
execute as @e[type=item_display,tag=gm4_ce_sword_ring.check_sword] if score @s gm4_ce_sword_ring = $sword_id gm4_ce_data run tag @s add gm4_ce_sword_ring.current_sword

# if no sword exists yet spawn a new one
execute unless entity @e[type=item_display,tag=gm4_ce_sword_ring.current_sword] summon item_display run function gm4_combat_expanded:armor/modifier/type/sword_ring/init_sword

# move the sword to the correct position
tag @s add gm4_ce_self
$execute as @e[type=item_display,tag=gm4_ce_sword_ring.current_sword,limit=1] positioned ^ ^ ^$(offset) run function gm4_combat_expanded:armor/modifier/type/sword_ring/move_sword
tag @s remove gm4_ce_self

# if more swords should exist run this again for those rotated around the player
data remove storage gm4_combat_expanded:temp sword_ring.data[0]
execute if score $sword_ring.count gm4_ce_data matches 2 if data storage gm4_combat_expanded:temp sword_ring.data[0] rotated ~180 ~ run function gm4_combat_expanded:armor/modifier/type/sword_ring/find_sword with storage gm4_combat_expanded:temp sword_ring
execute if score $sword_ring.count gm4_ce_data matches 3 if data storage gm4_combat_expanded:temp sword_ring.data[0] rotated ~120 ~ run function gm4_combat_expanded:armor/modifier/type/sword_ring/find_sword with storage gm4_combat_expanded:temp sword_ring
execute if score $sword_ring.count gm4_ce_data matches 4 if data storage gm4_combat_expanded:temp sword_ring.data[0] rotated ~90 ~ run function gm4_combat_expanded:armor/modifier/type/sword_ring/find_sword with storage gm4_combat_expanded:temp sword_ring
