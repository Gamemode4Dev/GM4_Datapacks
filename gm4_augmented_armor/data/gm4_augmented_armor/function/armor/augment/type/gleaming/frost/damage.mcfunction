
$damage @s $(frost_damage) freeze by @p[tag=gm4_aa_augment_damager]
# make damage combat damage so it does not regen
advancement grant @s[type=player] only gm4_survival_refightalized:damaged combat_damage

# if not at full stacks apply a brief slow
execute unless score $gleaming.frost gm4_aa_data matches 10.. run effect give @s[tag=!gm4_aa_immune_slowness] slowness 1 0

# briefly freeze entities, or apply a level of chill to players
scoreboard players set $freeze_seconds gm4_mu_data 1
execute if score $gleaming.frost gm4_aa_data matches 10.. if entity @s[type=!player] run function gm4_monsters_unbound:effect/freeze/apply
execute if score $gleaming.frost gm4_aa_data matches 10.. if entity @s[type=player] run function gm4_monsters_unbound:effect/freeze/apply_chill
