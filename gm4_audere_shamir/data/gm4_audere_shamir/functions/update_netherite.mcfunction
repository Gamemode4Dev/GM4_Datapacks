# @s = player holding a netherite audere tool that has the wrong Item.tag.gm4_audere_shamir.max_durability
# run from active_tool

# item modifier
item modify entity @s weapon.mainhand gm4_audere_shamir:update_netherite

# correctly set the max damage
scoreboard players set $tool_max_damage gm4_ml_data 2031
