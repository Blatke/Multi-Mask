# Plan for Future Updates
## Renaming the properties for HS2 ME
To rename the properties to make the shader options easy to be found and categorized on HS2 MaterialEditor tab. Each section of the properties should be have a prefix like A_, B_, C_, and D_, so the name of the Albedo could be _A1_Albedo, where "1" makes a more specific sequential order.
## Emission Map
To add properties of emission map and its strength into the Main Section. The emission map supports an RGB texture.
## Multiple versions for masks
To develop different versions of which each has less masks than the orginal shader in order to save rendering resources and to be adopted by a specific demand.

The naming method could be taken in format as:

_Multi-Masks CxNxF version_

where C stands for the amount of color masks; N for normal masks; and F, fluid mask. Therefore the original shader could have a name like below:

_Multi-Masks 2x3x1 v1.4.0_

