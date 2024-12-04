# Plan for Future Updates
## More Color Areas Supported
To sample at least 26 instead of 7 colors for indicating areas on a mask texture, and adopt on the mask texture the alpha channel instead of inter-medium colors in gradient effect performing, such like it from over Red(1,0,0,0) to Red(1,0,0,1).

That makes it possible for reducing at least one normal mask.

![image](https://github.com/user-attachments/assets/0881d02c-b169-42a5-acdc-80dc27b26820)

With considering a default texture in a mask slot, the black color(0,0,0) is not taken to sample. 

The specific color sampling threshold will fluctuate within a range of 0.05 up and down.


## Multiple versions for masks
To develop different versions of which each has less masks than the orginal shader in order to save rendering resources and to be adopted by a specific demand.

The naming method could be taken in format as:

_Multi-Masks CxNxF version_

where C stands for the amount of color masks; N for normal masks; and F, fluid mask. Therefore the original shader could have a name like below:

_Multi-Masks 2x3x1 v1.4.0_

