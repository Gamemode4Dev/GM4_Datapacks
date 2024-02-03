# stop regen when player gets damaged by something other than a fall
# @s = damaged player
# at @s
# run from advancement gm4_combat_expanded:damaged/stop_regen

# 2.4 seconds for damage that should only briefly pause regeneration
execute store success score $regeneration_paused gm4_ce_data run scoreboard players set @s[advancements={gm4_combat_expanded:damaged/stop_regen={short_regeneration_pause=true}}] gm4_ce_natural_regen_damage 3

# 12 seconds for other types of damage
execute if score $regeneration_paused gm4_ce_data matches 0 run scoreboard players set @s gm4_ce_natural_regen_damage 15

# revoke advancement
advancement revoke @s only gm4_combat_expanded:damaged/stop_regen
