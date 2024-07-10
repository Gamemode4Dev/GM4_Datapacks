
# take tiny fraction of damage for show
damage @s 0.01 freeze

# apply attributes
attribute @s generic.movement_speed modifier add gm4_combat_expanded:frozen -1 add_multiplied_total
attribute @s generic.attack_speed modifier add gm4_combat_expanded:frozen -1 add_multiplied_total
attribute @s generic.jump_strength modifier add gm4_combat_expanded:frozen -1 add_multiplied_total
attribute @s generic.knockback_resistance modifier add gm4_combat_expanded:frozen 1 add_multiplied_total
attribute @s player.entity_interaction_range modifier add gm4_combat_expanded:frozen -1 add_multiplied_total
attribute @s player.block_interaction_range modifier add gm4_combat_expanded:frozen -1 add_multiplied_total

# set timer
scoreboard players set @s gm4_ce_frozen_time 60
tag @s add gm4_ce_frozen
execute unless score $keep_tick.frozen_player gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/frozen_player 1t
