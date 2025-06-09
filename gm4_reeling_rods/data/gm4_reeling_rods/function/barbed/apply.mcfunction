# Applies the barbed damage to the hooked entity
# @s = hooked entity
# at bobber position
# with {damage}
# run from hooked_entity/select_type

# immediate damage (amount scales with enchantment level)
execute store result score $show_death_messages gm4_reeling_rods.barbed_damage_timer run gamerule showDeathMessages
gamerule showDeathMessages false
$damage @s $(damage) cactus by @p[tag=gm4_reeling_rods.player]
playsound minecraft:entity.player.attack.crit player @a[distance=..16] ~ ~ ~ 1 1.82

# handle death (@e only selects entities which are alive)
# | this is of importance for entities which display death messages or re-spawn
tag @s add gm4_reeling_rods.victim
execute if entity @s[type=#gm4_reeling_rods:support_death_message] at @s unless entity @e[type=#gm4_reeling_rods:support_death_message,tag=gm4_reeling_rods.victim,distance=0,limit=1] run function gm4_reeling_rods:barbed/on_scratch_death

# if the victim is still alive, schedule bleeding damage
execute at @s if entity @e[tag=gm4_reeling_rods.victim,distance=0,limit=1] run function gm4_reeling_rods:barbed/schedule_bleeding

# reset scores, gamerule and tag
tag @s remove gm4_reeling_rods.victim
execute if score $show_death_messages gm4_reeling_rods.barbed_damage_timer matches 1 run gamerule showDeathMessages true
scoreboard players reset $show_death_messages gm4_reeling_rods.barbed_damage_timer
