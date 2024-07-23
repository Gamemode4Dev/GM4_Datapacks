
# don't freeze spectators
execute if entity @s[gamemode=spectator] run return 0

# take tiny fraction of damage for show
damage @s 0.01 freeze

# set timer
scoreboard players operation $add_freeze_time gm4_ce_data = $freeze_seconds gm4_ce_data
scoreboard players operation $add_freeze_time gm4_ce_data *= #4 gm4_ce_data

# set attributes based on entity type, for players allow altering of freeze time
execute if entity @s[type=player] run function gm4_combat_expanded:effect/freeze/apply_player
execute if entity @s[type=!player] run function gm4_combat_expanded:effect/freeze/apply_entity

# apply freeze
scoreboard players operation @s gm4_ce_frozen_time += $add_freeze_time gm4_ce_data
tag @s add gm4_ce_frozen
execute unless score $keep_tick.frozen_entity gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/frozen_entity 5t
