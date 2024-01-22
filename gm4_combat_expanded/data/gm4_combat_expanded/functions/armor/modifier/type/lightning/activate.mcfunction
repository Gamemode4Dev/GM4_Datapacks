# actiavate lightning armor on wearer getting hit
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/lightning

item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items

scoreboard players set $lightning_pieces gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:0b}].tag.gm4_combat_expanded{modifier:lightning} run scoreboard players add $lightning_pieces gm4_ce_data 1
execute if data storage gm4_combat_expanded:temp Items[{Slot:1b}].tag.gm4_combat_expanded{modifier:lightning} run scoreboard players add $lightning_pieces gm4_ce_data 1
execute if data storage gm4_combat_expanded:temp Items[{Slot:2b}].tag.gm4_combat_expanded{modifier:lightning} run scoreboard players add $lightning_pieces gm4_ce_data 1
execute if data storage gm4_combat_expanded:temp Items[{Slot:3b}].tag.gm4_combat_expanded{modifier:lightning} run scoreboard players add $lightning_pieces gm4_ce_data 1

execute on attacker run scoreboard players operation @s gm4_ce_lightning_charge += $lightning_pieces gm4_ce_data
execute on attacker run scoreboard players set @s gm4_ce_lightning_charge.timer 160

# lightning processing is run through the weapon modifier
