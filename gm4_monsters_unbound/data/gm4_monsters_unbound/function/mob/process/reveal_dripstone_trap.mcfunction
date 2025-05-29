# reveal dripstone trap when a player gets below
# @s = hidden dripstone trap
# at @s
# run from main

kill @s 

execute unless block ~ ~1 ~ #gm4_monsters_unbound:dripstone run return 0

# spring the trap
particle block{block_state:"dripstone_block"} ~ ~ ~ 0.2 0.6 0.2 1 24
particle block{block_state:"dripstone_block"} ~ ~-16 ~ 0.2 10 0.2 1 64
playsound minecraft:block.dripstone_block.break block @a[distance=..42] ~ ~ ~ 1.5 0.8 1

execute store result score $pick_entity gm4_mu_data run random value 1..3
scoreboard players set $mob_extras gm4_sr_data 1
execute if score $pick_entity gm4_mu_data matches 1 run summon skeleton ~ ~-0.8 ~ {Tags:["gm4_sr_extra_mob"],Motion:[0.0d,-0.275d,0.0d],attributes:[{id:"fall_damage_multiplier",base:1,modifiers:[{id:"gm4_monsters_unbound:stat_change.dripstone_trap",amount:-0.95,operation:"add_multiplied_total"}]}]}
execute if score $pick_entity gm4_mu_data matches 2 run summon zombie ~ ~-0.8 ~ {Tags:["gm4_sr_extra_mob"],Motion:[0.0d,-0.275d,0.0d],attributes:[{id:"fall_damage_multiplier",base:1,modifiers:[{id:"gm4_monsters_unbound:stat_change.dripstone_trap",amount:-0.95,operation:"add_multiplied_total"}]}]}
execute if score $pick_entity gm4_mu_data matches 3 run summon spider ~ ~ ~ {Tags:["gm4_sr_extra_mob"],Motion:[0.0d,-0.275d,0.0d],attributes:[{id:"fall_damage_multiplier",base:1,modifiers:[{id:"gm4_monsters_unbound:stat_change.dripstone_trap",amount:-0.95,operation:"add_multiplied_total"}]}]}

execute as @e[type=#gm4_survival_refightalized:modify,tag=gm4_sr_extra_mob,distance=..1,limit=1] at @s run function gm4_survival_refightalized:mob/init/initiate
