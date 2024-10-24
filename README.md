# Multi-Masks Shader
A Unity shader that supports for multiple color masks and normal masks.

## Features
1. Color Masks

To adjust the colors of the parts of the albedo texture by importing RGB textures on which Red, Green, Blue, Cyan, Purple, Yellow and White parts can be recognized as the areas to affect the colors of the corresponding areas on the albedo texture. Two color masks are supported to blend or replace the colors of the albedo with the custom ones.

2. Normal Masks

To manipulate the display of the normal map by importing RGB textures on which Red, Green, Blue, Cyan, Purple, Yellow and White parts indicate which parts on the normal map shows or hides the bump effect, and to what extent the bump it shows. 

## Properties in the Shader
### Main
#### Albedo
The main map that can be an RGBA image on which the alpha channel controls the cutout value.
#### Tint Color
The color that will globally blend with the Albedo as well as the color masks.
#### OMS
It demands for an RGB image to use Red, Green and Blue channels to respectively control the performance of Occlusion, Metallic and Smoothness.
#### Occlusion
#### Metallic
#### Smoothness
### Color Mask 1 (blend)
This section of color mask is to blend its adjusted colors with the tint color as well as the Albedo map.
#### Albedo Mask
An RGB texture on which Red(1,0,0), Green(0,1,0), Blue(0,0,1), Cyan(0,1,1), Purple(1,0,1), Yellow(1,1,0) and White(1,1,1) parts can be recognized as the areas to affect the colors of the corresponding areas on the Albedo and the tint color. 

The black(0,0,0) parts on the mask means not to affect the corresponding parts on the Albedo.

It leaves black by default if no texture is imported.
#### Mask Red
It indicates what color to blend with the parts on the Albedo which are covered by the red parts on the mask texture.
#### Mask Green
It indicates what color to blend with the parts on the Albedo which are covered by the green parts on the mask texture.
#### Mask Blue
It indicates what color to blend with the parts on the Albedo which are covered by the blue parts on the mask texture.
#### Mask Cyan
It indicates what color to blend with the parts on the Albedo which are covered by the cyan parts on the mask texture.
#### Mask Purple
It indicates what color to blend with the parts on the Albedo which are covered by the purple parts on the mask texture.
#### Mask Yellow
It indicates what color to blend with the parts on the Albedo which are covered by the yellow parts on the mask texture.
#### Mask White
It indicates what color to blend with the parts on the Albedo which are covered by the white parts on the mask texture.
