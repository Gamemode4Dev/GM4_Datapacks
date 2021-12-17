# checks if the module is still reloading
# @s = player that triggered gm4_guide while holding a guidebook
# located at world spawn
# run from gm4_guidebook:tick

execute if score $reloading gm4_guide matches 1 run title @s actionbar {"translate": "%1$s%3427655$s","with": ["Guidebook Temporarily Disabled",{"translate": "tooltip.gm4.guidebook.disabled"}],"color":"red"}
execute unless score $reloading gm4_guide matches 1 run function gm4_guidebook:update_book/get_pages
