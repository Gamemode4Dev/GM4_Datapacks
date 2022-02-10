# @s = player holding a netherite moneo tool that has the wrong MaxDurability
# run from active_tool

# item modifier
item modify entity @s weapon.mainhand gm4_moneo_shamir:update_netherite

# correctly set the max damage
scoreboard players set $tool_max_damage gm4_ml_data 2031
