# run if sword damaged an entity
# @s = sword item_display
# at player rotated ~x ~
# run from armor/modifier/type/sword_ring/move_sword

# vfx
playsound minecraft:entity.player.attack.sweep player @a ~ ~ ~ 0.75 1.4
particle sweep_attack ~ ~ ~ 0.05 0.15 0.05 0.01 1

# check if damage should be done to the armor
execute if score $player_creative gm4_ce_data matches 0 run function gm4_combat_expanded:armor/modifier/type/sword_ring/damage_dealt/durability

