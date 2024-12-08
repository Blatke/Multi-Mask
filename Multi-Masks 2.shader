// Originally created by Bl@ke, on October 15, 2024.

// If the colors shown by the masks have some weird borders between the areas of masks, set the textures and masks NOT to generate Mip Map and Not to use High Quality for Compression.

// Make sure that all the masks involved in the shader are in the format of .png instead of .jpg, for the latters are compressed images that might get the color control confusing and problematic.

//It tolerates the checking and unchecking of sRGB (Color Texture), which means gamma correction, in the setting of mask image.

Shader "Blake/Multi-Masks v2.0.0"
{
    Properties
    {
        [Header(Main)]
        _Albedo ("Albedo (RGBA)", 2D) = "white" {}
        _TintColor ("Tint Color", Color) = (1,1,1,0.5)
        _OMS ("OMS (RGB)", 2D) = "white" {}
        _Occlusion("Occlusion", Range(0,1)) = 1.0
        _Metallic ("Metallic", Range(0,1)) = 0.5
        _Glossiness ("Smoothness", Range(0,1)) = 0.5

        [Header(Normal Maps)]
        _NormalMap ("Normal Map", 2D) = "bump" {}
        _NormalStrength ("Normal Strength", Range(0, 10)) = 1.0
        _DetailNormalMap ("Detail Normal Map", 2D) = "bump" {}
        _DetailNormalStrength ("Detail Normal Strength", Range(0, 10)) = 1.0

        [Header(Fresnel)]
		_FresnelEmissionColor ("Fresnel Emission Color", Color) = (1,1,1,1)
		[PowerSlider(4)] _FresnelEmissionExp ("Fresnel Emission Exp", Range(0.01, 10)) = 1
		_FresnelEmissionStrength ("Fresnel Emission Strength", Range(0,5)) = 0
        [Toggle] _FresnelEmissionRevert ("Fresnel Emission Revert", Range(0,1)) = 0
        _FresnelAlbedoColor ("Fresnel Albedo Color", Color) = (1,1,1,1)
		[PowerSlider(4)] _FresnelAlbedoExp ("Fresnel Albedo Exp", Range(0.01, 10)) = 1
		_FresnelAlbedoStrength ("Fresnel Albedo Strength", Range(0,5)) = 0
		[Toggle] _FresnelAlbedoRevert ("Fresnel Albedo Revert", Range(0,1)) = 0

        [Header(Wetness)]
        _WetnessMap ("Wetness Map", 2D) = "black" {}
        _WetnessDensity ("Wetness Density", Range(0,100)) = 10
        _WetnessStrength ("Wetness Strength", Range(0,2)) = 0

        [Header(Fluid)]
        _FluidMap ("Fluid Map", 2D) = "white" {}
        _FluidNormal ("Fluid Normal", 2D) = "bump" {}
        _FluidColor ("Fluid Color", Color) = (1,1,1,0.1)
        _FluidDensity ("Fluid Density", Range(0,100)) = 0
        _FluidGlossiness ("Fluid Glossiness", Range(0,5)) = 1
        _FluidEmission ("Fluid Emission", Range(0,5)) = 0.2
        _FluidBump ("Fluid Bump",Range(0,5)) = 1.0
        _FluidRotation ("Fluid Rotation", Range(-180, 180)) = 0.0
        _FluidMask ("Fluid Mask (RGBA; white by def)", 2D) = "white" {}
        _Fluid_Red ("Mask Red Strength", Range(0,1)) = 1.0
        _Fluid_Red_Rotation ("Mask Red Rotation", Range(-180, 180)) = 0.0
        _Fluid_Lime ("Mask Lime Strength", Range(0,1)) = 1.0
        _Fluid_Lime_Rotation ("Mask Lime Rotation", Range(-180, 180)) = 0.0
        _Fluid_Blue ("Mask Blue Strength", Range(0,1)) = 1.0
        _Fluid_Blue_Rotation ("Mask Blue Rotation", Range(-180, 180)) = 0.0
        _Fluid_Cyan ("Mask Cyan Strength", Range(0,1)) = 1.0
        _Fluid_Cyan_Rotation ("Mask Cyan Rotation", Range(-180, 180)) = 0.0
        _Fluid_Yellow ("Mask Yellow Strength", Range(0,1)) = 1.0
        _Fluid_Yellow_Rotation ("Mask Yellow Rotation", Range(-180, 180)) = 0.0
        _Fluid_Fuchsia ("Mask Fuchsia Strength", Range(0,1)) = 1.0
        _Fluid_Fuchsia_Rotation ("Mask Fuchsia Rotation", Range(-180, 180)) = 0.0
        _Fluid_White ("Mask White Strength", Range(0,1)) = 1.0
        _Fluid_White_Rotation ("Mask White Rotation", Range(-180, 180)) = 0.0
            _Fluid_Navy ("Mask Navy Strength", Range(0,1)) = 1.0
            _Fluid_Navy_Rotation ("Mask Navy Rotation", Range(-180, 180)) = 0.0
            _Fluid_Teal ("Mask Teal Strength", Range(0,1)) = 1.0
            _Fluid_Teal_Rotation ("Mask Teal Rotation", Range(-180, 180)) = 0.0
            _Fluid_Azure ("Mask Azure Strength", Range(0,1)) = 1.0
            _Fluid_Azure_Rotation ("Mask Azure Rotation", Range(-180, 180)) = 0.0
            _Fluid_Green ("Mask Green Strength", Range(0,1)) = 1.0
            _Fluid_Green_Rotation ("Mask Green Rotation", Range(-180, 180)) = 0.0
            _Fluid_SpringBud ("Mask SpringBud Strength", Range(0,1)) = 1.0
            _Fluid_SpringBud_Rotation ("Mask SpringBud Rotation", Range(-180, 180)) = 0.0
            _Fluid_Maroon ("Mask Maroon Strength", Range(0,1)) = 1.0
            _Fluid_Maroon_Rotation ("Mask Maroon Rotation", Range(-180, 180)) = 0.0
            _Fluid_Purple ("Mask Purple Strength", Range(0,1)) = 1.0
            _Fluid_Purple_Rotation ("Mask Purple Rotation", Range(-180, 180)) = 0.0
            _Fluid_Violet ("Mask Violet Strength", Range(0,1)) = 1.0
            _Fluid_Violet_Rotation ("Mask Violet Rotation", Range(-180, 180)) = 0.0
            _Fluid_Olive ("Mask Olive Strength", Range(0,1)) = 1.0
            _Fluid_Olive_Rotation ("Mask Olive Rotation", Range(-180, 180)) = 0.0
            _Fluid_Gray ("Mask Gray Strength", Range(0,1)) = 1.0
            _Fluid_Gray_Rotation ("Mask Gray Rotation", Range(-180, 180)) = 0.0
            _Fluid_Malibu ("Mask Malibu Strength", Range(0,1)) = 1.0
            _Fluid_Malibu_Rotation ("Mask Malibu Rotation", Range(-180, 180)) = 0.0
            _Fluid_Chartreuse ("Mask Chartreuse Strength", Range(0,1)) = 1.0
            _Fluid_Chartreuse_Rotation ("Mask Chartreuse Rotation", Range(-180, 180)) = 0.0
            _Fluid_UltraGreen ("Mask UltraGreen Strength", Range(0,1)) = 1.0
            _Fluid_UltraGreen_Rotation ("Mask UltraGreen Rotation", Range(-180, 180)) = 0.0
            _Fluid_ElectricBlue ("Mask ElectricBlue Strength", Range(0,1)) = 1.0
            _Fluid_ElectricBlue_Rotation ("Mask ElectricBlue Rotation", Range(-180, 180)) = 0.0
            _Fluid_Rose ("Mask Rose Strength", Range(0,1)) = 1.0
            _Fluid_Rose_Rotation ("Mask Rose Rotation", Range(-180, 180)) = 0.0
            _Fluid_SafetyOrange ("Mask SafetyOrange Strength", Range(0,1)) = 1.0
            _Fluid_SafetyOrange_Rotation ("Mask SafetyOrange Rotation", Range(-180, 180)) = 0.0
            _Fluid_LightCoral ("Mask LightCoral Strength", Range(0,1)) = 1.0
            _Fluid_LightCoral_Rotation ("Mask LightCoral Rotation", Range(-180, 180)) = 0.0
            _Fluid_LightFuchsia ("Mask LightFuchsia Strength", Range(0,1)) = 1.0
            _Fluid_LightFuchsia_Rotation ("Mask LightFuchsia Rotation", Range(-180, 180)) = 0.0
            _Fluid_LaserLemon ("Mask LaserLemon Strength", Range(0,1)) = 1.0
            _Fluid_LaserLemon_Rotation ("Mask LaserLemon Rotation", Range(-180, 180)) = 0.0

        [Header(Color Mask 1 (blend))]
        _AlbedoMask1 ("Albedo Mask (RGBA)", 2D) = "black" {}
        _Mask1_Red ("Mask Red", Color) = (1,0,0,1)
        _Mask1_Lime ("Mask Lime", Color) = (0,1,0,1)
        _Mask1_Blue ("Mask Blue", Color) = (0,0,1,1)
        _Mask1_Cyan ("Mask Cyan", Color) = (0,1,1,1)
        _Mask1_Fuchsia ("Mask Fuchsia", Color) = (1,0,1,1)
        _Mask1_Yellow ("Mask Yellow", Color) = (1,1,0,1)
        _Mask1_White ("Mask White", Color) = (1,1,1,1)
            _Mask1_Navy ("Mask Navy", Color) = (0,0,0.5)
            _Mask1_Teal ("Mask Teal", Color) = (0,0.5,0.5)
            _Mask1_Azure ("Mask Azure", Color) = (0,0.5,1)
            _Mask1_Green ("Mask Green", Color) = (0,0.5,0)
            _Mask1_SpringBud ("Mask SpringBud", Color) = (0,1,0.5)
            _Mask1_Maroon ("Mask Maroon", Color) = (0.5,0,0)
            _Mask1_Purple ("Mask Purple", Color) = (0.5,0,0.5)
            _Mask1_Violet ("Mask Violet", Color) = (0.5,0,1)
            _Mask1_Olive ("Mask Olive", Color) = (0.5,0.5,0)
            _Mask1_Gray ("Mask Gray", Color) = (0.5,0.5,0.5)
            _Mask1_Malibu ("Mask Malibu", Color) = (0.5,0.5,1)
            _Mask1_Chartreuse ("Mask Chartreuse", Color) = (0.5,1,0)
            _Mask1_UltraGreen ("Mask UltraGreen", Color) = (0.5,1,0.5)
            _Mask1_ElectricBlue ("Mask ElectricBlue", Color) = (0.5,1,1)
            _Mask1_Rose ("Mask Rose", Color) = (1,0,0.5)
            _Mask1_SafetyOrange ("Mask SafetyOrange", Color) = (1,0.5,0)
            _Mask1_LightCoral ("Mask LightCoral", Color) = (1,0.5,0.5)
            _Mask1_LightFuchsia ("Mask LightFuchsia", Color) = (1,0.5,1)
            _Mask1_LaserLemon ("Mask LaserLemon", Color) = (1,1,0.5)

        [Header(Color Mask 2 (replace))]
        _AlbedoMask2 ("Albedo Mask (RGBA)", 2D) = "black" {}
        _Mask2_Red ("Mask Red", Color) = (1,0,0,1)
        _Mask2_Red_Emission ("Red Emission", Range(0,3)) = 0
        _Mask2_Lime ("Mask Lime", Color) = (0,1,0,1)
        _Mask2_Lime_Emission ("Lime Emission", Range(0,3)) = 0
        _Mask2_Blue ("Mask Blue", Color) = (0,0,1,1)
        _Mask2_Blue_Emission ("Blue Emission", Range(0,3)) = 0
        _Mask2_Cyan ("Mask Cyan", Color) = (0,1,1,1)
        _Mask2_Cyan_Emission ("Cyan Emission", Range(0,3)) = 0
        _Mask2_Fuchsia ("Mask Fuchsia", Color) = (1,0,1,1)
        _Mask2_Fuchsia_Emission ("Fuchsia Emission", Range(0,3)) = 0
        _Mask2_Yellow ("Mask Yellow", Color) = (1,1,0,1)
        _Mask2_Yellow_Emission ("Yellow Emission", Range(0,3)) = 0
        _Mask2_White ("Mask White", Color) = (1,1,1,1)
        _Mask2_White_Emission ("White Emission", Range(0,3)) = 0
            _Mask2_Navy ("Mask Navy", Color) = (0,0,0.5)
            _Mask2_Navy_Emission ("Navy Emission", Range(0,3)) = 0
            _Mask2_Teal ("Mask Teal", Color) = (0,0.5,0.5)
            _Mask2_Teal_Emission ("Teal Emission", Range(0,3)) = 0
            _Mask2_Azure ("Mask Azure", Color) = (0,0.5,1)
            _Mask2_Azure_Emission ("Azure Emission", Range(0,3)) = 0
            _Mask2_Green ("Mask Green", Color) = (0,0.5,0)
            _Mask2_Green_Emission ("Green Emission", Range(0,3)) = 0
            _Mask2_SpringBud ("Mask SpringBud", Color) = (0,1,0.5)
            _Mask2_SpringBud_Emission ("SpringBud Emission", Range(0,3)) = 0
            _Mask2_Maroon ("Mask Maroon", Color) = (0.5,0,0)
            _Mask2_Maroon_Emission ("Maroon Emission", Range(0,3)) = 0
            _Mask2_Purple ("Mask Purple", Color) = (0.5,0,0.5)
            _Mask2_Purple_Emission ("Purple Emission", Range(0,3)) = 0
            _Mask2_Violet ("Mask Violet", Color) = (0.5,0,1)
            _Mask2_Violet_Emission ("Violet Emission", Range(0,3)) = 0
            _Mask2_Olive ("Mask Olive", Color) = (0.5,0.5,0)
            _Mask2_Olive_Emission ("Olive Emission", Range(0,3)) = 0
            _Mask2_Gray ("Mask Gray", Color) = (0.5,0.5,0.5)
            _Mask2_Gray_Emission ("Gray Emission", Range(0,3)) = 0
            _Mask2_Malibu ("Mask Malibu", Color) = (0.5,0.5,1)
            _Mask2_Malibu_Emission ("Malibu Emission", Range(0,3)) = 0
            _Mask2_Chartreuse ("Mask Chartreuse", Color) = (0.5,1,0)
            _Mask2_Chartreuse_Emission ("Chartreuse Emission", Range(0,3)) = 0
            _Mask2_UltraGreen ("Mask UltraGreen", Color) = (0.5,1,0.5)
            _Mask2_UltraGreen_Emission ("UltraGreen Emission", Range(0,3)) = 0
            _Mask2_ElectricBlue ("Mask ElectricBlue", Color) = (0.5,1,1)
            _Mask2_ElectricBlue_Emission ("ElectricBlue Emission", Range(0,3)) = 0
            _Mask2_Rose ("Mask Rose", Color) = (1,0,0.5)
            _Mask2_Rose_Emission ("Rose Emission", Range(0,3)) = 0
            _Mask2_SafetyOrange ("Mask SafetyOrange", Color) = (1,0.5,0)
            _Mask2_SafetyOrange_Emission ("SafetyOrange Emission", Range(0,3)) = 0
            _Mask2_LightCoral ("Mask LightCoral", Color) = (1,0.5,0.5)
            _Mask2_LightCoral_Emission ("LightCoral Emission", Range(0,3)) = 0
            _Mask2_LightFuchsia ("Mask LightFuchsia", Color) = (1,0.5,1)
            _Mask2_LightFuchsia_Emission ("LightFuchsia Emission", Range(0,3)) = 0
            _Mask2_LaserLemon ("Mask LaserLemon", Color) = (1,1,0.5)
            _Mask2_LaserLemon_Emission ("LaserLemon Emission", Range(0,3)) = 0
        [Toggle] _Mask2_ReplaceTintColor ("Replace Tint Color", Range(0,1)) = 1.0

        [Header(Normal Mask 1 (white by def))]
        _NormalMask1 ("Normal Map Mask (RGBA)", 2D) = "white" {}
        _NormalMask1_Red ("Mask Red Strength", Range(0, 1)) = 1.0
        _NormalMask1_Lime ("Mask Lime Strength", Range(0, 1)) = 1.0
        _NormalMask1_Blue ("Mask Blue Strength", Range(0, 1)) = 1.0
        _NormalMask1_Cyan ("Mask Cyan Strength", Range(0, 1)) = 1.0
        _NormalMask1_Fuchsia ("Mask Fuchsia Strength", Range(0, 1)) = 1.0
        _NormalMask1_Yellow ("Mask Yellow Strength", Range(0, 1)) = 1.0
        _NormalMask1_White ("Mask White Strength", Range(0, 1)) = 1.0
            _NormalMask1_Navy ("Mask Navy Strength", Range(0, 1)) = 1.0
            _NormalMask1_Teal ("Mask Teal Strength", Range(0, 1)) = 1.0
            _NormalMask1_Azure ("Mask Azure Strength", Range(0, 1)) = 1.0
            _NormalMask1_Green ("Mask Green Strength", Range(0, 1)) = 1.0
            _NormalMask1_SpringBud ("Mask SpringBud Strength", Range(0, 1)) = 1.0
            _NormalMask1_Maroon ("Mask Maroon Strength", Range(0, 1)) = 1.0
            _NormalMask1_Purple ("Mask Purple Strength", Range(0, 1)) = 1.0
            _NormalMask1_Violet ("Mask Violet Strength", Range(0, 1)) = 1.0
            _NormalMask1_Olive ("Mask Olive Strength", Range(0, 1)) = 1.0
            _NormalMask1_Gray ("Mask Gray Strength", Range(0, 1)) = 1.0
            _NormalMask1_Malibu ("Mask Malibu Strength", Range(0, 1)) = 1.0
            _NormalMask1_Chartreuse ("Mask Chartreuse Strength", Range(0, 1)) = 1.0
            _NormalMask1_UltraGreen ("Mask UltraGreen Strength", Range(0, 1)) = 1.0
            _NormalMask1_ElectricBlue ("Mask ElectricBlue Strength", Range(0, 1)) = 1.0
            _NormalMask1_Rose ("Mask Rose Strength", Range(0, 1)) = 1.0
            _NormalMask1_SafetyOrange ("Mask SafetyOrange Strength", Range(0, 1)) = 1.0
            _NormalMask1_LightCoral ("Mask LightCoral Strength", Range(0, 1)) = 1.0
            _NormalMask1_LightFuchsia ("Mask LightFuchsia Strength", Range(0, 1)) = 1.0
            _NormalMask1_LaserLemon ("Mask LaserLemon Strength", Range(0, 1)) = 1.0

        [Header(Normal Mask 2)]
        _NormalMask2 ("Normal Map Mask (RGBA)", 2D) = "black" {}
        _NormalMask2_Red ("Mask Red Strength", Range(0, 1)) = 1.0
        _NormalMask2_Lime ("Mask Lime Strength", Range(0, 1)) = 1.0
        _NormalMask2_Blue ("Mask Blue Strength", Range(0, 1)) = 1.0
        _NormalMask2_Cyan ("Mask Cyan Strength", Range(0, 1)) = 1.0
        _NormalMask2_Fuchsia ("Mask Fuchsia Strength", Range(0, 1)) = 1.0
        _NormalMask2_Yellow ("Mask Yellow Strength", Range(0, 1)) = 1.0
        _NormalMask2_White ("Mask White Strength", Range(0, 1)) = 1.0
            _NormalMask2_Navy ("Mask Navy Strength", Range(0, 1)) = 1.0
            _NormalMask2_Teal ("Mask Teal Strength", Range(0, 1)) = 1.0
            _NormalMask2_Azure ("Mask Azure Strength", Range(0, 1)) = 1.0
            _NormalMask2_Green ("Mask Green Strength", Range(0, 1)) = 1.0
            _NormalMask2_SpringBud ("Mask SpringBud Strength", Range(0, 1)) = 1.0
            _NormalMask2_Maroon ("Mask Maroon Strength", Range(0, 1)) = 1.0
            _NormalMask2_Purple ("Mask Purple Strength", Range(0, 1)) = 1.0
            _NormalMask2_Violet ("Mask Violet Strength", Range(0, 1)) = 1.0
            _NormalMask2_Olive ("Mask Olive Strength", Range(0, 1)) = 1.0
            _NormalMask2_Gray ("Mask Gray Strength", Range(0, 1)) = 1.0
            _NormalMask2_Malibu ("Mask Malibu Strength", Range(0, 1)) = 1.0
            _NormalMask2_Chartreuse ("Mask Chartreuse Strength", Range(0, 1)) = 1.0
            _NormalMask2_UltraGreen ("Mask UltraGreen Strength", Range(0, 1)) = 1.0
            _NormalMask2_ElectricBlue ("Mask ElectricBlue Strength", Range(0, 1)) = 1.0
            _NormalMask2_Rose ("Mask Rose Strength", Range(0, 1)) = 1.0
            _NormalMask2_SafetyOrange ("Mask SafetyOrange Strength", Range(0, 1)) = 1.0
            _NormalMask2_LightCoral ("Mask LightCoral Strength", Range(0, 1)) = 1.0
            _NormalMask2_LightFuchsia ("Mask LightFuchsia Strength", Range(0, 1)) = 1.0
            _NormalMask2_LaserLemon ("Mask LaserLemon Strength", Range(0, 1)) = 1.0
    }
    SubShader
    {
        Tags { "RenderType"="OpaqueCutout" "Queue"="AlphaTest+1"}
        LOD 200
        // ZTest Always
        ZWrite On
        Cull Off

        CGPROGRAM
        #pragma surface surf Standard addshadow
        #pragma target 3.5

        sampler2D _Albedo;
        sampler2D _AlbedoMask1;
        sampler2D _AlbedoMask2;
        sampler2D _NormalMap;
        sampler2D _NormalMask1;
        sampler2D _NormalMask2;
        sampler2D _DetailNormalMap;
        sampler2D _OMS;
        sampler2D _FluidMap;
        sampler2D _FluidNormal;
        sampler2D _FluidMask;
        sampler2D _WetnessMap;

        half _Occlusion;
        half _Glossiness;
        half _Metallic;
        half4 _TintColor;

        half4 _FresnelEmissionColor;
		half _FresnelEmissionExp;
		half _FresnelEmissionStrength;
        fixed _FresnelEmissionRevert;
        half4 _FresnelAlbedoColor;
		half _FresnelAlbedoExp;
		half _FresnelAlbedoStrength;
		fixed _FresnelAlbedoRevert;

        half4 _Mask1_Blue;
        half4 _Mask1_Cyan;
        half4 _Mask1_Green;
        half4 _Mask1_Fuchsia;
        half4 _Mask1_Red;
        half4 _Mask1_Yellow;
        half4 _Mask1_White;
            half4 _Mask1_Navy;
            half4 _Mask1_Teal;
            half4 _Mask1_Azure;
            half4 _Mask1_Lime;
            half4 _Mask1_SpringBud;
            half4 _Mask1_Maroon;
            half4 _Mask1_Purple;
            half4 _Mask1_Violet;
            half4 _Mask1_Olive;
            half4 _Mask1_Gray;
            half4 _Mask1_Malibu;
            half4 _Mask1_Chartreuse;
            half4 _Mask1_UltraGreen;
            half4 _Mask1_ElectricBlue;
            half4 _Mask1_Rose;
            half4 _Mask1_SafetyOrange;
            half4 _Mask1_LightCoral;
            half4 _Mask1_LightFuchsia;
            half4 _Mask1_LaserLemon;

        half4 _Mask2_Blue;
        half4 _Mask2_Cyan;
        half4 _Mask2_Green;
        half4 _Mask2_Fuchsia;
        half4 _Mask2_Red;
        half4 _Mask2_Yellow;
        half4 _Mask2_White;
        half4 _Mask2_Navy;
            half4 _Mask2_Teal;
            half4 _Mask2_Azure;
            half4 _Mask2_Lime;
            half4 _Mask2_SpringBud;
            half4 _Mask2_Maroon;
            half4 _Mask2_Purple;
            half4 _Mask2_Violet;
            half4 _Mask2_Olive;
            half4 _Mask2_Gray;
            half4 _Mask2_Malibu;
            half4 _Mask2_Chartreuse;
            half4 _Mask2_UltraGreen;
            half4 _Mask2_ElectricBlue;
            half4 _Mask2_Rose;
            half4 _Mask2_SafetyOrange;
            half4 _Mask2_LightCoral;
            half4 _Mask2_LightFuchsia;
            half4 _Mask2_LaserLemon;
        half _Mask2_ReplaceTintColor;

        half _Mask2_Blue_Emission;
        half _Mask2_Cyan_Emission;
        half _Mask2_Green_Emission;
        half _Mask2_Fuchsia_Emission;
        half _Mask2_Red_Emission;
        half _Mask2_Yellow_Emission;
        half _Mask2_White_Emission;
        half _Mask2_Navy_Emission;
            half _Mask2_Teal_Emission;
            half _Mask2_Azure_Emission;
            half _Mask2_Lime_Emission;
            half _Mask2_SpringBud_Emission;
            half _Mask2_Maroon_Emission;
            half _Mask2_Purple_Emission;
            half _Mask2_Violet_Emission;
            half _Mask2_Olive_Emission;
            half _Mask2_Gray_Emission;
            half _Mask2_Malibu_Emission;
            half _Mask2_Chartreuse_Emission;
            half _Mask2_UltraGreen_Emission;
            half _Mask2_ElectricBlue_Emission;
            half _Mask2_Rose_Emission;
            half _Mask2_SafetyOrange_Emission;
            half _Mask2_LightCoral_Emission;
            half _Mask2_LightFuchsia_Emission;
            half _Mask2_LaserLemon_Emission;

        half _NormalStrength;
        half _DetailNormalStrength;

        half _NormalMask1_Red, _NormalMask1_Green, _NormalMask1_Blue;
        half _NormalMask1_Cyan, _NormalMask1_Fuchsia, _NormalMask1_Yellow, _NormalMask1_White;
            half _NormalMask1_Navy, _NormalMask1_Teal, _NormalMask1_Azure, _NormalMask1_Lime, _NormalMask1_SpringBud, _NormalMask1_Maroon, _NormalMask1_Purple, _NormalMask1_Violet, _NormalMask1_Olive, _NormalMask1_Gray, _NormalMask1_Malibu, _NormalMask1_Chartreuse, _NormalMask1_UltraGreen, _NormalMask1_ElectricBlue, _NormalMask1_Rose, _NormalMask1_SafetyOrange, _NormalMask1_LightCoral, _NormalMask1_LightFuchsia, _NormalMask1_LaserLemon;

        half _NormalMask2_Red, _NormalMask2_Green, _NormalMask2_Blue;
        half _NormalMask2_Cyan, _NormalMask2_Fuchsia, _NormalMask2_Yellow, _NormalMask2_White;
            half _NormalMask2_Navy, _NormalMask2_Teal, _NormalMask2_Azure, _NormalMask2_Lime, _NormalMask2_SpringBud, _NormalMask2_Maroon, _NormalMask2_Purple, _NormalMask2_Violet, _NormalMask2_Olive, _NormalMask2_Gray, _NormalMask2_Malibu, _NormalMask2_Chartreuse, _NormalMask2_UltraGreen, _NormalMask2_ElectricBlue, _NormalMask2_Rose, _NormalMask2_SafetyOrange, _NormalMask2_LightCoral, _NormalMask2_LightFuchsia, _NormalMask2_LaserLemon;

        half _FluidGlossiness;
        half _FluidEmission;
        half4 _FluidColor;
        half _FluidRotation;
        half _FluidDensity;
        half _FluidBump;
        half _Fluid_Red;
        half _Fluid_Green;
        half _Fluid_Blue;
        half _Fluid_Cyan;
        half _Fluid_Yellow;
        half _Fluid_Fuchsia;
        half _Fluid_White;
        half _Fluid_Navy;
            half _Fluid_Teal;
            half _Fluid_Azure;
            half _Fluid_Lime;
            half _Fluid_SpringBud;
            half _Fluid_Maroon;
            half _Fluid_Purple;
            half _Fluid_Violet;
            half _Fluid_Olive;
            half _Fluid_Gray;
            half _Fluid_Malibu;
            half _Fluid_Chartreuse;
            half _Fluid_UltraGreen;
            half _Fluid_ElectricBlue;
            half _Fluid_Rose;
            half _Fluid_SafetyOrange;
            half _Fluid_LightCoral;
            half _Fluid_LightFuchsia;
            half _Fluid_LaserLemon;
        half _Fluid_Red_Rotation;
        half _Fluid_Green_Rotation;
        half _Fluid_Blue_Rotation;
        half _Fluid_Cyan_Rotation;
        half _Fluid_Yellow_Rotation;
        half _Fluid_Fuchsia_Rotation;
        half _Fluid_White_Rotation;
        half _Fluid_Navy_Rotation;
            half _Fluid_Teal_Rotation;
            half _Fluid_Azure_Rotation;
            half _Fluid_Lime_Rotation;
            half _Fluid_SpringBud_Rotation;
            half _Fluid_Maroon_Rotation;
            half _Fluid_Purple_Rotation;
            half _Fluid_Violet_Rotation;
            half _Fluid_Olive_Rotation;
            half _Fluid_Gray_Rotation;
            half _Fluid_Malibu_Rotation;
            half _Fluid_Chartreuse_Rotation;
            half _Fluid_UltraGreen_Rotation;
            half _Fluid_ElectricBlue_Rotation;
            half _Fluid_Rose_Rotation;
            half _Fluid_SafetyOrange_Rotation;
            half _Fluid_LightCoral_Rotation;
            half _Fluid_LightFuchsia_Rotation;
            half _Fluid_LaserLemon_Rotation;

        half _WetnessStrength;
        half _WetnessDensity;

        struct Input
        {
            half2 uv_Albedo;
            half2 uv_AlbedoMask1;
            half2 uv_AlbedoMask2;
            half2 uv_NormalMap;
            half2 uv_DetailNormalMap;
            half2 uv_OMS;
            half2 uv_NormalMask1;
            half2 uv_NormalMask2;
            half2 uv_FluidMap;
            half2 uv_FluidMask;
            half2 uv_WetnessMap;
            half3 worldNormal;
			half3 viewDir;
			INTERNAL_DATA
        };

        half2 uvRotation(half rotation, half2 uv){
            if (rotation != 0){
                half radians = rotation * UNITY_PI / 180.0;
                return half2(cos(radians) * uv.x - sin(radians) * uv.y, sin(radians) * uv.x + cos(radians) * uv.y);
            }else{
                return uv;
            }
        }

        half4 rgbLighter(half4 c){
            c.rgb = lerp(c.rgb, 1, 1-c.a);
            return c;
        }

        half3 rgbColor(
            half3 c1 = half3(0,0,0),
            half3 c2 = half3(0,0,0),
            half4 v = half4(1,1,1,1),
            int t = 0)
        {
            half3 re = half3(1,1,1);
            half r = v.r, g = v.g, b = v.b, a = v.a;

            if (
                (r>0.95 && g<0.05 && b<0.05 && a > 0 && (t==1 || t==101 || t==201 || t==501 || t==1001 || t==1101)) || //Red
                (r>0.95 && g<0.05 && b>0.95 && a > 0 && (t==2 || t==102 || t==202 || t==502 || t==502 || t==1002 || t==1102)) || //Fuchsia
                (r<0.05 && g<0.05 && b>0.95 && a > 0 && (t==3 || t==103 || t==203 || t==503 || t==1003 || t==1103)) || //Blue
                (r<0.05 && g>0.95 && b>0.95 && a > 0 && (t==4 || t==104 || t==204 || t==504 || t==1004 || t==1104)) || //Cyan
                (r<0.05 && ((g>0.45 && g<0.55)||(g>0.16 && g<0.26)) && b<0.05 && a > 0 && (t==5 || t==105 || t==205 || t==505 || t==1005 || t==1105)) || //Green
                (r>0.95 && g>0.95 && b<0.05 && a > 0 && (t==6 || t==106 || t==206 || t==506 || t==1006 || t==1106)) || //Yellow
                (r>0.95 && g>0.95 && b>0.95 && a > 0 && (t==7 || t==107 || t==207 || t==507 || t==1007 || t==1107)) || //White
                (r<0.05 && g<0.05 && ((b>0.45 && b<0.55)||(b>0.16 && b<0.26)) && a > 0 && (t==8 || t==108 || t==208 || t==508 || t==1008 || t==1108)) || //Navy
                (r<0.05 && ((g>0.45 && g<0.55)||(g>0.16 && g<0.26)) && ((b>0.45 && b<0.55)||(b>0.16 && b<0.26)) && a > 0 && (t==9 || t==109 || t==209 || t==509 || t==1009 || t==1109)) || //Teal
                (r<0.05 && ((g>0.45 && g<0.55)||(g>0.16 && g<0.26)) && b>0.95 && a > 0 && (t==10 || t==110 || t==210 || t==510 || t==1010 || t==1110)) || //Azure
                (r<0.05 && g>0.95 && b<0.05 && a > 0 && (t==11 || t==111 || t==211 || t==511 || t==1011 || t==1111)) || //Lime
                (r<0.05 && g>0.95 && ((b>0.45 && b<0.55)||(b>0.16 && b<0.26)) && a > 0 && (t==12 || t==112 || t==212 || t==512 || t==1012 || t==1112)) || //SpringBud
                (((r>0.45 && r<0.55)||(r>0.16 && r<0.26)) && g<0.05 && b<0.05 && a > 0 && (t==13 || t==113 || t==213 || t==513 || t==1013 || t==1113)) || //Maroon
                (((r>0.45 && r<0.55)||(r>0.16 && r<0.26)) && g<0.05 && ((b>0.45 && b<0.55)||(b>0.16 && b<0.26)) && a > 0 && (t==14 || t==114 || t==214 || t==514 || t==1014 || t==1114)) || //Purple
                (((r>0.45 && r<0.55)||(r>0.16 && r<0.26)) && g<0.05 && b>0.95 && a > 0 && (t==15 || t==115 || t==215 || t==515 || t==1015 || t==1115)) || //Violet
                (((r>0.45 && r<0.55)||(r>0.16 && r<0.26)) && ((g>0.45 && g<0.55)||(g>0.16 && g<0.26)) && b<0.05 && a > 0 && (t==16 || t==116 || t==216 || t==516 || t==1016 || t==1116)) || //Olive
                (((r>0.45 && r<0.55)||(r>0.16 && r<0.26)) && ((g>0.45 && g<0.55)||(g>0.16 && g<0.26)) && ((b>0.45 && b<0.55)||(b>0.16 && b<0.26)) && a > 0 && (t==17 || t==117 || t==217 || t==517 || t==1017 || t==1117)) || //Gray
                (((r>0.45 && r<0.55)||(r>0.16 && r<0.26)) && ((g>0.45 && g<0.55)||(g>0.16 && g<0.26)) && b>0.95 && a > 0 && (t==18 || t==118 || t==218 || t==518 || t==1018 || t==1118)) || //Malibu
                (((r>0.45 && r<0.55)||(r>0.16 && r<0.26)) && g>0.95 && b<0.05 && a > 0 && (t==19 || t==119 || t==219 || t==519 || t==1019 || t==1119)) || //Chartreuse
                (((r>0.45 && r<0.55)||(r>0.16 && r<0.26)) && g>0.95 && ((b>0.45 && b<0.55)||(b>0.16 && b<0.26)) && a > 0 && (t==20 || t==120 || t==220 || t==520 || t==1020 || t==1120)) || //UltraGreen
                (((r>0.45 && r<0.55)||(r>0.16 && r<0.26)) && g>0.95 && b>0.95 && a > 0 && (t==21 || t==121 || t==221 || t==521 || t==1021 || t==1121)) || //ElectricBlue
                (r>0.95 && g<0.05 && ((b>0.45 && b<0.55)||(b>0.16 && b<0.26)) && a > 0 && (t==22 || t==122 || t==222 || t==522 || t==1022 || t==1122)) || //Rose
                (r>0.95 && ((g>0.45 && g<0.55)||(g>0.16 && g<0.26)) && b<0.05 && a > 0 && (t==23 || t==123 || t==223 || t==523 || t==1023 || t==1123)) || //SafetyOrange
                (r>0.95 && ((g>0.45 && g<0.55)||(g>0.16 && g<0.26)) && ((b>0.45 && b<0.55)||(b>0.16 && b<0.26)) && a > 0 && (t==24 || t==124 || t==224 || t==524 || t==1024 || t==1124)) || //LightCoral
                (r>0.95 && ((g>0.45 && g<0.55)||(g>0.16 && g<0.26)) && b>0.95 && a > 0 && (t==25 || t==125 || t==225 || t==525 || t==1025 || t==1125)) || //LightFuchsia
                (r>0.95 && g>0.95 && ((b>0.45 && b<0.55)||(b>0.16 && b<0.26)) && a > 0 && (t==26 || t==126 || t==226 || t==526 || t==1026 || t==1126)) //LaserLemon
            ){
                if (t <= 100 || (t > 200 && t <= 300)){ // Colormask - blend & replace.
                    re = lerp(c1, c2, a);
                }else if(t > 100 && t <= 200){  // Normal mask 1 & 2.
                    // re = rgbMax(v) * c2.r;
                    re = a * c2.r;
                }else if(t > 500 && t <= 600){  // Colormask - replace - emission.
                    if (c2.r > 0){
                        re = c1 * c2.r * a;
                    }else{
                        re = half3(0,0,0);
                    }
                }else if(t > 1000 && t <= 1100){  // Fluid mask - rotation.
                    re = half3(uvRotation(c1.r, c2.rg), 1);
                }else if(t > 1100 && t <= 1200){    // Fluid mask - strength of display.
                    re = a * c2.r;
                }
            }else{
                if (t <= 100){
                    re = half3(1,1,1);
                }else if((t > 100 && t <= 200) || (t > 500 && t <= 600)){
                    re = half3(0,0,0);
                }else if(t > 200 && t <= 300){
                    re = c1.rgb;
                }else if(t > 1000 && t <= 1100){
                    re = c2.rgb;
                }else if(t > 1100 && t <= 1200){
                    re = half3(0,0,0);
                }
            }
            return re;
        }

        half maxIn13(half a1, half a2, half a3, half a4, half a5, half a6, half a7, half a8, half a9, half a10, half a11, half a12, half a13){
            half b1 = max(a1, max(a2, max(a3, max(a4, max(a5, max(a6, a7))))));
            half b2 = max(a8, max(a9, max(a10, max(a11, max(a12, a13)))));
            return max(b1, b2);
        }

        half4 affectToggle(half t, half4 t1, half4 t0){
            if (t == 1){
                return t1;
            }else{
                return t1 * t0;
            }
        }

        half3 normalBlender(half2 n1, half2 n2){
            return normalize(half3(n1.xy + n2.xy, 1));
        }        

        half4 fresnelResult(half3 o, half3 viewDir, half4 color, half exp, half strength, fixed isRevert, int def){
			if (strength > 0){
                half fresnel = pow(saturate(1 - dot(o, normalize(viewDir))), exp);
				if (isRevert == 1){
					fresnel = 1 - fresnel;
				}
			    return half4(fresnel * color * strength);
			}else{
				if (def == 1){
					return half4(1,1,1,1);
				}else{
					return half4(0,0,0,0);
				}				
			}
		}

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            half4 c = tex2D(_Albedo, IN.uv_Albedo);

            if (c.a < 1-_TintColor.a)
            {
                discard;
            }

            half4 blendMask = tex2D(_AlbedoMask1, IN.uv_AlbedoMask1);

            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Red), blendMask, 1);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Fuchsia), blendMask, 2);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Blue), blendMask, 3);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Cyan), blendMask, 4);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Green), blendMask, 5);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Yellow), blendMask, 6);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_White), blendMask, 7);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Navy), blendMask, 8);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Teal), blendMask, 9);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Azure), blendMask, 10);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Lime), blendMask, 11);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_SpringBud), blendMask, 12);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Maroon), blendMask, 13);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Purple), blendMask, 14);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Violet), blendMask, 15);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Olive), blendMask, 16);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Gray), blendMask, 17);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Malibu), blendMask, 18);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Chartreuse), blendMask, 19);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_UltraGreen), blendMask, 20);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_ElectricBlue), blendMask, 21);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_Rose), blendMask, 22);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_SafetyOrange), blendMask, 23);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_LightCoral), blendMask, 24);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_LightFuchsia), blendMask, 25);
            c.rgb *= rgbColor(c, rgbLighter(_Mask1_LaserLemon), blendMask, 26);

            c.rgb *= _TintColor;

            half4 replaceMask = tex2D(_AlbedoMask2, IN.uv_AlbedoMask2);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Red,_TintColor)), replaceMask, 201);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Fuchsia,_TintColor)), replaceMask, 202);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Blue,_TintColor)), replaceMask, 203);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Cyan,_TintColor)), replaceMask, 204);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Green,_TintColor)), replaceMask, 205);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Yellow,_TintColor)), replaceMask, 206);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_White,_TintColor)), replaceMask, 207);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Navy,_TintColor)), replaceMask, 208);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Teal,_TintColor)), replaceMask, 209);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Azure,_TintColor)), replaceMask, 210);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Lime,_TintColor)), replaceMask, 211);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_SpringBud,_TintColor)), replaceMask, 212);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Maroon,_TintColor)), replaceMask, 213);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Purple,_TintColor)), replaceMask, 214);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Violet,_TintColor)), replaceMask, 215);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Olive,_TintColor)), replaceMask, 216);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Gray,_TintColor)), replaceMask, 217);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Malibu,_TintColor)), replaceMask, 218);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Chartreuse,_TintColor)), replaceMask, 219);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_UltraGreen,_TintColor)), replaceMask, 220);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_ElectricBlue,_TintColor)), replaceMask, 221);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_Rose,_TintColor)), replaceMask, 222);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_SafetyOrange,_TintColor)), replaceMask, 223);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_LightCoral,_TintColor)), replaceMask, 224);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_LightFuchsia,_TintColor)), replaceMask, 225);
            c.rgb = rgbColor(c, rgbLighter(affectToggle(_Mask2_ReplaceTintColor,_Mask2_LaserLemon,_TintColor)), replaceMask, 226);

            half3 albedoResult = c.rgb;

            half3 oms = tex2D(_OMS, IN.uv_OMS);
            o.Occlusion = oms.r * _Occlusion;
            o.Metallic = oms.g * _Metallic;
            half smoothnessResult = oms.b * _Glossiness;
            half3 emissionResult = half3(0,0,0);

            if (_Mask2_Red_Emission+_Mask2_Fuchsia_Emission+_Mask2_Blue_Emission+_Mask2_Cyan_Emission+_Mask2_Green_Emission+_Mask2_Yellow_Emission+_Mask2_White_Emission+_Mask2_Navy_Emission+_Mask2_Teal_Emission+_Mask2_Azure_Emission+_Mask2_Lime_Emission+_Mask2_SpringBud_Emission+_Mask2_Maroon_Emission+_Mask2_Purple_Emission+_Mask2_Violet_Emission+_Mask2_Olive_Emission+_Mask2_Gray_Emission+_Mask2_Malibu_Emission+_Mask2_Chartreuse_Emission+_Mask2_UltraGreen_Emission+_Mask2_ElectricBlue_Emission+_Mask2_Rose_Emission+_Mask2_SafetyOrange_Emission+_Mask2_LightCoral_Emission+_Mask2_LightFuchsia_Emission+_Mask2_LaserLemon_Emission > 0){
                half3 em = half3(0,0,0);
                em += rgbColor(_Mask2_Red,_Mask2_Red_Emission,replaceMask,501);
                em += rgbColor(_Mask2_Fuchsia,_Mask2_Fuchsia_Emission,replaceMask,502);
                em += rgbColor(_Mask2_Blue,_Mask2_Blue_Emission,replaceMask,503);
                em += rgbColor(_Mask2_Cyan,_Mask2_Cyan_Emission,replaceMask,504);
                em += rgbColor(_Mask2_Green,_Mask2_Green_Emission,replaceMask,505);
                em += rgbColor(_Mask2_Yellow,_Mask2_Yellow_Emission,replaceMask,506);
                em += rgbColor(_Mask2_White,_Mask2_White_Emission,replaceMask,507);
                em += rgbColor(_Mask2_Navy,_Mask2_Navy_Emission,replaceMask,508);
                em += rgbColor(_Mask2_Teal,_Mask2_Teal_Emission,replaceMask,509);
                em += rgbColor(_Mask2_Azure,_Mask2_Azure_Emission,replaceMask,510);
                em += rgbColor(_Mask2_Lime,_Mask2_Lime_Emission,replaceMask,511);
                em += rgbColor(_Mask2_SpringBud,_Mask2_SpringBud_Emission,replaceMask,512);
                em += rgbColor(_Mask2_Maroon,_Mask2_Maroon_Emission,replaceMask,513);
                em += rgbColor(_Mask2_Purple,_Mask2_Purple_Emission,replaceMask,514);
                em += rgbColor(_Mask2_Violet,_Mask2_Violet_Emission,replaceMask,515);
                em += rgbColor(_Mask2_Olive,_Mask2_Olive_Emission,replaceMask,516);
                em += rgbColor(_Mask2_Gray,_Mask2_Gray_Emission,replaceMask,517);
                em += rgbColor(_Mask2_Malibu,_Mask2_Malibu_Emission,replaceMask,518);
                em += rgbColor(_Mask2_Chartreuse,_Mask2_Chartreuse_Emission,replaceMask,519);
                em += rgbColor(_Mask2_UltraGreen,_Mask2_UltraGreen_Emission,replaceMask,520);
                em += rgbColor(_Mask2_ElectricBlue,_Mask2_ElectricBlue_Emission,replaceMask,521);
                em += rgbColor(_Mask2_Rose,_Mask2_Rose_Emission,replaceMask,522);
                em += rgbColor(_Mask2_SafetyOrange,_Mask2_SafetyOrange_Emission,replaceMask,523);
                em += rgbColor(_Mask2_LightCoral,_Mask2_LightCoral_Emission,replaceMask,524);
                em += rgbColor(_Mask2_LightFuchsia,_Mask2_LightFuchsia_Emission,replaceMask,525);
                em += rgbColor(_Mask2_LaserLemon,_Mask2_LaserLemon_Emission,replaceMask,526);
                emissionResult = em.rgb;
            }

            half3 tangentNormal = UnpackNormal(tex2D(_NormalMap, IN.uv_NormalMap));
            half3 detailNormal = UnpackNormal(tex2D(_DetailNormalMap, IN.uv_DetailNormalMap));

            half4 mask1 = tex2D(_NormalMask1, IN.uv_NormalMask1);
            half4 mask2 = tex2D(_NormalMask2, IN.uv_NormalMask2);

            half mask_Red = max(rgbColor(0, _NormalMask1_Red, mask1, 101).r,rgbColor(0, _NormalMask2_Red, mask2, 101).r);
            half mask_Fuchsia = max(rgbColor(0, _NormalMask1_Fuchsia, mask1, 102).r,rgbColor(0, _NormalMask2_Fuchsia, mask2, 102).r);
            half mask_Blue = max(rgbColor(0, _NormalMask1_Blue, mask1, 103).r,rgbColor(0, _NormalMask2_Blue, mask2, 103).r);
            half mask_Cyan = max(rgbColor(0, _NormalMask1_Cyan, mask1, 104).r,rgbColor(0, _NormalMask2_Cyan, mask2, 104).r);
            half mask_Green = max(rgbColor(0, _NormalMask1_Green, mask1, 105).r,rgbColor(0, _NormalMask2_Green, mask2, 105).r);
            half mask_Yellow = max(rgbColor(0, _NormalMask1_Yellow, mask1, 106).r,rgbColor(0, _NormalMask2_Yellow, mask2, 106).r);
            half mask_White = max(rgbColor(0, _NormalMask1_White, mask1, 107).r,rgbColor(0, _NormalMask2_White, mask2, 107).r);
            half mask_Navy = max(rgbColor(0, _NormalMask1_Navy, mask1, 108).r,rgbColor(0, _NormalMask2_Navy, mask2, 108).r);
            half mask_Teal = max(rgbColor(0, _NormalMask1_Teal, mask1, 109).r,rgbColor(0, _NormalMask2_Teal, mask2, 109).r);
            half mask_Azure = max(rgbColor(0, _NormalMask1_Azure, mask1, 110).r,rgbColor(0, _NormalMask2_Azure, mask2, 110).r);
            half mask_Lime = max(rgbColor(0, _NormalMask1_Lime, mask1, 111).r,rgbColor(0, _NormalMask2_Lime, mask2, 111).r);
            half mask_SpringBud = max(rgbColor(0, _NormalMask1_SpringBud, mask1, 112).r,rgbColor(0, _NormalMask2_SpringBud, mask2, 112).r);
            half mask_Maroon = max(rgbColor(0, _NormalMask1_Maroon, mask1, 113).r,rgbColor(0, _NormalMask2_Maroon, mask2, 113).r);
            half mask_Purple = max(rgbColor(0, _NormalMask1_Purple, mask1, 114).r,rgbColor(0, _NormalMask2_Purple, mask2, 114).r);
            half mask_Violet = max(rgbColor(0, _NormalMask1_Violet, mask1, 115).r,rgbColor(0, _NormalMask2_Violet, mask2, 115).r);
            half mask_Olive = max(rgbColor(0, _NormalMask1_Olive, mask1, 116).r,rgbColor(0, _NormalMask2_Olive, mask2, 116).r);
            half mask_Gray = max(rgbColor(0, _NormalMask1_Gray, mask1, 117).r,rgbColor(0, _NormalMask2_Gray, mask2, 117).r);
            half mask_Malibu = max(rgbColor(0, _NormalMask1_Malibu, mask1, 118).r,rgbColor(0, _NormalMask2_Malibu, mask2, 118).r);
            half mask_Chartreuse = max(rgbColor(0, _NormalMask1_Chartreuse, mask1, 119).r,rgbColor(0, _NormalMask2_Chartreuse, mask2, 119).r);
            half mask_UltraGreen = max(rgbColor(0, _NormalMask1_UltraGreen, mask1, 120).r,rgbColor(0, _NormalMask2_UltraGreen, mask2, 120).r);
            half mask_ElectricBlue = max(rgbColor(0, _NormalMask1_ElectricBlue, mask1, 121).r,rgbColor(0, _NormalMask2_ElectricBlue, mask2, 121).r);
            half mask_Rose = max(rgbColor(0, _NormalMask1_Rose, mask1, 122).r,rgbColor(0, _NormalMask2_Rose, mask2, 122).r);
            half mask_SafetyOrange = max(rgbColor(0, _NormalMask1_SafetyOrange, mask1, 123).r,rgbColor(0, _NormalMask2_SafetyOrange, mask2, 123).r);
            half mask_LightCoral = max(rgbColor(0, _NormalMask1_LightCoral, mask1, 124).r,rgbColor(0, _NormalMask2_LightCoral, mask2, 124).r);
            half mask_LightFuchsia = max(rgbColor(0, _NormalMask1_LightFuchsia, mask1, 125).r,rgbColor(0, _NormalMask2_LightFuchsia, mask2, 125).r);
            half mask_LaserLemon = max(rgbColor(0, _NormalMask1_LaserLemon, mask1, 126).r,rgbColor(0, _NormalMask2_LaserLemon, mask2, 126).r);

            // half maxMaskFactor = maxIn7(mask_Red, mask_Green, mask_Yellow, mask_White, mask_Fuchsia, mask_Blue,mask_Cyan);
            half maxMaskFactor = max(maxIn13(mask_Red, mask_Fuchsia, mask_Blue, mask_Cyan, mask_Green, mask_Yellow, mask_White, mask_Navy, mask_Teal, mask_Azure, mask_Lime, mask_SpringBud, mask_Maroon), maxIn13(mask_Purple, mask_Violet, mask_Olive, mask_Gray, mask_Malibu, mask_Chartreuse, mask_UltraGreen, mask_ElectricBlue, mask_Rose, mask_SafetyOrange, mask_LightCoral, mask_LightFuchsia, mask_LaserLemon));
            
            half3 blendedNormal = half3(0, 0, 1).xyz;
            if (maxMaskFactor > 0)
            {
                tangentNormal *= _NormalStrength;

                blendedNormal.x = lerp(blendedNormal.x, tangentNormal.x, maxMaskFactor);
                blendedNormal.y = lerp(blendedNormal.y, tangentNormal.y, maxMaskFactor);
            }
            half3 normalResult = blendedNormal;

            if (_DetailNormalStrength > 0){
                detailNormal *= _DetailNormalStrength;
                normalResult = normalBlender(blendedNormal.xy,detailNormal.xy);
            }

            if (_WetnessDensity>0 && _WetnessStrength>0){
                half4 wet = tex2D (_WetnessMap, IN.uv_WetnessMap.xy*half2(_WetnessDensity*1.5,_WetnessDensity));
                if (wet.r>0 && wet.g>0 && wet.b>0){
                    smoothnessResult = lerp(smoothnessResult, max(wet.r,max(wet.g,wet.b))*_WetnessStrength,smoothnessResult*_WetnessStrength);
                }
            }

            if (_FluidDensity>0 && _FluidGlossiness>0){
                half2 uv_rotated;
                uv_rotated = uvRotation(_FluidRotation, IN.uv_FluidMap);
                uv_rotated *= _FluidDensity;

                // Fluid Mask Rotation.
                half4 fluidMask = tex2D(_FluidMask, IN.uv_FluidMask);
                uv_rotated = rgbColor(half3(_Fluid_Red_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1001).rg;
                uv_rotated = rgbColor(half3(_Fluid_Fuchsia_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1002).rg;
                uv_rotated = rgbColor(half3(_Fluid_Blue_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1003).rg;
                uv_rotated = rgbColor(half3(_Fluid_Cyan_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1004).rg;
                uv_rotated = rgbColor(half3(_Fluid_Green_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1005).rg;
                uv_rotated = rgbColor(half3(_Fluid_Yellow_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1006).rg;
                uv_rotated = rgbColor(half3(_Fluid_White_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1007).rg;
                uv_rotated = rgbColor(half3(_Fluid_Navy_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1008).rg;
                uv_rotated = rgbColor(half3(_Fluid_Teal_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1009).rg;
                uv_rotated = rgbColor(half3(_Fluid_Azure_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1010).rg;
                uv_rotated = rgbColor(half3(_Fluid_Lime_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1011).rg;
                uv_rotated = rgbColor(half3(_Fluid_SpringBud_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1012).rg;
                uv_rotated = rgbColor(half3(_Fluid_Maroon_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1013).rg;
                uv_rotated = rgbColor(half3(_Fluid_Purple_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1014).rg;
                uv_rotated = rgbColor(half3(_Fluid_Violet_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1015).rg;
                uv_rotated = rgbColor(half3(_Fluid_Olive_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1016).rg;
                uv_rotated = rgbColor(half3(_Fluid_Gray_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1017).rg;
                uv_rotated = rgbColor(half3(_Fluid_Malibu_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1018).rg;
                uv_rotated = rgbColor(half3(_Fluid_Chartreuse_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1019).rg;
                uv_rotated = rgbColor(half3(_Fluid_UltraGreen_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1020).rg;
                uv_rotated = rgbColor(half3(_Fluid_ElectricBlue_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1021).rg;
                uv_rotated = rgbColor(half3(_Fluid_Rose_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1022).rg;
                uv_rotated = rgbColor(half3(_Fluid_SafetyOrange_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1023).rg;
                uv_rotated = rgbColor(half3(_Fluid_LightCoral_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1024).rg;
                uv_rotated = rgbColor(half3(_Fluid_LightFuchsia_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1025).rg;
                uv_rotated = rgbColor(half3(_Fluid_LaserLemon_Rotation,0,0), half3(uv_rotated,0), fluidMask, 1026).rg;

                // Fluid Map processing with map and mask rotations.
                half4 fluid = tex2D(_FluidMap, uv_rotated);

                half fluidMax = max(fluid.r, max(fluid.g,fluid.b));
                half fluidGlossiness = fluidMax * _FluidGlossiness;

                half fluidMaskMax = max(
                    maxIn13(
                        rgbColor(0, half3(_Fluid_Red,1,1), fluidMask, 1101).r, 
                        rgbColor(0, half3(_Fluid_Fuchsia,1,1), fluidMask, 1102).r, 
                        rgbColor(0, half3(_Fluid_Blue,1,1), fluidMask, 1103).r, 
                        rgbColor(0, half3(_Fluid_Cyan,1,1), fluidMask, 1104).r, 
                        rgbColor(0, half3(_Fluid_Green,1,1), fluidMask, 1105).r, 
                        rgbColor(0, half3(_Fluid_Yellow,1,1), fluidMask, 1106).r, 
                        rgbColor(0, half3(_Fluid_White,1,1), fluidMask, 1107).r, 
                        rgbColor(0, half3(_Fluid_Navy,1,1), fluidMask, 1108).r, 
                        rgbColor(0, half3(_Fluid_Teal,1,1), fluidMask, 1109).r, 
                        rgbColor(0, half3(_Fluid_Azure,1,1), fluidMask, 1110).r, 
                        rgbColor(0, half3(_Fluid_Lime,1,1), fluidMask, 1111).r, 
                        rgbColor(0, half3(_Fluid_SpringBud,1,1), fluidMask, 1112).r, 
                        rgbColor(0, half3(_Fluid_Maroon,1,1), fluidMask, 1113).r
                    ),
                    maxIn13(
                        rgbColor(0, half3(_Fluid_Purple,1,1), fluidMask, 1114).r, 
                        rgbColor(0, half3(_Fluid_Violet,1,1), fluidMask, 1115).r, 
                        rgbColor(0, half3(_Fluid_Olive,1,1), fluidMask, 1116).r, 
                        rgbColor(0, half3(_Fluid_Gray,1,1), fluidMask, 1117).r, 
                        rgbColor(0, half3(_Fluid_Malibu,1,1), fluidMask, 1118).r, 
                        rgbColor(0, half3(_Fluid_Chartreuse,1,1), fluidMask, 1119).r, 
                        rgbColor(0, half3(_Fluid_UltraGreen,1,1), fluidMask, 1120).r, 
                        rgbColor(0, half3(_Fluid_ElectricBlue,1,1), fluidMask, 1121).r, 
                        rgbColor(0, half3(_Fluid_Rose,1,1), fluidMask, 1122).r, 
                        rgbColor(0, half3(_Fluid_SafetyOrange,1,1), fluidMask, 1123).r, 
                        rgbColor(0, half3(_Fluid_LightCoral,1,1), fluidMask, 1124).r, 
                        rgbColor(0, half3(_Fluid_LightFuchsia,1,1), fluidMask, 1125).r, 
                        rgbColor(0, half3(_Fluid_LaserLemon,1,1), fluidMask, 1126).r
                )); 
                if (fluidGlossiness>=0.5){
                    smoothnessResult += fluidGlossiness * fluidMaskMax;
                    if (_FluidEmission > 0){
                        emissionResult = _FluidColor.rgb * _FluidEmission;

                        emissionResult *= fluidMaskMax;
                    }
                }

                half3 wn = UnpackNormal(tex2D(_FluidNormal, uv_rotated));
                if (fluidGlossiness >0 && _FluidBump >0){
                    wn.xy *= _FluidBump * fluidMaskMax;
                    normalResult = normalBlender(normalResult.xy, wn.xy);
                }

                if (fluidGlossiness >= 0.5){
                    _FluidGlossiness *= _FluidColor.a * fluidMaskMax;
                    albedoResult = lerp(albedoResult, _FluidColor.rgb,(_FluidGlossiness>1?1:_FluidGlossiness));
                }
            }

            if (_FresnelEmissionStrength>0){
                emissionResult += fresnelResult(normalResult, IN.viewDir, _FresnelEmissionColor, _FresnelEmissionExp, _FresnelEmissionStrength, _FresnelEmissionRevert,0);
            }

            if (_FresnelAlbedoStrength>0){
                half4 fresnelAlbedo = fresnelResult(normalResult, IN.viewDir, _FresnelAlbedoColor, _FresnelAlbedoExp, _FresnelAlbedoStrength, _FresnelAlbedoRevert, 1);
                albedoResult.rgb = lerp(albedoResult.rgb, fresnelAlbedo.rgb * fresnelAlbedo.a, fresnelAlbedo.a);
            }					

            o.Albedo = albedoResult;
            o.Emission = emissionResult;
            o.Normal = normalResult;
            o.Smoothness = smoothnessResult;

        }
        ENDCG
    }
    FallBack "Standard"
}