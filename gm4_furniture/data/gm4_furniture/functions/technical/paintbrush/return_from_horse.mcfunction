# return paintbrush from horse to player
# @s = horse equipped with paintbrush
# at @s
# run from technical/paintbrush/used_on_horse

item replace entity @p[tag=gm4_furniture_target] weapon.mainhand with air
item replace entity @p[tag=gm4_furniture_target] weapon.mainhand from entity @s horse.armor
item replace entity @s horse.armor with air
