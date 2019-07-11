# @s = book and quill to set lock item, at lock item
# run from prepare_lock_setting

data modify entity @e[type=item,tag=gm4_lock_primed,dx=0,limit=1] Item.tag.gm4_lock.combination set from entity @s Item.tag.pages[0]
data merge entity @e[type=item,tag=gm4_lock_primed,dx=0,limit=1] {Item:{tag:{CustomModelData:3,Enchantments:[{}],gm4_lock:{set:1b},display:{Name:'{"translate":"%1$s%3427655$s","with":["Lock",{"translate":"item.gm4.set_lock"}],"italic":false}'}}}}
