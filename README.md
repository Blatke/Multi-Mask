# Multi-Masks Shader
A Unity shader that supports for multiple masks controlling colors as well as bumps.

## How to Get It
1. Download the .shader file(s) for the latest version on the **[Release](https://github.com/Blatke/Multi-Masks.shader/releases)** Page, and drag and drop it into the project window of Unity.
2. Go to a material and see its attributes in the inspector window, in the Shader option, assign it to **Blake/Multi-Masks** to change its shader to this one. Or you can just drag and drop it to the material.
3. Put the material onto any object in the hierarchical window and see the effect in the scene view.
4. Please note that there are at least 3 texture images in the **[Texture](https://github.com/Blatke/Multi-Masks.shader/tree/main/Textures)** folder of this repository. Download them and put them respectively into the corresponding slots of the material onto which this shader is used. The diffuse textures were sourced from Honey Select 2 built-in shader (AIT/Skin True).

## Main Features
1. Color Masks

To adjust the colors of the parts of the albedo texture by importing RGB textures on which Red, Green, Blue, Cyan, Purple, Yellow and White parts can be recognized as the areas to affect the colors of the corresponding areas on the albedo texture that are covered by these parts. Two color masks are supported to blend or replace the colors of the albedo with the custom ones.

2. Normal Masks

To manipulate the display of the normal map by importing RGB textures on which Red, Green, Blue, Cyan, Purple, Yellow and White parts indicate which parts on the normal map shows or hides the bump effect, and to what extent the bump it shows. 

3. Wetness and Fluid

To simulate wetness and fluid on the surface of an object. The fluid can be manipulated by a designated mask. 

## How to Use It
I hereby wrote several tutorials on this shader with going through creating some materials for a certain objects:

**[Tutorials in English](https://github.com/Blatke/Multi-Masks.shader/blob/main/Tutorials/EN/0.%20List%20of%20Contents.md)**


> [!NOTE]
> Please note that due to the updates on this shader, some property names might have adjustments that make them different from what they appeared in the tutorials, but the main features will not be significantly changed. 
