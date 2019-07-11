#@s = alchemical crafters containing a recipe results
#Run from recipe_validity_check

#drain charge based on drain value
execute store result score drain_amount gm4_ee_charge run data get block ~ ~ ~ Items[0].tag.gm4_alchemical_crafters.drain_value
scoreboard players operation @s gm4_ee_charge -= drain_amount gm4_ee_charge
execute if score @s gm4_ee_charge matches ..-1 run scoreboard players set @s gm4_ee_charge 0

#place in transmutation stone
execute if score @s gm4_ee_charge matches 101.. run replaceitem block ~ ~ ~ container.7 minecraft:player_head{gm4_alchemical_crafters:{multiplier:1},CustomModelData:14,gm4_transmutation_stone:1b,gm4_transmutation_charge:101s,display:{Lore:['{"translate":"%1$s%3427655$s","with":["Supercharged",{"translate":"item.gm4.ee_supercharged"}],"italic":true,"color":"aqua"}'],Name:'{"translate":"%1$s%3427655$s","with":["Transmutation Stone",{"translate":"item.gm4.transmutation_stone"}],"italic":false}'},SkullOwner:{Id:"0d867dc5-c2b3-460f-bbc6-8cbd4ae93a5f",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWFkY2Q3OWE5YmM3OWE3NjQyYTczZTU3ZGU2NzkzOWQzYzM3OTQyN2MyMWQzODQ2MTZmNDA0MDdmMWYzNDc2MSJ9fX0="}]}}} 1
execute if score @s gm4_ee_charge matches ..100 run replaceitem block ~ ~ ~ container.7 minecraft:player_head{CustomModelData:14,gm4_alchemical_crafters:{multiplier:1},gm4_transmutation_stone:1b,gm4_transmutation_charge:0s,display:{Name:'{"translate":"%1$s%3427655$s","with":["Transmutation Stone",{"translate":"item.gm4.transmutation_stone"}],"italic":false}'},SkullOwner:{Id:"0d867dc5-c2b3-460f-bbc6-8cbd4ae93a5f",Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYWFkY2Q3OWE5YmM3OWE3NjQyYTczZTU3ZGU2NzkzOWQzYzM3OTQyN2MyMWQzODQ2MTZmNDA0MDdmMWYzNDc2MSJ9fX0="}]}}} 1

#apply new charge
execute store result block ~ ~ ~ Items[0].tag.gm4_transmutation_charge short 1 run scoreboard players get @s gm4_ee_charge
