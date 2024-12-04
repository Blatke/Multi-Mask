# Plan for Future Updates
## More Color Areas Supported
To sample at least 16 instead of 7 colors for indicating areas on a mask texture, and adopt on the mask texture the alpha channel instead of inter-medium colors in gradient effect performing, such like it from over Red(1,0,0,0) to Red(1,0,0,1).

That makes it possible for reducing at least one normal mask.

![colors-name](https://github.com/user-attachments/assets/8b0330d6-5efa-4722-a1a5-eb5cdf838e7f)
(Source: https://color-hex.org/blog/color-wiki)


## Multiple versions for masks
To develop different versions of which each has less masks than the orginal shader in order to save rendering resources and to be adopted by a specific demand.

The naming method could be taken in format as:

_Multi-Masks CxNxF version_

where C stands for the amount of color masks; N for normal masks; and F, fluid mask. Therefore the original shader could have a name like below:

_Multi-Masks 2x3x1 v1.4.0_

