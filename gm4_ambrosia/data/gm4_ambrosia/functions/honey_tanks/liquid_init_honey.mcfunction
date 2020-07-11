data merge block ~ ~ ~ {CustomName:'{"translate":"%1$s","with":["Honey Tank","block.gm4.liquid_tank.honey"]}'}
summon armor_stand ~ ~-.45 ~ {CustomName:"\"gm4_liquid_tank_display\"",Tags:["gm4_no_edit","gm4_liquid_tank_display"],NoGravity:1,Marker:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039583,Fire:20000,ArmorItems:[{},{},{},{id:"player_head",Count:1b,tag:{SkullOwner: {Id: [I;-782351798,542655898,-1075183804,1293758076], Properties: {textures: [{Value: "eyJ0aW1lc3RhbXAiOjE1NjcxMjA2MDEzMDEsInByb2ZpbGVJZCI6ImQxNWU1MTVhMjA1ODQ1OWFiZmU5ZmY1NzlhMGQyZTdjIiwicHJvZmlsZU5hbWUiOiJCbHVlZmlyZTYxMCIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMTA3ODNjZTY1OTMxZjI3NDE0N2QyYmJkYmQ3MzQyZTFlZWUyNGZhNzY4ZThiZjMwYWJmOWQxZDMxNDA5YjVhYyJ9fX0="}]}}}}]}
scoreboard players set @s gm4_lt_max 300
tag @s add gm4_lt_honey
tag @s remove gm4_lt_empty
