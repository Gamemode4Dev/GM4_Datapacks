# stop regen when player gets damaged by something other than a fall
# @s = damaged player
# at @s
# run from advancement gm4_combat_expanded:damaged/stop_regen

# 12 seconds for main combat damage
execute store success score $regeneration_paused gm4_ce_data run scoreboard players set @s[advancements={gm4_combat_expanded:damaged/stop_regen={long_regeneration_pause=true}}] gm4_ce_natural_regen_damage 15
# 2.4 seconds for out-of-combat damage
execute if score $regeneration_paused gm4_ce_data matches 0 unless score @s gm4_ce_natural_regen_damage matches 3.. run scoreboard players set @s gm4_ce_natural_regen_damage 3

# revoke advancement
advancement revoke @s only gm4_combat_expanded:damaged/stop_regen
