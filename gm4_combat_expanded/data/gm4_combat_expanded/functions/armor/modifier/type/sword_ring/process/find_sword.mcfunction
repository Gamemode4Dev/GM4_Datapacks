
# find sword that should be moved 
execute as @e[type=item_display,tag=gm4_ce_sword_ring.check_sword] if score @s gm4_ce_sword_ring = $current_sword gm4_ce_data run tag @s add gm4_ce_sword_ring.current_sword

# if no sword exists yet spawn a new one
execute unless entity @e[type=item_display,tag=gm4_ce_sword_ring.current_sword] summon item_display run function gm4_combat_expanded:armor/modifier/type/sword_ring/process/init_sword

# move the sword to the correct position
$execute as @e[type=item_display,tag=gm4_ce_sword_ring.current_sword,limit=1] positioned ^ ^ ^$(offset) run function gm4_combat_expanded:armor/modifier/type/sword_ring/process/move_sword

# if more swords should exist run this again for those rotated around the player
scoreboard players add $current_sword gm4_ce_data 1
execute if score @s[scores={gm4_ce_sword_ring=2}] gm4_ce_sword_ring >= $current_sword gm4_ce_data rotated ~180 ~ run function gm4_combat_expanded:armor/modifier/type/sword_ring/process/find_sword with storage gm4_combat_expanded:temp sword_ring
execute if score @s[scores={gm4_ce_sword_ring=3}] gm4_ce_sword_ring >= $current_sword gm4_ce_data rotated ~120 ~ run function gm4_combat_expanded:armor/modifier/type/sword_ring/process/find_sword with storage gm4_combat_expanded:temp sword_ring
execute if score @s[scores={gm4_ce_sword_ring=4}] gm4_ce_sword_ring >= $current_sword gm4_ce_data rotated ~90 ~ run function gm4_combat_expanded:armor/modifier/type/sword_ring/process/find_sword with storage gm4_combat_expanded:temp sword_ring
