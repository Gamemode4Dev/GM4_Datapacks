#@s = alchemical crafter with recharge recipe
#Run from recipes/recharge

execute if score @s gm4_charge_level matches 5 run data merge block ~ ~ ~ {Items:[{Slot:8,id:"player_head",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1},gm4_transmutation_stone:1b,gm4_transmutation_charge:6b,gm4_transmutation_charged:1b,gm4_transmutation_supercharged:1b,display:{Lore:["§7Charge: §d150%§r"],Name:"{\"text\":\"Transmutation Stone\",\"italic\":false}"},SkullOwner:{Id:"0d867dc5-c2b3-460f-bbc6-8cbd4ae93a5f",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWFkY2Q3OWE5YmM3OWE3NjQyYTczZTU3ZGU2NzkzOWQzYzM3OTQyN2MyMWQzODQ2MTZmNDA0MDdmMWYzNDc2MSJ9fX0="}]}}}}]}

execute if score @s gm4_charge_level matches 4 run data merge block ~ ~ ~ {Items:[{Slot:8,id:"player_head",Count:1b,tag:{gm4_alchemical_crafters:{multiplier:1},gm4_transmutation_stone:1b,gm4_transmutation_charge:5b,gm4_transmutation_charged:1b,gm4_transmutation_supercharged:1b,display:{Lore:["§7Charge: §b125%§r"],Name:"{\"text\":\"Transmutation Stone\",\"italic\":false}"},SkullOwner:{Id:"0d867dc5-c2b3-460f-bbc6-8cbd4ae93a5f",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWFkY2Q3OWE5YmM3OWE3NjQyYTczZTU3ZGU2NzkzOWQzYzM3OTQyN2MyMWQzODQ2MTZmNDA0MDdmMWYzNDc2MSJ9fX0="}]}}}}]}

playsound entity.illusioner.prepare_mirror master @a[distance=..6] ~ ~ ~ 1 2 1
execute store result block ~ ~ ~ Items[0].Count byte 1 run scoreboard players get @s gm4_stack_size
data remove block ~ ~ ~ Items[0].tag.gm4_alchemical_crafters