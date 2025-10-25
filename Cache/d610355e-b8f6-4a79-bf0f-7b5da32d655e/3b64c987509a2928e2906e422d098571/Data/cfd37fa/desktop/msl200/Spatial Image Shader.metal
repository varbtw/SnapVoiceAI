#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_BACKEND_SHADER_FLAGS_END__
#endif
//efine SC_DISABLE_FRUSTUM_CULLING
#ifdef fadeBorder
#undef fadeBorder
#endif
#ifdef frameOn
#undef frameOn
#endif
namespace SNAP_VS {
int sc_GetStereoViewIndex()
{
    return 0;
}
}
    #ifndef sc_TextureRenderingLayout_Regular
        #define sc_TextureRenderingLayout_Regular 0
        #define sc_TextureRenderingLayout_StereoInstancedClipped 1
        #define sc_TextureRenderingLayout_StereoMultiview 2
    #endif
    #define depthToGlobal   depthScreenToViewSpace
    #define depthToLocal    depthViewToScreenSpace
    #ifndef quantizeUV
        #define quantizeUV sc_QuantizeUV
        #define sc_platformUVFlip sc_PlatformFlipV
        #define sc_PlatformFlipUV sc_PlatformFlipV
    #endif
    #ifndef sc_SampleTexture
        #define sc_SampleTexture sc_SampleTextureBiasOrLevel
    #endif
    #ifndef sc_texture2DLod
        #define sc_texture2DLod sc_InternalTextureLevel
        #define sc_textureLod sc_InternalTextureLevel
        #define sc_textureBias sc_InternalTextureBiasOrLevel
        #define sc_texture sc_InternalTexture
    #endif
//SG_REFLECTION_BEGIN(200)
//attribute vec4 boneData 5
//attribute vec3 blendShape0Pos 6
//attribute vec3 blendShape0Normal 12
//attribute vec3 blendShape1Pos 7
//attribute vec3 blendShape1Normal 13
//attribute vec3 blendShape2Pos 8
//attribute vec3 blendShape2Normal 14
//attribute vec3 blendShape3Pos 9
//attribute vec3 blendShape4Pos 10
//attribute vec3 blendShape5Pos 11
//attribute vec4 position 0
//attribute vec3 normal 1
//attribute vec4 tangent 2
//attribute vec2 texture0 3
//attribute vec2 texture1 4
//attribute vec4 color 18
//attribute vec3 positionNext 15
//attribute vec3 positionPrevious 16
//attribute vec4 strandProperties 17
//output vec4 FragColor0 0
//output vec4 FragColor1 1
//output vec4 FragColor2 2
//output vec4 FragColor3 3
//sampler sampler baseTexSmpSC 0:17
//sampler sampler intensityTextureSmpSC 0:18
//sampler sampler sc_ScreenTextureSmpSC 0:23
//texture texture2D baseTex 0:1:0:17
//texture texture2D intensityTexture 0:2:0:18
//texture texture2D sc_ScreenTexture 0:14:0:23
//ubo float sc_BonesUBO 0:0:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:26:4384 {
//sc_PointLight_t sc_PointLights 0:[3]:80
//bool sc_PointLights.falloffEnabled 0
//float sc_PointLights.falloffEndDistance 4
//float sc_PointLights.negRcpFalloffEndDistance4 8
//float sc_PointLights.angleScale 12
//float sc_PointLights.angleOffset 16
//float3 sc_PointLights.direction 32
//float3 sc_PointLights.position 48
//float4 sc_PointLights.color 64
//sc_DirectionalLight_t sc_DirectionalLights 240:[5]:32
//float3 sc_DirectionalLights.direction 0
//float4 sc_DirectionalLights.color 16
//sc_AmbientLight_t sc_AmbientLights 400:[3]:32
//float3 sc_AmbientLights.color 0
//float sc_AmbientLights.intensity 16
//sc_LightEstimationData_t sc_LightEstimationData 496
//sc_SphericalGaussianLight_t sc_LightEstimationData.sg 0:[12]:48
//float3 sc_LightEstimationData.sg.color 0
//float sc_LightEstimationData.sg.sharpness 16
//float3 sc_LightEstimationData.sg.axis 32
//float3 sc_LightEstimationData.ambientLight 576
//float4 sc_EnvmapDiffuseSize 1088
//float4 sc_EnvmapDiffuseDims 1104
//float4 sc_EnvmapDiffuseView 1120
//float4 sc_EnvmapSpecularSize 1136
//float4 sc_EnvmapSpecularDims 1152
//float4 sc_EnvmapSpecularView 1168
//float3 sc_EnvmapRotation 1184
//float sc_EnvmapExposure 1200
//float3 sc_Sh 1216:[9]:16
//float sc_ShIntensity 1360
//float4 sc_Time 1376
//float4 sc_UniformConstants 1392
//float4 sc_GeometryInfo 1408
//float4x4 sc_ModelViewProjectionMatrixArray 1424:[2]:64
//float4x4 sc_ModelViewProjectionMatrixInverseArray 1552:[2]:64
//float4x4 sc_ViewProjectionMatrixArray 1680:[2]:64
//float4x4 sc_ViewProjectionMatrixInverseArray 1808:[2]:64
//float4x4 sc_ModelViewMatrixArray 1936:[2]:64
//float4x4 sc_ModelViewMatrixInverseArray 2064:[2]:64
//float3x3 sc_ViewNormalMatrixArray 2192:[2]:48
//float3x3 sc_ViewNormalMatrixInverseArray 2288:[2]:48
//float4x4 sc_ProjectionMatrixArray 2384:[2]:64
//float4x4 sc_ProjectionMatrixInverseArray 2512:[2]:64
//float4x4 sc_ViewMatrixArray 2640:[2]:64
//float4x4 sc_ViewMatrixInverseArray 2768:[2]:64
//float4x4 sc_PrevFrameViewProjectionMatrixArray 2896:[2]:64
//float4x4 sc_ModelMatrix 3024
//float4x4 sc_ModelMatrixInverse 3088
//float3x3 sc_NormalMatrix 3152
//float3x3 sc_NormalMatrixInverse 3200
//float4x4 sc_PrevFrameModelMatrix 3248
//float4x4 sc_PrevFrameModelMatrixInverse 3312
//float3 sc_LocalAabbMin 3376
//float3 sc_LocalAabbMax 3392
//float3 sc_WorldAabbMin 3408
//float3 sc_WorldAabbMax 3424
//float4 sc_WindowToViewportTransform 3440
//float4 sc_CurrentRenderTargetDims 3456
//sc_Camera_t sc_Camera 3472
//float3 sc_Camera.position 0
//float sc_Camera.aspect 16
//float2 sc_Camera.clipPlanes 24
//float sc_ShadowDensity 3504
//float4 sc_ShadowColor 3520
//float4x4 sc_ProjectorMatrix 3536
//float _sc_GetFramebufferColorInvalidUsageMarker 3600
//float shaderComplexityValue 3604
//float sc_DisableFrustumCullingMarker 3608
//float4 weights0 3616
//float4 weights1 3632
//float4 weights2 3648
//float4 sc_StereoClipPlanes 3664:[2]:16
//int sc_FallbackInstanceID 3696
//float _sc_framebufferFetchMarker 3700
//float2 sc_TAAJitterOffset 3704
//float strandWidth 3712
//float strandTaper 3716
//float4 sc_StrandDataMapTextureSize 3728
//float clumpInstanceCount 3744
//float clumpRadius 3748
//float clumpTipScale 3752
//float hairstyleInstanceCount 3756
//float hairstyleNoise 3760
//float4 sc_ScreenTextureSize 3776
//float4 sc_ScreenTextureDims 3792
//float4 sc_ScreenTextureView 3808
//float correctedIntensity 3824
//float4 intensityTextureSize 3840
//float4 intensityTextureDims 3856
//float4 intensityTextureView 3872
//float3x3 intensityTextureTransform 3888
//float4 intensityTextureUvMinMax 3936
//float4 intensityTextureBorderColor 3952
//float reflBlurWidth 3968
//float reflBlurMinRough 3972
//float reflBlurMaxRough 3976
//int overrideTimeEnabled 3980
//float overrideTimeElapsed 3984
//float overrideTimeDelta 3988
//int PreviewEnabled 3992
//int PreviewNodeID 3996
//float alphaTestThreshold 4000
//float frameHeight 4004
//float depthScale 4008
//float frameOffset 4012
//float aspectRatio 4016
//float4 baseTexSize 4032
//float4 baseTexDims 4048
//float4 baseTexView 4064
//float3x3 baseTexTransform 4080
//float4 baseTexUvMinMax 4128
//float4 baseTexBorderColor 4144
//bool fadeBorder 4160
//bool frameOn 4164
//float fadeSpeed 4168
//float cornerRadius 4172
//float3 Port_Import_N005 4176
//float Port_Value1_N070 4192
//float Port_Value2_N070 4196
//float Port_Import_N009 4200
//float Port_Import_N117 4204
//float3 Port_Import_N111 4208
//float Port_Import_N030 4224
//float Port_eyeOffset_N060 4228
//float3 Port_Import_N006 4240
//float3 Port_Import_N129 4256
//float2 Port_Import_N112 4272
//float Port_Import_N041 4280
//float Port_Import_N040 4284
//float Port_Input1_N037 4288
//float2 Port_Import_N109 4296
//float Port_Default_N045 4304
//float Port_Import_N027 4308
//float Port_Default_N116 4312
//float3 Port_Import_N048 4320
//float Port_Input1_N033 4336
//float2 Port_Import_N131 4344
//float2 Port_Import_N024 4352
//float2 Port_Import_N026 4360
//float2 Port_Import_N025 4368
//float Port_Import_N064 4376
//}
//spec_const bool BLEND_MODE_AVERAGE 0
//spec_const bool BLEND_MODE_BRIGHT 1
//spec_const bool BLEND_MODE_COLOR_BURN 2
//spec_const bool BLEND_MODE_COLOR_DODGE 3
//spec_const bool BLEND_MODE_COLOR 4
//spec_const bool BLEND_MODE_DARKEN 5
//spec_const bool BLEND_MODE_DIFFERENCE 6
//spec_const bool BLEND_MODE_DIVIDE 7
//spec_const bool BLEND_MODE_DIVISION 8
//spec_const bool BLEND_MODE_EXCLUSION 9
//spec_const bool BLEND_MODE_FORGRAY 10
//spec_const bool BLEND_MODE_HARD_GLOW 11
//spec_const bool BLEND_MODE_HARD_LIGHT 12
//spec_const bool BLEND_MODE_HARD_MIX 13
//spec_const bool BLEND_MODE_HARD_PHOENIX 14
//spec_const bool BLEND_MODE_HARD_REFLECT 15
//spec_const bool BLEND_MODE_HUE 16
//spec_const bool BLEND_MODE_INTENSE 17
//spec_const bool BLEND_MODE_LIGHTEN 18
//spec_const bool BLEND_MODE_LINEAR_LIGHT 19
//spec_const bool BLEND_MODE_LUMINOSITY 20
//spec_const bool BLEND_MODE_NEGATION 21
//spec_const bool BLEND_MODE_NOTBRIGHT 22
//spec_const bool BLEND_MODE_OVERLAY 23
//spec_const bool BLEND_MODE_PIN_LIGHT 24
//spec_const bool BLEND_MODE_REALISTIC 25
//spec_const bool BLEND_MODE_SATURATION 26
//spec_const bool BLEND_MODE_SOFT_LIGHT 27
//spec_const bool BLEND_MODE_SUBTRACT 28
//spec_const bool BLEND_MODE_VIVID_LIGHT 29
//spec_const bool ENABLE_STIPPLE_PATTERN_TEST 30
//spec_const bool SC_USE_CLAMP_TO_BORDER_baseTex 31
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 32
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 33
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 34
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 35
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 36
//spec_const bool UseViewSpaceDepthVariant 37
//spec_const bool baseTexHasSwappedViews 38
//spec_const bool intensityTextureHasSwappedViews 39
//spec_const bool sc_BlendMode_AddWithAlphaFactor 40
//spec_const bool sc_BlendMode_Add 41
//spec_const bool sc_BlendMode_AlphaTest 42
//spec_const bool sc_BlendMode_AlphaToCoverage 43
//spec_const bool sc_BlendMode_ColoredGlass 44
//spec_const bool sc_BlendMode_Custom 45
//spec_const bool sc_BlendMode_Max 46
//spec_const bool sc_BlendMode_Min 47
//spec_const bool sc_BlendMode_MultiplyOriginal 48
//spec_const bool sc_BlendMode_Multiply 49
//spec_const bool sc_BlendMode_Normal 50
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 51
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 52
//spec_const bool sc_BlendMode_PremultipliedAlpha 53
//spec_const bool sc_BlendMode_Screen 54
//spec_const bool sc_DepthOnly 55
//spec_const bool sc_FramebufferFetch 56
//spec_const bool sc_MotionVectorsPass 57
//spec_const bool sc_OITCompositingPass 58
//spec_const bool sc_OITDepthBoundsPass 59
//spec_const bool sc_OITDepthGatherPass 60
//spec_const bool sc_ProjectiveShadowsCaster 61
//spec_const bool sc_ProjectiveShadowsReceiver 62
//spec_const bool sc_RenderAlphaToColor 63
//spec_const bool sc_ScreenTextureHasSwappedViews 64
//spec_const bool sc_ShaderComplexityAnalyzer 65
//spec_const bool sc_UseFramebufferFetchMarker 66
//spec_const bool sc_VertexBlendingUseNormals 67
//spec_const bool sc_VertexBlending 68
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 69
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 70
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 71
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 72
//spec_const int baseTexLayout 73
//spec_const int intensityTextureLayout 74
//spec_const int sc_DepthBufferMode 75
//spec_const int sc_RenderingSpace 76
//spec_const int sc_ScreenTextureLayout 77
//spec_const int sc_ShaderCacheConstant 78
//spec_const int sc_SkinBonesCount 79
//spec_const int sc_StereoRenderingMode 80
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 81
//SG_REFLECTION_END
constant bool BLEND_MODE_AVERAGE [[function_constant(0)]];
constant bool BLEND_MODE_AVERAGE_tmp = is_function_constant_defined(BLEND_MODE_AVERAGE) ? BLEND_MODE_AVERAGE : false;
constant bool BLEND_MODE_BRIGHT [[function_constant(1)]];
constant bool BLEND_MODE_BRIGHT_tmp = is_function_constant_defined(BLEND_MODE_BRIGHT) ? BLEND_MODE_BRIGHT : false;
constant bool BLEND_MODE_COLOR_BURN [[function_constant(2)]];
constant bool BLEND_MODE_COLOR_BURN_tmp = is_function_constant_defined(BLEND_MODE_COLOR_BURN) ? BLEND_MODE_COLOR_BURN : false;
constant bool BLEND_MODE_COLOR_DODGE [[function_constant(3)]];
constant bool BLEND_MODE_COLOR_DODGE_tmp = is_function_constant_defined(BLEND_MODE_COLOR_DODGE) ? BLEND_MODE_COLOR_DODGE : false;
constant bool BLEND_MODE_COLOR [[function_constant(4)]];
constant bool BLEND_MODE_COLOR_tmp = is_function_constant_defined(BLEND_MODE_COLOR) ? BLEND_MODE_COLOR : false;
constant bool BLEND_MODE_DARKEN [[function_constant(5)]];
constant bool BLEND_MODE_DARKEN_tmp = is_function_constant_defined(BLEND_MODE_DARKEN) ? BLEND_MODE_DARKEN : false;
constant bool BLEND_MODE_DIFFERENCE [[function_constant(6)]];
constant bool BLEND_MODE_DIFFERENCE_tmp = is_function_constant_defined(BLEND_MODE_DIFFERENCE) ? BLEND_MODE_DIFFERENCE : false;
constant bool BLEND_MODE_DIVIDE [[function_constant(7)]];
constant bool BLEND_MODE_DIVIDE_tmp = is_function_constant_defined(BLEND_MODE_DIVIDE) ? BLEND_MODE_DIVIDE : false;
constant bool BLEND_MODE_DIVISION [[function_constant(8)]];
constant bool BLEND_MODE_DIVISION_tmp = is_function_constant_defined(BLEND_MODE_DIVISION) ? BLEND_MODE_DIVISION : false;
constant bool BLEND_MODE_EXCLUSION [[function_constant(9)]];
constant bool BLEND_MODE_EXCLUSION_tmp = is_function_constant_defined(BLEND_MODE_EXCLUSION) ? BLEND_MODE_EXCLUSION : false;
constant bool BLEND_MODE_FORGRAY [[function_constant(10)]];
constant bool BLEND_MODE_FORGRAY_tmp = is_function_constant_defined(BLEND_MODE_FORGRAY) ? BLEND_MODE_FORGRAY : false;
constant bool BLEND_MODE_HARD_GLOW [[function_constant(11)]];
constant bool BLEND_MODE_HARD_GLOW_tmp = is_function_constant_defined(BLEND_MODE_HARD_GLOW) ? BLEND_MODE_HARD_GLOW : false;
constant bool BLEND_MODE_HARD_LIGHT [[function_constant(12)]];
constant bool BLEND_MODE_HARD_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_HARD_LIGHT) ? BLEND_MODE_HARD_LIGHT : false;
constant bool BLEND_MODE_HARD_MIX [[function_constant(13)]];
constant bool BLEND_MODE_HARD_MIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_MIX) ? BLEND_MODE_HARD_MIX : false;
constant bool BLEND_MODE_HARD_PHOENIX [[function_constant(14)]];
constant bool BLEND_MODE_HARD_PHOENIX_tmp = is_function_constant_defined(BLEND_MODE_HARD_PHOENIX) ? BLEND_MODE_HARD_PHOENIX : false;
constant bool BLEND_MODE_HARD_REFLECT [[function_constant(15)]];
constant bool BLEND_MODE_HARD_REFLECT_tmp = is_function_constant_defined(BLEND_MODE_HARD_REFLECT) ? BLEND_MODE_HARD_REFLECT : false;
constant bool BLEND_MODE_HUE [[function_constant(16)]];
constant bool BLEND_MODE_HUE_tmp = is_function_constant_defined(BLEND_MODE_HUE) ? BLEND_MODE_HUE : false;
constant bool BLEND_MODE_INTENSE [[function_constant(17)]];
constant bool BLEND_MODE_INTENSE_tmp = is_function_constant_defined(BLEND_MODE_INTENSE) ? BLEND_MODE_INTENSE : false;
constant bool BLEND_MODE_LIGHTEN [[function_constant(18)]];
constant bool BLEND_MODE_LIGHTEN_tmp = is_function_constant_defined(BLEND_MODE_LIGHTEN) ? BLEND_MODE_LIGHTEN : false;
constant bool BLEND_MODE_LINEAR_LIGHT [[function_constant(19)]];
constant bool BLEND_MODE_LINEAR_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_LINEAR_LIGHT) ? BLEND_MODE_LINEAR_LIGHT : false;
constant bool BLEND_MODE_LUMINOSITY [[function_constant(20)]];
constant bool BLEND_MODE_LUMINOSITY_tmp = is_function_constant_defined(BLEND_MODE_LUMINOSITY) ? BLEND_MODE_LUMINOSITY : false;
constant bool BLEND_MODE_NEGATION [[function_constant(21)]];
constant bool BLEND_MODE_NEGATION_tmp = is_function_constant_defined(BLEND_MODE_NEGATION) ? BLEND_MODE_NEGATION : false;
constant bool BLEND_MODE_NOTBRIGHT [[function_constant(22)]];
constant bool BLEND_MODE_NOTBRIGHT_tmp = is_function_constant_defined(BLEND_MODE_NOTBRIGHT) ? BLEND_MODE_NOTBRIGHT : false;
constant bool BLEND_MODE_OVERLAY [[function_constant(23)]];
constant bool BLEND_MODE_OVERLAY_tmp = is_function_constant_defined(BLEND_MODE_OVERLAY) ? BLEND_MODE_OVERLAY : false;
constant bool BLEND_MODE_PIN_LIGHT [[function_constant(24)]];
constant bool BLEND_MODE_PIN_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_PIN_LIGHT) ? BLEND_MODE_PIN_LIGHT : false;
constant bool BLEND_MODE_REALISTIC [[function_constant(25)]];
constant bool BLEND_MODE_REALISTIC_tmp = is_function_constant_defined(BLEND_MODE_REALISTIC) ? BLEND_MODE_REALISTIC : false;
constant bool BLEND_MODE_SATURATION [[function_constant(26)]];
constant bool BLEND_MODE_SATURATION_tmp = is_function_constant_defined(BLEND_MODE_SATURATION) ? BLEND_MODE_SATURATION : false;
constant bool BLEND_MODE_SOFT_LIGHT [[function_constant(27)]];
constant bool BLEND_MODE_SOFT_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_SOFT_LIGHT) ? BLEND_MODE_SOFT_LIGHT : false;
constant bool BLEND_MODE_SUBTRACT [[function_constant(28)]];
constant bool BLEND_MODE_SUBTRACT_tmp = is_function_constant_defined(BLEND_MODE_SUBTRACT) ? BLEND_MODE_SUBTRACT : false;
constant bool BLEND_MODE_VIVID_LIGHT [[function_constant(29)]];
constant bool BLEND_MODE_VIVID_LIGHT_tmp = is_function_constant_defined(BLEND_MODE_VIVID_LIGHT) ? BLEND_MODE_VIVID_LIGHT : false;
constant bool ENABLE_STIPPLE_PATTERN_TEST [[function_constant(30)]];
constant bool ENABLE_STIPPLE_PATTERN_TEST_tmp = is_function_constant_defined(ENABLE_STIPPLE_PATTERN_TEST) ? ENABLE_STIPPLE_PATTERN_TEST : false;
constant bool SC_USE_CLAMP_TO_BORDER_baseTex [[function_constant(31)]];
constant bool SC_USE_CLAMP_TO_BORDER_baseTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_baseTex) ? SC_USE_CLAMP_TO_BORDER_baseTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(33)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(34)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(35)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(36)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool UseViewSpaceDepthVariant [[function_constant(37)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(38)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(39)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(40)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(41)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(42)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(43)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(44)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(45)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(46)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(47)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(48)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(49)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(50)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(51)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(52)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(53)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(54)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(55)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_FramebufferFetch [[function_constant(56)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_MotionVectorsPass [[function_constant(57)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(58)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(59)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(60)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(61)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(62)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_RenderAlphaToColor [[function_constant(63)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(64)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(65)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(66)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(67)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(68)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(69)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(70)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(71)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(72)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int baseTexLayout [[function_constant(73)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int intensityTextureLayout [[function_constant(74)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int sc_DepthBufferMode [[function_constant(75)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_RenderingSpace [[function_constant(76)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(77)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(78)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(79)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(80)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(81)]];
constant int sc_StereoRendering_IsClipDistanceEnabled_tmp = is_function_constant_defined(sc_StereoRendering_IsClipDistanceEnabled) ? sc_StereoRendering_IsClipDistanceEnabled : 0;

namespace SNAP_VS {
struct sc_Vertex_t
{
float4 position;
float3 normal;
float3 tangent;
float2 texture0;
float2 texture1;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 SurfacePosition_ObjectSpace;
float gStereoViewIndex;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float frameHeight;
float depthScale;
float frameOffset;
float aspectRatio;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
int fadeBorder;
int frameOn;
float fadeSpeed;
float cornerRadius;
float3 Port_Import_N005;
float Port_Value1_N070;
float Port_Value2_N070;
float Port_Import_N009;
float Port_Import_N117;
float3 Port_Import_N111;
float Port_Import_N030;
float Port_eyeOffset_N060;
float3 Port_Import_N006;
float3 Port_Import_N129;
float2 Port_Import_N112;
float Port_Import_N041;
float Port_Import_N040;
float Port_Input1_N037;
float2 Port_Import_N109;
float Port_Default_N045;
float Port_Import_N027;
float Port_Default_N116;
float3 Port_Import_N048;
float Port_Input1_N033;
float2 Port_Import_N131;
float2 Port_Import_N024;
float2 Port_Import_N026;
float2 Port_Import_N025;
float Port_Import_N064;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> baseTex [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
sampler baseTexSmpSC [[id(17)]];
sampler intensityTextureSmpSC [[id(18)]];
sampler sc_ScreenTextureSmpSC [[id(23)]];
constant userUniformsObj* UserUniforms [[id(26)]];
};
struct main_vert_out
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 Interpolator0 [[user(locn13)]];
float Interpolator_gStereoViewIndex [[user(locn14)]];
float4 gl_Position [[position]];
};
struct main_vert_in
{
float4 position [[attribute(0)]];
float3 normal [[attribute(1)]];
float4 tangent [[attribute(2)]];
float2 texture0 [[attribute(3)]];
float2 texture1 [[attribute(4)]];
float4 boneData [[attribute(5)]];
float3 blendShape0Pos [[attribute(6)]];
float3 blendShape1Pos [[attribute(7)]];
float3 blendShape2Pos [[attribute(8)]];
float3 blendShape3Pos [[attribute(9)]];
float3 blendShape4Pos [[attribute(10)]];
float3 blendShape5Pos [[attribute(11)]];
float3 blendShape0Normal [[attribute(12)]];
float3 blendShape1Normal [[attribute(13)]];
float3 blendShape2Normal [[attribute(14)]];
float3 positionNext [[attribute(15)]];
float3 positionPrevious [[attribute(16)]];
float4 strandProperties [[attribute(17)]];
float4 color [[attribute(18)]];
};
vertex main_vert_out main_vert(main_vert_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],uint gl_InstanceIndex [[instance_id]])
{
main_vert_out out={};
float3 N7_objCoord=float3(0.0);
float N7_frameHeight=0.0;
float N7_depthScale=0.0;
float N7_frameOffset=0.0;
float N7_aspect=0.0;
float3 N7_world_out=float3(0.0);
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_0;
l9_0.position=in.position;
l9_0.normal=in.normal;
l9_0.tangent=in.tangent.xyz;
l9_0.texture0=in.texture0;
l9_0.texture1=in.texture1;
sc_Vertex_t l9_1=l9_0;
sc_Vertex_t param=l9_1;
sc_Vertex_t l9_2=param;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_3=l9_2;
float3 l9_4=in.blendShape0Pos;
float3 l9_5=in.blendShape0Normal;
float l9_6=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_7=l9_3;
float3 l9_8=l9_4;
float l9_9=l9_6;
float3 l9_10=l9_7.position.xyz+(l9_8*l9_9);
l9_7.position=float4(l9_10.x,l9_10.y,l9_10.z,l9_7.position.w);
l9_3=l9_7;
l9_3.normal+=(l9_5*l9_6);
l9_2=l9_3;
sc_Vertex_t l9_11=l9_2;
float3 l9_12=in.blendShape1Pos;
float3 l9_13=in.blendShape1Normal;
float l9_14=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_15=l9_11;
float3 l9_16=l9_12;
float l9_17=l9_14;
float3 l9_18=l9_15.position.xyz+(l9_16*l9_17);
l9_15.position=float4(l9_18.x,l9_18.y,l9_18.z,l9_15.position.w);
l9_11=l9_15;
l9_11.normal+=(l9_13*l9_14);
l9_2=l9_11;
sc_Vertex_t l9_19=l9_2;
float3 l9_20=in.blendShape2Pos;
float3 l9_21=in.blendShape2Normal;
float l9_22=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_23=l9_19;
float3 l9_24=l9_20;
float l9_25=l9_22;
float3 l9_26=l9_23.position.xyz+(l9_24*l9_25);
l9_23.position=float4(l9_26.x,l9_26.y,l9_26.z,l9_23.position.w);
l9_19=l9_23;
l9_19.normal+=(l9_21*l9_22);
l9_2=l9_19;
}
else
{
sc_Vertex_t l9_27=l9_2;
float3 l9_28=in.blendShape0Pos;
float l9_29=(*sc_set0.UserUniforms).weights0.x;
float3 l9_30=l9_27.position.xyz+(l9_28*l9_29);
l9_27.position=float4(l9_30.x,l9_30.y,l9_30.z,l9_27.position.w);
l9_2=l9_27;
sc_Vertex_t l9_31=l9_2;
float3 l9_32=in.blendShape1Pos;
float l9_33=(*sc_set0.UserUniforms).weights0.y;
float3 l9_34=l9_31.position.xyz+(l9_32*l9_33);
l9_31.position=float4(l9_34.x,l9_34.y,l9_34.z,l9_31.position.w);
l9_2=l9_31;
sc_Vertex_t l9_35=l9_2;
float3 l9_36=in.blendShape2Pos;
float l9_37=(*sc_set0.UserUniforms).weights0.z;
float3 l9_38=l9_35.position.xyz+(l9_36*l9_37);
l9_35.position=float4(l9_38.x,l9_38.y,l9_38.z,l9_35.position.w);
l9_2=l9_35;
sc_Vertex_t l9_39=l9_2;
float3 l9_40=in.blendShape3Pos;
float l9_41=(*sc_set0.UserUniforms).weights0.w;
float3 l9_42=l9_39.position.xyz+(l9_40*l9_41);
l9_39.position=float4(l9_42.x,l9_42.y,l9_42.z,l9_39.position.w);
l9_2=l9_39;
sc_Vertex_t l9_43=l9_2;
float3 l9_44=in.blendShape4Pos;
float l9_45=(*sc_set0.UserUniforms).weights1.x;
float3 l9_46=l9_43.position.xyz+(l9_44*l9_45);
l9_43.position=float4(l9_46.x,l9_46.y,l9_46.z,l9_43.position.w);
l9_2=l9_43;
sc_Vertex_t l9_47=l9_2;
float3 l9_48=in.blendShape5Pos;
float l9_49=(*sc_set0.UserUniforms).weights1.y;
float3 l9_50=l9_47.position.xyz+(l9_48*l9_49);
l9_47.position=float4(l9_50.x,l9_50.y,l9_50.z,l9_47.position.w);
l9_2=l9_47;
}
}
param=l9_2;
sc_Vertex_t l9_51=param;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_52=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_52=float4(1.0,fract(in.boneData.yzw));
l9_52.x-=dot(l9_52.yzw,float3(1.0));
}
float4 l9_53=l9_52;
float4 l9_54=l9_53;
int l9_55=int(in.boneData.x);
int l9_56=int(in.boneData.y);
int l9_57=int(in.boneData.z);
int l9_58=int(in.boneData.w);
int l9_59=l9_55;
float4 l9_60=l9_51.position;
float3 l9_61=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_62=l9_59;
float4 l9_63=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[0];
float4 l9_64=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[1];
float4 l9_65=(*sc_set0.sc_BonesUBO).sc_Bones[l9_62].boneMatrix[2];
float4 l9_66[3];
l9_66[0]=l9_63;
l9_66[1]=l9_64;
l9_66[2]=l9_65;
l9_61=float3(dot(l9_60,l9_66[0]),dot(l9_60,l9_66[1]),dot(l9_60,l9_66[2]));
}
else
{
l9_61=l9_60.xyz;
}
float3 l9_67=l9_61;
float3 l9_68=l9_67;
float l9_69=l9_54.x;
int l9_70=l9_56;
float4 l9_71=l9_51.position;
float3 l9_72=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_73=l9_70;
float4 l9_74=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[0];
float4 l9_75=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[1];
float4 l9_76=(*sc_set0.sc_BonesUBO).sc_Bones[l9_73].boneMatrix[2];
float4 l9_77[3];
l9_77[0]=l9_74;
l9_77[1]=l9_75;
l9_77[2]=l9_76;
l9_72=float3(dot(l9_71,l9_77[0]),dot(l9_71,l9_77[1]),dot(l9_71,l9_77[2]));
}
else
{
l9_72=l9_71.xyz;
}
float3 l9_78=l9_72;
float3 l9_79=l9_78;
float l9_80=l9_54.y;
int l9_81=l9_57;
float4 l9_82=l9_51.position;
float3 l9_83=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_84=l9_81;
float4 l9_85=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[0];
float4 l9_86=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[1];
float4 l9_87=(*sc_set0.sc_BonesUBO).sc_Bones[l9_84].boneMatrix[2];
float4 l9_88[3];
l9_88[0]=l9_85;
l9_88[1]=l9_86;
l9_88[2]=l9_87;
l9_83=float3(dot(l9_82,l9_88[0]),dot(l9_82,l9_88[1]),dot(l9_82,l9_88[2]));
}
else
{
l9_83=l9_82.xyz;
}
float3 l9_89=l9_83;
float3 l9_90=l9_89;
float l9_91=l9_54.z;
int l9_92=l9_58;
float4 l9_93=l9_51.position;
float3 l9_94=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_95=l9_92;
float4 l9_96=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[0];
float4 l9_97=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[1];
float4 l9_98=(*sc_set0.sc_BonesUBO).sc_Bones[l9_95].boneMatrix[2];
float4 l9_99[3];
l9_99[0]=l9_96;
l9_99[1]=l9_97;
l9_99[2]=l9_98;
l9_94=float3(dot(l9_93,l9_99[0]),dot(l9_93,l9_99[1]),dot(l9_93,l9_99[2]));
}
else
{
l9_94=l9_93.xyz;
}
float3 l9_100=l9_94;
float3 l9_101=(((l9_68*l9_69)+(l9_79*l9_80))+(l9_90*l9_91))+(l9_100*l9_54.w);
l9_51.position=float4(l9_101.x,l9_101.y,l9_101.z,l9_51.position.w);
int l9_102=l9_55;
float3x3 l9_103=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_102].normalMatrix[2].xyz));
float3x3 l9_104=l9_103;
float3x3 l9_105=l9_104;
int l9_106=l9_56;
float3x3 l9_107=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_106].normalMatrix[2].xyz));
float3x3 l9_108=l9_107;
float3x3 l9_109=l9_108;
int l9_110=l9_57;
float3x3 l9_111=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_110].normalMatrix[2].xyz));
float3x3 l9_112=l9_111;
float3x3 l9_113=l9_112;
int l9_114=l9_58;
float3x3 l9_115=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_114].normalMatrix[2].xyz));
float3x3 l9_116=l9_115;
float3x3 l9_117=l9_116;
l9_51.normal=((((l9_105*l9_51.normal)*l9_54.x)+((l9_109*l9_51.normal)*l9_54.y))+((l9_113*l9_51.normal)*l9_54.z))+((l9_117*l9_51.normal)*l9_54.w);
l9_51.tangent=((((l9_105*l9_51.tangent)*l9_54.x)+((l9_109*l9_51.tangent)*l9_54.y))+((l9_113*l9_51.tangent)*l9_54.z))+((l9_117*l9_51.tangent)*l9_54.w);
}
param=l9_51;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param.position.xyz;
out.varNormal=param.normal;
out.varTangent=float4(param.tangent.x,param.tangent.y,param.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set0.UserUniforms).sc_ModelMatrix*param.position).xyz;
out.varNormal=(*sc_set0.UserUniforms).sc_NormalMatrix*param.normal;
float3 l9_118=(*sc_set0.UserUniforms).sc_NormalMatrix*param.tangent;
out.varTangent=float4(l9_118.x,l9_118.y,l9_118.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param.texture0.x=1.0-param.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param;
float l9_119;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_119=(*sc_set0.UserUniforms).overrideTimeElapsed;
}
else
{
l9_119=(*sc_set0.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_119;
float l9_120;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_120=(*sc_set0.UserUniforms).overrideTimeDelta;
}
else
{
l9_120=(*sc_set0.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_120;
Globals.SurfacePosition_ObjectSpace=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(out.varPos,1.0)).xyz;
Globals.gStereoViewIndex=float(gl_InstanceIndex%2);
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
float3 Output_N20=float3(0.0);
float3 param_1=float3(0.0);
ssGlobals param_3=Globals;
float3 l9_121=float3(0.0);
l9_121=param_3.SurfacePosition_ObjectSpace;
param_1=l9_121;
float3 param_2=param_1;
Output_N20=param_2;
float Output_N54=0.0;
float param_4=(*sc_set0.UserUniforms).frameHeight;
Output_N54=param_4;
float Output_N120=0.0;
float param_5=(*sc_set0.UserUniforms).depthScale;
Output_N120=param_5;
float Output_N55=0.0;
float param_6=(*sc_set0.UserUniforms).frameOffset;
Output_N55=param_6;
float Output_N0=0.0;
float param_7=(*sc_set0.UserUniforms).aspectRatio;
Output_N0=param_7;
float3 world_out_N7=float3(0.0);
float3 param_8=Output_N20;
float param_9=Output_N54;
float param_10=Output_N120;
float param_11=Output_N55;
float param_12=Output_N0;
float3 param_13=float3(0.0);
N7_objCoord=param_8;
N7_frameHeight=param_9;
N7_depthScale=param_10;
N7_frameOffset=param_11;
N7_aspect=param_12;
float l9_122=((fast::max(N7_objCoord.z,-50.0)*N7_depthScale)+N7_frameOffset)+N7_depthScale;
float l9_123=l9_122;
int l9_124=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_124=0;
}
else
{
l9_124=gl_InstanceIndex%2;
}
int l9_125=l9_124;
float4x4 l9_126=(*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_125];
float4 l9_127=l9_126*float4(0.0,0.0,l9_123,1.0);
l9_127.z/=l9_127.w;
float2 l9_128=l9_127.zw;
float2 l9_129=l9_128;
float l9_130=N7_frameHeight;
float l9_131=N7_aspect;
float l9_132=N7_frameOffset;
float l9_133=l9_130/2.0;
float4 l9_134=float4(l9_131*l9_133,l9_133,l9_132,1.0);
int l9_135=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_135=0;
}
else
{
l9_135=gl_InstanceIndex%2;
}
int l9_136=l9_135;
float4x4 l9_137=(*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_136];
float4 l9_138=l9_137*l9_134;
float2 l9_139=l9_138.xy/float2(l9_138.w);
l9_138=float4(l9_139.x,l9_139.y,l9_138.z,l9_138.w);
float2 l9_140=l9_138.xy;
float2 l9_141=l9_140;
float l9_142=N7_frameHeight;
float l9_143=N7_aspect;
float l9_144=N7_frameOffset;
float l9_145=l9_142/2.0;
float4 l9_146=float4((-l9_143)*l9_145,-l9_145,l9_144,1.0);
int l9_147=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_147=0;
}
else
{
l9_147=gl_InstanceIndex%2;
}
int l9_148=l9_147;
float4x4 l9_149=(*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_148];
float4 l9_150=l9_149*l9_146;
float2 l9_151=l9_150.xy/float2(l9_150.w);
l9_150=float4(l9_151.x,l9_151.y,l9_150.z,l9_150.w);
float2 l9_152=l9_150.xy;
float2 l9_153=l9_152;
float2 l9_154=N7_objCoord.xy/float2(-N7_objCoord.z);
l9_154.x=(((l9_154.x+1.0)/2.0)*(l9_141.x-l9_153.x))+l9_153.x;
l9_154.y=(((l9_154.y+1.0)/2.0)*(l9_141.y-l9_153.y))+l9_153.y;
float4 l9_155=float4(l9_154,l9_129);
float4 l9_156=l9_155;
float3 l9_157=l9_156.xyz*l9_156.w;
l9_156=float4(l9_157.x,l9_157.y,l9_157.z,l9_156.w);
int l9_158=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_158=0;
}
else
{
l9_158=gl_InstanceIndex%2;
}
int l9_159=l9_158;
float4x4 l9_160=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_159];
l9_156=l9_160*l9_156;
l9_156.w=1.0;
float4x4 l9_161=(*sc_set0.UserUniforms).sc_ModelMatrix;
N7_world_out=(l9_161*l9_156).xyz;
param_13=N7_world_out;
world_out_N7=param_13;
float3 Value_N5=float3(0.0);
Value_N5=world_out_N7;
float3 VectorOut_N1=float3(0.0);
VectorOut_N1=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(Value_N5,1.0)).xyz;
float Value_N9=0.0;
Value_N9=Output_N55;
float3 Value_N70=float3(0.0);
Value_N70.x=(*sc_set0.UserUniforms).Port_Value1_N070;
Value_N70.y=(*sc_set0.UserUniforms).Port_Value2_N070;
Value_N70.z=Value_N9;
float3 Output_N69=float3(0.0);
Output_N69=VectorOut_N1-Value_N70;
float3 VectorOut_N13=float3(0.0);
VectorOut_N13=((*sc_set0.UserUniforms).sc_ModelMatrix*float4(Output_N69,1.0)).xyz;
float3 Export_N14=float3(0.0);
Export_N14=VectorOut_N13;
WorldPosition=Export_N14;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_14=v;
float3 param_15=WorldPosition;
float3 param_16=WorldNormal;
float3 param_17=WorldTangent;
float4 param_18=v.position;
out.varPos=param_15;
out.varNormal=normalize(param_16);
float3 l9_162=normalize(param_17);
out.varTangent=float4(l9_162.x,l9_162.y,l9_162.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_163=param_14.position;
float4 l9_164=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_165=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_165=0;
}
else
{
l9_165=gl_InstanceIndex%2;
}
int l9_166=l9_165;
l9_164=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_166]*l9_163;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_167=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_167=0;
}
else
{
l9_167=gl_InstanceIndex%2;
}
int l9_168=l9_167;
l9_164=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_168]*l9_163;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_169=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_169=0;
}
else
{
l9_169=gl_InstanceIndex%2;
}
int l9_170=l9_169;
l9_164=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_170]*l9_163;
}
else
{
l9_164=l9_163;
}
}
}
float4 l9_171=l9_164;
out.varViewSpaceDepth=-l9_171.z;
}
float4 l9_172=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_172=param_18;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_173=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_173=0;
}
else
{
l9_173=gl_InstanceIndex%2;
}
int l9_174=l9_173;
l9_172=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_174]*param_14.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_175=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_175=0;
}
else
{
l9_175=gl_InstanceIndex%2;
}
int l9_176=l9_175;
l9_172=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_176]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_177=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_177=0;
}
else
{
l9_177=gl_InstanceIndex%2;
}
int l9_178=l9_177;
l9_172=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_178]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_14.texture0,param_14.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_179=param_14.position;
float4 l9_180=l9_179;
if (sc_RenderingSpace_tmp==1)
{
l9_180=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_179;
}
float4 l9_181=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_180;
float2 l9_182=((l9_181.xy/float2(l9_181.w))*0.5)+float2(0.5);
out.varShadowTex=l9_182;
}
float4 l9_183=l9_172;
if (sc_DepthBufferMode_tmp==1)
{
int l9_184=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_184=0;
}
else
{
l9_184=gl_InstanceIndex%2;
}
int l9_185=l9_184;
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_185][2].w!=0.0)
{
float l9_186=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_183.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_183.w))*l9_186)-1.0)*l9_183.w;
}
}
float4 l9_187=l9_183;
l9_172=l9_187;
float4 l9_188=l9_172;
float4 l9_189=l9_188;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_189.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_190=l9_189;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_191=dot(l9_190,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_192=l9_191;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_192;
}
}
float4 l9_193=float4(l9_189.x,-l9_189.y,(l9_189.z*0.5)+(l9_189.w*0.5),l9_189.w);
out.gl_Position=l9_193;
v=param_14;
ssGlobals param_19=Globals;
float3 l9_195=float3(0.0);
float3 l9_196=float3(0.0);
l9_196=param_19.SurfacePosition_ObjectSpace;
l9_195=l9_196;
out.Interpolator0.x=l9_195.x;
out.Interpolator0.y=l9_195.y;
out.Interpolator0.z=l9_195.z;
out.Interpolator_gStereoViewIndex=Globals.gStereoViewIndex;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float2 Surface_UVCoord0;
float gStereoViewIndex;
};
struct sc_PointLight_t
{
int falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
};
struct sc_DirectionalLight_t
{
float3 direction;
float4 color;
};
struct sc_AmbientLight_t
{
float3 color;
float intensity;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct sc_LightEstimationData_t
{
sc_SphericalGaussianLight_t sg[12];
float3 ambientLight;
};
struct sc_Camera_t
{
float3 position;
float aspect;
float2 clipPlanes;
};
struct userUniformsObj
{
sc_PointLight_t sc_PointLights[3];
sc_DirectionalLight_t sc_DirectionalLights[5];
sc_AmbientLight_t sc_AmbientLights[3];
sc_LightEstimationData_t sc_LightEstimationData;
float4 sc_EnvmapDiffuseSize;
float4 sc_EnvmapDiffuseDims;
float4 sc_EnvmapDiffuseView;
float4 sc_EnvmapSpecularSize;
float4 sc_EnvmapSpecularDims;
float4 sc_EnvmapSpecularView;
float3 sc_EnvmapRotation;
float sc_EnvmapExposure;
float3 sc_Sh[9];
float sc_ShIntensity;
float4 sc_Time;
float4 sc_UniformConstants;
float4 sc_GeometryInfo;
float4x4 sc_ModelViewProjectionMatrixArray[2];
float4x4 sc_ModelViewProjectionMatrixInverseArray[2];
float4x4 sc_ViewProjectionMatrixArray[2];
float4x4 sc_ViewProjectionMatrixInverseArray[2];
float4x4 sc_ModelViewMatrixArray[2];
float4x4 sc_ModelViewMatrixInverseArray[2];
float3x3 sc_ViewNormalMatrixArray[2];
float3x3 sc_ViewNormalMatrixInverseArray[2];
float4x4 sc_ProjectionMatrixArray[2];
float4x4 sc_ProjectionMatrixInverseArray[2];
float4x4 sc_ViewMatrixArray[2];
float4x4 sc_ViewMatrixInverseArray[2];
float4x4 sc_PrevFrameViewProjectionMatrixArray[2];
float4x4 sc_ModelMatrix;
float4x4 sc_ModelMatrixInverse;
float3x3 sc_NormalMatrix;
float3x3 sc_NormalMatrixInverse;
float4x4 sc_PrevFrameModelMatrix;
float4x4 sc_PrevFrameModelMatrixInverse;
float3 sc_LocalAabbMin;
float3 sc_LocalAabbMax;
float3 sc_WorldAabbMin;
float3 sc_WorldAabbMax;
float4 sc_WindowToViewportTransform;
float4 sc_CurrentRenderTargetDims;
sc_Camera_t sc_Camera;
float sc_ShadowDensity;
float4 sc_ShadowColor;
float4x4 sc_ProjectorMatrix;
float _sc_GetFramebufferColorInvalidUsageMarker;
float shaderComplexityValue;
float sc_DisableFrustumCullingMarker;
float4 weights0;
float4 weights1;
float4 weights2;
float4 sc_StereoClipPlanes[2];
int sc_FallbackInstanceID;
float _sc_framebufferFetchMarker;
float2 sc_TAAJitterOffset;
float strandWidth;
float strandTaper;
float4 sc_StrandDataMapTextureSize;
float clumpInstanceCount;
float clumpRadius;
float clumpTipScale;
float hairstyleInstanceCount;
float hairstyleNoise;
float4 sc_ScreenTextureSize;
float4 sc_ScreenTextureDims;
float4 sc_ScreenTextureView;
float correctedIntensity;
float4 intensityTextureSize;
float4 intensityTextureDims;
float4 intensityTextureView;
float3x3 intensityTextureTransform;
float4 intensityTextureUvMinMax;
float4 intensityTextureBorderColor;
float reflBlurWidth;
float reflBlurMinRough;
float reflBlurMaxRough;
int overrideTimeEnabled;
float overrideTimeElapsed;
float overrideTimeDelta;
int PreviewEnabled;
int PreviewNodeID;
float alphaTestThreshold;
float frameHeight;
float depthScale;
float frameOffset;
float aspectRatio;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
int fadeBorder;
int frameOn;
float fadeSpeed;
float cornerRadius;
float3 Port_Import_N005;
float Port_Value1_N070;
float Port_Value2_N070;
float Port_Import_N009;
float Port_Import_N117;
float3 Port_Import_N111;
float Port_Import_N030;
float Port_eyeOffset_N060;
float3 Port_Import_N006;
float3 Port_Import_N129;
float2 Port_Import_N112;
float Port_Import_N041;
float Port_Import_N040;
float Port_Input1_N037;
float2 Port_Import_N109;
float Port_Default_N045;
float Port_Import_N027;
float Port_Default_N116;
float3 Port_Import_N048;
float Port_Input1_N033;
float2 Port_Import_N131;
float2 Port_Import_N024;
float2 Port_Import_N026;
float2 Port_Import_N025;
float Port_Import_N064;
};
struct ssPreviewInfo
{
float4 Color;
bool Saved;
};
struct sc_Bone_t
{
float4 boneMatrix[3];
float4 normalMatrix[3];
};
struct sc_Bones_obj
{
sc_Bone_t sc_Bones[1];
};
struct sc_Set0
{
constant sc_Bones_obj* sc_BonesUBO [[id(0)]];
texture2d<float> baseTex [[id(1)]];
texture2d<float> intensityTexture [[id(2)]];
texture2d<float> sc_ScreenTexture [[id(14)]];
sampler baseTexSmpSC [[id(17)]];
sampler intensityTextureSmpSC [[id(18)]];
sampler sc_ScreenTextureSmpSC [[id(23)]];
constant userUniformsObj* UserUniforms [[id(26)]];
};
struct main_frag_out
{
float4 FragColor0 [[color(0)]];
float4 FragColor1 [[color(1)]];
float4 FragColor2 [[color(2)]];
float4 FragColor3 [[color(3)]];
};
struct main_frag_in
{
float3 varPos [[user(locn0)]];
float3 varNormal [[user(locn1)]];
float4 varTangent [[user(locn2)]];
float4 varPackedTex [[user(locn3)]];
float4 varScreenPos [[user(locn4)]];
float2 varScreenTexturePos [[user(locn5)]];
float varViewSpaceDepth [[user(locn6)]];
float2 varShadowTex [[user(locn7)]];
int varStereoViewID [[user(locn8)]];
float varClipDistance [[user(locn9)]];
float4 varColor [[user(locn10)]];
float4 PreviewVertexColor [[user(locn11)]];
float PreviewVertexSaved [[user(locn12)]];
float4 Interpolator0 [[user(locn13)]];
float Interpolator_gStereoViewIndex [[user(locn14)]];
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
float transformSingleColor(thread const float& original,thread const float& intMap,thread const float& target)
{
if (((int(BLEND_MODE_REALISTIC_tmp)!=0)||(int(BLEND_MODE_FORGRAY_tmp)!=0))||(int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
return original/pow(1.0-target,intMap);
}
else
{
if ((int(BLEND_MODE_DIVISION_tmp)!=0))
{
return original/(1.0-target);
}
else
{
if ((int(BLEND_MODE_BRIGHT_tmp)!=0))
{
return original/pow(1.0-target,2.0-(2.0*original));
}
}
}
return 0.0;
}
float3 transformColor(thread const float& yValue,thread const float3& original,thread const float3& target,thread const float& weight,thread const float& intMap)
{
if ((int(BLEND_MODE_INTENSE_tmp)!=0))
{
float3 param=original;
float3 l9_0=param;
float4 l9_1;
if (l9_0.y<l9_0.z)
{
l9_1=float4(l9_0.zy,-1.0,0.66666669);
}
else
{
l9_1=float4(l9_0.yz,0.0,-0.33333334);
}
float4 l9_2=l9_1;
float4 l9_3;
if (l9_0.x<l9_2.x)
{
l9_3=float4(l9_2.xyw,l9_0.x);
}
else
{
l9_3=float4(l9_0.x,l9_2.yzx);
}
float4 l9_4=l9_3;
float l9_5=l9_4.x-fast::min(l9_4.w,l9_4.y);
float l9_6=abs(((l9_4.w-l9_4.y)/((6.0*l9_5)+1e-07))+l9_4.z);
float l9_7=l9_4.x;
float3 l9_8=float3(l9_6,l9_5,l9_7);
float3 l9_9=l9_8;
float l9_10=l9_9.z-(l9_9.y*0.5);
float l9_11=l9_9.y/((1.0-abs((2.0*l9_10)-1.0))+1e-07);
float3 l9_12=float3(l9_9.x,l9_11,l9_10);
float3 hslOrig=l9_12;
float3 res=float3(0.0);
res.x=target.x;
res.y=target.y;
res.z=hslOrig.z;
float3 param_1=res;
float l9_13=param_1.x;
float l9_14=abs((6.0*l9_13)-3.0)-1.0;
float l9_15=2.0-abs((6.0*l9_13)-2.0);
float l9_16=2.0-abs((6.0*l9_13)-4.0);
float3 l9_17=fast::clamp(float3(l9_14,l9_15,l9_16),float3(0.0),float3(1.0));
float3 l9_18=l9_17;
float l9_19=(1.0-abs((2.0*param_1.z)-1.0))*param_1.y;
l9_18=((l9_18-float3(0.5))*l9_19)+float3(param_1.z);
float3 l9_20=l9_18;
res=l9_20;
float3 resColor=mix(original,res,float3(weight));
return resColor;
}
else
{
float3 tmpColor=float3(0.0);
float param_2=yValue;
float param_3=intMap;
float param_4=target.x;
tmpColor.x=transformSingleColor(param_2,param_3,param_4);
float param_5=yValue;
float param_6=intMap;
float param_7=target.y;
tmpColor.y=transformSingleColor(param_5,param_6,param_7);
float param_8=yValue;
float param_9=intMap;
float param_10=target.z;
tmpColor.z=transformSingleColor(param_8,param_9,param_10);
tmpColor=fast::clamp(tmpColor,float3(0.0),float3(1.0));
float3 resColor_1=mix(original,tmpColor,float3(weight));
return resColor_1;
}
}
float3 definedBlend(thread const float3& a,thread const float3& b,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> intensityTexture,thread sampler intensityTextureSmpSC)
{
if ((int(BLEND_MODE_LIGHTEN_tmp)!=0))
{
return fast::max(a,b);
}
else
{
if ((int(BLEND_MODE_DARKEN_tmp)!=0))
{
return fast::min(a,b);
}
else
{
if ((int(BLEND_MODE_DIVIDE_tmp)!=0))
{
return b/a;
}
else
{
if ((int(BLEND_MODE_AVERAGE_tmp)!=0))
{
return (a+b)*0.5;
}
else
{
if ((int(BLEND_MODE_SUBTRACT_tmp)!=0))
{
return fast::max((a+b)-float3(1.0),float3(0.0));
}
else
{
if ((int(BLEND_MODE_DIFFERENCE_tmp)!=0))
{
return abs(a-b);
}
else
{
if ((int(BLEND_MODE_NEGATION_tmp)!=0))
{
return float3(1.0)-abs((float3(1.0)-a)-b);
}
else
{
if ((int(BLEND_MODE_EXCLUSION_tmp)!=0))
{
return (a+b)-((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_OVERLAY_tmp)!=0))
{
float l9_0;
if (a.x<0.5)
{
l9_0=(2.0*a.x)*b.x;
}
else
{
l9_0=1.0-((2.0*(1.0-a.x))*(1.0-b.x));
}
float l9_1=l9_0;
float l9_2;
if (a.y<0.5)
{
l9_2=(2.0*a.y)*b.y;
}
else
{
l9_2=1.0-((2.0*(1.0-a.y))*(1.0-b.y));
}
float l9_3=l9_2;
float l9_4;
if (a.z<0.5)
{
l9_4=(2.0*a.z)*b.z;
}
else
{
l9_4=1.0-((2.0*(1.0-a.z))*(1.0-b.z));
}
return float3(l9_1,l9_3,l9_4);
}
else
{
if ((int(BLEND_MODE_SOFT_LIGHT_tmp)!=0))
{
return (((float3(1.0)-(b*2.0))*a)*a)+((a*2.0)*b);
}
else
{
if ((int(BLEND_MODE_HARD_LIGHT_tmp)!=0))
{
float l9_5;
if (b.x<0.5)
{
l9_5=(2.0*b.x)*a.x;
}
else
{
l9_5=1.0-((2.0*(1.0-b.x))*(1.0-a.x));
}
float l9_6=l9_5;
float l9_7;
if (b.y<0.5)
{
l9_7=(2.0*b.y)*a.y;
}
else
{
l9_7=1.0-((2.0*(1.0-b.y))*(1.0-a.y));
}
float l9_8=l9_7;
float l9_9;
if (b.z<0.5)
{
l9_9=(2.0*b.z)*a.z;
}
else
{
l9_9=1.0-((2.0*(1.0-b.z))*(1.0-a.z));
}
return float3(l9_6,l9_8,l9_9);
}
else
{
if ((int(BLEND_MODE_COLOR_DODGE_tmp)!=0))
{
float l9_10;
if (b.x==1.0)
{
l9_10=b.x;
}
else
{
l9_10=fast::min(a.x/(1.0-b.x),1.0);
}
float l9_11=l9_10;
float l9_12;
if (b.y==1.0)
{
l9_12=b.y;
}
else
{
l9_12=fast::min(a.y/(1.0-b.y),1.0);
}
float l9_13=l9_12;
float l9_14;
if (b.z==1.0)
{
l9_14=b.z;
}
else
{
l9_14=fast::min(a.z/(1.0-b.z),1.0);
}
return float3(l9_11,l9_13,l9_14);
}
else
{
if ((int(BLEND_MODE_COLOR_BURN_tmp)!=0))
{
float l9_15;
if (b.x==0.0)
{
l9_15=b.x;
}
else
{
l9_15=fast::max(1.0-((1.0-a.x)/b.x),0.0);
}
float l9_16=l9_15;
float l9_17;
if (b.y==0.0)
{
l9_17=b.y;
}
else
{
l9_17=fast::max(1.0-((1.0-a.y)/b.y),0.0);
}
float l9_18=l9_17;
float l9_19;
if (b.z==0.0)
{
l9_19=b.z;
}
else
{
l9_19=fast::max(1.0-((1.0-a.z)/b.z),0.0);
}
return float3(l9_16,l9_18,l9_19);
}
else
{
if ((int(BLEND_MODE_LINEAR_LIGHT_tmp)!=0))
{
float l9_20;
if (b.x<0.5)
{
l9_20=fast::max((a.x+(2.0*b.x))-1.0,0.0);
}
else
{
l9_20=fast::min(a.x+(2.0*(b.x-0.5)),1.0);
}
float l9_21=l9_20;
float l9_22;
if (b.y<0.5)
{
l9_22=fast::max((a.y+(2.0*b.y))-1.0,0.0);
}
else
{
l9_22=fast::min(a.y+(2.0*(b.y-0.5)),1.0);
}
float l9_23=l9_22;
float l9_24;
if (b.z<0.5)
{
l9_24=fast::max((a.z+(2.0*b.z))-1.0,0.0);
}
else
{
l9_24=fast::min(a.z+(2.0*(b.z-0.5)),1.0);
}
return float3(l9_21,l9_23,l9_24);
}
else
{
if ((int(BLEND_MODE_VIVID_LIGHT_tmp)!=0))
{
float l9_25;
if (b.x<0.5)
{
float l9_26;
if ((2.0*b.x)==0.0)
{
l9_26=2.0*b.x;
}
else
{
l9_26=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_25=l9_26;
}
else
{
float l9_27;
if ((2.0*(b.x-0.5))==1.0)
{
l9_27=2.0*(b.x-0.5);
}
else
{
l9_27=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_25=l9_27;
}
float l9_28=l9_25;
float l9_29;
if (b.y<0.5)
{
float l9_30;
if ((2.0*b.y)==0.0)
{
l9_30=2.0*b.y;
}
else
{
l9_30=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_29=l9_30;
}
else
{
float l9_31;
if ((2.0*(b.y-0.5))==1.0)
{
l9_31=2.0*(b.y-0.5);
}
else
{
l9_31=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_29=l9_31;
}
float l9_32=l9_29;
float l9_33;
if (b.z<0.5)
{
float l9_34;
if ((2.0*b.z)==0.0)
{
l9_34=2.0*b.z;
}
else
{
l9_34=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_33=l9_34;
}
else
{
float l9_35;
if ((2.0*(b.z-0.5))==1.0)
{
l9_35=2.0*(b.z-0.5);
}
else
{
l9_35=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_33=l9_35;
}
return float3(l9_28,l9_32,l9_33);
}
else
{
if ((int(BLEND_MODE_PIN_LIGHT_tmp)!=0))
{
float l9_36;
if (b.x<0.5)
{
l9_36=fast::min(a.x,2.0*b.x);
}
else
{
l9_36=fast::max(a.x,2.0*(b.x-0.5));
}
float l9_37=l9_36;
float l9_38;
if (b.y<0.5)
{
l9_38=fast::min(a.y,2.0*b.y);
}
else
{
l9_38=fast::max(a.y,2.0*(b.y-0.5));
}
float l9_39=l9_38;
float l9_40;
if (b.z<0.5)
{
l9_40=fast::min(a.z,2.0*b.z);
}
else
{
l9_40=fast::max(a.z,2.0*(b.z-0.5));
}
return float3(l9_37,l9_39,l9_40);
}
else
{
if ((int(BLEND_MODE_HARD_MIX_tmp)!=0))
{
float l9_41;
if (b.x<0.5)
{
float l9_42;
if ((2.0*b.x)==0.0)
{
l9_42=2.0*b.x;
}
else
{
l9_42=fast::max(1.0-((1.0-a.x)/(2.0*b.x)),0.0);
}
l9_41=l9_42;
}
else
{
float l9_43;
if ((2.0*(b.x-0.5))==1.0)
{
l9_43=2.0*(b.x-0.5);
}
else
{
l9_43=fast::min(a.x/(1.0-(2.0*(b.x-0.5))),1.0);
}
l9_41=l9_43;
}
float l9_44=l9_41;
float l9_45;
if (b.y<0.5)
{
float l9_46;
if ((2.0*b.y)==0.0)
{
l9_46=2.0*b.y;
}
else
{
l9_46=fast::max(1.0-((1.0-a.y)/(2.0*b.y)),0.0);
}
l9_45=l9_46;
}
else
{
float l9_47;
if ((2.0*(b.y-0.5))==1.0)
{
l9_47=2.0*(b.y-0.5);
}
else
{
l9_47=fast::min(a.y/(1.0-(2.0*(b.y-0.5))),1.0);
}
l9_45=l9_47;
}
float l9_48=l9_45;
float l9_49;
if (b.z<0.5)
{
float l9_50;
if ((2.0*b.z)==0.0)
{
l9_50=2.0*b.z;
}
else
{
l9_50=fast::max(1.0-((1.0-a.z)/(2.0*b.z)),0.0);
}
l9_49=l9_50;
}
else
{
float l9_51;
if ((2.0*(b.z-0.5))==1.0)
{
l9_51=2.0*(b.z-0.5);
}
else
{
l9_51=fast::min(a.z/(1.0-(2.0*(b.z-0.5))),1.0);
}
l9_49=l9_51;
}
return float3((l9_44<0.5) ? 0.0 : 1.0,(l9_48<0.5) ? 0.0 : 1.0,(l9_49<0.5) ? 0.0 : 1.0);
}
else
{
if ((int(BLEND_MODE_HARD_REFLECT_tmp)!=0))
{
float l9_52;
if (b.x==1.0)
{
l9_52=b.x;
}
else
{
l9_52=fast::min((a.x*a.x)/(1.0-b.x),1.0);
}
float l9_53=l9_52;
float l9_54;
if (b.y==1.0)
{
l9_54=b.y;
}
else
{
l9_54=fast::min((a.y*a.y)/(1.0-b.y),1.0);
}
float l9_55=l9_54;
float l9_56;
if (b.z==1.0)
{
l9_56=b.z;
}
else
{
l9_56=fast::min((a.z*a.z)/(1.0-b.z),1.0);
}
return float3(l9_53,l9_55,l9_56);
}
else
{
if ((int(BLEND_MODE_HARD_GLOW_tmp)!=0))
{
float l9_57;
if (a.x==1.0)
{
l9_57=a.x;
}
else
{
l9_57=fast::min((b.x*b.x)/(1.0-a.x),1.0);
}
float l9_58=l9_57;
float l9_59;
if (a.y==1.0)
{
l9_59=a.y;
}
else
{
l9_59=fast::min((b.y*b.y)/(1.0-a.y),1.0);
}
float l9_60=l9_59;
float l9_61;
if (a.z==1.0)
{
l9_61=a.z;
}
else
{
l9_61=fast::min((b.z*b.z)/(1.0-a.z),1.0);
}
return float3(l9_58,l9_60,l9_61);
}
else
{
if ((int(BLEND_MODE_HARD_PHOENIX_tmp)!=0))
{
return (fast::min(a,b)-fast::max(a,b))+float3(1.0);
}
else
{
if ((int(BLEND_MODE_HUE_tmp)!=0))
{
float3 param=a;
float3 param_1=b;
float3 l9_62=param;
float3 l9_63=l9_62;
float4 l9_64;
if (l9_63.y<l9_63.z)
{
l9_64=float4(l9_63.zy,-1.0,0.66666669);
}
else
{
l9_64=float4(l9_63.yz,0.0,-0.33333334);
}
float4 l9_65=l9_64;
float4 l9_66;
if (l9_63.x<l9_65.x)
{
l9_66=float4(l9_65.xyw,l9_63.x);
}
else
{
l9_66=float4(l9_63.x,l9_65.yzx);
}
float4 l9_67=l9_66;
float l9_68=l9_67.x-fast::min(l9_67.w,l9_67.y);
float l9_69=abs(((l9_67.w-l9_67.y)/((6.0*l9_68)+1e-07))+l9_67.z);
float l9_70=l9_67.x;
float3 l9_71=float3(l9_69,l9_68,l9_70);
float3 l9_72=l9_71;
float l9_73=l9_72.z-(l9_72.y*0.5);
float l9_74=l9_72.y/((1.0-abs((2.0*l9_73)-1.0))+1e-07);
float3 l9_75=float3(l9_72.x,l9_74,l9_73);
float3 l9_76=l9_75;
float3 l9_77=param_1;
float3 l9_78=l9_77;
float4 l9_79;
if (l9_78.y<l9_78.z)
{
l9_79=float4(l9_78.zy,-1.0,0.66666669);
}
else
{
l9_79=float4(l9_78.yz,0.0,-0.33333334);
}
float4 l9_80=l9_79;
float4 l9_81;
if (l9_78.x<l9_80.x)
{
l9_81=float4(l9_80.xyw,l9_78.x);
}
else
{
l9_81=float4(l9_78.x,l9_80.yzx);
}
float4 l9_82=l9_81;
float l9_83=l9_82.x-fast::min(l9_82.w,l9_82.y);
float l9_84=abs(((l9_82.w-l9_82.y)/((6.0*l9_83)+1e-07))+l9_82.z);
float l9_85=l9_82.x;
float3 l9_86=float3(l9_84,l9_83,l9_85);
float3 l9_87=l9_86;
float l9_88=l9_87.z-(l9_87.y*0.5);
float l9_89=l9_87.y/((1.0-abs((2.0*l9_88)-1.0))+1e-07);
float3 l9_90=float3(l9_87.x,l9_89,l9_88);
float3 l9_91=float3(l9_90.x,l9_76.y,l9_76.z);
float l9_92=l9_91.x;
float l9_93=abs((6.0*l9_92)-3.0)-1.0;
float l9_94=2.0-abs((6.0*l9_92)-2.0);
float l9_95=2.0-abs((6.0*l9_92)-4.0);
float3 l9_96=fast::clamp(float3(l9_93,l9_94,l9_95),float3(0.0),float3(1.0));
float3 l9_97=l9_96;
float l9_98=(1.0-abs((2.0*l9_91.z)-1.0))*l9_91.y;
l9_97=((l9_97-float3(0.5))*l9_98)+float3(l9_91.z);
float3 l9_99=l9_97;
float3 l9_100=l9_99;
return l9_100;
}
else
{
if ((int(BLEND_MODE_SATURATION_tmp)!=0))
{
float3 param_2=a;
float3 param_3=b;
float3 l9_101=param_2;
float3 l9_102=l9_101;
float4 l9_103;
if (l9_102.y<l9_102.z)
{
l9_103=float4(l9_102.zy,-1.0,0.66666669);
}
else
{
l9_103=float4(l9_102.yz,0.0,-0.33333334);
}
float4 l9_104=l9_103;
float4 l9_105;
if (l9_102.x<l9_104.x)
{
l9_105=float4(l9_104.xyw,l9_102.x);
}
else
{
l9_105=float4(l9_102.x,l9_104.yzx);
}
float4 l9_106=l9_105;
float l9_107=l9_106.x-fast::min(l9_106.w,l9_106.y);
float l9_108=abs(((l9_106.w-l9_106.y)/((6.0*l9_107)+1e-07))+l9_106.z);
float l9_109=l9_106.x;
float3 l9_110=float3(l9_108,l9_107,l9_109);
float3 l9_111=l9_110;
float l9_112=l9_111.z-(l9_111.y*0.5);
float l9_113=l9_111.y/((1.0-abs((2.0*l9_112)-1.0))+1e-07);
float3 l9_114=float3(l9_111.x,l9_113,l9_112);
float3 l9_115=l9_114;
float l9_116=l9_115.x;
float3 l9_117=param_3;
float3 l9_118=l9_117;
float4 l9_119;
if (l9_118.y<l9_118.z)
{
l9_119=float4(l9_118.zy,-1.0,0.66666669);
}
else
{
l9_119=float4(l9_118.yz,0.0,-0.33333334);
}
float4 l9_120=l9_119;
float4 l9_121;
if (l9_118.x<l9_120.x)
{
l9_121=float4(l9_120.xyw,l9_118.x);
}
else
{
l9_121=float4(l9_118.x,l9_120.yzx);
}
float4 l9_122=l9_121;
float l9_123=l9_122.x-fast::min(l9_122.w,l9_122.y);
float l9_124=abs(((l9_122.w-l9_122.y)/((6.0*l9_123)+1e-07))+l9_122.z);
float l9_125=l9_122.x;
float3 l9_126=float3(l9_124,l9_123,l9_125);
float3 l9_127=l9_126;
float l9_128=l9_127.z-(l9_127.y*0.5);
float l9_129=l9_127.y/((1.0-abs((2.0*l9_128)-1.0))+1e-07);
float3 l9_130=float3(l9_127.x,l9_129,l9_128);
float3 l9_131=float3(l9_116,l9_130.y,l9_115.z);
float l9_132=l9_131.x;
float l9_133=abs((6.0*l9_132)-3.0)-1.0;
float l9_134=2.0-abs((6.0*l9_132)-2.0);
float l9_135=2.0-abs((6.0*l9_132)-4.0);
float3 l9_136=fast::clamp(float3(l9_133,l9_134,l9_135),float3(0.0),float3(1.0));
float3 l9_137=l9_136;
float l9_138=(1.0-abs((2.0*l9_131.z)-1.0))*l9_131.y;
l9_137=((l9_137-float3(0.5))*l9_138)+float3(l9_131.z);
float3 l9_139=l9_137;
float3 l9_140=l9_139;
return l9_140;
}
else
{
if ((int(BLEND_MODE_COLOR_tmp)!=0))
{
float3 param_4=a;
float3 param_5=b;
float3 l9_141=param_5;
float3 l9_142=l9_141;
float4 l9_143;
if (l9_142.y<l9_142.z)
{
l9_143=float4(l9_142.zy,-1.0,0.66666669);
}
else
{
l9_143=float4(l9_142.yz,0.0,-0.33333334);
}
float4 l9_144=l9_143;
float4 l9_145;
if (l9_142.x<l9_144.x)
{
l9_145=float4(l9_144.xyw,l9_142.x);
}
else
{
l9_145=float4(l9_142.x,l9_144.yzx);
}
float4 l9_146=l9_145;
float l9_147=l9_146.x-fast::min(l9_146.w,l9_146.y);
float l9_148=abs(((l9_146.w-l9_146.y)/((6.0*l9_147)+1e-07))+l9_146.z);
float l9_149=l9_146.x;
float3 l9_150=float3(l9_148,l9_147,l9_149);
float3 l9_151=l9_150;
float l9_152=l9_151.z-(l9_151.y*0.5);
float l9_153=l9_151.y/((1.0-abs((2.0*l9_152)-1.0))+1e-07);
float3 l9_154=float3(l9_151.x,l9_153,l9_152);
float3 l9_155=l9_154;
float l9_156=l9_155.x;
float l9_157=l9_155.y;
float3 l9_158=param_4;
float3 l9_159=l9_158;
float4 l9_160;
if (l9_159.y<l9_159.z)
{
l9_160=float4(l9_159.zy,-1.0,0.66666669);
}
else
{
l9_160=float4(l9_159.yz,0.0,-0.33333334);
}
float4 l9_161=l9_160;
float4 l9_162;
if (l9_159.x<l9_161.x)
{
l9_162=float4(l9_161.xyw,l9_159.x);
}
else
{
l9_162=float4(l9_159.x,l9_161.yzx);
}
float4 l9_163=l9_162;
float l9_164=l9_163.x-fast::min(l9_163.w,l9_163.y);
float l9_165=abs(((l9_163.w-l9_163.y)/((6.0*l9_164)+1e-07))+l9_163.z);
float l9_166=l9_163.x;
float3 l9_167=float3(l9_165,l9_164,l9_166);
float3 l9_168=l9_167;
float l9_169=l9_168.z-(l9_168.y*0.5);
float l9_170=l9_168.y/((1.0-abs((2.0*l9_169)-1.0))+1e-07);
float3 l9_171=float3(l9_168.x,l9_170,l9_169);
float3 l9_172=float3(l9_156,l9_157,l9_171.z);
float l9_173=l9_172.x;
float l9_174=abs((6.0*l9_173)-3.0)-1.0;
float l9_175=2.0-abs((6.0*l9_173)-2.0);
float l9_176=2.0-abs((6.0*l9_173)-4.0);
float3 l9_177=fast::clamp(float3(l9_174,l9_175,l9_176),float3(0.0),float3(1.0));
float3 l9_178=l9_177;
float l9_179=(1.0-abs((2.0*l9_172.z)-1.0))*l9_172.y;
l9_178=((l9_178-float3(0.5))*l9_179)+float3(l9_172.z);
float3 l9_180=l9_178;
float3 l9_181=l9_180;
return l9_181;
}
else
{
if ((int(BLEND_MODE_LUMINOSITY_tmp)!=0))
{
float3 param_6=a;
float3 param_7=b;
float3 l9_182=param_6;
float3 l9_183=l9_182;
float4 l9_184;
if (l9_183.y<l9_183.z)
{
l9_184=float4(l9_183.zy,-1.0,0.66666669);
}
else
{
l9_184=float4(l9_183.yz,0.0,-0.33333334);
}
float4 l9_185=l9_184;
float4 l9_186;
if (l9_183.x<l9_185.x)
{
l9_186=float4(l9_185.xyw,l9_183.x);
}
else
{
l9_186=float4(l9_183.x,l9_185.yzx);
}
float4 l9_187=l9_186;
float l9_188=l9_187.x-fast::min(l9_187.w,l9_187.y);
float l9_189=abs(((l9_187.w-l9_187.y)/((6.0*l9_188)+1e-07))+l9_187.z);
float l9_190=l9_187.x;
float3 l9_191=float3(l9_189,l9_188,l9_190);
float3 l9_192=l9_191;
float l9_193=l9_192.z-(l9_192.y*0.5);
float l9_194=l9_192.y/((1.0-abs((2.0*l9_193)-1.0))+1e-07);
float3 l9_195=float3(l9_192.x,l9_194,l9_193);
float3 l9_196=l9_195;
float l9_197=l9_196.x;
float l9_198=l9_196.y;
float3 l9_199=param_7;
float3 l9_200=l9_199;
float4 l9_201;
if (l9_200.y<l9_200.z)
{
l9_201=float4(l9_200.zy,-1.0,0.66666669);
}
else
{
l9_201=float4(l9_200.yz,0.0,-0.33333334);
}
float4 l9_202=l9_201;
float4 l9_203;
if (l9_200.x<l9_202.x)
{
l9_203=float4(l9_202.xyw,l9_200.x);
}
else
{
l9_203=float4(l9_200.x,l9_202.yzx);
}
float4 l9_204=l9_203;
float l9_205=l9_204.x-fast::min(l9_204.w,l9_204.y);
float l9_206=abs(((l9_204.w-l9_204.y)/((6.0*l9_205)+1e-07))+l9_204.z);
float l9_207=l9_204.x;
float3 l9_208=float3(l9_206,l9_205,l9_207);
float3 l9_209=l9_208;
float l9_210=l9_209.z-(l9_209.y*0.5);
float l9_211=l9_209.y/((1.0-abs((2.0*l9_210)-1.0))+1e-07);
float3 l9_212=float3(l9_209.x,l9_211,l9_210);
float3 l9_213=float3(l9_197,l9_198,l9_212.z);
float l9_214=l9_213.x;
float l9_215=abs((6.0*l9_214)-3.0)-1.0;
float l9_216=2.0-abs((6.0*l9_214)-2.0);
float l9_217=2.0-abs((6.0*l9_214)-4.0);
float3 l9_218=fast::clamp(float3(l9_215,l9_216,l9_217),float3(0.0),float3(1.0));
float3 l9_219=l9_218;
float l9_220=(1.0-abs((2.0*l9_213.z)-1.0))*l9_213.y;
l9_219=((l9_219-float3(0.5))*l9_220)+float3(l9_213.z);
float3 l9_221=l9_219;
float3 l9_222=l9_221;
return l9_222;
}
else
{
float3 param_8=a;
float3 param_9=b;
float3 l9_223=param_8;
float l9_224=((0.29899999*l9_223.x)+(0.58700001*l9_223.y))+(0.114*l9_223.z);
float l9_225=l9_224;
float l9_226=1.0;
float l9_227=pow(l9_225,1.0/UserUniforms.correctedIntensity);
int l9_228=0;
if ((int(intensityTextureHasSwappedViews_tmp)!=0))
{
int l9_229=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_229=0;
}
else
{
l9_229=varStereoViewID;
}
int l9_230=l9_229;
l9_228=1-l9_230;
}
else
{
int l9_231=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_231=0;
}
else
{
l9_231=varStereoViewID;
}
int l9_232=l9_231;
l9_228=l9_232;
}
int l9_233=l9_228;
int l9_234=intensityTextureLayout_tmp;
int l9_235=l9_233;
float2 l9_236=float2(l9_227,0.5);
bool l9_237=(int(SC_USE_UV_TRANSFORM_intensityTexture_tmp)!=0);
float3x3 l9_238=UserUniforms.intensityTextureTransform;
int2 l9_239=int2(SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp,SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp);
bool l9_240=(int(SC_USE_UV_MIN_MAX_intensityTexture_tmp)!=0);
float4 l9_241=UserUniforms.intensityTextureUvMinMax;
bool l9_242=(int(SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp)!=0);
float4 l9_243=UserUniforms.intensityTextureBorderColor;
float l9_244=0.0;
bool l9_245=l9_242&&(!l9_240);
float l9_246=1.0;
float l9_247=l9_236.x;
int l9_248=l9_239.x;
if (l9_248==1)
{
l9_247=fract(l9_247);
}
else
{
if (l9_248==2)
{
float l9_249=fract(l9_247);
float l9_250=l9_247-l9_249;
float l9_251=step(0.25,fract(l9_250*0.5));
l9_247=mix(l9_249,1.0-l9_249,fast::clamp(l9_251,0.0,1.0));
}
}
l9_236.x=l9_247;
float l9_252=l9_236.y;
int l9_253=l9_239.y;
if (l9_253==1)
{
l9_252=fract(l9_252);
}
else
{
if (l9_253==2)
{
float l9_254=fract(l9_252);
float l9_255=l9_252-l9_254;
float l9_256=step(0.25,fract(l9_255*0.5));
l9_252=mix(l9_254,1.0-l9_254,fast::clamp(l9_256,0.0,1.0));
}
}
l9_236.y=l9_252;
if (l9_240)
{
bool l9_257=l9_242;
bool l9_258;
if (l9_257)
{
l9_258=l9_239.x==3;
}
else
{
l9_258=l9_257;
}
float l9_259=l9_236.x;
float l9_260=l9_241.x;
float l9_261=l9_241.z;
bool l9_262=l9_258;
float l9_263=l9_246;
float l9_264=fast::clamp(l9_259,l9_260,l9_261);
float l9_265=step(abs(l9_259-l9_264),9.9999997e-06);
l9_263*=(l9_265+((1.0-float(l9_262))*(1.0-l9_265)));
l9_259=l9_264;
l9_236.x=l9_259;
l9_246=l9_263;
bool l9_266=l9_242;
bool l9_267;
if (l9_266)
{
l9_267=l9_239.y==3;
}
else
{
l9_267=l9_266;
}
float l9_268=l9_236.y;
float l9_269=l9_241.y;
float l9_270=l9_241.w;
bool l9_271=l9_267;
float l9_272=l9_246;
float l9_273=fast::clamp(l9_268,l9_269,l9_270);
float l9_274=step(abs(l9_268-l9_273),9.9999997e-06);
l9_272*=(l9_274+((1.0-float(l9_271))*(1.0-l9_274)));
l9_268=l9_273;
l9_236.y=l9_268;
l9_246=l9_272;
}
float2 l9_275=l9_236;
bool l9_276=l9_237;
float3x3 l9_277=l9_238;
if (l9_276)
{
l9_275=float2((l9_277*float3(l9_275,1.0)).xy);
}
float2 l9_278=l9_275;
float2 l9_279=l9_278;
float2 l9_280=l9_279;
l9_236=l9_280;
float l9_281=l9_236.x;
int l9_282=l9_239.x;
bool l9_283=l9_245;
float l9_284=l9_246;
if ((l9_282==0)||(l9_282==3))
{
float l9_285=l9_281;
float l9_286=0.0;
float l9_287=1.0;
bool l9_288=l9_283;
float l9_289=l9_284;
float l9_290=fast::clamp(l9_285,l9_286,l9_287);
float l9_291=step(abs(l9_285-l9_290),9.9999997e-06);
l9_289*=(l9_291+((1.0-float(l9_288))*(1.0-l9_291)));
l9_285=l9_290;
l9_281=l9_285;
l9_284=l9_289;
}
l9_236.x=l9_281;
l9_246=l9_284;
float l9_292=l9_236.y;
int l9_293=l9_239.y;
bool l9_294=l9_245;
float l9_295=l9_246;
if ((l9_293==0)||(l9_293==3))
{
float l9_296=l9_292;
float l9_297=0.0;
float l9_298=1.0;
bool l9_299=l9_294;
float l9_300=l9_295;
float l9_301=fast::clamp(l9_296,l9_297,l9_298);
float l9_302=step(abs(l9_296-l9_301),9.9999997e-06);
l9_300*=(l9_302+((1.0-float(l9_299))*(1.0-l9_302)));
l9_296=l9_301;
l9_292=l9_296;
l9_295=l9_300;
}
l9_236.y=l9_292;
l9_246=l9_295;
float2 l9_303=l9_236;
int l9_304=l9_234;
int l9_305=l9_235;
float l9_306=l9_244;
float2 l9_307=l9_303;
int l9_308=l9_304;
int l9_309=l9_305;
float3 l9_310=float3(0.0);
if (l9_308==0)
{
l9_310=float3(l9_307,0.0);
}
else
{
if (l9_308==1)
{
l9_310=float3(l9_307.x,(l9_307.y*0.5)+(0.5-(float(l9_309)*0.5)),0.0);
}
else
{
l9_310=float3(l9_307,float(l9_309));
}
}
float3 l9_311=l9_310;
float3 l9_312=l9_311;
float2 l9_313=l9_312.xy;
float l9_314=l9_306;
float4 l9_315=intensityTexture.sample(intensityTextureSmpSC,l9_313,bias(l9_314));
float4 l9_316=l9_315;
float4 l9_317=l9_316;
if (l9_242)
{
l9_317=mix(l9_243,l9_317,float4(l9_246));
}
float4 l9_318=l9_317;
float3 l9_319=l9_318.xyz;
float3 l9_320=l9_319;
float l9_321=16.0;
float l9_322=((((l9_320.x*256.0)+l9_320.y)+(l9_320.z/256.0))/257.00391)*l9_321;
float l9_323=l9_322;
if ((int(BLEND_MODE_FORGRAY_tmp)!=0))
{
l9_323=fast::max(l9_323,1.0);
}
if ((int(BLEND_MODE_NOTBRIGHT_tmp)!=0))
{
l9_323=fast::min(l9_323,1.0);
}
float l9_324=l9_225;
float3 l9_325=param_8;
float3 l9_326=param_9;
float l9_327=l9_226;
float l9_328=l9_323;
float3 l9_329=transformColor(l9_324,l9_325,l9_326,l9_327,l9_328);
return l9_329;
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
float4 outputMotionVectorsIfNeeded(thread const float3& surfacePosWorldSpace,thread const float4& finalColor,thread int& varStereoViewID,constant userUniformsObj& UserUniforms)
{
if ((int(sc_MotionVectorsPass_tmp)!=0))
{
float3 param=surfacePosWorldSpace;
int l9_0=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_0=0;
}
else
{
l9_0=varStereoViewID;
}
int l9_1=l9_0;
float4 l9_2=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(param,1.0);
float2 l9_3=l9_2.xy/float2(l9_2.w);
l9_2=float4(l9_3.x,l9_3.y,l9_2.z,l9_2.w);
int l9_4=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4=0;
}
else
{
l9_4=varStereoViewID;
}
int l9_5=l9_4;
float4 l9_6=((UserUniforms.sc_PrevFrameViewProjectionMatrixArray[l9_5]*UserUniforms.sc_PrevFrameModelMatrix)*UserUniforms.sc_ModelMatrixInverse)*float4(param,1.0);
float2 l9_7=l9_6.xy/float2(l9_6.w);
l9_6=float4(l9_7.x,l9_7.y,l9_6.z,l9_6.w);
float2 l9_8=(l9_2.xy-l9_6.xy)*0.5;
float2 l9_9=l9_8;
float l9_10=(l9_9.x*5.0)+0.5;
float l9_11=floor(l9_10*65535.0);
float l9_12=floor(l9_11*0.00390625);
float2 l9_13=float2(l9_12/255.0,(l9_11-(l9_12*256.0))/255.0);
float l9_14=(l9_9.y*5.0)+0.5;
float l9_15=floor(l9_14*65535.0);
float l9_16=floor(l9_15*0.00390625);
float2 l9_17=float2(l9_16/255.0,(l9_15-(l9_16*256.0))/255.0);
float4 l9_18=float4(l9_13,l9_17);
float4 l9_19=l9_18;
return l9_19;
}
else
{
return finalColor;
}
}
fragment main_frag_out main_frag(main_frag_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_frag_out out={};
float3 N60_camCoordWorld=float3(0.0);
float N60_eyeOffset=0.0;
float3 N60_eyeCoordWorld=float3(0.0);
float3 N7_objCoord=float3(0.0);
float N7_frameHeight=0.0;
float N7_depthScale=0.0;
float N7_frameOffset=0.0;
float N7_aspect=0.0;
float3 N7_world_out=float3(0.0);
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
if ((sc_StereoRenderingMode_tmp==1)&&(sc_StereoRendering_IsClipDistanceEnabled_tmp==0))
{
if (in.varClipDistance<0.0)
{
discard_fragment();
}
}
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=in.PreviewVertexColor;
PreviewInfo.Saved=((in.PreviewVertexSaved*1.0)!=0.0) ? true : false;
float4 FinalColor=float4(1.0);
float l9_0;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_0=(*sc_set0.UserUniforms).overrideTimeElapsed;
}
else
{
l9_0=(*sc_set0.UserUniforms).sc_Time.x;
}
ssGlobals Globals;
Globals.gTimeElapsed=l9_0;
float l9_1;
if ((*sc_set0.UserUniforms).overrideTimeEnabled==1)
{
l9_1=(*sc_set0.UserUniforms).overrideTimeDelta;
}
else
{
l9_1=(*sc_set0.UserUniforms).sc_Time.y;
}
Globals.gTimeDelta=l9_1;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.gStereoViewIndex=in.Interpolator_gStereoViewIndex;
float2 UVCoord_N106=float2(0.0);
UVCoord_N106=Globals.Surface_UVCoord0;
float4 Color_N105=float4(0.0);
int l9_2=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_3=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3=0;
}
else
{
l9_3=in.varStereoViewID;
}
int l9_4=l9_3;
l9_2=1-l9_4;
}
else
{
int l9_5=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5=0;
}
else
{
l9_5=in.varStereoViewID;
}
int l9_6=l9_5;
l9_2=l9_6;
}
int l9_7=l9_2;
int param=baseTexLayout_tmp;
int param_1=l9_7;
float2 param_2=UVCoord_N106;
bool param_3=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 param_4=(*sc_set0.UserUniforms).baseTexTransform;
int2 param_5=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool param_6=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 param_7=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool param_8=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 param_9=(*sc_set0.UserUniforms).baseTexBorderColor;
float param_10=0.0;
bool l9_8=param_8&&(!param_6);
float l9_9=1.0;
float l9_10=param_2.x;
int l9_11=param_5.x;
if (l9_11==1)
{
l9_10=fract(l9_10);
}
else
{
if (l9_11==2)
{
float l9_12=fract(l9_10);
float l9_13=l9_10-l9_12;
float l9_14=step(0.25,fract(l9_13*0.5));
l9_10=mix(l9_12,1.0-l9_12,fast::clamp(l9_14,0.0,1.0));
}
}
param_2.x=l9_10;
float l9_15=param_2.y;
int l9_16=param_5.y;
if (l9_16==1)
{
l9_15=fract(l9_15);
}
else
{
if (l9_16==2)
{
float l9_17=fract(l9_15);
float l9_18=l9_15-l9_17;
float l9_19=step(0.25,fract(l9_18*0.5));
l9_15=mix(l9_17,1.0-l9_17,fast::clamp(l9_19,0.0,1.0));
}
}
param_2.y=l9_15;
if (param_6)
{
bool l9_20=param_8;
bool l9_21;
if (l9_20)
{
l9_21=param_5.x==3;
}
else
{
l9_21=l9_20;
}
float l9_22=param_2.x;
float l9_23=param_7.x;
float l9_24=param_7.z;
bool l9_25=l9_21;
float l9_26=l9_9;
float l9_27=fast::clamp(l9_22,l9_23,l9_24);
float l9_28=step(abs(l9_22-l9_27),9.9999997e-06);
l9_26*=(l9_28+((1.0-float(l9_25))*(1.0-l9_28)));
l9_22=l9_27;
param_2.x=l9_22;
l9_9=l9_26;
bool l9_29=param_8;
bool l9_30;
if (l9_29)
{
l9_30=param_5.y==3;
}
else
{
l9_30=l9_29;
}
float l9_31=param_2.y;
float l9_32=param_7.y;
float l9_33=param_7.w;
bool l9_34=l9_30;
float l9_35=l9_9;
float l9_36=fast::clamp(l9_31,l9_32,l9_33);
float l9_37=step(abs(l9_31-l9_36),9.9999997e-06);
l9_35*=(l9_37+((1.0-float(l9_34))*(1.0-l9_37)));
l9_31=l9_36;
param_2.y=l9_31;
l9_9=l9_35;
}
float2 l9_38=param_2;
bool l9_39=param_3;
float3x3 l9_40=param_4;
if (l9_39)
{
l9_38=float2((l9_40*float3(l9_38,1.0)).xy);
}
float2 l9_41=l9_38;
float2 l9_42=l9_41;
float2 l9_43=l9_42;
param_2=l9_43;
float l9_44=param_2.x;
int l9_45=param_5.x;
bool l9_46=l9_8;
float l9_47=l9_9;
if ((l9_45==0)||(l9_45==3))
{
float l9_48=l9_44;
float l9_49=0.0;
float l9_50=1.0;
bool l9_51=l9_46;
float l9_52=l9_47;
float l9_53=fast::clamp(l9_48,l9_49,l9_50);
float l9_54=step(abs(l9_48-l9_53),9.9999997e-06);
l9_52*=(l9_54+((1.0-float(l9_51))*(1.0-l9_54)));
l9_48=l9_53;
l9_44=l9_48;
l9_47=l9_52;
}
param_2.x=l9_44;
l9_9=l9_47;
float l9_55=param_2.y;
int l9_56=param_5.y;
bool l9_57=l9_8;
float l9_58=l9_9;
if ((l9_56==0)||(l9_56==3))
{
float l9_59=l9_55;
float l9_60=0.0;
float l9_61=1.0;
bool l9_62=l9_57;
float l9_63=l9_58;
float l9_64=fast::clamp(l9_59,l9_60,l9_61);
float l9_65=step(abs(l9_59-l9_64),9.9999997e-06);
l9_63*=(l9_65+((1.0-float(l9_62))*(1.0-l9_65)));
l9_59=l9_64;
l9_55=l9_59;
l9_58=l9_63;
}
param_2.y=l9_55;
l9_9=l9_58;
float2 l9_66=param_2;
int l9_67=param;
int l9_68=param_1;
float l9_69=param_10;
float2 l9_70=l9_66;
int l9_71=l9_67;
int l9_72=l9_68;
float3 l9_73=float3(0.0);
if (l9_71==0)
{
l9_73=float3(l9_70,0.0);
}
else
{
if (l9_71==1)
{
l9_73=float3(l9_70.x,(l9_70.y*0.5)+(0.5-(float(l9_72)*0.5)),0.0);
}
else
{
l9_73=float3(l9_70,float(l9_72));
}
}
float3 l9_74=l9_73;
float3 l9_75=l9_74;
float2 l9_76=l9_75.xy;
float l9_77=l9_69;
float4 l9_78=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_76,bias(l9_77));
float4 l9_79=l9_78;
float4 l9_80=l9_79;
if (param_8)
{
l9_80=mix(param_9,l9_80,float4(l9_9));
}
float4 l9_81=l9_80;
Color_N105=l9_81;
float3 Output_N107=float3(0.0);
Output_N107=float3(Color_N105.x,Color_N105.y,Color_N105.z);
float Result_N116=0.0;
float param_11=0.0;
float param_12=0.0;
float param_13=(*sc_set0.UserUniforms).Port_Default_N116;
ssGlobals param_15=Globals;
float l9_82=0.0;
float l9_83=float((*sc_set0.UserUniforms).fadeBorder!=0);
l9_82=l9_83;
float l9_84=0.0;
l9_84=fast::clamp(l9_82,0.0,1.0);
param_11=l9_84;
ssGlobals tempGlobals;
float param_14;
if ((param_11*1.0)!=0.0)
{
float3 l9_85=float3(0.0);
float3 l9_86;
l9_86.x=in.Interpolator0.x;
l9_86.y=in.Interpolator0.y;
l9_86.z=in.Interpolator0.z;
l9_85=l9_86;
float3 l9_87=float3(0.0);
l9_87=l9_85;
float3 l9_88=float3(0.0);
l9_88=abs(l9_87);
float2 l9_89=float2(0.0);
float l9_90=0.0;
float3 l9_91=l9_88;
float2 l9_92=l9_91.xy;
float l9_93=l9_91.z;
l9_89=l9_92;
l9_90=l9_93;
float2 l9_94=float2(0.0);
l9_94=l9_89/(float2(l9_90)+float2(1.234e-06));
float l9_95=0.0;
float l9_96=0.0;
float2 l9_97=l9_94;
float l9_98=l9_97.x;
float l9_99=l9_97.y;
l9_95=l9_98;
l9_96=l9_99;
float l9_100=0.0;
float l9_101=0.0;
float l9_102=0.0;
float l9_103=(*sc_set0.UserUniforms).Port_Default_N045;
ssGlobals l9_104=param_15;
float l9_105=0.0;
float l9_106=float((*sc_set0.UserUniforms).frameOn!=0);
l9_105=l9_106;
float l9_107=0.0;
l9_107=l9_105;
l9_101=l9_107;
float l9_108;
if ((l9_101*1.0)!=0.0)
{
float3 l9_109=float3(0.0);
l9_109=(*sc_set0.UserUniforms).sc_Camera.position;
float3 l9_110=float3(0.0);
float3 l9_111=l9_109;
float l9_112=(*sc_set0.UserUniforms).Port_eyeOffset_N060;
ssGlobals l9_113=l9_104;
tempGlobals=l9_113;
float3 l9_114=float3(0.0);
N60_camCoordWorld=l9_111;
N60_eyeOffset=l9_112;
int l9_115=int(tempGlobals.gStereoViewIndex);
float l9_116=(float(l9_115)-0.5)*2.0;
float3 l9_117=N60_camCoordWorld;
int l9_118=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_118=0;
}
else
{
l9_118=in.varStereoViewID;
}
int l9_119=l9_118;
float3 l9_120=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_119][0].xyz;
l9_117+=((l9_120*l9_116)*N60_eyeOffset);
N60_eyeCoordWorld=l9_117;
l9_114=N60_eyeCoordWorld;
l9_110=l9_114;
float3 l9_121=float3(0.0);
l9_121=l9_110;
float3 l9_122=float3(0.0);
l9_122=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(l9_121,1.0)).xyz;
float3 l9_123=float3(0.0);
float3 l9_124;
l9_124.x=in.Interpolator0.x;
l9_124.y=in.Interpolator0.y;
l9_124.z=in.Interpolator0.z;
l9_123=l9_124;
float l9_125=0.0;
float l9_126=(*sc_set0.UserUniforms).frameHeight;
l9_125=l9_126;
float l9_127=0.0;
float l9_128=(*sc_set0.UserUniforms).depthScale;
l9_127=l9_128;
float l9_129=0.0;
float l9_130=(*sc_set0.UserUniforms).frameOffset;
l9_129=l9_130;
float l9_131=0.0;
float l9_132=(*sc_set0.UserUniforms).aspectRatio;
l9_131=l9_132;
float3 l9_133=float3(0.0);
float3 l9_134=l9_123;
float l9_135=l9_125;
float l9_136=l9_127;
float l9_137=l9_129;
float l9_138=l9_131;
ssGlobals l9_139=l9_104;
tempGlobals=l9_139;
float3 l9_140=float3(0.0);
N7_objCoord=l9_134;
N7_frameHeight=l9_135;
N7_depthScale=l9_136;
N7_frameOffset=l9_137;
N7_aspect=l9_138;
float l9_141=((fast::max(N7_objCoord.z,-50.0)*N7_depthScale)+N7_frameOffset)+N7_depthScale;
float l9_142=l9_141;
int l9_143=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_143=0;
}
else
{
l9_143=in.varStereoViewID;
}
int l9_144=l9_143;
float4x4 l9_145=(*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_144];
float4 l9_146=l9_145*float4(0.0,0.0,l9_142,1.0);
l9_146.z/=l9_146.w;
float2 l9_147=l9_146.zw;
float2 l9_148=l9_147;
float l9_149=N7_frameHeight;
float l9_150=N7_aspect;
float l9_151=N7_frameOffset;
float l9_152=l9_149/2.0;
float4 l9_153=float4(l9_150*l9_152,l9_152,l9_151,1.0);
int l9_154=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_154=0;
}
else
{
l9_154=in.varStereoViewID;
}
int l9_155=l9_154;
float4x4 l9_156=(*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_155];
float4 l9_157=l9_156*l9_153;
float2 l9_158=l9_157.xy/float2(l9_157.w);
l9_157=float4(l9_158.x,l9_158.y,l9_157.z,l9_157.w);
float2 l9_159=l9_157.xy;
float2 l9_160=l9_159;
float l9_161=N7_frameHeight;
float l9_162=N7_aspect;
float l9_163=N7_frameOffset;
float l9_164=l9_161/2.0;
float4 l9_165=float4((-l9_162)*l9_164,-l9_164,l9_163,1.0);
int l9_166=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_166=0;
}
else
{
l9_166=in.varStereoViewID;
}
int l9_167=l9_166;
float4x4 l9_168=(*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_167];
float4 l9_169=l9_168*l9_165;
float2 l9_170=l9_169.xy/float2(l9_169.w);
l9_169=float4(l9_170.x,l9_170.y,l9_169.z,l9_169.w);
float2 l9_171=l9_169.xy;
float2 l9_172=l9_171;
float2 l9_173=N7_objCoord.xy/float2(-N7_objCoord.z);
l9_173.x=(((l9_173.x+1.0)/2.0)*(l9_160.x-l9_172.x))+l9_172.x;
l9_173.y=(((l9_173.y+1.0)/2.0)*(l9_160.y-l9_172.y))+l9_172.y;
float4 l9_174=float4(l9_173,l9_148);
float4 l9_175=l9_174;
float3 l9_176=l9_175.xyz*l9_175.w;
l9_175=float4(l9_176.x,l9_176.y,l9_176.z,l9_175.w);
int l9_177=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_177=0;
}
else
{
l9_177=in.varStereoViewID;
}
int l9_178=l9_177;
float4x4 l9_179=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_178];
l9_175=l9_179*l9_175;
l9_175.w=1.0;
float4x4 l9_180=(*sc_set0.UserUniforms).sc_ModelMatrix;
N7_world_out=(l9_180*l9_175).xyz;
l9_140=N7_world_out;
l9_133=l9_140;
float3 l9_181=float3(0.0);
l9_181=l9_133;
float3 l9_182=float3(0.0);
l9_182=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(l9_181,1.0)).xyz;
float3 l9_183=float3(0.0);
l9_183=l9_122-l9_182;
float l9_184=0.0;
l9_184=l9_122.z;
float l9_185=0.0;
l9_185=l9_129;
float3 l9_186=float3(0.0);
l9_186.x=(*sc_set0.UserUniforms).Port_Value1_N070;
l9_186.y=(*sc_set0.UserUniforms).Port_Value2_N070;
l9_186.z=l9_185;
float3 l9_187=float3(0.0);
l9_187=l9_182-l9_186;
float l9_188=0.0;
l9_188=l9_187.z;
float l9_189=0.0;
l9_189=l9_188-l9_184;
float l9_190=0.0;
l9_190=l9_184/(l9_189+1.234e-06);
float3 l9_191=float3(0.0);
l9_191=l9_183*float3(l9_190);
float3 l9_192=float3(0.0);
l9_192=l9_191+l9_122;
float3 l9_193=float3(0.0);
l9_193=l9_192;
float3 l9_194=float3(0.0);
l9_194=l9_193;
float2 l9_195=float2(0.0);
l9_195=float2(l9_194.x,l9_194.y);
float2 l9_196=float2(0.0);
l9_196=abs(l9_195);
float2 l9_197=float2(0.0);
l9_197=l9_196;
float2 l9_198=float2(0.0);
l9_198=l9_197;
float l9_199=0.0;
l9_199=l9_131;
float l9_200=0.0;
l9_200=l9_125;
float l9_201=0.0;
l9_201=l9_199*l9_200;
float2 l9_202=float2(0.0);
l9_202.x=l9_201;
l9_202.y=l9_200;
float2 l9_203=float2(0.0);
l9_203=l9_202*float2((*sc_set0.UserUniforms).Port_Input1_N037);
float2 l9_204=float2(0.0);
l9_204=l9_203;
float2 l9_205=float2(0.0);
l9_205=l9_204;
float2 l9_206=float2(0.0);
l9_206=l9_198/(l9_205+float2(1.234e-06));
float l9_207=0.0;
float l9_208=0.0;
float2 l9_209=l9_206;
float l9_210=l9_209.x;
float l9_211=l9_209.y;
l9_207=l9_210;
l9_208=l9_211;
float l9_212=0.0;
l9_212=fast::max(l9_207,l9_208);
l9_102=l9_212;
l9_108=l9_102;
}
else
{
l9_108=l9_103;
}
l9_100=l9_108;
float l9_213=0.0;
l9_213=fast::max(fast::max(l9_95,l9_96),l9_100);
float l9_214=0.0;
float l9_215=(*sc_set0.UserUniforms).fadeSpeed;
l9_214=l9_215;
float l9_216=0.0;
l9_216=l9_214;
float l9_217=0.0;
float l9_218;
if (l9_213<=0.0)
{
l9_218=0.0;
}
else
{
l9_218=pow(l9_213,l9_216);
}
l9_217=l9_218;
float l9_219=0.0;
l9_219=1.0-l9_217;
param_12=l9_219;
param_14=param_12;
}
else
{
param_14=param_13;
}
Result_N116=param_14;
float Export_N113=0.0;
Export_N113=Result_N116;
float4 Value_N92=float4(0.0);
Value_N92=float4(Output_N107.x,Output_N107.y,Output_N107.z,Value_N92.w);
Value_N92.w=Export_N113;
float3 Camera_Position_N43=float3(0.0);
Camera_Position_N43=(*sc_set0.UserUniforms).sc_Camera.position;
float3 eyeCoordWorld_N60=float3(0.0);
float3 param_16=Camera_Position_N43;
float param_17=(*sc_set0.UserUniforms).Port_eyeOffset_N060;
ssGlobals param_19=Globals;
tempGlobals=param_19;
float3 param_18=float3(0.0);
N60_camCoordWorld=param_16;
N60_eyeOffset=param_17;
int l9_220=int(tempGlobals.gStereoViewIndex);
float l9_221=(float(l9_220)-0.5)*2.0;
float3 l9_222=N60_camCoordWorld;
int l9_223=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_223=0;
}
else
{
l9_223=in.varStereoViewID;
}
int l9_224=l9_223;
float3 l9_225=(*sc_set0.UserUniforms).sc_ViewMatrixInverseArray[l9_224][0].xyz;
l9_222+=((l9_225*l9_221)*N60_eyeOffset);
N60_eyeCoordWorld=l9_222;
param_18=N60_eyeCoordWorld;
eyeCoordWorld_N60=param_18;
float3 Value_N6=float3(0.0);
Value_N6=eyeCoordWorld_N60;
float3 VectorOut_N8=float3(0.0);
VectorOut_N8=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(Value_N6,1.0)).xyz;
float3 Export_N22=float3(0.0);
Export_N22=VectorOut_N8;
float3 Value_N48=float3(0.0);
Value_N48=Export_N22;
float Output_N51=0.0;
Output_N51=Value_N48.z;
float Output_N33=0.0;
Output_N33=float(Output_N51<(*sc_set0.UserUniforms).Port_Input1_N033);
float Export_N53=0.0;
Export_N53=Output_N33;
float4 Output_N31=float4(0.0);
float4 param_20=Value_N92;
float param_21=Export_N53;
float4 param_22=param_20;
if ((param_21*1.0)!=0.0)
{
discard_fragment();
}
Output_N31=param_22;
float3 Output_N20=float3(0.0);
float3 param_23;
param_23.x=in.Interpolator0.x;
param_23.y=in.Interpolator0.y;
param_23.z=in.Interpolator0.z;
Output_N20=param_23;
float Output_N54=0.0;
float param_24=(*sc_set0.UserUniforms).frameHeight;
Output_N54=param_24;
float Output_N120=0.0;
float param_25=(*sc_set0.UserUniforms).depthScale;
Output_N120=param_25;
float Output_N55=0.0;
float param_26=(*sc_set0.UserUniforms).frameOffset;
Output_N55=param_26;
float Output_N0=0.0;
float param_27=(*sc_set0.UserUniforms).aspectRatio;
Output_N0=param_27;
float3 world_out_N7=float3(0.0);
float3 param_28=Output_N20;
float param_29=Output_N54;
float param_30=Output_N120;
float param_31=Output_N55;
float param_32=Output_N0;
ssGlobals param_34=Globals;
tempGlobals=param_34;
float3 param_33=float3(0.0);
N7_objCoord=param_28;
N7_frameHeight=param_29;
N7_depthScale=param_30;
N7_frameOffset=param_31;
N7_aspect=param_32;
float l9_226=((fast::max(N7_objCoord.z,-50.0)*N7_depthScale)+N7_frameOffset)+N7_depthScale;
float l9_227=l9_226;
int l9_228=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_228=0;
}
else
{
l9_228=in.varStereoViewID;
}
int l9_229=l9_228;
float4x4 l9_230=(*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_229];
float4 l9_231=l9_230*float4(0.0,0.0,l9_227,1.0);
l9_231.z/=l9_231.w;
float2 l9_232=l9_231.zw;
float2 l9_233=l9_232;
float l9_234=N7_frameHeight;
float l9_235=N7_aspect;
float l9_236=N7_frameOffset;
float l9_237=l9_234/2.0;
float4 l9_238=float4(l9_235*l9_237,l9_237,l9_236,1.0);
int l9_239=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_239=0;
}
else
{
l9_239=in.varStereoViewID;
}
int l9_240=l9_239;
float4x4 l9_241=(*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_240];
float4 l9_242=l9_241*l9_238;
float2 l9_243=l9_242.xy/float2(l9_242.w);
l9_242=float4(l9_243.x,l9_243.y,l9_242.z,l9_242.w);
float2 l9_244=l9_242.xy;
float2 l9_245=l9_244;
float l9_246=N7_frameHeight;
float l9_247=N7_aspect;
float l9_248=N7_frameOffset;
float l9_249=l9_246/2.0;
float4 l9_250=float4((-l9_247)*l9_249,-l9_249,l9_248,1.0);
int l9_251=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_251=0;
}
else
{
l9_251=in.varStereoViewID;
}
int l9_252=l9_251;
float4x4 l9_253=(*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_252];
float4 l9_254=l9_253*l9_250;
float2 l9_255=l9_254.xy/float2(l9_254.w);
l9_254=float4(l9_255.x,l9_255.y,l9_254.z,l9_254.w);
float2 l9_256=l9_254.xy;
float2 l9_257=l9_256;
float2 l9_258=N7_objCoord.xy/float2(-N7_objCoord.z);
l9_258.x=(((l9_258.x+1.0)/2.0)*(l9_245.x-l9_257.x))+l9_257.x;
l9_258.y=(((l9_258.y+1.0)/2.0)*(l9_245.y-l9_257.y))+l9_257.y;
float4 l9_259=float4(l9_258,l9_233);
float4 l9_260=l9_259;
float3 l9_261=l9_260.xyz*l9_260.w;
l9_260=float4(l9_261.x,l9_261.y,l9_261.z,l9_260.w);
int l9_262=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_262=0;
}
else
{
l9_262=in.varStereoViewID;
}
int l9_263=l9_262;
float4x4 l9_264=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_263];
l9_260=l9_264*l9_260;
l9_260.w=1.0;
float4x4 l9_265=(*sc_set0.UserUniforms).sc_ModelMatrix;
N7_world_out=(l9_265*l9_260).xyz;
param_33=N7_world_out;
world_out_N7=param_33;
float3 Value_N5=float3(0.0);
Value_N5=world_out_N7;
float3 VectorOut_N1=float3(0.0);
VectorOut_N1=((*sc_set0.UserUniforms).sc_ModelMatrixInverse*float4(Value_N5,1.0)).xyz;
float3 Output_N10=float3(0.0);
Output_N10=VectorOut_N8-VectorOut_N1;
float Output_N12=0.0;
Output_N12=VectorOut_N8.z;
float Value_N9=0.0;
Value_N9=Output_N55;
float3 Value_N70=float3(0.0);
Value_N70.x=(*sc_set0.UserUniforms).Port_Value1_N070;
Value_N70.y=(*sc_set0.UserUniforms).Port_Value2_N070;
Value_N70.z=Value_N9;
float3 Output_N69=float3(0.0);
Output_N69=VectorOut_N1-Value_N70;
float Output_N11=0.0;
Output_N11=Output_N69.z;
float Output_N15=0.0;
Output_N15=Output_N11-Output_N12;
float Output_N17=0.0;
Output_N17=Output_N12/(Output_N15+1.234e-06);
float3 Output_N18=float3(0.0);
Output_N18=Output_N10*float3(Output_N17);
float3 Output_N19=float3(0.0);
Output_N19=Output_N18+VectorOut_N8;
float3 Export_N21=float3(0.0);
Export_N21=Output_N19;
float3 Value_N129=float3(0.0);
Value_N129=Export_N21;
float2 Output_N52=float2(0.0);
Output_N52=float2(Value_N129.x,Value_N129.y);
float2 Output_N126=float2(0.0);
Output_N126=abs(Output_N52);
float2 Export_N130=float2(0.0);
Export_N130=Output_N126;
float2 Value_N131=float2(0.0);
Value_N131=Export_N130;
float Value_N41=0.0;
Value_N41=Output_N0;
float Value_N40=0.0;
Value_N40=Output_N54;
float Output_N35=0.0;
Output_N35=Value_N41*Value_N40;
float2 Value_N36=float2(0.0);
Value_N36.x=Output_N35;
Value_N36.y=Value_N40;
float2 Output_N37=float2(0.0);
Output_N37=Value_N36*float2((*sc_set0.UserUniforms).Port_Input1_N037);
float2 Export_N50=float2(0.0);
Export_N50=Output_N37;
float2 Value_N24=float2(0.0);
Value_N24=Export_N50;
float2 Output_N56=float2(0.0);
Output_N56=float2(float(Value_N131.x>Value_N24.x),float(Value_N131.y>Value_N24.y));
float Value1_N32=0.0;
float Value2_N32=0.0;
float2 param_35=Output_N56;
float param_36=param_35.x;
float param_37=param_35.y;
Value1_N32=param_36;
Value2_N32=param_37;
float Result_N34=0.0;
float l9_266=Value1_N32;
bool l9_267=(l9_266*1.0)!=0.0;
bool l9_268;
if (!l9_267)
{
l9_268=(Value2_N32*1.0)!=0.0;
}
else
{
l9_268=l9_267;
}
Result_N34=float(l9_268);
float Export_N42=0.0;
Export_N42=Result_N34;
float2 Value_N26=float2(0.0);
Value_N26=Export_N130;
float2 Value_N25=float2(0.0);
Value_N25=Export_N50;
float Output_N123=0.0;
float param_38=(*sc_set0.UserUniforms).cornerRadius;
Output_N123=param_38;
float Value_N64=0.0;
Value_N64=Output_N123;
float2 Output_N74=float2(0.0);
Output_N74=float2(Value_N64,Value_N64);
float2 Output_N84=float2(0.0);
Output_N84=Value_N25-Output_N74;
float2 Output_N85=float2(0.0);
Output_N85=float2(float(Value_N26.x>Output_N84.x),float(Value_N26.y>Output_N84.y));
float Value1_N86=0.0;
float Value2_N86=0.0;
float2 param_39=Output_N85;
float param_40=param_39.x;
float param_41=param_39.y;
Value1_N86=param_40;
Value2_N86=param_41;
float Result_N81=0.0;
float l9_269=Value1_N86;
bool l9_270=(l9_269*1.0)!=0.0;
bool l9_271;
if (l9_270)
{
l9_271=(Value2_N86*1.0)!=0.0;
}
else
{
l9_271=l9_270;
}
Result_N81=float(l9_271);
float Output_N87=0.0;
Output_N87=distance(Value_N26,Output_N84);
float Output_N88=0.0;
Output_N88=float(Output_N87>Value_N64);
float Result_N89=0.0;
float l9_272=Result_N81;
bool l9_273=(l9_272*1.0)!=0.0;
bool l9_274;
if (l9_273)
{
l9_274=(Output_N88*1.0)!=0.0;
}
else
{
l9_274=l9_273;
}
Result_N89=float(l9_274);
float Export_N62=0.0;
Export_N62=Result_N89;
float Result_N78=0.0;
float l9_275=Export_N42;
bool l9_276=(l9_275*1.0)!=0.0;
bool l9_277;
if (!l9_276)
{
l9_277=(Export_N62*1.0)!=0.0;
}
else
{
l9_277=l9_276;
}
Result_N78=float(l9_277);
float Output_N124=0.0;
float param_42=float((*sc_set0.UserUniforms).frameOn!=0);
Output_N124=param_42;
float Result_N125=0.0;
float l9_278=Result_N78;
bool l9_279=(l9_278*1.0)!=0.0;
bool l9_280;
if (l9_279)
{
l9_280=(Output_N124*1.0)!=0.0;
}
else
{
l9_280=l9_279;
}
Result_N125=float(l9_280);
float4 Output_N44=float4(0.0);
float4 param_43=Output_N31;
float param_44=Result_N125;
float4 param_45=param_43;
if ((param_44*1.0)!=0.0)
{
discard_fragment();
}
Output_N44=param_45;
FinalColor=Output_N44;
float param_46=FinalColor.w;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (param_46<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_281=gl_FragCoord;
float2 l9_282=floor(mod(l9_281.xy,float2(4.0)));
float l9_283=(mod(dot(l9_282,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (param_46<l9_283)
{
discard_fragment();
}
}
float4 param_47=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_284=param_47;
float4 l9_285=l9_284;
float l9_286=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_286=l9_285.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_286=fast::clamp(l9_285.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_286=fast::clamp(dot(l9_285.xyz,float3(l9_285.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_286=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_286=(1.0-dot(l9_285.xyz,float3(0.33333001)))*l9_285.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_286=(1.0-fast::clamp(dot(l9_285.xyz,float3(1.0)),0.0,1.0))*l9_285.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_286=fast::clamp(dot(l9_285.xyz,float3(1.0)),0.0,1.0)*l9_285.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_286=fast::clamp(dot(l9_285.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_286=fast::clamp(dot(l9_285.xyz,float3(1.0)),0.0,1.0)*l9_285.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_286=dot(l9_285.xyz,float3(0.33333001))*l9_285.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_286=1.0-fast::clamp(dot(l9_285.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_286=fast::clamp(dot(l9_285.xyz,float3(1.0)),0.0,1.0);
}
}
}
}
}
}
}
}
}
}
}
}
float l9_287=l9_286;
float l9_288=l9_287;
float l9_289=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_288;
float3 l9_290=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_284.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_291=float4(l9_290.x,l9_290.y,l9_290.z,l9_289);
param_47=l9_291;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_47=float4(param_47.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_292=param_47;
float4 l9_293=float4(0.0);
float4 l9_294=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_295=out.FragColor0;
float4 l9_296=l9_295;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_296.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_297=l9_296;
l9_294=l9_297;
}
else
{
float4 l9_298=gl_FragCoord;
float2 l9_299=l9_298.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_300=l9_299;
float2 l9_301=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_302=1;
int l9_303=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_303=0;
}
else
{
l9_303=in.varStereoViewID;
}
int l9_304=l9_303;
int l9_305=l9_304;
float3 l9_306=float3(l9_300,0.0);
int l9_307=l9_302;
int l9_308=l9_305;
if (l9_307==1)
{
l9_306.y=((2.0*l9_306.y)+float(l9_308))-1.0;
}
float2 l9_309=l9_306.xy;
l9_301=l9_309;
}
else
{
l9_301=l9_300;
}
float2 l9_310=l9_301;
float2 l9_311=l9_310;
float2 l9_312=l9_311;
int l9_313=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_314=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_314=0;
}
else
{
l9_314=in.varStereoViewID;
}
int l9_315=l9_314;
l9_313=1-l9_315;
}
else
{
int l9_316=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_316=0;
}
else
{
l9_316=in.varStereoViewID;
}
int l9_317=l9_316;
l9_313=l9_317;
}
int l9_318=l9_313;
float2 l9_319=l9_312;
int l9_320=l9_318;
float2 l9_321=l9_319;
int l9_322=l9_320;
float l9_323=0.0;
float4 l9_324=float4(0.0);
float2 l9_325=l9_321;
int l9_326=sc_ScreenTextureLayout_tmp;
int l9_327=l9_322;
float l9_328=l9_323;
float2 l9_329=l9_325;
int l9_330=l9_326;
int l9_331=l9_327;
float3 l9_332=float3(0.0);
if (l9_330==0)
{
l9_332=float3(l9_329,0.0);
}
else
{
if (l9_330==1)
{
l9_332=float3(l9_329.x,(l9_329.y*0.5)+(0.5-(float(l9_331)*0.5)),0.0);
}
else
{
l9_332=float3(l9_329,float(l9_331));
}
}
float3 l9_333=l9_332;
float3 l9_334=l9_333;
float2 l9_335=l9_334.xy;
float l9_336=l9_328;
float4 l9_337=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_335,bias(l9_336));
float4 l9_338=l9_337;
l9_324=l9_338;
float4 l9_339=l9_324;
float4 l9_340=l9_339;
float4 l9_341=l9_340;
l9_294=l9_341;
}
float4 l9_342=l9_294;
float4 l9_343=l9_342;
float3 l9_344=l9_343.xyz;
float3 l9_345=l9_344;
float3 l9_346=l9_292.xyz;
float3 l9_347=definedBlend(l9_345,l9_346,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_293=float4(l9_347.x,l9_347.y,l9_347.z,l9_293.w);
float3 l9_348=mix(l9_344,l9_293.xyz,float3(l9_292.w));
l9_293=float4(l9_348.x,l9_348.y,l9_348.z,l9_293.w);
l9_293.w=1.0;
float4 l9_349=l9_293;
param_47=l9_349;
}
else
{
float4 l9_350=param_47;
float4 l9_351=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_351=float4(mix(float3(1.0),l9_350.xyz,float3(l9_350.w)),l9_350.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_352=l9_350.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_352=fast::clamp(l9_352,0.0,1.0);
}
l9_351=float4(l9_350.xyz*l9_352,l9_352);
}
else
{
l9_351=l9_350;
}
}
float4 l9_353=l9_351;
param_47=l9_353;
}
}
}
float4 l9_354=param_47;
FinalColor=l9_354;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
if (PreviewInfo.Saved)
{
FinalColor=float4(PreviewInfo.Color);
}
else
{
FinalColor=float4(0.0);
}
}
float4 l9_355=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_355=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_355=float4(0.0);
}
float4 l9_356=l9_355;
float4 Cost=l9_356;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_48=in.varPos;
float4 param_49=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_48,param_49,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_50=FinalColor;
float4 l9_357=param_50;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_357.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_357;
return out;
}
} // FRAGMENT SHADER
