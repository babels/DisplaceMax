--- James Bailey
--- Fall 2020 MMST CoM
--- 3DSMax 2021, Max Script
--- Takes in a Directory path, for each image in that directory script will iterate through each object in scene (non recursively), copy the object, apply a displacement for the image, collapse the stack, then apply a uv.  Can be used to procedurally generate terrain

thePath = getSavepath(); pth = thePath + "\*.jpg"; imgz = #();  for f in getFiles pth do(join imgz #(f)); oj = #(); for obj in objects do(join oj #(obj)); for img in imgz do( print img; for o in oj do(print o.name; select o; maxOps.cloneNodes (selection as array) cloneType:#copy newNodes:&nnl #nodialog; select nnl; modPanel.addModToSelection (Displace ()) ui:on; c =  bitmap 2048 2048; c.filename = img; $.modifiers[#Displace].bitmap = c; $.modifiers[#Displace].strength = 20;macros.run "Modifier Stack" "Collapse_Stack";modPanel.addModToSelection (Unwrap_UVW ()) ui:on););
