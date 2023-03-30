# process landed spell trident
# @s = spell trident
# at @s
# run from spell_trident/process_slow

# on first landing setup interaction entity

# if interaction entity is lost stop spell and delete interaction entity


scoreboard players set $heal.mana_used gm4_hy_data 0
tag @s add gm4_hy_target

# grow nearby crops / regrow nearby coral, random column each cycle (1 mana per growth)
execute summon marker run function gm4_hydromancy:spell_trident/heal/grow/init

# regen entities, damage undead (1 mana per entity)
execute as @e[distance=..8,team=!gm4_hy_team_check,type=!armor_stand,tag=!smithed.strict] run function gm4_hydromancy:spell_trident/heal/regen

# breed mobs?


scoreboard players operation @s gm4_hy_mana_used += $heal.mana_used gm4_hy_data
tag @s remove gm4_hy_target
