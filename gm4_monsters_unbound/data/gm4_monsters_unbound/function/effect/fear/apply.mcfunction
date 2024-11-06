# apply fear to this player
# @s = player to hit with fear
# at @s
# run from mob/process/elite/vorpal/fear_hit

# failsafe - don't fear spectators
execute if entity @s[gamemode=spectator] run return 0

# particles and sound
particle dust{color:[0.000,0.000,0.000],scale:1} ~ ~ ~ 0.0666 0.0666 0.0666 2 6 normal
playsound minecraft:entity.witch.celebrate hostile @s ~ ~ ~ 1 2
playsound minecraft:entity.witch.death hostile @s ~ ~ ~ 1 0.666

# set timer
scoreboard players operation $add_fear_time gm4_mu_data = $fear_seconds gm4_mu_data
scoreboard players operation $add_fear_time gm4_mu_data *= #4 gm4_mu_data

# effects
effect give @s blindness 3 0 true
effect give @s darkness 3 0 true
effect give @s nausea 3 0 true
effect give @s wither 1 0 true

# apply attributes
attribute @s attack_damage modifier add gm4_monsters_unbound:feared -0.9 add_multiplied_total
attribute @s attack_speed modifier add gm4_monsters_unbound:feared -0.9 add_multiplied_total
attribute @s block_break_speed modifier add gm4_monsters_unbound:feared -0.9 add_multiplied_total

# apply fear
scoreboard players operation @s gm4_mu_feared_time += $add_fear_time gm4_mu_data
tag @s add gm4_mu_feared
execute unless score $keep_tick.feared_entity gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/effect/fear 5t
