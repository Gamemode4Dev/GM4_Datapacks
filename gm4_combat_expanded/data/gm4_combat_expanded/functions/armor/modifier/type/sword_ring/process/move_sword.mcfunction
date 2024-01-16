
# move sword to correct position
tp @s ~ ~ ~ facing ^-1 ^ ^

# damage entities the sword contacts
scoreboard players set $damage_dealt gm4_ce_data 0
execute at @s positioned ~-.1 ~-.1 ~-.1 as @e[tag=!gm4_ce_target,dx=0,dy=0,dz=0,type=!#gm4_combat_expanded:effect_immune,team=!gm4_ce_team_check,tag=!smithed.strict] positioned ~-.8 ~-.8 ~-.8 if entity @s[dx=0,dy=0,dz=0] store success score $damage_dealt gm4_ce_data run damage @s 4 player_attack
execute if score $damage_dealt gm4_ce_data matches 1 at @s run playsound minecraft:entity.player.attack.sweep player @a ~ ~ ~ 0.75 1.4

# reset the scales 
execute store result entity @s transformation.scale[0] float 0.003 run data get storage gm4_combat_expanded:temp sword_ring.scale 100
execute store result entity @s transformation.scale[1] float 0.003 run data get storage gm4_combat_expanded:temp sword_ring.scale 100
execute store result entity @s transformation.scale[2] float 0.003 run data get storage gm4_combat_expanded:temp sword_ring.scale 100

# keep this sword around until next tick
tag @s add gm4_ce_sword_ring.keep_sword

# remove tags so this sword is not processed anymore this tick
tag @s remove gm4_ce_sword_ring.current_sword
tag @s remove gm4_ce_sword_ring.check_sword
