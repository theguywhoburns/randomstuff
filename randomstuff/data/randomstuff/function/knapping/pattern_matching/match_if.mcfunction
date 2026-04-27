# O(25) check

$execute \
if data storage randomstuff:knapping.patterns.tree $(v00).$(v01).$(v02).$(v03).$(v04).$(v10).$(v11).$(v12).$(v13).$(v14).$(v20).$(v21).$(v22).$(v23).$(v24).$(v30).$(v31).$(v32).$(v33).$(v34).$(v40).$(v41).$(v42).$(v43).$(v44).recipe \
run data modify storage randomstuff:knapping.grid.match result set from storage randomstuff:knapping.patterns.tree $(v00).$(v01).$(v02).$(v03).$(v04).$(v10).$(v11).$(v12).$(v13).$(v14).$(v20).$(v21).$(v22).$(v23).$(v24).$(v30).$(v31).$(v32).$(v33).$(v34).$(v40).$(v41).$(v42).$(v43).$(v44).result
     
execute if data storage randomstuff:knapping.grid.match result run function randomstuff:knapping/pattern_matching/on_match with storage randomstuff:knapping.grid.match
execute if data storage randomstuff:knapping.grid.match result run data remove storage randomstuff:knapping.grid.match result