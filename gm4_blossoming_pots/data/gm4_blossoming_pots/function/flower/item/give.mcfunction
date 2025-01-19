# puts items in players mainhand
# @s = player who right clicked on custom flower pot with an empty hand
# at temp marker align xyz positioned ~.5 ~.5 ~.5
# with {id, count}
# run from flower/item/give_back

$item replace entity @s weapon.mainhand with $(id) $(count)
