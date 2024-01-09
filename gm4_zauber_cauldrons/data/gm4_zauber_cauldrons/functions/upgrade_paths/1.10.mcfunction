# add pre-computed location and dimension data to existing Zauber Cauldrons, if there is a player in the same dimension as the cauldron (required for obtaining the dimension id)
execute as @e[type=marker,tag=gm4_zauber_cauldron,scores={gm4_entity_version=..1}] at @s if entity @p[x=0] run function gm4_zauber_cauldrons:cauldron/setup/initialize_marker
tag @a remove gm4_zc_luck

# single-run actions below, return if this upgrade path ran before
execute if score $ran_v1_10_upgrade_path gm4_zc_data matches 1.. run return 1

# remove HideFlags from crystal skull registry
data remove storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/instant_damage/v0"}].item.HideFlags
data remove storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/instant_health/v0"}].item.HideFlags
data remove storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/jump_boost/v0"}].item.HideFlags
data remove storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/poison/v0"}].item.HideFlags
data remove storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/regeneration/v1"}].item.HideFlags
data remove storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/speed/v1"}].item.HideFlags
data remove storage gm4_player_heads:register heads[{id:"gm4_zauber_cauldrons:crystal/strength/v0"}].item.HideFlags

# remember upgrade path ran so that single-run actions are not executed again
scoreboard players set $ran_v1_10_upgrade_path gm4_zc_data 1
