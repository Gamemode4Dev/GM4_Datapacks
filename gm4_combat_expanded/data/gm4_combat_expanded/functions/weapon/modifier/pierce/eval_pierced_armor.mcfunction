# use macro's to set the negative armor value
# @s = entity that pierced is applied to
# at @s
# run from weapon/modifier/pierce/apply

$attribute @s generic.armor modifier add df679fe3-2d2a-429f-9dea-55a030b50964 "gm4_ce_pierced_armor" -$(pierced_armor) add_value
playsound minecraft:item.armor.unequip_wolf player @s ~ ~ ~ 1 0.6
