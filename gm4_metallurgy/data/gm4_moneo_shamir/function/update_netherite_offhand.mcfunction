# @s = player holding a netherite moneo tool that has the wrong MaxDurability
# at @s
# run from active_tool_offhand

# item modifier
item modify entity @s weapon.offhand gm4_moneo_shamir:netherite_update

# correctly set the max damage
scoreboard players set $tool_max_damage gm4_ml_data 2031
