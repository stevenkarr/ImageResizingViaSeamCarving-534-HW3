% Author: Steven Karr
% Class: CS 534
% Date: 10-9-15
% Purpose: Perform image resizing using seam carving. It achieves this by calculated the energy of the image, then the changes in energy, and uses that information to extract low energy (and therefore unimportant) "seams" from an image to resize it without changing the proportions of important sections of an image.


Explanation of images:

Experiment 2:
-karr.2a:
--Areas of brighter color show local areas of high color change, whereas darker colors show local areas of low color change. For example, the edges of the tables are marked because the image goes from an area of bright red (a table) to a kind of gray (the ground). But within areas of the table, we see dark blue (one spot to another on the table has relatively low change in color).
-Karr.2b
--The brightness shows the cumulative energy at that point, calculated left to right. We see it gradually get brighter as we move right, as the energies accumulate. But, some regions are brighter than others -- there are some seams which are made from going straight across the water, which have low cumulative energy and are darker in this image. Then there are seams that have lots of change across them (high energy values) and end up with a high cumulative energy (i.e. to the right of the tables), shown with brighter colors in the image.

Experiment 3:
-karr.3:
--The horizontal optimal seam was found running across the water, which makes the most sense. There are no distinct features of this area of the water, so it has a low cumulative energy value. By my explanation of karr.2b, we should expect the optimal seam to be here, as it corresponds to the lowest cumulative energy as seen in the color scaled image of cumulative energy.
--The vertical seam was found running along water, part of the road, and the grass between tiers of the terrace. This seam is easier to understand by what it does NOT contain: tables, boats, flags, people, etc. That is, it does not cover areas of high energy and corresponds to a seam of lowest cumulative energy.

Experiment 4:
-Karr.4b:
--Reduction from 317 pixels in width to 167 pixels (150 vertical seams removed). The seams must weave inbetween the geese in the flock to find vertical seams which is why I find this image interesting. Clearly one could not do this with a simple crop, as the vertical seams must be found between each goose. It works very well for this image seeing as I reduced its width by 50%, which is a huge change, yet the image remains in very good condition after the operation. Comparing it to a simple scale operation, the geese are not stretched and the clouds look normal. Thus, both crop and scale totally fail to reduce width by 50% nicely, whereas seam removal does it nicely for this image.
-Karr.5b:
--Reduction from 506x337 to 406x237 (100 horizontal and vertical seams removed). there are two major problems with seam removal and the content of this picture: (1) the low energy areas are important (the black of the roads), and (2) curves on diagonals must be perserved. Clearly, scaling a picture of a highway should not result in several lanes narrowing into one or roads that just suddenly drop off into nowhere.