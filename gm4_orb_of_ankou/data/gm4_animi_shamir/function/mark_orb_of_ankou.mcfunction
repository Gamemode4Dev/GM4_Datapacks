# Marks Orbs of Ankou as tools for the animi shamir
# run from #gm4_animi_shamir:mark_item_validity

execute if items entity @e[type=item,tag=gm4_ml_source,dx=0] contents *[custom_data~{gm4_metallurgy:{stored_shamir:'animi'}}] if items entity @s contents minecraft:firework_star[custom_data~{gm4_orb_of_ankou:{item:"orb"}}] run scoreboard players set valid_item gm4_ml_data 1
