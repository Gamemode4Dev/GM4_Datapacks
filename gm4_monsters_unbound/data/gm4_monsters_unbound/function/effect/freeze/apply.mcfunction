# apply freeze to this entity
# @s = entity to freeze
# at @s
# run from effect/freeze/apply_from_slow
# run from mob/process/elite/glacial/explode

# don't freeze spectators
execute if entity @s[gamemode=spectator] run return 0

# take tiny fraction of damage for show
damage @s 0.01 freeze

# set timer
scoreboard players operation $add_freeze_time gm4_mu_data = $freeze_seconds gm4_mu_data
scoreboard players operation $add_freeze_time gm4_mu_data *= #4 gm4_mu_data
scoreboard players reset $freeze_seconds gm4_mu_data

# set attributes based on entity type
execute if entity @s[type=player] run function gm4_monsters_unbound:effect/freeze/apply_player
execute if entity @s[type=!player] run function gm4_monsters_unbound:effect/freeze/apply_entity

# apply freeze
scoreboard players operation @s gm4_mu_frozen_time += $add_freeze_time gm4_mu_data
tag @s add gm4_mu_frozen
execute unless score $keep_tick.frozen_entity gm4_mu_keep_tick matches 1 run schedule function gm4_monsters_unbound:clocks/effect/freeze 5t
