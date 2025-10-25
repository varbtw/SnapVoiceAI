#include <metal_stdlib>
#include <simd/simd.h>
using namespace metal;
#if 0
NGS_BACKEND_SHADER_FLAGS_BEGIN__
NGS_FLAG_IS_NORMAL_MAP normalTex
NGS_FLAG_IS_NORMAL_MAP detailNormalTex
NGS_BACKEND_SHADER_FLAGS_END__
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
#ifdef uv2
#undef uv2
#endif
#ifdef uv3
#undef uv3
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
//output uvec4 position_and_mask 0
//output uvec4 normal_and_more 1
//sampler sampler baseTexSmpSC 0:32
//sampler sampler detailNormalTexSmpSC 0:33
//sampler sampler emissiveTexSmpSC 0:34
//sampler sampler intensityTextureSmpSC 0:35
//sampler sampler normalTexSmpSC 0:36
//sampler sampler reflectionModulationTexSmpSC 0:37
//sampler sampler reflectionTexSmpSC 0:38
//sampler sampler rimColorTexSmpSC 0:39
//sampler sampler sc_EnvmapDiffuseSmpSC 0:40
//sampler sampler sc_EnvmapSpecularSmpSC 0:41
//sampler sampler sc_RayTracedAoTextureSmpSC 0:43
//sampler sampler sc_RayTracedDiffIndTextureSmpSC 0:44
//sampler sampler sc_RayTracedShadowTextureSmpSC 0:46
//sampler sampler sc_SSAOTextureSmpSC 0:47
//sampler sampler sc_ScreenTextureSmpSC 0:48
//sampler sampler sc_ShadowTextureSmpSC 0:49
//sampler sampler z_hitIdAndBarycentricSmp 0:51
//sampler sampler z_rayDirectionsSmpSC 0:52
//texture texture2D baseTex 0:4:0:32
//texture texture2D detailNormalTex 0:5:0:33
//texture texture2D emissiveTex 0:6:0:34
//texture texture2D intensityTexture 0:7:0:35
//texture texture2D normalTex 0:8:0:36
//texture texture2D reflectionModulationTex 0:9:0:37
//texture texture2D reflectionTex 0:10:0:38
//texture texture2D rimColorTex 0:11:0:39
//texture texture2D sc_EnvmapDiffuse 0:12:0:40
//texture texture2D sc_EnvmapSpecular 0:13:0:41
//texture texture2D sc_RayTracedAoTexture 0:22:0:43
//texture texture2D sc_RayTracedDiffIndTexture 0:23:0:44
//texture texture2D sc_RayTracedShadowTexture 0:25:0:46
//texture texture2D sc_SSAOTexture 0:26:0:47
//texture texture2D sc_ScreenTexture 0:27:0:48
//texture texture2D sc_ShadowTexture 0:28:0:49
//texture utexture2D z_hitIdAndBarycentric 0:30:0:51
//texture texture2D z_rayDirections 0:31:0:52
//ubo float sc_BonesUBO 0:3:96 {
//sc_Bone_t sc_Bones 0:[]:96
//float4 sc_Bones.boneMatrix 0:[3]:16
//float4 sc_Bones.normalMatrix 48:[3]:16
//}
//ubo int UserUniforms 0:53:6272 {
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
//bool receivesRayTracedReflections 3824
//bool isProxyMode 3828
//bool receivesRayTracedShadows 3832
//bool receivesRayTracedDiffuseIndirect 3836
//bool receivesRayTracedAo 3840
//float4 sc_RayTracedReflectionTextureSize 3856
//float4 sc_RayTracedReflectionTextureDims 3872
//float4 sc_RayTracedReflectionTextureView 3888
//float4 sc_RayTracedShadowTextureSize 3904
//float4 sc_RayTracedShadowTextureDims 3920
//float4 sc_RayTracedShadowTextureView 3936
//float4 sc_RayTracedDiffIndTextureSize 3952
//float4 sc_RayTracedDiffIndTextureDims 3968
//float4 sc_RayTracedDiffIndTextureView 3984
//float4 sc_RayTracedAoTextureSize 4000
//float4 sc_RayTracedAoTextureDims 4016
//float4 sc_RayTracedAoTextureView 4032
//float receiver_mask 4048
//float3 OriginNormalizationScale 4064
//float3 OriginNormalizationScaleInv 4080
//float3 OriginNormalizationOffset 4096
//int receiverId 4112
//int instance_id 4116
//int lray_triangles_last 4120
//bool noEarlyZ 4124
//bool has_animated_pn 4128
//int emitter_stride 4132
//int proxy_offset_position 4136
//int proxy_offset_normal 4140
//int proxy_offset_tangent 4144
//int proxy_offset_color 4148
//int proxy_offset_texture0 4152
//int proxy_offset_texture1 4156
//int proxy_offset_texture2 4160
//int proxy_offset_texture3 4164
//int proxy_format_position 4168
//int proxy_format_normal 4172
//int proxy_format_tangent 4176
//int proxy_format_color 4180
//int proxy_format_texture0 4184
//int proxy_format_texture1 4188
//int proxy_format_texture2 4192
//int proxy_format_texture3 4196
//float4 z_rayDirectionsSize 4208
//float4 z_rayDirectionsDims 4224
//float4 z_rayDirectionsView 4240
//float correctedIntensity 4256
//float4 intensityTextureSize 4272
//float4 intensityTextureDims 4288
//float4 intensityTextureView 4304
//float3x3 intensityTextureTransform 4320
//float4 intensityTextureUvMinMax 4368
//float4 intensityTextureBorderColor 4384
//float reflBlurWidth 4400
//float reflBlurMinRough 4404
//float reflBlurMaxRough 4408
//int overrideTimeEnabled 4412
//float overrideTimeElapsed 4416
//float overrideTimeDelta 4420
//int PreviewEnabled 4424
//int PreviewNodeID 4428
//float alphaTestThreshold 4432
//float3 recolorRed 4448
//float4 baseColor 4464
//float4 baseTexSize 4480
//float4 baseTexDims 4496
//float4 baseTexView 4512
//float3x3 baseTexTransform 4528
//float4 baseTexUvMinMax 4576
//float4 baseTexBorderColor 4592
//float2 uv2Scale 4608
//float2 uv2Offset 4616
//float2 uv3Scale 4624
//float2 uv3Offset 4632
//float3 recolorGreen 4640
//float3 recolorBlue 4656
//float progress_value 4672
//float4 normalTexSize 4688
//float4 normalTexDims 4704
//float4 normalTexView 4720
//float3x3 normalTexTransform 4736
//float4 normalTexUvMinMax 4784
//float4 normalTexBorderColor 4800
//float4 detailNormalTexSize 4816
//float4 detailNormalTexDims 4832
//float4 detailNormalTexView 4848
//float3x3 detailNormalTexTransform 4864
//float4 detailNormalTexUvMinMax 4912
//float4 detailNormalTexBorderColor 4928
//float4 emissiveTexSize 4944
//float4 emissiveTexDims 4960
//float4 emissiveTexView 4976
//float3x3 emissiveTexTransform 4992
//float4 emissiveTexUvMinMax 5040
//float4 emissiveTexBorderColor 5056
//float3 emissiveColor 5072
//float emissiveIntensity 5088
//float reflectionIntensity 5092
//float4 reflectionTexSize 5104
//float4 reflectionTexDims 5120
//float4 reflectionTexView 5136
//float3x3 reflectionTexTransform 5152
//float4 reflectionTexUvMinMax 5200
//float4 reflectionTexBorderColor 5216
//float4 reflectionModulationTexSize 5232
//float4 reflectionModulationTexDims 5248
//float4 reflectionModulationTexView 5264
//float3x3 reflectionModulationTexTransform 5280
//float4 reflectionModulationTexUvMinMax 5328
//float4 reflectionModulationTexBorderColor 5344
//float3 rimColor 5360
//float rimIntensity 5376
//float4 rimColorTexSize 5392
//float4 rimColorTexDims 5408
//float4 rimColorTexView 5424
//float3x3 rimColorTexTransform 5440
//float4 rimColorTexUvMinMax 5488
//float4 rimColorTexBorderColor 5504
//float rimExponent 5520
//float4 Port_Import_N042 5536
//float Port_Input1_N044 5552
//float Port_Import_N088 5556
//float3 Port_Import_N089 5568
//float4 Port_Import_N384 5584
//float Port_Import_N307 5600
//float Port_Import_N201 5604
//float Port_Import_N010 5608
//float Port_Import_N007 5612
//float2 Port_Import_N008 5616
//float2 Port_Import_N009 5624
//float Port_Speed_N022 5632
//float Port_Import_N012 5636
//float2 Port_Import_N254 5640
//float Port_Import_N055 5648
//float Port_Import_N056 5652
//float2 Port_Import_N000 5656
//float2 Port_Import_N060 5664
//float2 Port_Import_N061 5672
//float Port_Speed_N063 5680
//float Port_Import_N065 5684
//float2 Port_Import_N255 5688
//float4 Port_Default_N369 5696
//float4 Port_Import_N092 5712
//float3 Port_Import_N090 5728
//float3 Port_Import_N091 5744
//float3 Port_Import_N144 5760
//float Port_Value2_N073 5776
//float Port_Import_N336 5780
//float Port_Import_N160 5784
//float2 Port_Import_N167 5792
//float2 Port_Import_N207 5800
//float Port_Strength1_N200 5808
//float Port_Import_N095 5812
//float Port_Import_N108 5816
//float3 Port_Default_N113 5824
//float Port_Strength2_N200 5840
//float Port_Import_N273 5844
//float Port_Input1_N274 5848
//float Port_Import_N131 5852
//float Port_Import_N116 5856
//float2 Port_Import_N120 5864
//float2 Port_Import_N127 5872
//float4 Port_Default_N132 5888
//float3 Port_Import_N295 5904
//float Port_Import_N296 5920
//float Port_Import_N133 5924
//float Port_Import_N231 5928
//float3 Port_Import_N327 5936
//float3 Port_Input1_N257 5952
//float3 Port_Import_N259 5968
//float Port_Input1_N264 5984
//float Port_Input1_N268 5988
//float Port_Input1_N270 5992
//float Port_Import_N123 5996
//float Port_Import_N025 6000
//float2 Port_Import_N030 6008
//float2 Port_Import_N031 6016
//float3 Port_Default_N041 6032
//float3 Port_Default_N134 6048
//float3 Port_Import_N298 6064
//float Port_Import_N172 6080
//float3 Port_Import_N318 6096
//float Port_Import_N319 6112
//float Port_Import_N171 6116
//float Port_Import_N135 6120
//float2 Port_Import_N150 6128
//float2 Port_Import_N152 6136
//float3 Port_Default_N170 6144
//float Port_Import_N339 6160
//float3 Port_Import_N328 6176
//float Port_Import_N340 6192
//float3 Port_Default_N173 6208
//float3 Port_Import_N306 6224
//float3 Port_AO_N036 6240
//float depthRef 6256
//}
//ssbo int layoutIndices 0:0:4 {
//uint _Triangles 0:[]:4
//}
//ssbo float layoutVerticesPN 0:2:4 {
//float _VerticesPN 0:[]:4
//}
//ssbo float layoutVertices 0:1:4 {
//float _Vertices 0:[]:4
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
//spec_const bool SC_USE_CLAMP_TO_BORDER_detailNormalTex 32
//spec_const bool SC_USE_CLAMP_TO_BORDER_emissiveTex 33
//spec_const bool SC_USE_CLAMP_TO_BORDER_intensityTexture 34
//spec_const bool SC_USE_CLAMP_TO_BORDER_normalTex 35
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex 36
//spec_const bool SC_USE_CLAMP_TO_BORDER_reflectionTex 37
//spec_const bool SC_USE_CLAMP_TO_BORDER_rimColorTex 38
//spec_const bool SC_USE_UV_MIN_MAX_baseTex 39
//spec_const bool SC_USE_UV_MIN_MAX_detailNormalTex 40
//spec_const bool SC_USE_UV_MIN_MAX_emissiveTex 41
//spec_const bool SC_USE_UV_MIN_MAX_intensityTexture 42
//spec_const bool SC_USE_UV_MIN_MAX_normalTex 43
//spec_const bool SC_USE_UV_MIN_MAX_reflectionModulationTex 44
//spec_const bool SC_USE_UV_MIN_MAX_reflectionTex 45
//spec_const bool SC_USE_UV_MIN_MAX_rimColorTex 46
//spec_const bool SC_USE_UV_TRANSFORM_baseTex 47
//spec_const bool SC_USE_UV_TRANSFORM_detailNormalTex 48
//spec_const bool SC_USE_UV_TRANSFORM_emissiveTex 49
//spec_const bool SC_USE_UV_TRANSFORM_intensityTexture 50
//spec_const bool SC_USE_UV_TRANSFORM_normalTex 51
//spec_const bool SC_USE_UV_TRANSFORM_reflectionModulationTex 52
//spec_const bool SC_USE_UV_TRANSFORM_reflectionTex 53
//spec_const bool SC_USE_UV_TRANSFORM_rimColorTex 54
//spec_const bool Tweak_N11 55
//spec_const bool Tweak_N121 56
//spec_const bool Tweak_N177 57
//spec_const bool Tweak_N179 58
//spec_const bool Tweak_N216 59
//spec_const bool Tweak_N218 60
//spec_const bool Tweak_N223 61
//spec_const bool Tweak_N354 62
//spec_const bool Tweak_N37 63
//spec_const bool Tweak_N67 64
//spec_const bool Tweak_N74 65
//spec_const bool UseViewSpaceDepthVariant 66
//spec_const bool baseTexHasSwappedViews 67
//spec_const bool detailNormalTexHasSwappedViews 68
//spec_const bool emissiveTexHasSwappedViews 69
//spec_const bool intensityTextureHasSwappedViews 70
//spec_const bool normalTexHasSwappedViews 71
//spec_const bool reflectionModulationTexHasSwappedViews 72
//spec_const bool reflectionTexHasSwappedViews 73
//spec_const bool rimColorTexHasSwappedViews 74
//spec_const bool rimInvert 75
//spec_const bool sc_BlendMode_AddWithAlphaFactor 76
//spec_const bool sc_BlendMode_Add 77
//spec_const bool sc_BlendMode_AlphaTest 78
//spec_const bool sc_BlendMode_AlphaToCoverage 79
//spec_const bool sc_BlendMode_ColoredGlass 80
//spec_const bool sc_BlendMode_Custom 81
//spec_const bool sc_BlendMode_Max 82
//spec_const bool sc_BlendMode_Min 83
//spec_const bool sc_BlendMode_MultiplyOriginal 84
//spec_const bool sc_BlendMode_Multiply 85
//spec_const bool sc_BlendMode_Normal 86
//spec_const bool sc_BlendMode_PremultipliedAlphaAuto 87
//spec_const bool sc_BlendMode_PremultipliedAlphaHardware 88
//spec_const bool sc_BlendMode_PremultipliedAlpha 89
//spec_const bool sc_BlendMode_Screen 90
//spec_const bool sc_DepthOnly 91
//spec_const bool sc_EnvmapDiffuseHasSwappedViews 92
//spec_const bool sc_EnvmapSpecularHasSwappedViews 93
//spec_const bool sc_FramebufferFetch 94
//spec_const bool sc_HasDiffuseEnvmap 95
//spec_const bool sc_LightEstimation 96
//spec_const bool sc_MotionVectorsPass 97
//spec_const bool sc_OITCompositingPass 98
//spec_const bool sc_OITDepthBoundsPass 99
//spec_const bool sc_OITDepthGatherPass 100
//spec_const bool sc_ProjectiveShadowsCaster 101
//spec_const bool sc_ProjectiveShadowsReceiver 102
//spec_const bool sc_ProxyAlphaOne 103
//spec_const bool sc_RayTracedAoTextureHasSwappedViews 104
//spec_const bool sc_RayTracedDiffIndTextureHasSwappedViews 105
//spec_const bool sc_RayTracedShadowTextureHasSwappedViews 106
//spec_const bool sc_RenderAlphaToColor 107
//spec_const bool sc_SSAOEnabled 108
//spec_const bool sc_ScreenTextureHasSwappedViews 109
//spec_const bool sc_ShaderComplexityAnalyzer 110
//spec_const bool sc_UseFramebufferFetchMarker 111
//spec_const bool sc_VertexBlendingUseNormals 112
//spec_const bool sc_VertexBlending 113
//spec_const bool uv2EnableAnimation 114
//spec_const bool uv3EnableAnimation 115
//spec_const int NODE_13_DROPLIST_ITEM 116
//spec_const int NODE_181_DROPLIST_ITEM 117
//spec_const int NODE_184_DROPLIST_ITEM 118
//spec_const int NODE_228_DROPLIST_ITEM 119
//spec_const int NODE_27_DROPLIST_ITEM 120
//spec_const int NODE_315_DROPLIST_ITEM 121
//spec_const int NODE_38_DROPLIST_ITEM 122
//spec_const int NODE_49_DROPLIST_ITEM 123
//spec_const int NODE_76_DROPLIST_ITEM 124
//spec_const int SC_DEVICE_CLASS 125
//spec_const int SC_SOFTWARE_WRAP_MODE_U_baseTex 126
//spec_const int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex 127
//spec_const int SC_SOFTWARE_WRAP_MODE_U_emissiveTex 128
//spec_const int SC_SOFTWARE_WRAP_MODE_U_intensityTexture 129
//spec_const int SC_SOFTWARE_WRAP_MODE_U_normalTex 130
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex 131
//spec_const int SC_SOFTWARE_WRAP_MODE_U_reflectionTex 132
//spec_const int SC_SOFTWARE_WRAP_MODE_U_rimColorTex 133
//spec_const int SC_SOFTWARE_WRAP_MODE_V_baseTex 134
//spec_const int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex 135
//spec_const int SC_SOFTWARE_WRAP_MODE_V_emissiveTex 136
//spec_const int SC_SOFTWARE_WRAP_MODE_V_intensityTexture 137
//spec_const int SC_SOFTWARE_WRAP_MODE_V_normalTex 138
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex 139
//spec_const int SC_SOFTWARE_WRAP_MODE_V_reflectionTex 140
//spec_const int SC_SOFTWARE_WRAP_MODE_V_rimColorTex 141
//spec_const int baseTexLayout 142
//spec_const int detailNormalTexLayout 143
//spec_const int emissiveTexLayout 144
//spec_const int intensityTextureLayout 145
//spec_const int normalTexLayout 146
//spec_const int reflectionModulationTexLayout 147
//spec_const int reflectionTexLayout 148
//spec_const int rimColorTexLayout 149
//spec_const int sc_AmbientLightMode0 150
//spec_const int sc_AmbientLightMode1 151
//spec_const int sc_AmbientLightMode2 152
//spec_const int sc_AmbientLightMode_Constant 153
//spec_const int sc_AmbientLightMode_EnvironmentMap 154
//spec_const int sc_AmbientLightMode_FromCamera 155
//spec_const int sc_AmbientLightMode_SphericalHarmonics 156
//spec_const int sc_AmbientLightsCount 157
//spec_const int sc_DepthBufferMode 158
//spec_const int sc_DirectionalLightsCount 159
//spec_const int sc_EnvLightMode 160
//spec_const int sc_EnvmapDiffuseLayout 161
//spec_const int sc_EnvmapSpecularLayout 162
//spec_const int sc_LightEstimationSGCount 163
//spec_const int sc_MaxTextureImageUnits 164
//spec_const int sc_PointLightsCount 165
//spec_const int sc_RayTracedAoTextureLayout 166
//spec_const int sc_RayTracedDiffIndTextureLayout 167
//spec_const int sc_RayTracedShadowTextureLayout 168
//spec_const int sc_RenderingSpace 169
//spec_const int sc_ScreenTextureLayout 170
//spec_const int sc_ShaderCacheConstant 171
//spec_const int sc_SkinBonesCount 172
//spec_const int sc_StereoRenderingMode 173
//spec_const int sc_StereoRendering_IsClipDistanceEnabled 174
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
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex [[function_constant(32)]];
constant bool SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_detailNormalTex) ? SC_USE_CLAMP_TO_BORDER_detailNormalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTex [[function_constant(33)]];
constant bool SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_emissiveTex) ? SC_USE_CLAMP_TO_BORDER_emissiveTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture [[function_constant(34)]];
constant bool SC_USE_CLAMP_TO_BORDER_intensityTexture_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_intensityTexture) ? SC_USE_CLAMP_TO_BORDER_intensityTexture : false;
constant bool SC_USE_CLAMP_TO_BORDER_normalTex [[function_constant(35)]];
constant bool SC_USE_CLAMP_TO_BORDER_normalTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_normalTex) ? SC_USE_CLAMP_TO_BORDER_normalTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex [[function_constant(36)]];
constant bool SC_USE_CLAMP_TO_BORDER_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex) ? SC_USE_CLAMP_TO_BORDER_reflectionModulationTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_reflectionTex [[function_constant(37)]];
constant bool SC_USE_CLAMP_TO_BORDER_reflectionTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_reflectionTex) ? SC_USE_CLAMP_TO_BORDER_reflectionTex : false;
constant bool SC_USE_CLAMP_TO_BORDER_rimColorTex [[function_constant(38)]];
constant bool SC_USE_CLAMP_TO_BORDER_rimColorTex_tmp = is_function_constant_defined(SC_USE_CLAMP_TO_BORDER_rimColorTex) ? SC_USE_CLAMP_TO_BORDER_rimColorTex : false;
constant bool SC_USE_UV_MIN_MAX_baseTex [[function_constant(39)]];
constant bool SC_USE_UV_MIN_MAX_baseTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_baseTex) ? SC_USE_UV_MIN_MAX_baseTex : false;
constant bool SC_USE_UV_MIN_MAX_detailNormalTex [[function_constant(40)]];
constant bool SC_USE_UV_MIN_MAX_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_detailNormalTex) ? SC_USE_UV_MIN_MAX_detailNormalTex : false;
constant bool SC_USE_UV_MIN_MAX_emissiveTex [[function_constant(41)]];
constant bool SC_USE_UV_MIN_MAX_emissiveTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_emissiveTex) ? SC_USE_UV_MIN_MAX_emissiveTex : false;
constant bool SC_USE_UV_MIN_MAX_intensityTexture [[function_constant(42)]];
constant bool SC_USE_UV_MIN_MAX_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_intensityTexture) ? SC_USE_UV_MIN_MAX_intensityTexture : false;
constant bool SC_USE_UV_MIN_MAX_normalTex [[function_constant(43)]];
constant bool SC_USE_UV_MIN_MAX_normalTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_normalTex) ? SC_USE_UV_MIN_MAX_normalTex : false;
constant bool SC_USE_UV_MIN_MAX_reflectionModulationTex [[function_constant(44)]];
constant bool SC_USE_UV_MIN_MAX_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_reflectionModulationTex) ? SC_USE_UV_MIN_MAX_reflectionModulationTex : false;
constant bool SC_USE_UV_MIN_MAX_reflectionTex [[function_constant(45)]];
constant bool SC_USE_UV_MIN_MAX_reflectionTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_reflectionTex) ? SC_USE_UV_MIN_MAX_reflectionTex : false;
constant bool SC_USE_UV_MIN_MAX_rimColorTex [[function_constant(46)]];
constant bool SC_USE_UV_MIN_MAX_rimColorTex_tmp = is_function_constant_defined(SC_USE_UV_MIN_MAX_rimColorTex) ? SC_USE_UV_MIN_MAX_rimColorTex : false;
constant bool SC_USE_UV_TRANSFORM_baseTex [[function_constant(47)]];
constant bool SC_USE_UV_TRANSFORM_baseTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_baseTex) ? SC_USE_UV_TRANSFORM_baseTex : false;
constant bool SC_USE_UV_TRANSFORM_detailNormalTex [[function_constant(48)]];
constant bool SC_USE_UV_TRANSFORM_detailNormalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_detailNormalTex) ? SC_USE_UV_TRANSFORM_detailNormalTex : false;
constant bool SC_USE_UV_TRANSFORM_emissiveTex [[function_constant(49)]];
constant bool SC_USE_UV_TRANSFORM_emissiveTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_emissiveTex) ? SC_USE_UV_TRANSFORM_emissiveTex : false;
constant bool SC_USE_UV_TRANSFORM_intensityTexture [[function_constant(50)]];
constant bool SC_USE_UV_TRANSFORM_intensityTexture_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_intensityTexture) ? SC_USE_UV_TRANSFORM_intensityTexture : false;
constant bool SC_USE_UV_TRANSFORM_normalTex [[function_constant(51)]];
constant bool SC_USE_UV_TRANSFORM_normalTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_normalTex) ? SC_USE_UV_TRANSFORM_normalTex : false;
constant bool SC_USE_UV_TRANSFORM_reflectionModulationTex [[function_constant(52)]];
constant bool SC_USE_UV_TRANSFORM_reflectionModulationTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_reflectionModulationTex) ? SC_USE_UV_TRANSFORM_reflectionModulationTex : false;
constant bool SC_USE_UV_TRANSFORM_reflectionTex [[function_constant(53)]];
constant bool SC_USE_UV_TRANSFORM_reflectionTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_reflectionTex) ? SC_USE_UV_TRANSFORM_reflectionTex : false;
constant bool SC_USE_UV_TRANSFORM_rimColorTex [[function_constant(54)]];
constant bool SC_USE_UV_TRANSFORM_rimColorTex_tmp = is_function_constant_defined(SC_USE_UV_TRANSFORM_rimColorTex) ? SC_USE_UV_TRANSFORM_rimColorTex : false;
constant bool Tweak_N11 [[function_constant(55)]];
constant bool Tweak_N11_tmp = is_function_constant_defined(Tweak_N11) ? Tweak_N11 : false;
constant bool Tweak_N121 [[function_constant(56)]];
constant bool Tweak_N121_tmp = is_function_constant_defined(Tweak_N121) ? Tweak_N121 : false;
constant bool Tweak_N177 [[function_constant(57)]];
constant bool Tweak_N177_tmp = is_function_constant_defined(Tweak_N177) ? Tweak_N177 : false;
constant bool Tweak_N179 [[function_constant(58)]];
constant bool Tweak_N179_tmp = is_function_constant_defined(Tweak_N179) ? Tweak_N179 : false;
constant bool Tweak_N216 [[function_constant(59)]];
constant bool Tweak_N216_tmp = is_function_constant_defined(Tweak_N216) ? Tweak_N216 : false;
constant bool Tweak_N218 [[function_constant(60)]];
constant bool Tweak_N218_tmp = is_function_constant_defined(Tweak_N218) ? Tweak_N218 : false;
constant bool Tweak_N223 [[function_constant(61)]];
constant bool Tweak_N223_tmp = is_function_constant_defined(Tweak_N223) ? Tweak_N223 : false;
constant bool Tweak_N354 [[function_constant(62)]];
constant bool Tweak_N354_tmp = is_function_constant_defined(Tweak_N354) ? Tweak_N354 : false;
constant bool Tweak_N37 [[function_constant(63)]];
constant bool Tweak_N37_tmp = is_function_constant_defined(Tweak_N37) ? Tweak_N37 : false;
constant bool Tweak_N67 [[function_constant(64)]];
constant bool Tweak_N67_tmp = is_function_constant_defined(Tweak_N67) ? Tweak_N67 : false;
constant bool Tweak_N74 [[function_constant(65)]];
constant bool Tweak_N74_tmp = is_function_constant_defined(Tweak_N74) ? Tweak_N74 : false;
constant bool UseViewSpaceDepthVariant [[function_constant(66)]];
constant bool UseViewSpaceDepthVariant_tmp = is_function_constant_defined(UseViewSpaceDepthVariant) ? UseViewSpaceDepthVariant : true;
constant bool baseTexHasSwappedViews [[function_constant(67)]];
constant bool baseTexHasSwappedViews_tmp = is_function_constant_defined(baseTexHasSwappedViews) ? baseTexHasSwappedViews : false;
constant bool detailNormalTexHasSwappedViews [[function_constant(68)]];
constant bool detailNormalTexHasSwappedViews_tmp = is_function_constant_defined(detailNormalTexHasSwappedViews) ? detailNormalTexHasSwappedViews : false;
constant bool emissiveTexHasSwappedViews [[function_constant(69)]];
constant bool emissiveTexHasSwappedViews_tmp = is_function_constant_defined(emissiveTexHasSwappedViews) ? emissiveTexHasSwappedViews : false;
constant bool intensityTextureHasSwappedViews [[function_constant(70)]];
constant bool intensityTextureHasSwappedViews_tmp = is_function_constant_defined(intensityTextureHasSwappedViews) ? intensityTextureHasSwappedViews : false;
constant bool normalTexHasSwappedViews [[function_constant(71)]];
constant bool normalTexHasSwappedViews_tmp = is_function_constant_defined(normalTexHasSwappedViews) ? normalTexHasSwappedViews : false;
constant bool reflectionModulationTexHasSwappedViews [[function_constant(72)]];
constant bool reflectionModulationTexHasSwappedViews_tmp = is_function_constant_defined(reflectionModulationTexHasSwappedViews) ? reflectionModulationTexHasSwappedViews : false;
constant bool reflectionTexHasSwappedViews [[function_constant(73)]];
constant bool reflectionTexHasSwappedViews_tmp = is_function_constant_defined(reflectionTexHasSwappedViews) ? reflectionTexHasSwappedViews : false;
constant bool rimColorTexHasSwappedViews [[function_constant(74)]];
constant bool rimColorTexHasSwappedViews_tmp = is_function_constant_defined(rimColorTexHasSwappedViews) ? rimColorTexHasSwappedViews : false;
constant bool rimInvert [[function_constant(75)]];
constant bool rimInvert_tmp = is_function_constant_defined(rimInvert) ? rimInvert : false;
constant bool sc_BlendMode_AddWithAlphaFactor [[function_constant(76)]];
constant bool sc_BlendMode_AddWithAlphaFactor_tmp = is_function_constant_defined(sc_BlendMode_AddWithAlphaFactor) ? sc_BlendMode_AddWithAlphaFactor : false;
constant bool sc_BlendMode_Add [[function_constant(77)]];
constant bool sc_BlendMode_Add_tmp = is_function_constant_defined(sc_BlendMode_Add) ? sc_BlendMode_Add : false;
constant bool sc_BlendMode_AlphaTest [[function_constant(78)]];
constant bool sc_BlendMode_AlphaTest_tmp = is_function_constant_defined(sc_BlendMode_AlphaTest) ? sc_BlendMode_AlphaTest : false;
constant bool sc_BlendMode_AlphaToCoverage [[function_constant(79)]];
constant bool sc_BlendMode_AlphaToCoverage_tmp = is_function_constant_defined(sc_BlendMode_AlphaToCoverage) ? sc_BlendMode_AlphaToCoverage : false;
constant bool sc_BlendMode_ColoredGlass [[function_constant(80)]];
constant bool sc_BlendMode_ColoredGlass_tmp = is_function_constant_defined(sc_BlendMode_ColoredGlass) ? sc_BlendMode_ColoredGlass : false;
constant bool sc_BlendMode_Custom [[function_constant(81)]];
constant bool sc_BlendMode_Custom_tmp = is_function_constant_defined(sc_BlendMode_Custom) ? sc_BlendMode_Custom : false;
constant bool sc_BlendMode_Max [[function_constant(82)]];
constant bool sc_BlendMode_Max_tmp = is_function_constant_defined(sc_BlendMode_Max) ? sc_BlendMode_Max : false;
constant bool sc_BlendMode_Min [[function_constant(83)]];
constant bool sc_BlendMode_Min_tmp = is_function_constant_defined(sc_BlendMode_Min) ? sc_BlendMode_Min : false;
constant bool sc_BlendMode_MultiplyOriginal [[function_constant(84)]];
constant bool sc_BlendMode_MultiplyOriginal_tmp = is_function_constant_defined(sc_BlendMode_MultiplyOriginal) ? sc_BlendMode_MultiplyOriginal : false;
constant bool sc_BlendMode_Multiply [[function_constant(85)]];
constant bool sc_BlendMode_Multiply_tmp = is_function_constant_defined(sc_BlendMode_Multiply) ? sc_BlendMode_Multiply : false;
constant bool sc_BlendMode_Normal [[function_constant(86)]];
constant bool sc_BlendMode_Normal_tmp = is_function_constant_defined(sc_BlendMode_Normal) ? sc_BlendMode_Normal : false;
constant bool sc_BlendMode_PremultipliedAlphaAuto [[function_constant(87)]];
constant bool sc_BlendMode_PremultipliedAlphaAuto_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaAuto) ? sc_BlendMode_PremultipliedAlphaAuto : false;
constant bool sc_BlendMode_PremultipliedAlphaHardware [[function_constant(88)]];
constant bool sc_BlendMode_PremultipliedAlphaHardware_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlphaHardware) ? sc_BlendMode_PremultipliedAlphaHardware : false;
constant bool sc_BlendMode_PremultipliedAlpha [[function_constant(89)]];
constant bool sc_BlendMode_PremultipliedAlpha_tmp = is_function_constant_defined(sc_BlendMode_PremultipliedAlpha) ? sc_BlendMode_PremultipliedAlpha : false;
constant bool sc_BlendMode_Screen [[function_constant(90)]];
constant bool sc_BlendMode_Screen_tmp = is_function_constant_defined(sc_BlendMode_Screen) ? sc_BlendMode_Screen : false;
constant bool sc_DepthOnly [[function_constant(91)]];
constant bool sc_DepthOnly_tmp = is_function_constant_defined(sc_DepthOnly) ? sc_DepthOnly : false;
constant bool sc_EnvmapDiffuseHasSwappedViews [[function_constant(92)]];
constant bool sc_EnvmapDiffuseHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapDiffuseHasSwappedViews) ? sc_EnvmapDiffuseHasSwappedViews : false;
constant bool sc_EnvmapSpecularHasSwappedViews [[function_constant(93)]];
constant bool sc_EnvmapSpecularHasSwappedViews_tmp = is_function_constant_defined(sc_EnvmapSpecularHasSwappedViews) ? sc_EnvmapSpecularHasSwappedViews : false;
constant bool sc_FramebufferFetch [[function_constant(94)]];
constant bool sc_FramebufferFetch_tmp = is_function_constant_defined(sc_FramebufferFetch) ? sc_FramebufferFetch : false;
constant bool sc_HasDiffuseEnvmap [[function_constant(95)]];
constant bool sc_HasDiffuseEnvmap_tmp = is_function_constant_defined(sc_HasDiffuseEnvmap) ? sc_HasDiffuseEnvmap : false;
constant bool sc_LightEstimation [[function_constant(96)]];
constant bool sc_LightEstimation_tmp = is_function_constant_defined(sc_LightEstimation) ? sc_LightEstimation : false;
constant bool sc_MotionVectorsPass [[function_constant(97)]];
constant bool sc_MotionVectorsPass_tmp = is_function_constant_defined(sc_MotionVectorsPass) ? sc_MotionVectorsPass : false;
constant bool sc_OITCompositingPass [[function_constant(98)]];
constant bool sc_OITCompositingPass_tmp = is_function_constant_defined(sc_OITCompositingPass) ? sc_OITCompositingPass : false;
constant bool sc_OITDepthBoundsPass [[function_constant(99)]];
constant bool sc_OITDepthBoundsPass_tmp = is_function_constant_defined(sc_OITDepthBoundsPass) ? sc_OITDepthBoundsPass : false;
constant bool sc_OITDepthGatherPass [[function_constant(100)]];
constant bool sc_OITDepthGatherPass_tmp = is_function_constant_defined(sc_OITDepthGatherPass) ? sc_OITDepthGatherPass : false;
constant bool sc_ProjectiveShadowsCaster [[function_constant(101)]];
constant bool sc_ProjectiveShadowsCaster_tmp = is_function_constant_defined(sc_ProjectiveShadowsCaster) ? sc_ProjectiveShadowsCaster : false;
constant bool sc_ProjectiveShadowsReceiver [[function_constant(102)]];
constant bool sc_ProjectiveShadowsReceiver_tmp = is_function_constant_defined(sc_ProjectiveShadowsReceiver) ? sc_ProjectiveShadowsReceiver : false;
constant bool sc_ProxyAlphaOne [[function_constant(103)]];
constant bool sc_ProxyAlphaOne_tmp = is_function_constant_defined(sc_ProxyAlphaOne) ? sc_ProxyAlphaOne : false;
constant bool sc_RayTracedAoTextureHasSwappedViews [[function_constant(104)]];
constant bool sc_RayTracedAoTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedAoTextureHasSwappedViews) ? sc_RayTracedAoTextureHasSwappedViews : false;
constant bool sc_RayTracedDiffIndTextureHasSwappedViews [[function_constant(105)]];
constant bool sc_RayTracedDiffIndTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureHasSwappedViews) ? sc_RayTracedDiffIndTextureHasSwappedViews : false;
constant bool sc_RayTracedShadowTextureHasSwappedViews [[function_constant(106)]];
constant bool sc_RayTracedShadowTextureHasSwappedViews_tmp = is_function_constant_defined(sc_RayTracedShadowTextureHasSwappedViews) ? sc_RayTracedShadowTextureHasSwappedViews : false;
constant bool sc_RenderAlphaToColor [[function_constant(107)]];
constant bool sc_RenderAlphaToColor_tmp = is_function_constant_defined(sc_RenderAlphaToColor) ? sc_RenderAlphaToColor : false;
constant bool sc_SSAOEnabled [[function_constant(108)]];
constant bool sc_SSAOEnabled_tmp = is_function_constant_defined(sc_SSAOEnabled) ? sc_SSAOEnabled : false;
constant bool sc_ScreenTextureHasSwappedViews [[function_constant(109)]];
constant bool sc_ScreenTextureHasSwappedViews_tmp = is_function_constant_defined(sc_ScreenTextureHasSwappedViews) ? sc_ScreenTextureHasSwappedViews : false;
constant bool sc_ShaderComplexityAnalyzer [[function_constant(110)]];
constant bool sc_ShaderComplexityAnalyzer_tmp = is_function_constant_defined(sc_ShaderComplexityAnalyzer) ? sc_ShaderComplexityAnalyzer : false;
constant bool sc_UseFramebufferFetchMarker [[function_constant(111)]];
constant bool sc_UseFramebufferFetchMarker_tmp = is_function_constant_defined(sc_UseFramebufferFetchMarker) ? sc_UseFramebufferFetchMarker : false;
constant bool sc_VertexBlendingUseNormals [[function_constant(112)]];
constant bool sc_VertexBlendingUseNormals_tmp = is_function_constant_defined(sc_VertexBlendingUseNormals) ? sc_VertexBlendingUseNormals : false;
constant bool sc_VertexBlending [[function_constant(113)]];
constant bool sc_VertexBlending_tmp = is_function_constant_defined(sc_VertexBlending) ? sc_VertexBlending : false;
constant bool uv2EnableAnimation [[function_constant(114)]];
constant bool uv2EnableAnimation_tmp = is_function_constant_defined(uv2EnableAnimation) ? uv2EnableAnimation : false;
constant bool uv3EnableAnimation [[function_constant(115)]];
constant bool uv3EnableAnimation_tmp = is_function_constant_defined(uv3EnableAnimation) ? uv3EnableAnimation : false;
constant int NODE_13_DROPLIST_ITEM [[function_constant(116)]];
constant int NODE_13_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_13_DROPLIST_ITEM) ? NODE_13_DROPLIST_ITEM : 0;
constant int NODE_181_DROPLIST_ITEM [[function_constant(117)]];
constant int NODE_181_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_181_DROPLIST_ITEM) ? NODE_181_DROPLIST_ITEM : 0;
constant int NODE_184_DROPLIST_ITEM [[function_constant(118)]];
constant int NODE_184_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_184_DROPLIST_ITEM) ? NODE_184_DROPLIST_ITEM : 0;
constant int NODE_228_DROPLIST_ITEM [[function_constant(119)]];
constant int NODE_228_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_228_DROPLIST_ITEM) ? NODE_228_DROPLIST_ITEM : 0;
constant int NODE_27_DROPLIST_ITEM [[function_constant(120)]];
constant int NODE_27_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_27_DROPLIST_ITEM) ? NODE_27_DROPLIST_ITEM : 0;
constant int NODE_315_DROPLIST_ITEM [[function_constant(121)]];
constant int NODE_315_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_315_DROPLIST_ITEM) ? NODE_315_DROPLIST_ITEM : 0;
constant int NODE_38_DROPLIST_ITEM [[function_constant(122)]];
constant int NODE_38_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_38_DROPLIST_ITEM) ? NODE_38_DROPLIST_ITEM : 0;
constant int NODE_49_DROPLIST_ITEM [[function_constant(123)]];
constant int NODE_49_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_49_DROPLIST_ITEM) ? NODE_49_DROPLIST_ITEM : 0;
constant int NODE_76_DROPLIST_ITEM [[function_constant(124)]];
constant int NODE_76_DROPLIST_ITEM_tmp = is_function_constant_defined(NODE_76_DROPLIST_ITEM) ? NODE_76_DROPLIST_ITEM : 0;
constant int SC_DEVICE_CLASS [[function_constant(125)]];
constant int SC_DEVICE_CLASS_tmp = is_function_constant_defined(SC_DEVICE_CLASS) ? SC_DEVICE_CLASS : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex [[function_constant(126)]];
constant int SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_baseTex) ? SC_SOFTWARE_WRAP_MODE_U_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex [[function_constant(127)]];
constant int SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_U_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTex [[function_constant(128)]];
constant int SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_emissiveTex) ? SC_SOFTWARE_WRAP_MODE_U_emissiveTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture [[function_constant(129)]];
constant int SC_SOFTWARE_WRAP_MODE_U_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_U_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex [[function_constant(130)]];
constant int SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_normalTex) ? SC_SOFTWARE_WRAP_MODE_U_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex [[function_constant(131)]];
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex) ? SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionTex [[function_constant(132)]];
constant int SC_SOFTWARE_WRAP_MODE_U_reflectionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_reflectionTex) ? SC_SOFTWARE_WRAP_MODE_U_reflectionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_U_rimColorTex [[function_constant(133)]];
constant int SC_SOFTWARE_WRAP_MODE_U_rimColorTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_U_rimColorTex) ? SC_SOFTWARE_WRAP_MODE_U_rimColorTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex [[function_constant(134)]];
constant int SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_baseTex) ? SC_SOFTWARE_WRAP_MODE_V_baseTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex [[function_constant(135)]];
constant int SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_detailNormalTex) ? SC_SOFTWARE_WRAP_MODE_V_detailNormalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTex [[function_constant(136)]];
constant int SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_emissiveTex) ? SC_SOFTWARE_WRAP_MODE_V_emissiveTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture [[function_constant(137)]];
constant int SC_SOFTWARE_WRAP_MODE_V_intensityTexture_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_intensityTexture) ? SC_SOFTWARE_WRAP_MODE_V_intensityTexture : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex [[function_constant(138)]];
constant int SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_normalTex) ? SC_SOFTWARE_WRAP_MODE_V_normalTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex [[function_constant(139)]];
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex) ? SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionTex [[function_constant(140)]];
constant int SC_SOFTWARE_WRAP_MODE_V_reflectionTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_reflectionTex) ? SC_SOFTWARE_WRAP_MODE_V_reflectionTex : -1;
constant int SC_SOFTWARE_WRAP_MODE_V_rimColorTex [[function_constant(141)]];
constant int SC_SOFTWARE_WRAP_MODE_V_rimColorTex_tmp = is_function_constant_defined(SC_SOFTWARE_WRAP_MODE_V_rimColorTex) ? SC_SOFTWARE_WRAP_MODE_V_rimColorTex : -1;
constant int baseTexLayout [[function_constant(142)]];
constant int baseTexLayout_tmp = is_function_constant_defined(baseTexLayout) ? baseTexLayout : 0;
constant int detailNormalTexLayout [[function_constant(143)]];
constant int detailNormalTexLayout_tmp = is_function_constant_defined(detailNormalTexLayout) ? detailNormalTexLayout : 0;
constant int emissiveTexLayout [[function_constant(144)]];
constant int emissiveTexLayout_tmp = is_function_constant_defined(emissiveTexLayout) ? emissiveTexLayout : 0;
constant int intensityTextureLayout [[function_constant(145)]];
constant int intensityTextureLayout_tmp = is_function_constant_defined(intensityTextureLayout) ? intensityTextureLayout : 0;
constant int normalTexLayout [[function_constant(146)]];
constant int normalTexLayout_tmp = is_function_constant_defined(normalTexLayout) ? normalTexLayout : 0;
constant int reflectionModulationTexLayout [[function_constant(147)]];
constant int reflectionModulationTexLayout_tmp = is_function_constant_defined(reflectionModulationTexLayout) ? reflectionModulationTexLayout : 0;
constant int reflectionTexLayout [[function_constant(148)]];
constant int reflectionTexLayout_tmp = is_function_constant_defined(reflectionTexLayout) ? reflectionTexLayout : 0;
constant int rimColorTexLayout [[function_constant(149)]];
constant int rimColorTexLayout_tmp = is_function_constant_defined(rimColorTexLayout) ? rimColorTexLayout : 0;
constant int sc_AmbientLightMode0 [[function_constant(150)]];
constant int sc_AmbientLightMode0_tmp = is_function_constant_defined(sc_AmbientLightMode0) ? sc_AmbientLightMode0 : 0;
constant int sc_AmbientLightMode1 [[function_constant(151)]];
constant int sc_AmbientLightMode1_tmp = is_function_constant_defined(sc_AmbientLightMode1) ? sc_AmbientLightMode1 : 0;
constant int sc_AmbientLightMode2 [[function_constant(152)]];
constant int sc_AmbientLightMode2_tmp = is_function_constant_defined(sc_AmbientLightMode2) ? sc_AmbientLightMode2 : 0;
constant int sc_AmbientLightMode_Constant [[function_constant(153)]];
constant int sc_AmbientLightMode_Constant_tmp = is_function_constant_defined(sc_AmbientLightMode_Constant) ? sc_AmbientLightMode_Constant : 0;
constant int sc_AmbientLightMode_EnvironmentMap [[function_constant(154)]];
constant int sc_AmbientLightMode_EnvironmentMap_tmp = is_function_constant_defined(sc_AmbientLightMode_EnvironmentMap) ? sc_AmbientLightMode_EnvironmentMap : 0;
constant int sc_AmbientLightMode_FromCamera [[function_constant(155)]];
constant int sc_AmbientLightMode_FromCamera_tmp = is_function_constant_defined(sc_AmbientLightMode_FromCamera) ? sc_AmbientLightMode_FromCamera : 0;
constant int sc_AmbientLightMode_SphericalHarmonics [[function_constant(156)]];
constant int sc_AmbientLightMode_SphericalHarmonics_tmp = is_function_constant_defined(sc_AmbientLightMode_SphericalHarmonics) ? sc_AmbientLightMode_SphericalHarmonics : 0;
constant int sc_AmbientLightsCount [[function_constant(157)]];
constant int sc_AmbientLightsCount_tmp = is_function_constant_defined(sc_AmbientLightsCount) ? sc_AmbientLightsCount : 0;
constant int sc_DepthBufferMode [[function_constant(158)]];
constant int sc_DepthBufferMode_tmp = is_function_constant_defined(sc_DepthBufferMode) ? sc_DepthBufferMode : 0;
constant int sc_DirectionalLightsCount [[function_constant(159)]];
constant int sc_DirectionalLightsCount_tmp = is_function_constant_defined(sc_DirectionalLightsCount) ? sc_DirectionalLightsCount : 0;
constant int sc_EnvLightMode [[function_constant(160)]];
constant int sc_EnvLightMode_tmp = is_function_constant_defined(sc_EnvLightMode) ? sc_EnvLightMode : 0;
constant int sc_EnvmapDiffuseLayout [[function_constant(161)]];
constant int sc_EnvmapDiffuseLayout_tmp = is_function_constant_defined(sc_EnvmapDiffuseLayout) ? sc_EnvmapDiffuseLayout : 0;
constant int sc_EnvmapSpecularLayout [[function_constant(162)]];
constant int sc_EnvmapSpecularLayout_tmp = is_function_constant_defined(sc_EnvmapSpecularLayout) ? sc_EnvmapSpecularLayout : 0;
constant int sc_LightEstimationSGCount [[function_constant(163)]];
constant int sc_LightEstimationSGCount_tmp = is_function_constant_defined(sc_LightEstimationSGCount) ? sc_LightEstimationSGCount : 0;
constant int sc_MaxTextureImageUnits [[function_constant(164)]];
constant int sc_MaxTextureImageUnits_tmp = is_function_constant_defined(sc_MaxTextureImageUnits) ? sc_MaxTextureImageUnits : 0;
constant int sc_PointLightsCount [[function_constant(165)]];
constant int sc_PointLightsCount_tmp = is_function_constant_defined(sc_PointLightsCount) ? sc_PointLightsCount : 0;
constant int sc_RayTracedAoTextureLayout [[function_constant(166)]];
constant int sc_RayTracedAoTextureLayout_tmp = is_function_constant_defined(sc_RayTracedAoTextureLayout) ? sc_RayTracedAoTextureLayout : 0;
constant int sc_RayTracedDiffIndTextureLayout [[function_constant(167)]];
constant int sc_RayTracedDiffIndTextureLayout_tmp = is_function_constant_defined(sc_RayTracedDiffIndTextureLayout) ? sc_RayTracedDiffIndTextureLayout : 0;
constant int sc_RayTracedShadowTextureLayout [[function_constant(168)]];
constant int sc_RayTracedShadowTextureLayout_tmp = is_function_constant_defined(sc_RayTracedShadowTextureLayout) ? sc_RayTracedShadowTextureLayout : 0;
constant int sc_RenderingSpace [[function_constant(169)]];
constant int sc_RenderingSpace_tmp = is_function_constant_defined(sc_RenderingSpace) ? sc_RenderingSpace : -1;
constant int sc_ScreenTextureLayout [[function_constant(170)]];
constant int sc_ScreenTextureLayout_tmp = is_function_constant_defined(sc_ScreenTextureLayout) ? sc_ScreenTextureLayout : 0;
constant int sc_ShaderCacheConstant [[function_constant(171)]];
constant int sc_ShaderCacheConstant_tmp = is_function_constant_defined(sc_ShaderCacheConstant) ? sc_ShaderCacheConstant : 0;
constant int sc_SkinBonesCount [[function_constant(172)]];
constant int sc_SkinBonesCount_tmp = is_function_constant_defined(sc_SkinBonesCount) ? sc_SkinBonesCount : 0;
constant int sc_StereoRenderingMode [[function_constant(173)]];
constant int sc_StereoRenderingMode_tmp = is_function_constant_defined(sc_StereoRenderingMode) ? sc_StereoRenderingMode : 0;
constant int sc_StereoRendering_IsClipDistanceEnabled [[function_constant(174)]];
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
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
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
float3 recolorRed;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float progress_value;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float reflectionIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float rimExponent;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float Port_Import_N012;
float2 Port_Import_N254;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float Port_Import_N065;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float Port_Import_N273;
float Port_Input1_N274;
float Port_Import_N131;
float Port_Import_N116;
float2 Port_Import_N120;
float2 Port_Import_N127;
float4 Port_Default_N132;
float3 Port_Import_N295;
float Port_Import_N296;
float Port_Import_N133;
float Port_Import_N231;
float3 Port_Import_N327;
float3 Port_Input1_N257;
float3 Port_Import_N259;
float Port_Input1_N264;
float Port_Input1_N268;
float Port_Input1_N270;
float Port_Import_N123;
float Port_Import_N025;
float2 Port_Import_N030;
float2 Port_Import_N031;
float3 Port_Default_N041;
float3 Port_Default_N134;
float3 Port_Import_N298;
float Port_Import_N172;
float3 Port_Import_N318;
float Port_Import_N319;
float Port_Import_N171;
float Port_Import_N135;
float2 Port_Import_N150;
float2 Port_Import_N152;
float3 Port_Default_N170;
float Port_Import_N339;
float3 Port_Import_N328;
float Port_Import_N340;
float3 Port_Default_N173;
float3 Port_Import_N306;
float3 Port_AO_N036;
float depthRef;
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
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> emissiveTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> normalTex [[id(8)]];
texture2d<float> reflectionModulationTex [[id(9)]];
texture2d<float> reflectionTex [[id(10)]];
texture2d<float> rimColorTex [[id(11)]];
texture2d<float> sc_EnvmapDiffuse [[id(12)]];
texture2d<float> sc_EnvmapSpecular [[id(13)]];
texture2d<float> sc_RayTracedAoTexture [[id(22)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(23)]];
texture2d<float> sc_RayTracedShadowTexture [[id(25)]];
texture2d<float> sc_SSAOTexture [[id(26)]];
texture2d<float> sc_ScreenTexture [[id(27)]];
texture2d<float> sc_ShadowTexture [[id(28)]];
texture2d<uint> z_hitIdAndBarycentric [[id(30)]];
texture2d<float> z_rayDirections [[id(31)]];
sampler baseTexSmpSC [[id(32)]];
sampler detailNormalTexSmpSC [[id(33)]];
sampler emissiveTexSmpSC [[id(34)]];
sampler intensityTextureSmpSC [[id(35)]];
sampler normalTexSmpSC [[id(36)]];
sampler reflectionModulationTexSmpSC [[id(37)]];
sampler reflectionTexSmpSC [[id(38)]];
sampler rimColorTexSmpSC [[id(39)]];
sampler sc_EnvmapDiffuseSmpSC [[id(40)]];
sampler sc_EnvmapSpecularSmpSC [[id(41)]];
sampler sc_RayTracedAoTextureSmpSC [[id(43)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(44)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(46)]];
sampler sc_SSAOTextureSmpSC [[id(47)]];
sampler sc_ScreenTextureSmpSC [[id(48)]];
sampler sc_ShadowTextureSmpSC [[id(49)]];
sampler z_hitIdAndBarycentricSmp [[id(51)]];
sampler z_rayDirectionsSmpSC [[id(52)]];
constant userUniformsObj* UserUniforms [[id(53)]];
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
bool l9_0=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_0)
{
float4 param=float4(in.position.xy,(*sc_set0.UserUniforms).depthRef+(1e-10*in.position.z),1.0+(1e-10*in.position.w));
if (sc_ShaderCacheConstant_tmp!=0)
{
param.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_1=param;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_2=dot(l9_1,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_3=l9_2;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_3;
}
}
float4 l9_4=float4(param.x,-param.y,(param.z*0.5)+(param.w*0.5),param.w);
out.gl_Position=l9_4;
return out;
}
out.PreviewVertexColor=float4(0.5);
ssPreviewInfo PreviewInfo;
PreviewInfo.Color=float4(0.5);
PreviewInfo.Saved=false;
out.PreviewVertexSaved=0.0;
sc_Vertex_t l9_6;
l9_6.position=in.position;
l9_6.normal=in.normal;
l9_6.tangent=in.tangent.xyz;
l9_6.texture0=in.texture0;
l9_6.texture1=in.texture1;
sc_Vertex_t l9_7=l9_6;
sc_Vertex_t param_1=l9_7;
sc_Vertex_t l9_8=param_1;
if ((int(sc_VertexBlending_tmp)!=0))
{
if ((int(sc_VertexBlendingUseNormals_tmp)!=0))
{
sc_Vertex_t l9_9=l9_8;
float3 l9_10=in.blendShape0Pos;
float3 l9_11=in.blendShape0Normal;
float l9_12=(*sc_set0.UserUniforms).weights0.x;
sc_Vertex_t l9_13=l9_9;
float3 l9_14=l9_10;
float l9_15=l9_12;
float3 l9_16=l9_13.position.xyz+(l9_14*l9_15);
l9_13.position=float4(l9_16.x,l9_16.y,l9_16.z,l9_13.position.w);
l9_9=l9_13;
l9_9.normal+=(l9_11*l9_12);
l9_8=l9_9;
sc_Vertex_t l9_17=l9_8;
float3 l9_18=in.blendShape1Pos;
float3 l9_19=in.blendShape1Normal;
float l9_20=(*sc_set0.UserUniforms).weights0.y;
sc_Vertex_t l9_21=l9_17;
float3 l9_22=l9_18;
float l9_23=l9_20;
float3 l9_24=l9_21.position.xyz+(l9_22*l9_23);
l9_21.position=float4(l9_24.x,l9_24.y,l9_24.z,l9_21.position.w);
l9_17=l9_21;
l9_17.normal+=(l9_19*l9_20);
l9_8=l9_17;
sc_Vertex_t l9_25=l9_8;
float3 l9_26=in.blendShape2Pos;
float3 l9_27=in.blendShape2Normal;
float l9_28=(*sc_set0.UserUniforms).weights0.z;
sc_Vertex_t l9_29=l9_25;
float3 l9_30=l9_26;
float l9_31=l9_28;
float3 l9_32=l9_29.position.xyz+(l9_30*l9_31);
l9_29.position=float4(l9_32.x,l9_32.y,l9_32.z,l9_29.position.w);
l9_25=l9_29;
l9_25.normal+=(l9_27*l9_28);
l9_8=l9_25;
}
else
{
sc_Vertex_t l9_33=l9_8;
float3 l9_34=in.blendShape0Pos;
float l9_35=(*sc_set0.UserUniforms).weights0.x;
float3 l9_36=l9_33.position.xyz+(l9_34*l9_35);
l9_33.position=float4(l9_36.x,l9_36.y,l9_36.z,l9_33.position.w);
l9_8=l9_33;
sc_Vertex_t l9_37=l9_8;
float3 l9_38=in.blendShape1Pos;
float l9_39=(*sc_set0.UserUniforms).weights0.y;
float3 l9_40=l9_37.position.xyz+(l9_38*l9_39);
l9_37.position=float4(l9_40.x,l9_40.y,l9_40.z,l9_37.position.w);
l9_8=l9_37;
sc_Vertex_t l9_41=l9_8;
float3 l9_42=in.blendShape2Pos;
float l9_43=(*sc_set0.UserUniforms).weights0.z;
float3 l9_44=l9_41.position.xyz+(l9_42*l9_43);
l9_41.position=float4(l9_44.x,l9_44.y,l9_44.z,l9_41.position.w);
l9_8=l9_41;
sc_Vertex_t l9_45=l9_8;
float3 l9_46=in.blendShape3Pos;
float l9_47=(*sc_set0.UserUniforms).weights0.w;
float3 l9_48=l9_45.position.xyz+(l9_46*l9_47);
l9_45.position=float4(l9_48.x,l9_48.y,l9_48.z,l9_45.position.w);
l9_8=l9_45;
sc_Vertex_t l9_49=l9_8;
float3 l9_50=in.blendShape4Pos;
float l9_51=(*sc_set0.UserUniforms).weights1.x;
float3 l9_52=l9_49.position.xyz+(l9_50*l9_51);
l9_49.position=float4(l9_52.x,l9_52.y,l9_52.z,l9_49.position.w);
l9_8=l9_49;
sc_Vertex_t l9_53=l9_8;
float3 l9_54=in.blendShape5Pos;
float l9_55=(*sc_set0.UserUniforms).weights1.y;
float3 l9_56=l9_53.position.xyz+(l9_54*l9_55);
l9_53.position=float4(l9_56.x,l9_56.y,l9_56.z,l9_53.position.w);
l9_8=l9_53;
}
}
param_1=l9_8;
sc_Vertex_t l9_57=param_1;
if (sc_SkinBonesCount_tmp>0)
{
float4 l9_58=float4(0.0);
if (sc_SkinBonesCount_tmp>0)
{
l9_58=float4(1.0,fract(in.boneData.yzw));
l9_58.x-=dot(l9_58.yzw,float3(1.0));
}
float4 l9_59=l9_58;
float4 l9_60=l9_59;
int l9_61=int(in.boneData.x);
int l9_62=int(in.boneData.y);
int l9_63=int(in.boneData.z);
int l9_64=int(in.boneData.w);
int l9_65=l9_61;
float4 l9_66=l9_57.position;
float3 l9_67=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_68=l9_65;
float4 l9_69=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[0];
float4 l9_70=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[1];
float4 l9_71=(*sc_set0.sc_BonesUBO).sc_Bones[l9_68].boneMatrix[2];
float4 l9_72[3];
l9_72[0]=l9_69;
l9_72[1]=l9_70;
l9_72[2]=l9_71;
l9_67=float3(dot(l9_66,l9_72[0]),dot(l9_66,l9_72[1]),dot(l9_66,l9_72[2]));
}
else
{
l9_67=l9_66.xyz;
}
float3 l9_73=l9_67;
float3 l9_74=l9_73;
float l9_75=l9_60.x;
int l9_76=l9_62;
float4 l9_77=l9_57.position;
float3 l9_78=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_79=l9_76;
float4 l9_80=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[0];
float4 l9_81=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[1];
float4 l9_82=(*sc_set0.sc_BonesUBO).sc_Bones[l9_79].boneMatrix[2];
float4 l9_83[3];
l9_83[0]=l9_80;
l9_83[1]=l9_81;
l9_83[2]=l9_82;
l9_78=float3(dot(l9_77,l9_83[0]),dot(l9_77,l9_83[1]),dot(l9_77,l9_83[2]));
}
else
{
l9_78=l9_77.xyz;
}
float3 l9_84=l9_78;
float3 l9_85=l9_84;
float l9_86=l9_60.y;
int l9_87=l9_63;
float4 l9_88=l9_57.position;
float3 l9_89=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_90=l9_87;
float4 l9_91=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[0];
float4 l9_92=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[1];
float4 l9_93=(*sc_set0.sc_BonesUBO).sc_Bones[l9_90].boneMatrix[2];
float4 l9_94[3];
l9_94[0]=l9_91;
l9_94[1]=l9_92;
l9_94[2]=l9_93;
l9_89=float3(dot(l9_88,l9_94[0]),dot(l9_88,l9_94[1]),dot(l9_88,l9_94[2]));
}
else
{
l9_89=l9_88.xyz;
}
float3 l9_95=l9_89;
float3 l9_96=l9_95;
float l9_97=l9_60.z;
int l9_98=l9_64;
float4 l9_99=l9_57.position;
float3 l9_100=float3(0.0);
if (sc_SkinBonesCount_tmp>0)
{
int l9_101=l9_98;
float4 l9_102=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[0];
float4 l9_103=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[1];
float4 l9_104=(*sc_set0.sc_BonesUBO).sc_Bones[l9_101].boneMatrix[2];
float4 l9_105[3];
l9_105[0]=l9_102;
l9_105[1]=l9_103;
l9_105[2]=l9_104;
l9_100=float3(dot(l9_99,l9_105[0]),dot(l9_99,l9_105[1]),dot(l9_99,l9_105[2]));
}
else
{
l9_100=l9_99.xyz;
}
float3 l9_106=l9_100;
float3 l9_107=(((l9_74*l9_75)+(l9_85*l9_86))+(l9_96*l9_97))+(l9_106*l9_60.w);
l9_57.position=float4(l9_107.x,l9_107.y,l9_107.z,l9_57.position.w);
int l9_108=l9_61;
float3x3 l9_109=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_108].normalMatrix[2].xyz));
float3x3 l9_110=l9_109;
float3x3 l9_111=l9_110;
int l9_112=l9_62;
float3x3 l9_113=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_112].normalMatrix[2].xyz));
float3x3 l9_114=l9_113;
float3x3 l9_115=l9_114;
int l9_116=l9_63;
float3x3 l9_117=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_116].normalMatrix[2].xyz));
float3x3 l9_118=l9_117;
float3x3 l9_119=l9_118;
int l9_120=l9_64;
float3x3 l9_121=float3x3(float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[0].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[1].xyz),float3((*sc_set0.sc_BonesUBO).sc_Bones[l9_120].normalMatrix[2].xyz));
float3x3 l9_122=l9_121;
float3x3 l9_123=l9_122;
l9_57.normal=((((l9_111*l9_57.normal)*l9_60.x)+((l9_115*l9_57.normal)*l9_60.y))+((l9_119*l9_57.normal)*l9_60.z))+((l9_123*l9_57.normal)*l9_60.w);
l9_57.tangent=((((l9_111*l9_57.tangent)*l9_60.x)+((l9_115*l9_57.tangent)*l9_60.y))+((l9_119*l9_57.tangent)*l9_60.z))+((l9_123*l9_57.tangent)*l9_60.w);
}
param_1=l9_57;
if (sc_RenderingSpace_tmp==3)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==4)
{
out.varPos=float3(0.0);
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
out.varPos=param_1.position.xyz;
out.varNormal=param_1.normal;
out.varTangent=float4(param_1.tangent.x,param_1.tangent.y,param_1.tangent.z,out.varTangent.w);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
out.varPos=((*sc_set0.UserUniforms).sc_ModelMatrix*param_1.position).xyz;
out.varNormal=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.normal;
float3 l9_124=(*sc_set0.UserUniforms).sc_NormalMatrix*param_1.tangent;
out.varTangent=float4(l9_124.x,l9_124.y,l9_124.z,out.varTangent.w);
}
}
}
}
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
param_1.texture0.x=1.0-param_1.texture0.x;
}
out.varColor=in.color;
sc_Vertex_t v=param_1;
float3 WorldPosition=out.varPos;
float3 WorldNormal=out.varNormal;
float3 WorldTangent=out.varTangent.xyz;
if ((*sc_set0.UserUniforms).PreviewEnabled==1)
{
WorldPosition=out.varPos;
WorldNormal=out.varNormal;
WorldTangent=out.varTangent.xyz;
}
sc_Vertex_t param_2=v;
float3 param_3=WorldPosition;
float3 param_4=WorldNormal;
float3 param_5=WorldTangent;
float4 param_6=v.position;
out.varPos=param_3;
out.varNormal=normalize(param_4);
float3 l9_125=normalize(param_5);
out.varTangent=float4(l9_125.x,l9_125.y,l9_125.z,out.varTangent.w);
out.varTangent.w=in.tangent.w;
if ((int(UseViewSpaceDepthVariant_tmp)!=0)&&(((int(sc_OITDepthGatherPass_tmp)!=0)||(int(sc_OITCompositingPass_tmp)!=0))||(int(sc_OITDepthBoundsPass_tmp)!=0)))
{
float4 l9_126=param_2.position;
float4 l9_127=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
int l9_128=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_128=0;
}
else
{
l9_128=gl_InstanceIndex%2;
}
int l9_129=l9_128;
l9_127=(*sc_set0.UserUniforms).sc_ProjectionMatrixInverseArray[l9_129]*l9_126;
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_130=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_130=0;
}
else
{
l9_130=gl_InstanceIndex%2;
}
int l9_131=l9_130;
l9_127=(*sc_set0.UserUniforms).sc_ViewMatrixArray[l9_131]*l9_126;
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_132=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_132=0;
}
else
{
l9_132=gl_InstanceIndex%2;
}
int l9_133=l9_132;
l9_127=(*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_133]*l9_126;
}
else
{
l9_127=l9_126;
}
}
}
float4 l9_134=l9_127;
out.varViewSpaceDepth=-l9_134.z;
}
float4 l9_135=float4(0.0);
if (sc_RenderingSpace_tmp==3)
{
l9_135=param_6;
}
else
{
if (sc_RenderingSpace_tmp==4)
{
int l9_136=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_136=0;
}
else
{
l9_136=gl_InstanceIndex%2;
}
int l9_137=l9_136;
l9_135=((*sc_set0.UserUniforms).sc_ModelViewMatrixArray[l9_137]*param_2.position)*float4(1.0/(*sc_set0.UserUniforms).sc_Camera.aspect,1.0,1.0,1.0);
}
else
{
if (sc_RenderingSpace_tmp==2)
{
int l9_138=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_138=0;
}
else
{
l9_138=gl_InstanceIndex%2;
}
int l9_139=l9_138;
l9_135=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_139]*float4(out.varPos,1.0);
}
else
{
if (sc_RenderingSpace_tmp==1)
{
int l9_140=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_140=0;
}
else
{
l9_140=gl_InstanceIndex%2;
}
int l9_141=l9_140;
l9_135=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_141]*float4(out.varPos,1.0);
}
}
}
}
out.varPackedTex=float4(param_2.texture0,param_2.texture1);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float4 l9_142=param_2.position;
float4 l9_143=l9_142;
if (sc_RenderingSpace_tmp==1)
{
l9_143=(*sc_set0.UserUniforms).sc_ModelMatrix*l9_142;
}
float4 l9_144=(*sc_set0.UserUniforms).sc_ProjectorMatrix*l9_143;
float2 l9_145=((l9_144.xy/float2(l9_144.w))*0.5)+float2(0.5);
out.varShadowTex=l9_145;
}
float4 l9_146=l9_135;
if (sc_DepthBufferMode_tmp==1)
{
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
if ((*sc_set0.UserUniforms).sc_ProjectionMatrixArray[l9_148][2].w!=0.0)
{
float l9_149=2.0/log2((*sc_set0.UserUniforms).sc_Camera.clipPlanes.y+1.0);
l9_146.z=((log2(fast::max((*sc_set0.UserUniforms).sc_Camera.clipPlanes.x,1.0+l9_146.w))*l9_149)-1.0)*l9_146.w;
}
}
float4 l9_150=l9_146;
l9_135=l9_150;
float4 l9_151=l9_135;
float4 l9_152=l9_151;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_152.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
if (sc_StereoRenderingMode_tmp>0)
{
out.varStereoViewID=gl_InstanceIndex%2;
}
float4 l9_153=l9_152;
if (sc_StereoRenderingMode_tmp==1)
{
float l9_154=dot(l9_153,(*sc_set0.UserUniforms).sc_StereoClipPlanes[gl_InstanceIndex%2]);
float l9_155=l9_154;
if (sc_StereoRendering_IsClipDistanceEnabled_tmp==1)
{
}
else
{
out.varClipDistance=l9_155;
}
}
float4 l9_156=float4(l9_152.x,-l9_152.y,(l9_152.z*0.5)+(l9_152.w*0.5),l9_152.w);
out.gl_Position=l9_156;
v=param_2;
if (PreviewInfo.Saved)
{
out.PreviewVertexColor=float4(PreviewInfo.Color.xyz,1.0);
out.PreviewVertexSaved=1.0;
}
return out;
}
} // VERTEX SHADER


namespace SNAP_FS {
struct RayHitPayload
{
float3 viewDirWS;
float3 positionWS;
float3 normalWS;
float4 tangentWS;
float4 color;
float2 uv0;
float2 uv1;
float2 uv2;
float2 uv3;
uint2 id;
};
struct SurfaceProperties
{
float3 albedo;
float opacity;
float3 normal;
float3 positionWS;
float3 viewDirWS;
float metallic;
float roughness;
float3 emissive;
float3 ao;
float3 specularAo;
float3 bakedShadows;
float3 specColor;
};
struct LightingComponents
{
float3 directDiffuse;
float3 directSpecular;
float3 indirectDiffuse;
float3 indirectSpecular;
float3 emitted;
float3 transmitted;
};
struct LightProperties
{
float3 direction;
float3 color;
float attenuation;
};
struct sc_SphericalGaussianLight_t
{
float3 color;
float sharpness;
float3 axis;
};
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float4 VertexColor;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float2 gScreenCoord;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
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
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
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
float3 recolorRed;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float progress_value;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float reflectionIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float rimExponent;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float Port_Import_N012;
float2 Port_Import_N254;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float Port_Import_N065;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float Port_Import_N273;
float Port_Input1_N274;
float Port_Import_N131;
float Port_Import_N116;
float2 Port_Import_N120;
float2 Port_Import_N127;
float4 Port_Default_N132;
float3 Port_Import_N295;
float Port_Import_N296;
float Port_Import_N133;
float Port_Import_N231;
float3 Port_Import_N327;
float3 Port_Input1_N257;
float3 Port_Import_N259;
float Port_Input1_N264;
float Port_Input1_N268;
float Port_Input1_N270;
float Port_Import_N123;
float Port_Import_N025;
float2 Port_Import_N030;
float2 Port_Import_N031;
float3 Port_Default_N041;
float3 Port_Default_N134;
float3 Port_Import_N298;
float Port_Import_N172;
float3 Port_Import_N318;
float Port_Import_N319;
float Port_Import_N171;
float Port_Import_N135;
float2 Port_Import_N150;
float2 Port_Import_N152;
float3 Port_Default_N170;
float Port_Import_N339;
float3 Port_Import_N328;
float Port_Import_N340;
float3 Port_Default_N173;
float3 Port_Import_N306;
float3 Port_AO_N036;
float depthRef;
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct sc_PointLight_t_1
{
bool falloffEnabled;
float falloffEndDistance;
float negRcpFalloffEndDistance4;
float angleScale;
float angleOffset;
float3 direction;
float3 position;
float4 color;
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
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> emissiveTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> normalTex [[id(8)]];
texture2d<float> reflectionModulationTex [[id(9)]];
texture2d<float> reflectionTex [[id(10)]];
texture2d<float> rimColorTex [[id(11)]];
texture2d<float> sc_EnvmapDiffuse [[id(12)]];
texture2d<float> sc_EnvmapSpecular [[id(13)]];
texture2d<float> sc_RayTracedAoTexture [[id(22)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(23)]];
texture2d<float> sc_RayTracedShadowTexture [[id(25)]];
texture2d<float> sc_SSAOTexture [[id(26)]];
texture2d<float> sc_ScreenTexture [[id(27)]];
texture2d<float> sc_ShadowTexture [[id(28)]];
texture2d<uint> z_hitIdAndBarycentric [[id(30)]];
texture2d<float> z_rayDirections [[id(31)]];
sampler baseTexSmpSC [[id(32)]];
sampler detailNormalTexSmpSC [[id(33)]];
sampler emissiveTexSmpSC [[id(34)]];
sampler intensityTextureSmpSC [[id(35)]];
sampler normalTexSmpSC [[id(36)]];
sampler reflectionModulationTexSmpSC [[id(37)]];
sampler reflectionTexSmpSC [[id(38)]];
sampler rimColorTexSmpSC [[id(39)]];
sampler sc_EnvmapDiffuseSmpSC [[id(40)]];
sampler sc_EnvmapSpecularSmpSC [[id(41)]];
sampler sc_RayTracedAoTextureSmpSC [[id(43)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(44)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(46)]];
sampler sc_SSAOTextureSmpSC [[id(47)]];
sampler sc_ScreenTextureSmpSC [[id(48)]];
sampler sc_ShadowTextureSmpSC [[id(49)]];
sampler z_hitIdAndBarycentricSmp [[id(51)]];
sampler z_rayDirectionsSmpSC [[id(52)]];
constant userUniformsObj* UserUniforms [[id(53)]];
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
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
RayHitPayload GetHitData(thread const int2& screenPos,constant userUniformsObj& UserUniforms,thread texture2d<float> z_rayDirections,thread sampler z_rayDirectionsSmpSC,thread texture2d<uint> z_hitIdAndBarycentric,thread sampler z_hitIdAndBarycentricSmp,const device layoutVertices_obj& layoutVertices,const device layoutVerticesPN_obj& layoutVerticesPN,const device layoutIndices_obj& layoutIndices)
{
int2 param=screenPos;
uint4 l9_0=z_hitIdAndBarycentric.read(uint2(param),0);
uint4 id_and_barycentric=l9_0;
RayHitPayload rhp;
rhp.id=id_and_barycentric.xy;
if (rhp.id.x!=uint(UserUniforms.instance_id))
{
return rhp;
}
float2 brc_vw=float2(as_type<half2>(id_and_barycentric.z|(id_and_barycentric.w<<uint(16))));
float3 brc=float3((1.0-brc_vw.x)-brc_vw.y,brc_vw);
float2 param_1=z_rayDirections.read(uint2(screenPos),0).xy;
float3 l9_1=float3(param_1.x,param_1.y,(1.0-abs(param_1.x))-abs(param_1.y));
float l9_2=fast::clamp(-l9_1.z,0.0,1.0);
float l9_3;
if (l9_1.x>=0.0)
{
l9_3=-l9_2;
}
else
{
l9_3=l9_2;
}
float l9_4=l9_3;
float l9_5;
if (l9_1.y>=0.0)
{
l9_5=-l9_2;
}
else
{
l9_5=l9_2;
}
float2 l9_6=l9_1.xy+float2(l9_4,l9_5);
l9_1=float3(l9_6.x,l9_6.y,l9_1.z);
float3 l9_7=normalize(l9_1);
float3 rayDir=l9_7;
rhp.viewDirWS=-rayDir;
uint param_2=rhp.id.y;
uint l9_8=min(param_2,uint(UserUniforms.lray_triangles_last));
uint l9_9=l9_8*6u;
uint l9_10=l9_9&4294967292u;
uint4 l9_11=(uint4(uint2(layoutIndices._Triangles[l9_10/4u]),uint2(layoutIndices._Triangles[(l9_10/4u)+1u]))&uint4(65535u,4294967295u,65535u,4294967295u))>>uint4(0u,16u,0u,16u);
int3 l9_12;
if (l9_9==l9_10)
{
l9_12=int3(l9_11.xyz);
}
else
{
l9_12=int3(l9_11.yzw);
}
int3 l9_13=l9_12;
int3 i=l9_13;
if (UserUniforms.has_animated_pn!=0)
{
float3 param_3=brc;
int3 param_4=i;
int param_5=0;
int3 l9_14=(param_4*int3(6))+int3(param_5);
int l9_15=l9_14.x;
float3 l9_16=float3(layoutVerticesPN._VerticesPN[l9_15],layoutVerticesPN._VerticesPN[l9_15+1],layoutVerticesPN._VerticesPN[l9_15+2]);
int l9_17=l9_14.y;
float3 l9_18=float3(layoutVerticesPN._VerticesPN[l9_17],layoutVerticesPN._VerticesPN[l9_17+1],layoutVerticesPN._VerticesPN[l9_17+2]);
int l9_19=l9_14.z;
float3 l9_20=float3(layoutVerticesPN._VerticesPN[l9_19],layoutVerticesPN._VerticesPN[l9_19+1],layoutVerticesPN._VerticesPN[l9_19+2]);
float3 l9_21=((l9_16*param_3.x)+(l9_18*param_3.y))+(l9_20*param_3.z);
rhp.positionWS=l9_21;
}
else
{
float3 param_6=brc;
int3 param_7=i;
int3 l9_22=int3((param_7.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position,(param_7.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_position);
float3 l9_23=float3(0.0);
if (UserUniforms.proxy_format_position==5)
{
int l9_24=l9_22.x;
float3 l9_25=float3(layoutVertices._Vertices[l9_24],layoutVertices._Vertices[l9_24+1],layoutVertices._Vertices[l9_24+2]);
int l9_26=l9_22.y;
float3 l9_27=float3(layoutVertices._Vertices[l9_26],layoutVertices._Vertices[l9_26+1],layoutVertices._Vertices[l9_26+2]);
int l9_28=l9_22.z;
float3 l9_29=float3(layoutVertices._Vertices[l9_28],layoutVertices._Vertices[l9_28+1],layoutVertices._Vertices[l9_28+2]);
l9_23=((l9_25*param_6.x)+(l9_27*param_6.y))+(l9_29*param_6.z);
}
else
{
if (UserUniforms.proxy_format_position==6)
{
int l9_30=l9_22.x;
float3 l9_31=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_30+1]))).x);
int l9_32=l9_22.y;
float3 l9_33=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_32+1]))).x);
int l9_34=l9_22.z;
float3 l9_35=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_34+1]))).x);
l9_23=((l9_31*param_6.x)+(l9_33*param_6.y))+(l9_35*param_6.z);
}
else
{
l9_23=float3(1.0,0.0,0.0);
}
}
float3 l9_36=l9_23;
float3 positionOS=l9_36;
rhp.positionWS=(UserUniforms.sc_ModelMatrix*float4(positionOS,1.0)).xyz;
}
if (UserUniforms.proxy_offset_normal>0)
{
if (UserUniforms.has_animated_pn!=0)
{
float3 param_8=brc;
int3 param_9=i;
int param_10=3;
int3 l9_37=(param_9*int3(6))+int3(param_10);
int l9_38=l9_37.x;
float3 l9_39=float3(layoutVerticesPN._VerticesPN[l9_38],layoutVerticesPN._VerticesPN[l9_38+1],layoutVerticesPN._VerticesPN[l9_38+2]);
int l9_40=l9_37.y;
float3 l9_41=float3(layoutVerticesPN._VerticesPN[l9_40],layoutVerticesPN._VerticesPN[l9_40+1],layoutVerticesPN._VerticesPN[l9_40+2]);
int l9_42=l9_37.z;
float3 l9_43=float3(layoutVerticesPN._VerticesPN[l9_42],layoutVerticesPN._VerticesPN[l9_42+1],layoutVerticesPN._VerticesPN[l9_42+2]);
float3 l9_44=((l9_39*param_8.x)+(l9_41*param_8.y))+(l9_43*param_8.z);
rhp.normalWS=l9_44;
}
else
{
float3 param_11=brc;
int3 param_12=i;
int3 l9_45=int3((param_12.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal,(param_12.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_normal);
float3 l9_46=float3(0.0);
if (UserUniforms.proxy_format_normal==5)
{
int l9_47=l9_45.x;
float3 l9_48=float3(layoutVertices._Vertices[l9_47],layoutVertices._Vertices[l9_47+1],layoutVertices._Vertices[l9_47+2]);
int l9_49=l9_45.y;
float3 l9_50=float3(layoutVertices._Vertices[l9_49],layoutVertices._Vertices[l9_49+1],layoutVertices._Vertices[l9_49+2]);
int l9_51=l9_45.z;
float3 l9_52=float3(layoutVertices._Vertices[l9_51],layoutVertices._Vertices[l9_51+1],layoutVertices._Vertices[l9_51+2]);
l9_46=((l9_48*param_11.x)+(l9_50*param_11.y))+(l9_52*param_11.z);
}
else
{
if (UserUniforms.proxy_format_normal==6)
{
int l9_53=l9_45.x;
float3 l9_54=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_53+1]))).x);
int l9_55=l9_45.y;
float3 l9_56=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_55+1]))).x);
int l9_57=l9_45.z;
float3 l9_58=float3(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_57+1]))).x);
l9_46=((l9_54*param_11.x)+(l9_56*param_11.y))+(l9_58*param_11.z);
}
else
{
l9_46=float3(1.0,0.0,0.0);
}
}
float3 l9_59=l9_46;
float3 normalOS=l9_59;
rhp.normalWS=normalize(UserUniforms.sc_NormalMatrix*normalOS);
}
}
else
{
rhp.normalWS=float3(1.0,0.0,0.0);
}
bool l9_60=!(UserUniforms.has_animated_pn!=0);
bool l9_61;
if (l9_60)
{
l9_61=UserUniforms.proxy_offset_tangent>0;
}
else
{
l9_61=l9_60;
}
if (l9_61)
{
float3 param_13=brc;
int3 param_14=i;
int3 l9_62=int3((param_14.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent,(param_14.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_tangent);
float4 l9_63=float4(0.0);
if (UserUniforms.proxy_format_tangent==5)
{
int l9_64=l9_62.x;
float4 l9_65=float4(layoutVertices._Vertices[l9_64],layoutVertices._Vertices[l9_64+1],layoutVertices._Vertices[l9_64+2],layoutVertices._Vertices[l9_64+3]);
int l9_66=l9_62.y;
float4 l9_67=float4(layoutVertices._Vertices[l9_66],layoutVertices._Vertices[l9_66+1],layoutVertices._Vertices[l9_66+2],layoutVertices._Vertices[l9_66+3]);
int l9_68=l9_62.z;
float4 l9_69=float4(layoutVertices._Vertices[l9_68],layoutVertices._Vertices[l9_68+1],layoutVertices._Vertices[l9_68+2],layoutVertices._Vertices[l9_68+3]);
l9_63=((l9_65*param_13.x)+(l9_67*param_13.y))+(l9_69*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==6)
{
int l9_70=l9_62.x;
float4 l9_71=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_70+1]))));
int l9_72=l9_62.y;
float4 l9_73=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_72+1]))));
int l9_74=l9_62.z;
float4 l9_75=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_74+1]))));
l9_63=((l9_71*param_13.x)+(l9_73*param_13.y))+(l9_75*param_13.z);
}
else
{
if (UserUniforms.proxy_format_tangent==2)
{
int l9_76=l9_62.x;
uint l9_77=as_type<uint>(layoutVertices._Vertices[l9_76]);
uint l9_78=l9_77&255u;
uint l9_79=(l9_77>>uint(8))&255u;
uint l9_80=(l9_77>>uint(16))&255u;
uint l9_81=(l9_77>>uint(24))&255u;
float4 l9_82=float4(float(l9_78),float(l9_79),float(l9_80),float(l9_81))/float4(255.0);
int l9_83=l9_62.y;
uint l9_84=as_type<uint>(layoutVertices._Vertices[l9_83]);
uint l9_85=l9_84&255u;
uint l9_86=(l9_84>>uint(8))&255u;
uint l9_87=(l9_84>>uint(16))&255u;
uint l9_88=(l9_84>>uint(24))&255u;
float4 l9_89=float4(float(l9_85),float(l9_86),float(l9_87),float(l9_88))/float4(255.0);
int l9_90=l9_62.z;
uint l9_91=as_type<uint>(layoutVertices._Vertices[l9_90]);
uint l9_92=l9_91&255u;
uint l9_93=(l9_91>>uint(8))&255u;
uint l9_94=(l9_91>>uint(16))&255u;
uint l9_95=(l9_91>>uint(24))&255u;
float4 l9_96=float4(float(l9_92),float(l9_93),float(l9_94),float(l9_95))/float4(255.0);
l9_63=((l9_82*param_13.x)+(l9_89*param_13.y))+(l9_96*param_13.z);
}
else
{
l9_63=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_97=l9_63;
float4 tangentOS=l9_97;
float3 tangentWS=normalize(UserUniforms.sc_NormalMatrix*tangentOS.xyz);
rhp.tangentWS=float4(tangentWS,tangentOS.w);
}
else
{
rhp.tangentWS=float4(1.0,0.0,0.0,1.0);
}
if (UserUniforms.proxy_format_color>0)
{
float3 param_15=brc;
int3 param_16=i;
int3 l9_98=int3((param_16.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color,(param_16.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_color);
float4 l9_99=float4(0.0);
if (UserUniforms.proxy_format_color==5)
{
int l9_100=l9_98.x;
float4 l9_101=float4(layoutVertices._Vertices[l9_100],layoutVertices._Vertices[l9_100+1],layoutVertices._Vertices[l9_100+2],layoutVertices._Vertices[l9_100+3]);
int l9_102=l9_98.y;
float4 l9_103=float4(layoutVertices._Vertices[l9_102],layoutVertices._Vertices[l9_102+1],layoutVertices._Vertices[l9_102+2],layoutVertices._Vertices[l9_102+3]);
int l9_104=l9_98.z;
float4 l9_105=float4(layoutVertices._Vertices[l9_104],layoutVertices._Vertices[l9_104+1],layoutVertices._Vertices[l9_104+2],layoutVertices._Vertices[l9_104+3]);
l9_99=((l9_101*param_15.x)+(l9_103*param_15.y))+(l9_105*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==6)
{
int l9_106=l9_98.x;
float4 l9_107=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_106+1]))));
int l9_108=l9_98.y;
float4 l9_109=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_108+1]))));
int l9_110=l9_98.z;
float4 l9_111=float4(float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110]))),float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_110+1]))));
l9_99=((l9_107*param_15.x)+(l9_109*param_15.y))+(l9_111*param_15.z);
}
else
{
if (UserUniforms.proxy_format_color==2)
{
int l9_112=l9_98.x;
uint l9_113=as_type<uint>(layoutVertices._Vertices[l9_112]);
uint l9_114=l9_113&255u;
uint l9_115=(l9_113>>uint(8))&255u;
uint l9_116=(l9_113>>uint(16))&255u;
uint l9_117=(l9_113>>uint(24))&255u;
float4 l9_118=float4(float(l9_114),float(l9_115),float(l9_116),float(l9_117))/float4(255.0);
int l9_119=l9_98.y;
uint l9_120=as_type<uint>(layoutVertices._Vertices[l9_119]);
uint l9_121=l9_120&255u;
uint l9_122=(l9_120>>uint(8))&255u;
uint l9_123=(l9_120>>uint(16))&255u;
uint l9_124=(l9_120>>uint(24))&255u;
float4 l9_125=float4(float(l9_121),float(l9_122),float(l9_123),float(l9_124))/float4(255.0);
int l9_126=l9_98.z;
uint l9_127=as_type<uint>(layoutVertices._Vertices[l9_126]);
uint l9_128=l9_127&255u;
uint l9_129=(l9_127>>uint(8))&255u;
uint l9_130=(l9_127>>uint(16))&255u;
uint l9_131=(l9_127>>uint(24))&255u;
float4 l9_132=float4(float(l9_128),float(l9_129),float(l9_130),float(l9_131))/float4(255.0);
l9_99=((l9_118*param_15.x)+(l9_125*param_15.y))+(l9_132*param_15.z);
}
else
{
l9_99=float4(1.0,0.0,0.0,0.0);
}
}
}
float4 l9_133=l9_99;
rhp.color=l9_133;
}
float2 dummy_red_black=float2(dot(brc,float3(int3(1)-(i%int3(2)))),0.0);
if (UserUniforms.proxy_format_texture0>0)
{
float3 param_17=brc;
int3 param_18=i;
int3 l9_134=int3((param_18.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0,(param_18.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture0);
float2 l9_135=float2(0.0);
if (UserUniforms.proxy_format_texture0==5)
{
int l9_136=l9_134.x;
float2 l9_137=float2(layoutVertices._Vertices[l9_136],layoutVertices._Vertices[l9_136+1]);
int l9_138=l9_134.y;
float2 l9_139=float2(layoutVertices._Vertices[l9_138],layoutVertices._Vertices[l9_138+1]);
int l9_140=l9_134.z;
float2 l9_141=float2(layoutVertices._Vertices[l9_140],layoutVertices._Vertices[l9_140+1]);
l9_135=((l9_137*param_17.x)+(l9_139*param_17.y))+(l9_141*param_17.z);
}
else
{
if (UserUniforms.proxy_format_texture0==6)
{
int l9_142=l9_134.x;
float2 l9_143=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_142])));
int l9_144=l9_134.y;
float2 l9_145=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_144])));
int l9_146=l9_134.z;
float2 l9_147=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_146])));
l9_135=((l9_143*param_17.x)+(l9_145*param_17.y))+(l9_147*param_17.z);
}
else
{
l9_135=float2(1.0,0.0);
}
}
float2 l9_148=l9_135;
rhp.uv0=l9_148;
}
else
{
rhp.uv0=dummy_red_black;
}
if (UserUniforms.proxy_format_texture1>0)
{
float3 param_19=brc;
int3 param_20=i;
int3 l9_149=int3((param_20.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1,(param_20.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture1);
float2 l9_150=float2(0.0);
if (UserUniforms.proxy_format_texture1==5)
{
int l9_151=l9_149.x;
float2 l9_152=float2(layoutVertices._Vertices[l9_151],layoutVertices._Vertices[l9_151+1]);
int l9_153=l9_149.y;
float2 l9_154=float2(layoutVertices._Vertices[l9_153],layoutVertices._Vertices[l9_153+1]);
int l9_155=l9_149.z;
float2 l9_156=float2(layoutVertices._Vertices[l9_155],layoutVertices._Vertices[l9_155+1]);
l9_150=((l9_152*param_19.x)+(l9_154*param_19.y))+(l9_156*param_19.z);
}
else
{
if (UserUniforms.proxy_format_texture1==6)
{
int l9_157=l9_149.x;
float2 l9_158=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_157])));
int l9_159=l9_149.y;
float2 l9_160=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_159])));
int l9_161=l9_149.z;
float2 l9_162=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_161])));
l9_150=((l9_158*param_19.x)+(l9_160*param_19.y))+(l9_162*param_19.z);
}
else
{
l9_150=float2(1.0,0.0);
}
}
float2 l9_163=l9_150;
rhp.uv1=l9_163;
}
else
{
rhp.uv1=dummy_red_black;
}
if (UserUniforms.proxy_format_texture2>0)
{
float3 param_21=brc;
int3 param_22=i;
int3 l9_164=int3((param_22.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2,(param_22.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture2);
float2 l9_165=float2(0.0);
if (UserUniforms.proxy_format_texture2==5)
{
int l9_166=l9_164.x;
float2 l9_167=float2(layoutVertices._Vertices[l9_166],layoutVertices._Vertices[l9_166+1]);
int l9_168=l9_164.y;
float2 l9_169=float2(layoutVertices._Vertices[l9_168],layoutVertices._Vertices[l9_168+1]);
int l9_170=l9_164.z;
float2 l9_171=float2(layoutVertices._Vertices[l9_170],layoutVertices._Vertices[l9_170+1]);
l9_165=((l9_167*param_21.x)+(l9_169*param_21.y))+(l9_171*param_21.z);
}
else
{
if (UserUniforms.proxy_format_texture2==6)
{
int l9_172=l9_164.x;
float2 l9_173=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_172])));
int l9_174=l9_164.y;
float2 l9_175=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_174])));
int l9_176=l9_164.z;
float2 l9_177=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_176])));
l9_165=((l9_173*param_21.x)+(l9_175*param_21.y))+(l9_177*param_21.z);
}
else
{
l9_165=float2(1.0,0.0);
}
}
float2 l9_178=l9_165;
rhp.uv2=l9_178;
}
else
{
rhp.uv2=dummy_red_black;
}
if (UserUniforms.proxy_format_texture3>0)
{
float3 param_23=brc;
int3 param_24=i;
int3 l9_179=int3((param_24.x*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.y*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3,(param_24.z*UserUniforms.emitter_stride)+UserUniforms.proxy_offset_texture3);
float2 l9_180=float2(0.0);
if (UserUniforms.proxy_format_texture3==5)
{
int l9_181=l9_179.x;
float2 l9_182=float2(layoutVertices._Vertices[l9_181],layoutVertices._Vertices[l9_181+1]);
int l9_183=l9_179.y;
float2 l9_184=float2(layoutVertices._Vertices[l9_183],layoutVertices._Vertices[l9_183+1]);
int l9_185=l9_179.z;
float2 l9_186=float2(layoutVertices._Vertices[l9_185],layoutVertices._Vertices[l9_185+1]);
l9_180=((l9_182*param_23.x)+(l9_184*param_23.y))+(l9_186*param_23.z);
}
else
{
if (UserUniforms.proxy_format_texture3==6)
{
int l9_187=l9_179.x;
float2 l9_188=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_187])));
int l9_189=l9_179.y;
float2 l9_190=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_189])));
int l9_191=l9_179.z;
float2 l9_192=float2(as_type<half2>(as_type<uint>(layoutVertices._Vertices[l9_191])));
l9_180=((l9_188*param_23.x)+(l9_190*param_23.y))+(l9_192*param_23.z);
}
else
{
l9_180=float2(1.0,0.0);
}
}
float2 l9_193=l9_180;
rhp.uv3=l9_193;
}
else
{
rhp.uv3=dummy_red_black;
}
return rhp;
}
float3 evaluateSSAO(thread const float3& positionWS,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC)
{
if ((int(sc_SSAOEnabled_tmp)!=0))
{
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
float4 clipSpaceCoord=UserUniforms.sc_ViewProjectionMatrixArray[l9_1]*float4(positionWS,1.0);
float3 l9_2=clipSpaceCoord.xyz/float3(clipSpaceCoord.w);
clipSpaceCoord=float4(l9_2.x,l9_2.y,l9_2.z,clipSpaceCoord.w);
float4 shadowSample=sc_SSAOTexture.sample(sc_SSAOTextureSmpSC,((clipSpaceCoord.xy*0.5)+float2(0.5)));
return float3(shadowSample.x);
}
else
{
return float3(1.0);
}
}
float3 calculateDirectSpecular(thread const SurfaceProperties& surfaceProperties,thread const float3& L,thread const float3& V,constant userUniformsObj& UserUniforms)
{
float r=fast::max(surfaceProperties.roughness,0.029999999);
float3 F0=surfaceProperties.specColor;
float3 N=surfaceProperties.normal;
float3 H=normalize(L+V);
float param=dot(N,L);
float l9_0=fast::clamp(param,0.0,1.0);
float NdotL=l9_0;
float param_1=dot(N,V);
float l9_1=fast::clamp(param_1,0.0,1.0);
float NdotV=l9_1;
float param_2=dot(N,H);
float l9_2=fast::clamp(param_2,0.0,1.0);
float NdotH=l9_2;
float param_3=dot(V,H);
float l9_3=fast::clamp(param_3,0.0,1.0);
float VdotH=l9_3;
if (SC_DEVICE_CLASS_tmp>=2)
{
float param_4=NdotH;
float param_5=r;
float l9_4=param_5*param_5;
float l9_5=l9_4*l9_4;
float l9_6=param_4*param_4;
float l9_7=(l9_6*(l9_5-1.0))+1.0;
float l9_8=l9_7*l9_7;
float l9_9=9.9999999e-09;
bool l9_10=UserUniforms.isProxyMode!=0;
if (l9_10)
{
l9_9=1e-07;
}
float l9_11=l9_5/(l9_8+l9_9);
float param_6=NdotL;
float param_7=NdotV;
float param_8=r;
float l9_12=param_6;
float l9_13=param_8;
float l9_14=l9_13+1.0;
l9_14=(l9_14*l9_14)*0.125;
float l9_15=(l9_12*(1.0-l9_14))+l9_14;
float l9_16=param_7;
float l9_17=param_8;
float l9_18=l9_17+1.0;
l9_18=(l9_18*l9_18)*0.125;
float l9_19=(l9_16*(1.0-l9_18))+l9_18;
float l9_20=1.0/(l9_15*l9_19);
float param_9=VdotH;
float3 param_10=F0;
float l9_21=param_9;
float3 l9_22=param_10;
float3 l9_23=float3(1.0);
float l9_24=1.0-l9_21;
float l9_25=l9_24*l9_24;
float l9_26=(l9_25*l9_25)*l9_24;
float3 l9_27=l9_22+((l9_23-l9_22)*l9_26);
float3 l9_28=l9_27;
return l9_28*(((l9_11*l9_20)*0.25)*NdotL);
}
else
{
float specPower=exp2(11.0-(10.0*r));
float param_11=VdotH;
float3 param_12=F0;
float l9_29=param_11;
float3 l9_30=param_12;
float3 l9_31=float3(1.0);
float l9_32=1.0-l9_29;
float l9_33=l9_32*l9_32;
float l9_34=(l9_33*l9_33)*l9_32;
float3 l9_35=l9_30+((l9_31-l9_30)*l9_34);
float3 l9_36=l9_35;
return ((l9_36*((specPower*0.125)+0.25))*pow(NdotH,specPower))*NdotL;
}
}
float computeDistanceAttenuation(thread const float& distanceToLight,thread const float& falloffEndDistance)
{
float distanceToLightSquared=distanceToLight*distanceToLight;
if (falloffEndDistance==0.0)
{
return 1.0/distanceToLightSquared;
}
float distanceToLightToTheFourth=distanceToLightSquared*distanceToLightSquared;
float falloffEndDistanceToTheFourth=pow(falloffEndDistance,4.0);
return fast::max(fast::min(1.0-(distanceToLightToTheFourth/falloffEndDistanceToTheFourth),1.0),0.0)/distanceToLightSquared;
}
float2 calcSeamlessPanoramicUvsForSampling(thread const float2& uv,thread const float2& topMipRes,thread const float& lod)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 thisMipRes=fast::max(float2(1.0),topMipRes/float2(exp2(lod)));
return ((uv*(thisMipRes-float2(1.0)))/thisMipRes)+(float2(0.5)/thisMipRes);
}
else
{
return uv;
}
}
float4 sampleRayTracedIndirectDiffuse(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedDiffIndTextureHasSwappedViews_tmp)!=0))
{
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
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedDiffIndTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedDiffIndTexture.sample(sc_RayTracedDiffIndTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31;
}
return float4(0.0);
}
float sampleRayTracedAo(thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord)
{
bool l9_0=UserUniforms.receivesRayTracedAo!=0;
if (l9_0)
{
float4 l9_1=gl_FragCoord;
float2 l9_2=l9_1.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 p=l9_2;
float2 param=p;
int l9_3=0;
if ((int(sc_RayTracedAoTextureHasSwappedViews_tmp)!=0))
{
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
l9_3=1-l9_5;
}
else
{
int l9_6=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_6=0;
}
else
{
l9_6=varStereoViewID;
}
int l9_7=l9_6;
l9_3=l9_7;
}
int l9_8=l9_3;
float2 l9_9=param;
int l9_10=l9_8;
float2 l9_11=l9_9;
int l9_12=l9_10;
float l9_13=0.0;
float4 l9_14=float4(0.0);
float2 l9_15=l9_11;
int l9_16=sc_RayTracedAoTextureLayout_tmp;
int l9_17=l9_12;
float l9_18=l9_13;
float2 l9_19=l9_15;
int l9_20=l9_16;
int l9_21=l9_17;
float3 l9_22=float3(0.0);
if (l9_20==0)
{
l9_22=float3(l9_19,0.0);
}
else
{
if (l9_20==1)
{
l9_22=float3(l9_19.x,(l9_19.y*0.5)+(0.5-(float(l9_21)*0.5)),0.0);
}
else
{
l9_22=float3(l9_19,float(l9_21));
}
}
float3 l9_23=l9_22;
float3 l9_24=l9_23;
float2 l9_25=l9_24.xy;
float l9_26=l9_18;
float4 l9_27=sc_RayTracedAoTexture.sample(sc_RayTracedAoTextureSmpSC,l9_25,bias(l9_26));
float4 l9_28=l9_27;
l9_14=l9_28;
float4 l9_29=l9_14;
float4 l9_30=l9_29;
float4 l9_31=l9_30;
return l9_31.x;
}
return 0.0;
}
float srgbToLinear(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,2.2);
}
else
{
return x*x;
}
}
float linearToSrgb(thread const float& x)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
return pow(x,0.45454547);
}
else
{
return sqrt(x);
}
}
float4 ngsCalculateLighting(thread const float3& albedo,thread const float& opacity,thread const float3& normal,thread const float3& position,thread const float3& viewDir,thread const float3& emissive,thread const float& metallic,thread const float& roughness,thread const float3& ao,thread const float3& specularAO,thread int& varStereoViewID,constant userUniformsObj& UserUniforms,thread texture2d<float> sc_EnvmapDiffuse,thread sampler sc_EnvmapDiffuseSmpSC,thread texture2d<float> sc_EnvmapSpecular,thread sampler sc_EnvmapSpecularSmpSC,thread texture2d<float> sc_ScreenTexture,thread sampler sc_ScreenTextureSmpSC,thread texture2d<float> sc_ShadowTexture,thread sampler sc_ShadowTextureSmpSC,thread texture2d<float> sc_SSAOTexture,thread sampler sc_SSAOTextureSmpSC,thread texture2d<float> sc_RayTracedShadowTexture,thread sampler sc_RayTracedShadowTextureSmpSC,thread texture2d<float> sc_RayTracedDiffIndTexture,thread sampler sc_RayTracedDiffIndTextureSmpSC,thread texture2d<float> sc_RayTracedAoTexture,thread sampler sc_RayTracedAoTextureSmpSC,thread float4& gl_FragCoord,thread float2& varShadowTex,thread float4& FragColor0)
{
SurfaceProperties l9_0;
l9_0.albedo=float3(0.0);
l9_0.opacity=1.0;
l9_0.normal=float3(0.0);
l9_0.positionWS=float3(0.0);
l9_0.viewDirWS=float3(0.0);
l9_0.metallic=0.0;
l9_0.roughness=0.0;
l9_0.emissive=float3(0.0);
l9_0.ao=float3(1.0);
l9_0.specularAo=float3(1.0);
l9_0.bakedShadows=float3(1.0);
SurfaceProperties l9_1=l9_0;
SurfaceProperties surfaceProperties=l9_1;
surfaceProperties.opacity=opacity;
float3 param=albedo;
float3 l9_2;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2=float3(pow(param.x,2.2),pow(param.y,2.2),pow(param.z,2.2));
}
else
{
l9_2=param*param;
}
float3 l9_3=l9_2;
surfaceProperties.albedo=l9_3;
surfaceProperties.normal=normalize(normal);
surfaceProperties.positionWS=position;
surfaceProperties.viewDirWS=viewDir;
float3 param_1=emissive;
float3 l9_4;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_4=float3(pow(param_1.x,2.2),pow(param_1.y,2.2),pow(param_1.z,2.2));
}
else
{
l9_4=param_1*param_1;
}
float3 l9_5=l9_4;
surfaceProperties.emissive=l9_5;
surfaceProperties.metallic=metallic;
surfaceProperties.roughness=roughness;
surfaceProperties.ao=ao;
surfaceProperties.specularAo=specularAO;
if ((int(sc_SSAOEnabled_tmp)!=0))
{
float3 param_2=surfaceProperties.positionWS;
surfaceProperties.ao=evaluateSSAO(param_2,varStereoViewID,UserUniforms,sc_SSAOTexture,sc_SSAOTextureSmpSC);
}
SurfaceProperties param_3=surfaceProperties;
SurfaceProperties l9_6=param_3;
float3 l9_7=mix(float3(0.039999999),l9_6.albedo*l9_6.metallic,float3(l9_6.metallic));
float3 l9_8=mix(l9_6.albedo*(1.0-l9_6.metallic),float3(0.0),float3(l9_6.metallic));
param_3.albedo=l9_8;
param_3.specColor=l9_7;
SurfaceProperties l9_9=param_3;
surfaceProperties=l9_9;
SurfaceProperties param_4=surfaceProperties;
LightingComponents l9_10;
l9_10.directDiffuse=float3(0.0);
l9_10.directSpecular=float3(0.0);
l9_10.indirectDiffuse=float3(1.0);
l9_10.indirectSpecular=float3(0.0);
l9_10.emitted=float3(0.0);
l9_10.transmitted=float3(0.0);
LightingComponents l9_11=l9_10;
LightingComponents l9_12=l9_11;
float3 l9_13=param_4.viewDirWS;
int l9_14=0;
float4 l9_15=float4(param_4.bakedShadows,1.0);
if (sc_DirectionalLightsCount_tmp>0)
{
sc_DirectionalLight_t l9_16;
LightProperties l9_17;
int l9_18=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_18<sc_DirectionalLightsCount_tmp)
{
l9_16.direction=UserUniforms.sc_DirectionalLights[l9_18].direction;
l9_16.color=UserUniforms.sc_DirectionalLights[l9_18].color;
l9_17.direction=l9_16.direction;
l9_17.color=l9_16.color.xyz;
l9_17.attenuation=l9_16.color.w;
l9_17.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
l9_14++;
LightingComponents l9_19=l9_12;
LightProperties l9_20=l9_17;
SurfaceProperties l9_21=param_4;
float3 l9_22=l9_13;
SurfaceProperties l9_23=l9_21;
float3 l9_24=l9_20.direction;
float l9_25=dot(l9_23.normal,l9_24);
float l9_26=fast::clamp(l9_25,0.0,1.0);
float3 l9_27=float3(l9_26);
l9_19.directDiffuse+=((l9_27*l9_20.color)*l9_20.attenuation);
SurfaceProperties l9_28=l9_21;
float3 l9_29=l9_20.direction;
float3 l9_30=l9_22;
l9_19.directSpecular+=((calculateDirectSpecular(l9_28,l9_29,l9_30,UserUniforms)*l9_20.color)*l9_20.attenuation);
LightingComponents l9_31=l9_19;
l9_12=l9_31;
l9_18++;
continue;
}
else
{
break;
}
}
}
if (sc_PointLightsCount_tmp>0)
{
sc_PointLight_t_1 l9_32;
LightProperties l9_33;
int l9_34=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_34<sc_PointLightsCount_tmp)
{
l9_32.falloffEnabled=UserUniforms.sc_PointLights[l9_34].falloffEnabled!=0;
l9_32.falloffEndDistance=UserUniforms.sc_PointLights[l9_34].falloffEndDistance;
l9_32.negRcpFalloffEndDistance4=UserUniforms.sc_PointLights[l9_34].negRcpFalloffEndDistance4;
l9_32.angleScale=UserUniforms.sc_PointLights[l9_34].angleScale;
l9_32.angleOffset=UserUniforms.sc_PointLights[l9_34].angleOffset;
l9_32.direction=UserUniforms.sc_PointLights[l9_34].direction;
l9_32.position=UserUniforms.sc_PointLights[l9_34].position;
l9_32.color=UserUniforms.sc_PointLights[l9_34].color;
float3 l9_35=l9_32.position-param_4.positionWS;
l9_33.direction=normalize(l9_35);
l9_33.color=l9_32.color.xyz;
l9_33.attenuation=l9_32.color.w;
l9_33.attenuation*=l9_15[(l9_14<3) ? l9_14 : 3];
float3 l9_36=l9_33.direction;
float3 l9_37=l9_32.direction;
float l9_38=l9_32.angleScale;
float l9_39=l9_32.angleOffset;
float l9_40=dot(l9_36,l9_37);
float l9_41=fast::clamp((l9_40*l9_38)+l9_39,0.0,1.0);
float l9_42=l9_41*l9_41;
l9_33.attenuation*=l9_42;
if (l9_32.falloffEnabled)
{
float l9_43=length(l9_35);
float l9_44=l9_32.falloffEndDistance;
l9_33.attenuation*=computeDistanceAttenuation(l9_43,l9_44);
}
l9_14++;
LightingComponents l9_45=l9_12;
LightProperties l9_46=l9_33;
SurfaceProperties l9_47=param_4;
float3 l9_48=l9_13;
SurfaceProperties l9_49=l9_47;
float3 l9_50=l9_46.direction;
float l9_51=dot(l9_49.normal,l9_50);
float l9_52=fast::clamp(l9_51,0.0,1.0);
float3 l9_53=float3(l9_52);
l9_45.directDiffuse+=((l9_53*l9_46.color)*l9_46.attenuation);
SurfaceProperties l9_54=l9_47;
float3 l9_55=l9_46.direction;
float3 l9_56=l9_48;
l9_45.directSpecular+=((calculateDirectSpecular(l9_54,l9_55,l9_56,UserUniforms)*l9_46.color)*l9_46.attenuation);
LightingComponents l9_57=l9_45;
l9_12=l9_57;
l9_34++;
continue;
}
else
{
break;
}
}
}
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float3 l9_58=float3(0.0);
if ((int(sc_ProjectiveShadowsReceiver_tmp)!=0))
{
float2 l9_59=abs(varShadowTex-float2(0.5));
float l9_60=fast::max(l9_59.x,l9_59.y);
float l9_61=step(l9_60,0.5);
float4 l9_62=sc_ShadowTexture.sample(sc_ShadowTextureSmpSC,varShadowTex)*l9_61;
float3 l9_63=mix(UserUniforms.sc_ShadowColor.xyz,UserUniforms.sc_ShadowColor.xyz*l9_62.xyz,float3(UserUniforms.sc_ShadowColor.w));
float l9_64=l9_62.w*UserUniforms.sc_ShadowDensity;
l9_58=mix(float3(1.0),l9_63,float3(l9_64));
}
else
{
l9_58=float3(1.0);
}
float3 l9_65=l9_58;
float3 l9_66=l9_65;
l9_12.directDiffuse*=l9_66;
l9_12.directSpecular*=l9_66;
}
bool l9_67=UserUniforms.receivesRayTracedShadows!=0;
if (l9_67)
{
float4 l9_68=gl_FragCoord;
float2 l9_69=l9_68.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_70=l9_69;
float2 l9_71=l9_70;
int l9_72=0;
if ((int(sc_RayTracedShadowTextureHasSwappedViews_tmp)!=0))
{
int l9_73=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_73=0;
}
else
{
l9_73=varStereoViewID;
}
int l9_74=l9_73;
l9_72=1-l9_74;
}
else
{
int l9_75=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_75=0;
}
else
{
l9_75=varStereoViewID;
}
int l9_76=l9_75;
l9_72=l9_76;
}
int l9_77=l9_72;
float2 l9_78=l9_71;
int l9_79=l9_77;
float2 l9_80=l9_78;
int l9_81=l9_79;
float l9_82=0.0;
float4 l9_83=float4(0.0);
float2 l9_84=l9_80;
int l9_85=sc_RayTracedShadowTextureLayout_tmp;
int l9_86=l9_81;
float l9_87=l9_82;
float2 l9_88=l9_84;
int l9_89=l9_85;
int l9_90=l9_86;
float3 l9_91=float3(0.0);
if (l9_89==0)
{
l9_91=float3(l9_88,0.0);
}
else
{
if (l9_89==1)
{
l9_91=float3(l9_88.x,(l9_88.y*0.5)+(0.5-(float(l9_90)*0.5)),0.0);
}
else
{
l9_91=float3(l9_88,float(l9_90));
}
}
float3 l9_92=l9_91;
float3 l9_93=l9_92;
float2 l9_94=l9_93.xy;
float l9_95=l9_87;
float4 l9_96=sc_RayTracedShadowTexture.sample(sc_RayTracedShadowTextureSmpSC,l9_94,bias(l9_95));
float4 l9_97=l9_96;
l9_83=l9_97;
float4 l9_98=l9_83;
float4 l9_99=l9_98;
float4 l9_100=l9_99;
float l9_101=l9_100.x;
float3 l9_102=float3(l9_101);
float3 l9_103=l9_102;
l9_12.directDiffuse*=(float3(1.0)-l9_103);
l9_12.directSpecular*=(float3(1.0)-l9_103);
}
l9_12.directSpecular=float3(0.0);
SurfaceProperties l9_104=param_4;
float3 l9_105=l9_104.normal;
float3 l9_106=float3(0.0);
if ((sc_EnvLightMode_tmp==sc_AmbientLightMode_EnvironmentMap_tmp)||(sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp))
{
float3 l9_107=l9_105;
float3 l9_108=l9_107;
float l9_109=UserUniforms.sc_EnvmapRotation.y;
float2 l9_110=float2(0.0);
float l9_111=l9_108.x;
float l9_112=-l9_108.z;
float l9_113=(l9_111<0.0) ? (-1.0) : 1.0;
float l9_114=l9_113*acos(fast::clamp(l9_112/length(float2(l9_111,l9_112)),-1.0,1.0));
l9_110.x=l9_114-1.5707964;
l9_110.y=acos(l9_108.y);
l9_110/=float2(6.2831855,3.1415927);
l9_110.y=1.0-l9_110.y;
l9_110.x+=(l9_109/360.0);
l9_110.x=fract((l9_110.x+floor(l9_110.x))+1.0);
float2 l9_115=l9_110;
float2 l9_116=l9_115;
float4 l9_117=float4(0.0);
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_FromCamera_tmp)
{
if (SC_DEVICE_CLASS_tmp>=2)
{
float2 l9_118=l9_116;
float2 l9_119=UserUniforms.sc_EnvmapSpecularSize.xy;
float l9_120=5.0;
l9_116=calcSeamlessPanoramicUvsForSampling(l9_118,l9_119,l9_120);
}
float2 l9_121=l9_116;
float l9_122=13.0;
int l9_123=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_124=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_124=0;
}
else
{
l9_124=varStereoViewID;
}
int l9_125=l9_124;
l9_123=1-l9_125;
}
else
{
int l9_126=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_126=0;
}
else
{
l9_126=varStereoViewID;
}
int l9_127=l9_126;
l9_123=l9_127;
}
int l9_128=l9_123;
float2 l9_129=l9_121;
int l9_130=l9_128;
float l9_131=l9_122;
float4 l9_132=float4(0.0);
float2 l9_133=l9_129;
int l9_134=sc_EnvmapSpecularLayout_tmp;
int l9_135=l9_130;
float l9_136=l9_131;
float2 l9_137=l9_133;
int l9_138=l9_134;
int l9_139=l9_135;
float3 l9_140=float3(0.0);
if (l9_138==0)
{
l9_140=float3(l9_137,0.0);
}
else
{
if (l9_138==1)
{
l9_140=float3(l9_137.x,(l9_137.y*0.5)+(0.5-(float(l9_139)*0.5)),0.0);
}
else
{
l9_140=float3(l9_137,float(l9_139));
}
}
float3 l9_141=l9_140;
float3 l9_142=l9_141;
float2 l9_143=l9_142.xy;
float l9_144=l9_136;
float4 l9_145=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_143,bias(l9_144));
float4 l9_146=l9_145;
l9_132=l9_146;
float4 l9_147=l9_132;
float4 l9_148=l9_147;
l9_117=l9_148;
}
else
{
if ((sc_MaxTextureImageUnits_tmp>8)&&(int(sc_HasDiffuseEnvmap_tmp)!=0))
{
float2 l9_149=l9_116;
float2 l9_150=UserUniforms.sc_EnvmapDiffuseSize.xy;
float l9_151=0.0;
l9_116=calcSeamlessPanoramicUvsForSampling(l9_149,l9_150,l9_151);
bool l9_152=UserUniforms.isProxyMode!=0;
if (l9_152)
{
float2 l9_153=l9_116;
float l9_154=0.0;
int l9_155=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_156=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_156=0;
}
else
{
l9_156=varStereoViewID;
}
int l9_157=l9_156;
l9_155=1-l9_157;
}
else
{
int l9_158=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_158=0;
}
else
{
l9_158=varStereoViewID;
}
int l9_159=l9_158;
l9_155=l9_159;
}
int l9_160=l9_155;
float2 l9_161=l9_153;
int l9_162=l9_160;
float l9_163=l9_154;
float4 l9_164=float4(0.0);
float2 l9_165=l9_161;
int l9_166=sc_EnvmapDiffuseLayout_tmp;
int l9_167=l9_162;
float l9_168=l9_163;
float2 l9_169=l9_165;
int l9_170=l9_166;
int l9_171=l9_167;
float3 l9_172=float3(0.0);
if (l9_170==0)
{
l9_172=float3(l9_169,0.0);
}
else
{
if (l9_170==1)
{
l9_172=float3(l9_169.x,(l9_169.y*0.5)+(0.5-(float(l9_171)*0.5)),0.0);
}
else
{
l9_172=float3(l9_169,float(l9_171));
}
}
float3 l9_173=l9_172;
float3 l9_174=l9_173;
float2 l9_175=l9_174.xy;
float l9_176=l9_168;
float4 l9_177=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_175,level(l9_176));
float4 l9_178=l9_177;
l9_164=l9_178;
float4 l9_179=l9_164;
float4 l9_180=l9_179;
l9_117=l9_180;
}
else
{
float2 l9_181=l9_116;
float l9_182=-13.0;
int l9_183=0;
if ((int(sc_EnvmapDiffuseHasSwappedViews_tmp)!=0))
{
int l9_184=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_184=0;
}
else
{
l9_184=varStereoViewID;
}
int l9_185=l9_184;
l9_183=1-l9_185;
}
else
{
int l9_186=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_186=0;
}
else
{
l9_186=varStereoViewID;
}
int l9_187=l9_186;
l9_183=l9_187;
}
int l9_188=l9_183;
float2 l9_189=l9_181;
int l9_190=l9_188;
float l9_191=l9_182;
float4 l9_192=float4(0.0);
float2 l9_193=l9_189;
int l9_194=sc_EnvmapDiffuseLayout_tmp;
int l9_195=l9_190;
float l9_196=l9_191;
float2 l9_197=l9_193;
int l9_198=l9_194;
int l9_199=l9_195;
float3 l9_200=float3(0.0);
if (l9_198==0)
{
l9_200=float3(l9_197,0.0);
}
else
{
if (l9_198==1)
{
l9_200=float3(l9_197.x,(l9_197.y*0.5)+(0.5-(float(l9_199)*0.5)),0.0);
}
else
{
l9_200=float3(l9_197,float(l9_199));
}
}
float3 l9_201=l9_200;
float3 l9_202=l9_201;
float2 l9_203=l9_202.xy;
float l9_204=l9_196;
float4 l9_205=sc_EnvmapDiffuse.sample(sc_EnvmapDiffuseSmpSC,l9_203,bias(l9_204));
float4 l9_206=l9_205;
l9_192=l9_206;
float4 l9_207=l9_192;
float4 l9_208=l9_207;
l9_117=l9_208;
}
}
else
{
float2 l9_209=l9_116;
float l9_210=13.0;
int l9_211=0;
if ((int(sc_EnvmapSpecularHasSwappedViews_tmp)!=0))
{
int l9_212=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_212=0;
}
else
{
l9_212=varStereoViewID;
}
int l9_213=l9_212;
l9_211=1-l9_213;
}
else
{
int l9_214=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_214=0;
}
else
{
l9_214=varStereoViewID;
}
int l9_215=l9_214;
l9_211=l9_215;
}
int l9_216=l9_211;
float2 l9_217=l9_209;
int l9_218=l9_216;
float l9_219=l9_210;
float4 l9_220=float4(0.0);
float2 l9_221=l9_217;
int l9_222=sc_EnvmapSpecularLayout_tmp;
int l9_223=l9_218;
float l9_224=l9_219;
float2 l9_225=l9_221;
int l9_226=l9_222;
int l9_227=l9_223;
float3 l9_228=float3(0.0);
if (l9_226==0)
{
l9_228=float3(l9_225,0.0);
}
else
{
if (l9_226==1)
{
l9_228=float3(l9_225.x,(l9_225.y*0.5)+(0.5-(float(l9_227)*0.5)),0.0);
}
else
{
l9_228=float3(l9_225,float(l9_227));
}
}
float3 l9_229=l9_228;
float3 l9_230=l9_229;
float2 l9_231=l9_230.xy;
float l9_232=l9_224;
float4 l9_233=sc_EnvmapSpecular.sample(sc_EnvmapSpecularSmpSC,l9_231,bias(l9_232));
float4 l9_234=l9_233;
l9_220=l9_234;
float4 l9_235=l9_220;
float4 l9_236=l9_235;
l9_117=l9_236;
}
}
float4 l9_237=l9_117;
float3 l9_238=l9_237.xyz*(1.0/l9_237.w);
float3 l9_239=l9_238*UserUniforms.sc_EnvmapExposure;
l9_106=l9_239;
}
else
{
if (sc_EnvLightMode_tmp==sc_AmbientLightMode_SphericalHarmonics_tmp)
{
float3 l9_240=UserUniforms.sc_Sh[0];
float3 l9_241=UserUniforms.sc_Sh[1];
float3 l9_242=UserUniforms.sc_Sh[2];
float3 l9_243=UserUniforms.sc_Sh[3];
float3 l9_244=UserUniforms.sc_Sh[4];
float3 l9_245=UserUniforms.sc_Sh[5];
float3 l9_246=UserUniforms.sc_Sh[6];
float3 l9_247=UserUniforms.sc_Sh[7];
float3 l9_248=UserUniforms.sc_Sh[8];
float3 l9_249=-l9_105;
float l9_250=0.0;
l9_250=l9_249.x;
float l9_251=l9_249.y;
float l9_252=l9_249.z;
float l9_253=l9_250*l9_250;
float l9_254=l9_251*l9_251;
float l9_255=l9_252*l9_252;
float l9_256=l9_250*l9_251;
float l9_257=l9_251*l9_252;
float l9_258=l9_250*l9_252;
float3 l9_259=((((((l9_248*0.42904299)*(l9_253-l9_254))+((l9_246*0.74312502)*l9_255))+(l9_240*0.88622701))-(l9_246*0.24770799))+((((l9_244*l9_256)+(l9_247*l9_258))+(l9_245*l9_257))*0.85808599))+((((l9_243*l9_250)+(l9_241*l9_251))+(l9_242*l9_252))*1.0233279);
l9_106=l9_259*UserUniforms.sc_ShIntensity;
}
}
bool l9_260=UserUniforms.receivesRayTracedDiffuseIndirect!=0;
if (l9_260)
{
float4 l9_261=sampleRayTracedIndirectDiffuse(varStereoViewID,UserUniforms,sc_RayTracedDiffIndTexture,sc_RayTracedDiffIndTextureSmpSC,gl_FragCoord);
l9_106=mix(l9_106,l9_261.xyz,float3(l9_261.w));
}
if (sc_AmbientLightsCount_tmp>0)
{
if (sc_AmbientLightMode0_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[0].color*UserUniforms.sc_AmbientLights[0].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[0].color.x);
}
}
if (sc_AmbientLightsCount_tmp>1)
{
if (sc_AmbientLightMode1_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[1].color*UserUniforms.sc_AmbientLights[1].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[1].color.x);
}
}
if (sc_AmbientLightsCount_tmp>2)
{
if (sc_AmbientLightMode2_tmp==sc_AmbientLightMode_Constant_tmp)
{
l9_106+=(UserUniforms.sc_AmbientLights[2].color*UserUniforms.sc_AmbientLights[2].intensity);
}
else
{
l9_106.x+=(1e-06*UserUniforms.sc_AmbientLights[2].color.x);
}
}
if ((int(sc_LightEstimation_tmp)!=0))
{
float3 l9_262=l9_105;
float3 l9_263=UserUniforms.sc_LightEstimationData.ambientLight;
sc_SphericalGaussianLight_t l9_264;
float l9_265;
int l9_266=0;
for (int snapLoopIndex=0; snapLoopIndex==0; snapLoopIndex+=0)
{
if (l9_266<sc_LightEstimationSGCount_tmp)
{
l9_264.color=UserUniforms.sc_LightEstimationData.sg[l9_266].color;
l9_264.sharpness=UserUniforms.sc_LightEstimationData.sg[l9_266].sharpness;
l9_264.axis=UserUniforms.sc_LightEstimationData.sg[l9_266].axis;
float3 l9_267=l9_262;
float l9_268=dot(l9_264.axis,l9_267);
float l9_269=l9_264.sharpness;
float l9_270=0.36000001;
float l9_271=1.0/(4.0*l9_270);
float l9_272=exp(-l9_269);
float l9_273=l9_272*l9_272;
float l9_274=1.0/l9_269;
float l9_275=(1.0+(2.0*l9_273))-l9_274;
float l9_276=((l9_272-l9_273)*l9_274)-l9_273;
float l9_277=sqrt(1.0-l9_275);
float l9_278=l9_270*l9_268;
float l9_279=l9_271*l9_277;
float l9_280=l9_278+l9_279;
float l9_281=l9_268;
float l9_282=fast::clamp(l9_281,0.0,1.0);
float l9_283=l9_282;
if (step(abs(l9_278),l9_279)>0.5)
{
l9_265=(l9_280*l9_280)/l9_277;
}
else
{
l9_265=l9_283;
}
l9_283=l9_265;
float l9_284=(l9_275*l9_283)+l9_276;
sc_SphericalGaussianLight_t l9_285=l9_264;
float3 l9_286=(l9_285.color/float3(l9_285.sharpness))*6.2831855;
float3 l9_287=(l9_286*l9_284)/float3(3.1415927);
l9_263+=l9_287;
l9_266++;
continue;
}
else
{
break;
}
}
float3 l9_288=l9_263;
l9_106+=l9_288;
}
float3 l9_289=l9_106;
float3 l9_290=l9_289;
l9_12.indirectDiffuse=l9_290;
LightingComponents l9_291=l9_12;
LightingComponents lighting=l9_291;
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
lighting.directDiffuse=float3(0.0);
lighting.indirectDiffuse=float3(0.0);
float4 l9_292=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_293=FragColor0;
float4 l9_294=l9_293;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_294.x+=UserUniforms._sc_framebufferFetchMarker;
}
float4 l9_295=l9_294;
l9_292=l9_295;
}
else
{
float4 l9_296=gl_FragCoord;
float2 l9_297=l9_296.xy*UserUniforms.sc_CurrentRenderTargetDims.zw;
float2 l9_298=l9_297;
float2 l9_299=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_300=1;
int l9_301=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_301=0;
}
else
{
l9_301=varStereoViewID;
}
int l9_302=l9_301;
int l9_303=l9_302;
float3 l9_304=float3(l9_298,0.0);
int l9_305=l9_300;
int l9_306=l9_303;
if (l9_305==1)
{
l9_304.y=((2.0*l9_304.y)+float(l9_306))-1.0;
}
float2 l9_307=l9_304.xy;
l9_299=l9_307;
}
else
{
l9_299=l9_298;
}
float2 l9_308=l9_299;
float2 l9_309=l9_308;
float2 l9_310=l9_309;
int l9_311=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_312=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_312=0;
}
else
{
l9_312=varStereoViewID;
}
int l9_313=l9_312;
l9_311=1-l9_313;
}
else
{
int l9_314=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_314=0;
}
else
{
l9_314=varStereoViewID;
}
int l9_315=l9_314;
l9_311=l9_315;
}
int l9_316=l9_311;
float2 l9_317=l9_310;
int l9_318=l9_316;
float2 l9_319=l9_317;
int l9_320=l9_318;
float l9_321=0.0;
float4 l9_322=float4(0.0);
float2 l9_323=l9_319;
int l9_324=sc_ScreenTextureLayout_tmp;
int l9_325=l9_320;
float l9_326=l9_321;
float2 l9_327=l9_323;
int l9_328=l9_324;
int l9_329=l9_325;
float3 l9_330=float3(0.0);
if (l9_328==0)
{
l9_330=float3(l9_327,0.0);
}
else
{
if (l9_328==1)
{
l9_330=float3(l9_327.x,(l9_327.y*0.5)+(0.5-(float(l9_329)*0.5)),0.0);
}
else
{
l9_330=float3(l9_327,float(l9_329));
}
}
float3 l9_331=l9_330;
float3 l9_332=l9_331;
float2 l9_333=l9_332.xy;
float l9_334=l9_326;
float4 l9_335=sc_ScreenTexture.sample(sc_ScreenTextureSmpSC,l9_333,bias(l9_334));
float4 l9_336=l9_335;
l9_322=l9_336;
float4 l9_337=l9_322;
float4 l9_338=l9_337;
float4 l9_339=l9_338;
l9_292=l9_339;
}
float4 l9_340=l9_292;
float4 l9_341=l9_340;
float3 param_5=l9_341.xyz;
float3 l9_342;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_342=float3(pow(param_5.x,2.2),pow(param_5.y,2.2),pow(param_5.z,2.2));
}
else
{
l9_342=param_5*param_5;
}
float3 l9_343=l9_342;
float3 framebuffer=l9_343;
lighting.transmitted=framebuffer*mix(float3(1.0),surfaceProperties.albedo,float3(surfaceProperties.opacity));
surfaceProperties.opacity=1.0;
}
bool enablePremultipliedAlpha=false;
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
enablePremultipliedAlpha=true;
}
SurfaceProperties param_6=surfaceProperties;
LightingComponents param_7=lighting;
bool param_8=enablePremultipliedAlpha;
float3 l9_344=float3(0.0);
bool l9_345=UserUniforms.receivesRayTracedAo!=0;
if (l9_345)
{
l9_344=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*float3(1.0-sampleRayTracedAo(varStereoViewID,UserUniforms,sc_RayTracedAoTexture,sc_RayTracedAoTextureSmpSC,gl_FragCoord))));
}
else
{
l9_344=param_6.albedo*(param_7.directDiffuse+(param_7.indirectDiffuse*param_6.ao));
}
float3 l9_346=param_7.directSpecular+(param_7.indirectSpecular*param_6.specularAo);
float3 l9_347=param_6.emissive;
float3 l9_348=param_7.transmitted;
if (param_8)
{
float l9_349=param_6.opacity;
l9_344*=srgbToLinear(l9_349);
}
float3 l9_350=((l9_344+l9_346)+l9_347)+l9_348;
float3 l9_351=l9_350;
float4 Output=float4(l9_351,surfaceProperties.opacity);
bool l9_352=UserUniforms.isProxyMode!=0;
if (l9_352)
{
return Output;
}
if (!(int(sc_BlendMode_Multiply_tmp)!=0))
{
float3 param_9=Output.xyz;
float l9_353=1.8;
float l9_354=1.4;
float l9_355=0.5;
float l9_356=1.5;
float3 l9_357=(param_9*((param_9*l9_353)+float3(l9_354)))/((param_9*((param_9*l9_353)+float3(l9_355)))+float3(l9_356));
Output=float4(l9_357.x,l9_357.y,l9_357.z,Output.w);
}
float3 param_10=Output.xyz;
float l9_358=param_10.x;
float l9_359=param_10.y;
float l9_360=param_10.z;
float3 l9_361=float3(linearToSrgb(l9_358),linearToSrgb(l9_359),linearToSrgb(l9_360));
Output=float4(l9_361.x,l9_361.y,l9_361.z,Output.w);
return Output;
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
bool l9_2=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_2)
{
float4 l9_3=gl_FragCoord;
int2 l9_4=int2(l9_3.xy);
RayHitPayload l9_5=GetHitData(l9_4,(*sc_set0.UserUniforms),sc_set0.z_rayDirections,sc_set0.z_rayDirectionsSmpSC,sc_set0.z_hitIdAndBarycentric,sc_set0.z_hitIdAndBarycentricSmp,(*sc_set0.layoutVertices),(*sc_set0.layoutVerticesPN),(*sc_set0.layoutIndices));
RayHitPayload rhp=l9_5;
bool l9_6=(*sc_set0.UserUniforms).noEarlyZ!=0;
if (l9_6)
{
if (rhp.id.x!=uint((*sc_set0.UserUniforms).instance_id))
{
return out;
}
}
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=rhp.viewDirWS;
Globals.PositionWS=rhp.positionWS;
Globals.VertexColor=rhp.color;
Globals.Surface_UVCoord0=rhp.uv0;
Globals.Surface_UVCoord1=rhp.uv1;
int l9_7=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7=0;
}
else
{
l9_7=in.varStereoViewID;
}
int l9_8=l9_7;
float4 emitterPositionCS=(*sc_set0.UserUniforms).sc_ViewProjectionMatrixArray[l9_8]*float4(rhp.positionWS,1.0);
Globals.gScreenCoord=((emitterPositionCS.xy/float2(emitterPositionCS.w))*0.5)+float2(0.5);
Globals.VertexTangent_WorldSpace=rhp.tangentWS.xyz;
Globals.VertexNormal_WorldSpace=rhp.normalWS;
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*rhp.tangentWS.w;
Globals.SurfacePosition_WorldSpace=rhp.positionWS;
}
else
{
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexColor=in.varColor;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
float4 l9_9=gl_FragCoord;
float2 l9_10=l9_9.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_11=l9_10;
float2 l9_12=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_13=1;
int l9_14=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_14=0;
}
else
{
l9_14=in.varStereoViewID;
}
int l9_15=l9_14;
int l9_16=l9_15;
float3 l9_17=float3(l9_11,0.0);
int l9_18=l9_13;
int l9_19=l9_16;
if (l9_18==1)
{
l9_17.y=((2.0*l9_17.y)+float(l9_19))-1.0;
}
float2 l9_20=l9_17.xy;
l9_12=l9_20;
}
else
{
l9_12=l9_11;
}
float2 l9_21=l9_12;
float2 l9_22=l9_21;
Globals.gScreenCoord=l9_22;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
}
float4 Result_N363=float4(0.0);
float4 param=float4(0.0);
float4 param_1=float4(0.0);
ssGlobals param_3=Globals;
float4 param_2;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_23=float4(0.0);
l9_23=param_3.VertexColor;
float3 l9_24=float3(0.0);
float3 l9_25=float3(0.0);
float3 l9_26=float3(0.0);
ssGlobals l9_27=param_3;
float3 l9_28;
if ((int(Tweak_N37_tmp)!=0))
{
float3 l9_29=float3(0.0);
float3 l9_30=(*sc_set0.UserUniforms).recolorRed;
l9_29=l9_30;
float3 l9_31=float3(0.0);
l9_31=l9_29;
float4 l9_32=float4(0.0);
float4 l9_33=(*sc_set0.UserUniforms).baseColor;
l9_32=l9_33;
float4 l9_34=float4(0.0);
l9_34=l9_32;
float4 l9_35=float4(0.0);
float4 l9_36=float4(0.0);
float4 l9_37=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_38=l9_27;
float4 l9_39;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_40=float2(0.0);
float2 l9_41=float2(0.0);
float2 l9_42=float2(0.0);
float2 l9_43=float2(0.0);
float2 l9_44=float2(0.0);
float2 l9_45=float2(0.0);
ssGlobals l9_46=l9_38;
float2 l9_47;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_48=float2(0.0);
l9_48=l9_46.Surface_UVCoord0;
l9_41=l9_48;
l9_47=l9_41;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_49=float2(0.0);
l9_49=l9_46.Surface_UVCoord1;
l9_42=l9_49;
l9_47=l9_42;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_50=float2(0.0);
l9_50=l9_46.Surface_UVCoord0;
float2 l9_51=float2(0.0);
float2 l9_52=float2(0.0);
float2 l9_53=float2(0.0);
ssGlobals l9_54=l9_46;
float2 l9_55;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_56=float2(0.0);
float2 l9_57=float2(0.0);
float2 l9_58=float2(0.0);
float2 l9_59=float2(0.0);
float2 l9_60=float2(0.0);
ssGlobals l9_61=l9_54;
float2 l9_62;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_63=float2(0.0);
l9_63=l9_61.Surface_UVCoord0;
l9_57=l9_63;
l9_62=l9_57;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_64=float2(0.0);
l9_64=l9_61.Surface_UVCoord1;
l9_58=l9_64;
l9_62=l9_58;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_65=float2(0.0);
l9_65=l9_61.gScreenCoord;
l9_59=l9_65;
l9_62=l9_59;
}
else
{
float2 l9_66=float2(0.0);
l9_66=l9_61.Surface_UVCoord0;
l9_60=l9_66;
l9_62=l9_60;
}
}
}
l9_56=l9_62;
float2 l9_67=float2(0.0);
float2 l9_68=(*sc_set0.UserUniforms).uv2Scale;
l9_67=l9_68;
float2 l9_69=float2(0.0);
l9_69=l9_67;
float2 l9_70=float2(0.0);
float2 l9_71=(*sc_set0.UserUniforms).uv2Offset;
l9_70=l9_71;
float2 l9_72=float2(0.0);
l9_72=l9_70;
float2 l9_73=float2(0.0);
l9_73=(l9_56*l9_69)+l9_72;
float2 l9_74=float2(0.0);
l9_74=l9_73+(l9_72*(l9_54.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_52=l9_74;
l9_55=l9_52;
}
else
{
float2 l9_75=float2(0.0);
float2 l9_76=float2(0.0);
float2 l9_77=float2(0.0);
float2 l9_78=float2(0.0);
float2 l9_79=float2(0.0);
ssGlobals l9_80=l9_54;
float2 l9_81;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_82=float2(0.0);
l9_82=l9_80.Surface_UVCoord0;
l9_76=l9_82;
l9_81=l9_76;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_83=float2(0.0);
l9_83=l9_80.Surface_UVCoord1;
l9_77=l9_83;
l9_81=l9_77;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_84=float2(0.0);
l9_84=l9_80.gScreenCoord;
l9_78=l9_84;
l9_81=l9_78;
}
else
{
float2 l9_85=float2(0.0);
l9_85=l9_80.Surface_UVCoord0;
l9_79=l9_85;
l9_81=l9_79;
}
}
}
l9_75=l9_81;
float2 l9_86=float2(0.0);
float2 l9_87=(*sc_set0.UserUniforms).uv2Scale;
l9_86=l9_87;
float2 l9_88=float2(0.0);
l9_88=l9_86;
float2 l9_89=float2(0.0);
float2 l9_90=(*sc_set0.UserUniforms).uv2Offset;
l9_89=l9_90;
float2 l9_91=float2(0.0);
l9_91=l9_89;
float2 l9_92=float2(0.0);
l9_92=(l9_75*l9_88)+l9_91;
l9_53=l9_92;
l9_55=l9_53;
}
l9_51=l9_55;
float l9_93=0.0;
float l9_94;
if ((int(Tweak_N67_tmp)!=0))
{
l9_94=1.001;
}
else
{
l9_94=0.001;
}
l9_94-=0.001;
l9_93=l9_94;
float l9_95=0.0;
l9_95=l9_93;
float2 l9_96=float2(0.0);
l9_96=mix(l9_50,l9_51,float2(l9_95));
float2 l9_97=float2(0.0);
l9_97=l9_96;
float2 l9_98=float2(0.0);
l9_98=l9_97;
l9_43=l9_98;
l9_47=l9_43;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_99=float2(0.0);
l9_99=l9_46.Surface_UVCoord0;
float2 l9_100=float2(0.0);
float2 l9_101=float2(0.0);
float2 l9_102=float2(0.0);
ssGlobals l9_103=l9_46;
float2 l9_104;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_105=float2(0.0);
float2 l9_106=float2(0.0);
float2 l9_107=float2(0.0);
float2 l9_108=float2(0.0);
float2 l9_109=float2(0.0);
float2 l9_110=float2(0.0);
ssGlobals l9_111=l9_103;
float2 l9_112;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_113=float2(0.0);
l9_113=l9_111.Surface_UVCoord0;
l9_106=l9_113;
l9_112=l9_106;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_114=float2(0.0);
l9_114=l9_111.Surface_UVCoord1;
l9_107=l9_114;
l9_112=l9_107;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_115=float2(0.0);
l9_115=l9_111.gScreenCoord;
l9_108=l9_115;
l9_112=l9_108;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_116=float2(0.0);
l9_116=l9_111.Surface_UVCoord0;
float2 l9_117=float2(0.0);
float2 l9_118=float2(0.0);
float2 l9_119=float2(0.0);
ssGlobals l9_120=l9_111;
float2 l9_121;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_122=float2(0.0);
float2 l9_123=float2(0.0);
float2 l9_124=float2(0.0);
float2 l9_125=float2(0.0);
float2 l9_126=float2(0.0);
ssGlobals l9_127=l9_120;
float2 l9_128;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_129=float2(0.0);
l9_129=l9_127.Surface_UVCoord0;
l9_123=l9_129;
l9_128=l9_123;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_130=float2(0.0);
l9_130=l9_127.Surface_UVCoord1;
l9_124=l9_130;
l9_128=l9_124;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_131=float2(0.0);
l9_131=l9_127.gScreenCoord;
l9_125=l9_131;
l9_128=l9_125;
}
else
{
float2 l9_132=float2(0.0);
l9_132=l9_127.Surface_UVCoord0;
l9_126=l9_132;
l9_128=l9_126;
}
}
}
l9_122=l9_128;
float2 l9_133=float2(0.0);
float2 l9_134=(*sc_set0.UserUniforms).uv2Scale;
l9_133=l9_134;
float2 l9_135=float2(0.0);
l9_135=l9_133;
float2 l9_136=float2(0.0);
float2 l9_137=(*sc_set0.UserUniforms).uv2Offset;
l9_136=l9_137;
float2 l9_138=float2(0.0);
l9_138=l9_136;
float2 l9_139=float2(0.0);
l9_139=(l9_122*l9_135)+l9_138;
float2 l9_140=float2(0.0);
l9_140=l9_139+(l9_138*(l9_120.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_118=l9_140;
l9_121=l9_118;
}
else
{
float2 l9_141=float2(0.0);
float2 l9_142=float2(0.0);
float2 l9_143=float2(0.0);
float2 l9_144=float2(0.0);
float2 l9_145=float2(0.0);
ssGlobals l9_146=l9_120;
float2 l9_147;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_148=float2(0.0);
l9_148=l9_146.Surface_UVCoord0;
l9_142=l9_148;
l9_147=l9_142;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_149=float2(0.0);
l9_149=l9_146.Surface_UVCoord1;
l9_143=l9_149;
l9_147=l9_143;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_150=float2(0.0);
l9_150=l9_146.gScreenCoord;
l9_144=l9_150;
l9_147=l9_144;
}
else
{
float2 l9_151=float2(0.0);
l9_151=l9_146.Surface_UVCoord0;
l9_145=l9_151;
l9_147=l9_145;
}
}
}
l9_141=l9_147;
float2 l9_152=float2(0.0);
float2 l9_153=(*sc_set0.UserUniforms).uv2Scale;
l9_152=l9_153;
float2 l9_154=float2(0.0);
l9_154=l9_152;
float2 l9_155=float2(0.0);
float2 l9_156=(*sc_set0.UserUniforms).uv2Offset;
l9_155=l9_156;
float2 l9_157=float2(0.0);
l9_157=l9_155;
float2 l9_158=float2(0.0);
l9_158=(l9_141*l9_154)+l9_157;
l9_119=l9_158;
l9_121=l9_119;
}
l9_117=l9_121;
float l9_159=0.0;
float l9_160;
if ((int(Tweak_N67_tmp)!=0))
{
l9_160=1.001;
}
else
{
l9_160=0.001;
}
l9_160-=0.001;
l9_159=l9_160;
float l9_161=0.0;
l9_161=l9_159;
float2 l9_162=float2(0.0);
l9_162=mix(l9_116,l9_117,float2(l9_161));
float2 l9_163=float2(0.0);
l9_163=l9_162;
float2 l9_164=float2(0.0);
l9_164=l9_163;
l9_109=l9_164;
l9_112=l9_109;
}
else
{
float2 l9_165=float2(0.0);
l9_165=l9_111.Surface_UVCoord0;
l9_110=l9_165;
l9_112=l9_110;
}
}
}
}
l9_105=l9_112;
float2 l9_166=float2(0.0);
float2 l9_167=(*sc_set0.UserUniforms).uv3Scale;
l9_166=l9_167;
float2 l9_168=float2(0.0);
l9_168=l9_166;
float2 l9_169=float2(0.0);
float2 l9_170=(*sc_set0.UserUniforms).uv3Offset;
l9_169=l9_170;
float2 l9_171=float2(0.0);
l9_171=l9_169;
float2 l9_172=float2(0.0);
l9_172=(l9_105*l9_168)+l9_171;
float2 l9_173=float2(0.0);
l9_173=l9_172+(l9_171*(l9_103.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_101=l9_173;
l9_104=l9_101;
}
else
{
float2 l9_174=float2(0.0);
float2 l9_175=float2(0.0);
float2 l9_176=float2(0.0);
float2 l9_177=float2(0.0);
float2 l9_178=float2(0.0);
float2 l9_179=float2(0.0);
ssGlobals l9_180=l9_103;
float2 l9_181;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_182=float2(0.0);
l9_182=l9_180.Surface_UVCoord0;
l9_175=l9_182;
l9_181=l9_175;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_183=float2(0.0);
l9_183=l9_180.Surface_UVCoord1;
l9_176=l9_183;
l9_181=l9_176;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_184=float2(0.0);
l9_184=l9_180.gScreenCoord;
l9_177=l9_184;
l9_181=l9_177;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_185=float2(0.0);
l9_185=l9_180.Surface_UVCoord0;
float2 l9_186=float2(0.0);
float2 l9_187=float2(0.0);
float2 l9_188=float2(0.0);
ssGlobals l9_189=l9_180;
float2 l9_190;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_191=float2(0.0);
float2 l9_192=float2(0.0);
float2 l9_193=float2(0.0);
float2 l9_194=float2(0.0);
float2 l9_195=float2(0.0);
ssGlobals l9_196=l9_189;
float2 l9_197;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_198=float2(0.0);
l9_198=l9_196.Surface_UVCoord0;
l9_192=l9_198;
l9_197=l9_192;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_199=float2(0.0);
l9_199=l9_196.Surface_UVCoord1;
l9_193=l9_199;
l9_197=l9_193;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_200=float2(0.0);
l9_200=l9_196.gScreenCoord;
l9_194=l9_200;
l9_197=l9_194;
}
else
{
float2 l9_201=float2(0.0);
l9_201=l9_196.Surface_UVCoord0;
l9_195=l9_201;
l9_197=l9_195;
}
}
}
l9_191=l9_197;
float2 l9_202=float2(0.0);
float2 l9_203=(*sc_set0.UserUniforms).uv2Scale;
l9_202=l9_203;
float2 l9_204=float2(0.0);
l9_204=l9_202;
float2 l9_205=float2(0.0);
float2 l9_206=(*sc_set0.UserUniforms).uv2Offset;
l9_205=l9_206;
float2 l9_207=float2(0.0);
l9_207=l9_205;
float2 l9_208=float2(0.0);
l9_208=(l9_191*l9_204)+l9_207;
float2 l9_209=float2(0.0);
l9_209=l9_208+(l9_207*(l9_189.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_187=l9_209;
l9_190=l9_187;
}
else
{
float2 l9_210=float2(0.0);
float2 l9_211=float2(0.0);
float2 l9_212=float2(0.0);
float2 l9_213=float2(0.0);
float2 l9_214=float2(0.0);
ssGlobals l9_215=l9_189;
float2 l9_216;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_217=float2(0.0);
l9_217=l9_215.Surface_UVCoord0;
l9_211=l9_217;
l9_216=l9_211;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_218=float2(0.0);
l9_218=l9_215.Surface_UVCoord1;
l9_212=l9_218;
l9_216=l9_212;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_219=float2(0.0);
l9_219=l9_215.gScreenCoord;
l9_213=l9_219;
l9_216=l9_213;
}
else
{
float2 l9_220=float2(0.0);
l9_220=l9_215.Surface_UVCoord0;
l9_214=l9_220;
l9_216=l9_214;
}
}
}
l9_210=l9_216;
float2 l9_221=float2(0.0);
float2 l9_222=(*sc_set0.UserUniforms).uv2Scale;
l9_221=l9_222;
float2 l9_223=float2(0.0);
l9_223=l9_221;
float2 l9_224=float2(0.0);
float2 l9_225=(*sc_set0.UserUniforms).uv2Offset;
l9_224=l9_225;
float2 l9_226=float2(0.0);
l9_226=l9_224;
float2 l9_227=float2(0.0);
l9_227=(l9_210*l9_223)+l9_226;
l9_188=l9_227;
l9_190=l9_188;
}
l9_186=l9_190;
float l9_228=0.0;
float l9_229;
if ((int(Tweak_N67_tmp)!=0))
{
l9_229=1.001;
}
else
{
l9_229=0.001;
}
l9_229-=0.001;
l9_228=l9_229;
float l9_230=0.0;
l9_230=l9_228;
float2 l9_231=float2(0.0);
l9_231=mix(l9_185,l9_186,float2(l9_230));
float2 l9_232=float2(0.0);
l9_232=l9_231;
float2 l9_233=float2(0.0);
l9_233=l9_232;
l9_178=l9_233;
l9_181=l9_178;
}
else
{
float2 l9_234=float2(0.0);
l9_234=l9_180.Surface_UVCoord0;
l9_179=l9_234;
l9_181=l9_179;
}
}
}
}
l9_174=l9_181;
float2 l9_235=float2(0.0);
float2 l9_236=(*sc_set0.UserUniforms).uv3Scale;
l9_235=l9_236;
float2 l9_237=float2(0.0);
l9_237=l9_235;
float2 l9_238=float2(0.0);
float2 l9_239=(*sc_set0.UserUniforms).uv3Offset;
l9_238=l9_239;
float2 l9_240=float2(0.0);
l9_240=l9_238;
float2 l9_241=float2(0.0);
l9_241=(l9_174*l9_237)+l9_240;
l9_102=l9_241;
l9_104=l9_102;
}
l9_100=l9_104;
float l9_242=0.0;
float l9_243;
if ((int(Tweak_N11_tmp)!=0))
{
l9_243=1.001;
}
else
{
l9_243=0.001;
}
l9_243-=0.001;
l9_242=l9_243;
float l9_244=0.0;
l9_244=l9_242;
float2 l9_245=float2(0.0);
l9_245=mix(l9_99,l9_100,float2(l9_244));
float2 l9_246=float2(0.0);
l9_246=l9_245;
float2 l9_247=float2(0.0);
l9_247=l9_246;
l9_44=l9_247;
l9_47=l9_44;
}
else
{
float2 l9_248=float2(0.0);
l9_248=l9_46.Surface_UVCoord0;
l9_45=l9_248;
l9_47=l9_45;
}
}
}
}
l9_40=l9_47;
float4 l9_249=float4(0.0);
int l9_250=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
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
l9_250=1-l9_252;
}
else
{
int l9_253=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_253=0;
}
else
{
l9_253=in.varStereoViewID;
}
int l9_254=l9_253;
l9_250=l9_254;
}
int l9_255=l9_250;
int l9_256=baseTexLayout_tmp;
int l9_257=l9_255;
float2 l9_258=l9_40;
bool l9_259=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_260=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_261=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_262=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_263=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_264=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_265=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_266=0.0;
bool l9_267=l9_264&&(!l9_262);
float l9_268=1.0;
float l9_269=l9_258.x;
int l9_270=l9_261.x;
if (l9_270==1)
{
l9_269=fract(l9_269);
}
else
{
if (l9_270==2)
{
float l9_271=fract(l9_269);
float l9_272=l9_269-l9_271;
float l9_273=step(0.25,fract(l9_272*0.5));
l9_269=mix(l9_271,1.0-l9_271,fast::clamp(l9_273,0.0,1.0));
}
}
l9_258.x=l9_269;
float l9_274=l9_258.y;
int l9_275=l9_261.y;
if (l9_275==1)
{
l9_274=fract(l9_274);
}
else
{
if (l9_275==2)
{
float l9_276=fract(l9_274);
float l9_277=l9_274-l9_276;
float l9_278=step(0.25,fract(l9_277*0.5));
l9_274=mix(l9_276,1.0-l9_276,fast::clamp(l9_278,0.0,1.0));
}
}
l9_258.y=l9_274;
if (l9_262)
{
bool l9_279=l9_264;
bool l9_280;
if (l9_279)
{
l9_280=l9_261.x==3;
}
else
{
l9_280=l9_279;
}
float l9_281=l9_258.x;
float l9_282=l9_263.x;
float l9_283=l9_263.z;
bool l9_284=l9_280;
float l9_285=l9_268;
float l9_286=fast::clamp(l9_281,l9_282,l9_283);
float l9_287=step(abs(l9_281-l9_286),9.9999997e-06);
l9_285*=(l9_287+((1.0-float(l9_284))*(1.0-l9_287)));
l9_281=l9_286;
l9_258.x=l9_281;
l9_268=l9_285;
bool l9_288=l9_264;
bool l9_289;
if (l9_288)
{
l9_289=l9_261.y==3;
}
else
{
l9_289=l9_288;
}
float l9_290=l9_258.y;
float l9_291=l9_263.y;
float l9_292=l9_263.w;
bool l9_293=l9_289;
float l9_294=l9_268;
float l9_295=fast::clamp(l9_290,l9_291,l9_292);
float l9_296=step(abs(l9_290-l9_295),9.9999997e-06);
l9_294*=(l9_296+((1.0-float(l9_293))*(1.0-l9_296)));
l9_290=l9_295;
l9_258.y=l9_290;
l9_268=l9_294;
}
float2 l9_297=l9_258;
bool l9_298=l9_259;
float3x3 l9_299=l9_260;
if (l9_298)
{
l9_297=float2((l9_299*float3(l9_297,1.0)).xy);
}
float2 l9_300=l9_297;
float2 l9_301=l9_300;
float2 l9_302=l9_301;
l9_258=l9_302;
float l9_303=l9_258.x;
int l9_304=l9_261.x;
bool l9_305=l9_267;
float l9_306=l9_268;
if ((l9_304==0)||(l9_304==3))
{
float l9_307=l9_303;
float l9_308=0.0;
float l9_309=1.0;
bool l9_310=l9_305;
float l9_311=l9_306;
float l9_312=fast::clamp(l9_307,l9_308,l9_309);
float l9_313=step(abs(l9_307-l9_312),9.9999997e-06);
l9_311*=(l9_313+((1.0-float(l9_310))*(1.0-l9_313)));
l9_307=l9_312;
l9_303=l9_307;
l9_306=l9_311;
}
l9_258.x=l9_303;
l9_268=l9_306;
float l9_314=l9_258.y;
int l9_315=l9_261.y;
bool l9_316=l9_267;
float l9_317=l9_268;
if ((l9_315==0)||(l9_315==3))
{
float l9_318=l9_314;
float l9_319=0.0;
float l9_320=1.0;
bool l9_321=l9_316;
float l9_322=l9_317;
float l9_323=fast::clamp(l9_318,l9_319,l9_320);
float l9_324=step(abs(l9_318-l9_323),9.9999997e-06);
l9_322*=(l9_324+((1.0-float(l9_321))*(1.0-l9_324)));
l9_318=l9_323;
l9_314=l9_318;
l9_317=l9_322;
}
l9_258.y=l9_314;
l9_268=l9_317;
float2 l9_325=l9_258;
int l9_326=l9_256;
int l9_327=l9_257;
float l9_328=l9_266;
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
float4 l9_337=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_335,bias(l9_336));
float4 l9_338=l9_337;
float4 l9_339=l9_338;
if (l9_264)
{
l9_339=mix(l9_265,l9_339,float4(l9_268));
}
float4 l9_340=l9_339;
l9_249=l9_340;
l9_36=l9_249;
l9_39=l9_36;
}
else
{
l9_39=l9_37;
}
l9_35=l9_39;
float4 l9_341=float4(0.0);
l9_341=l9_34*l9_35;
float4 l9_342=float4(0.0);
l9_342=l9_341;
float4 l9_343=float4(0.0);
l9_343=l9_342;
float l9_344=0.0;
float l9_345=0.0;
float l9_346=0.0;
float3 l9_347=l9_343.xyz;
float l9_348=l9_347.x;
float l9_349=l9_347.y;
float l9_350=l9_347.z;
l9_344=l9_348;
l9_345=l9_349;
l9_346=l9_350;
float3 l9_351=float3(0.0);
l9_351=l9_31*float3(l9_344);
float3 l9_352=float3(0.0);
float3 l9_353=(*sc_set0.UserUniforms).recolorGreen;
l9_352=l9_353;
float3 l9_354=float3(0.0);
l9_354=l9_352;
float3 l9_355=float3(0.0);
l9_355=l9_354*float3(l9_345);
float3 l9_356=float3(0.0);
float3 l9_357=(*sc_set0.UserUniforms).recolorBlue;
l9_356=l9_357;
float3 l9_358=float3(0.0);
l9_358=l9_356;
float3 l9_359=float3(0.0);
l9_359=l9_358*float3(l9_346);
float3 l9_360=float3(0.0);
l9_360=(l9_351+l9_355)+l9_359;
l9_25=l9_360;
l9_28=l9_25;
}
else
{
float4 l9_361=float4(0.0);
float4 l9_362=(*sc_set0.UserUniforms).baseColor;
l9_361=l9_362;
float4 l9_363=float4(0.0);
l9_363=l9_361;
float4 l9_364=float4(0.0);
float4 l9_365=float4(0.0);
float4 l9_366=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_367=l9_27;
float4 l9_368;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_369=float2(0.0);
float2 l9_370=float2(0.0);
float2 l9_371=float2(0.0);
float2 l9_372=float2(0.0);
float2 l9_373=float2(0.0);
float2 l9_374=float2(0.0);
ssGlobals l9_375=l9_367;
float2 l9_376;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_377=float2(0.0);
l9_377=l9_375.Surface_UVCoord0;
l9_370=l9_377;
l9_376=l9_370;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_378=float2(0.0);
l9_378=l9_375.Surface_UVCoord1;
l9_371=l9_378;
l9_376=l9_371;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_379=float2(0.0);
l9_379=l9_375.Surface_UVCoord0;
float2 l9_380=float2(0.0);
float2 l9_381=float2(0.0);
float2 l9_382=float2(0.0);
ssGlobals l9_383=l9_375;
float2 l9_384;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_385=float2(0.0);
float2 l9_386=float2(0.0);
float2 l9_387=float2(0.0);
float2 l9_388=float2(0.0);
float2 l9_389=float2(0.0);
ssGlobals l9_390=l9_383;
float2 l9_391;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_392=float2(0.0);
l9_392=l9_390.Surface_UVCoord0;
l9_386=l9_392;
l9_391=l9_386;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_393=float2(0.0);
l9_393=l9_390.Surface_UVCoord1;
l9_387=l9_393;
l9_391=l9_387;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_394=float2(0.0);
l9_394=l9_390.gScreenCoord;
l9_388=l9_394;
l9_391=l9_388;
}
else
{
float2 l9_395=float2(0.0);
l9_395=l9_390.Surface_UVCoord0;
l9_389=l9_395;
l9_391=l9_389;
}
}
}
l9_385=l9_391;
float2 l9_396=float2(0.0);
float2 l9_397=(*sc_set0.UserUniforms).uv2Scale;
l9_396=l9_397;
float2 l9_398=float2(0.0);
l9_398=l9_396;
float2 l9_399=float2(0.0);
float2 l9_400=(*sc_set0.UserUniforms).uv2Offset;
l9_399=l9_400;
float2 l9_401=float2(0.0);
l9_401=l9_399;
float2 l9_402=float2(0.0);
l9_402=(l9_385*l9_398)+l9_401;
float2 l9_403=float2(0.0);
l9_403=l9_402+(l9_401*(l9_383.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_381=l9_403;
l9_384=l9_381;
}
else
{
float2 l9_404=float2(0.0);
float2 l9_405=float2(0.0);
float2 l9_406=float2(0.0);
float2 l9_407=float2(0.0);
float2 l9_408=float2(0.0);
ssGlobals l9_409=l9_383;
float2 l9_410;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_411=float2(0.0);
l9_411=l9_409.Surface_UVCoord0;
l9_405=l9_411;
l9_410=l9_405;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_412=float2(0.0);
l9_412=l9_409.Surface_UVCoord1;
l9_406=l9_412;
l9_410=l9_406;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_413=float2(0.0);
l9_413=l9_409.gScreenCoord;
l9_407=l9_413;
l9_410=l9_407;
}
else
{
float2 l9_414=float2(0.0);
l9_414=l9_409.Surface_UVCoord0;
l9_408=l9_414;
l9_410=l9_408;
}
}
}
l9_404=l9_410;
float2 l9_415=float2(0.0);
float2 l9_416=(*sc_set0.UserUniforms).uv2Scale;
l9_415=l9_416;
float2 l9_417=float2(0.0);
l9_417=l9_415;
float2 l9_418=float2(0.0);
float2 l9_419=(*sc_set0.UserUniforms).uv2Offset;
l9_418=l9_419;
float2 l9_420=float2(0.0);
l9_420=l9_418;
float2 l9_421=float2(0.0);
l9_421=(l9_404*l9_417)+l9_420;
l9_382=l9_421;
l9_384=l9_382;
}
l9_380=l9_384;
float l9_422=0.0;
float l9_423;
if ((int(Tweak_N67_tmp)!=0))
{
l9_423=1.001;
}
else
{
l9_423=0.001;
}
l9_423-=0.001;
l9_422=l9_423;
float l9_424=0.0;
l9_424=l9_422;
float2 l9_425=float2(0.0);
l9_425=mix(l9_379,l9_380,float2(l9_424));
float2 l9_426=float2(0.0);
l9_426=l9_425;
float2 l9_427=float2(0.0);
l9_427=l9_426;
l9_372=l9_427;
l9_376=l9_372;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_428=float2(0.0);
l9_428=l9_375.Surface_UVCoord0;
float2 l9_429=float2(0.0);
float2 l9_430=float2(0.0);
float2 l9_431=float2(0.0);
ssGlobals l9_432=l9_375;
float2 l9_433;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_434=float2(0.0);
float2 l9_435=float2(0.0);
float2 l9_436=float2(0.0);
float2 l9_437=float2(0.0);
float2 l9_438=float2(0.0);
float2 l9_439=float2(0.0);
ssGlobals l9_440=l9_432;
float2 l9_441;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_442=float2(0.0);
l9_442=l9_440.Surface_UVCoord0;
l9_435=l9_442;
l9_441=l9_435;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_443=float2(0.0);
l9_443=l9_440.Surface_UVCoord1;
l9_436=l9_443;
l9_441=l9_436;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_444=float2(0.0);
l9_444=l9_440.gScreenCoord;
l9_437=l9_444;
l9_441=l9_437;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_445=float2(0.0);
l9_445=l9_440.Surface_UVCoord0;
float2 l9_446=float2(0.0);
float2 l9_447=float2(0.0);
float2 l9_448=float2(0.0);
ssGlobals l9_449=l9_440;
float2 l9_450;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_451=float2(0.0);
float2 l9_452=float2(0.0);
float2 l9_453=float2(0.0);
float2 l9_454=float2(0.0);
float2 l9_455=float2(0.0);
ssGlobals l9_456=l9_449;
float2 l9_457;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_458=float2(0.0);
l9_458=l9_456.Surface_UVCoord0;
l9_452=l9_458;
l9_457=l9_452;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_459=float2(0.0);
l9_459=l9_456.Surface_UVCoord1;
l9_453=l9_459;
l9_457=l9_453;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_460=float2(0.0);
l9_460=l9_456.gScreenCoord;
l9_454=l9_460;
l9_457=l9_454;
}
else
{
float2 l9_461=float2(0.0);
l9_461=l9_456.Surface_UVCoord0;
l9_455=l9_461;
l9_457=l9_455;
}
}
}
l9_451=l9_457;
float2 l9_462=float2(0.0);
float2 l9_463=(*sc_set0.UserUniforms).uv2Scale;
l9_462=l9_463;
float2 l9_464=float2(0.0);
l9_464=l9_462;
float2 l9_465=float2(0.0);
float2 l9_466=(*sc_set0.UserUniforms).uv2Offset;
l9_465=l9_466;
float2 l9_467=float2(0.0);
l9_467=l9_465;
float2 l9_468=float2(0.0);
l9_468=(l9_451*l9_464)+l9_467;
float2 l9_469=float2(0.0);
l9_469=l9_468+(l9_467*(l9_449.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_447=l9_469;
l9_450=l9_447;
}
else
{
float2 l9_470=float2(0.0);
float2 l9_471=float2(0.0);
float2 l9_472=float2(0.0);
float2 l9_473=float2(0.0);
float2 l9_474=float2(0.0);
ssGlobals l9_475=l9_449;
float2 l9_476;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_477=float2(0.0);
l9_477=l9_475.Surface_UVCoord0;
l9_471=l9_477;
l9_476=l9_471;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_478=float2(0.0);
l9_478=l9_475.Surface_UVCoord1;
l9_472=l9_478;
l9_476=l9_472;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_479=float2(0.0);
l9_479=l9_475.gScreenCoord;
l9_473=l9_479;
l9_476=l9_473;
}
else
{
float2 l9_480=float2(0.0);
l9_480=l9_475.Surface_UVCoord0;
l9_474=l9_480;
l9_476=l9_474;
}
}
}
l9_470=l9_476;
float2 l9_481=float2(0.0);
float2 l9_482=(*sc_set0.UserUniforms).uv2Scale;
l9_481=l9_482;
float2 l9_483=float2(0.0);
l9_483=l9_481;
float2 l9_484=float2(0.0);
float2 l9_485=(*sc_set0.UserUniforms).uv2Offset;
l9_484=l9_485;
float2 l9_486=float2(0.0);
l9_486=l9_484;
float2 l9_487=float2(0.0);
l9_487=(l9_470*l9_483)+l9_486;
l9_448=l9_487;
l9_450=l9_448;
}
l9_446=l9_450;
float l9_488=0.0;
float l9_489;
if ((int(Tweak_N67_tmp)!=0))
{
l9_489=1.001;
}
else
{
l9_489=0.001;
}
l9_489-=0.001;
l9_488=l9_489;
float l9_490=0.0;
l9_490=l9_488;
float2 l9_491=float2(0.0);
l9_491=mix(l9_445,l9_446,float2(l9_490));
float2 l9_492=float2(0.0);
l9_492=l9_491;
float2 l9_493=float2(0.0);
l9_493=l9_492;
l9_438=l9_493;
l9_441=l9_438;
}
else
{
float2 l9_494=float2(0.0);
l9_494=l9_440.Surface_UVCoord0;
l9_439=l9_494;
l9_441=l9_439;
}
}
}
}
l9_434=l9_441;
float2 l9_495=float2(0.0);
float2 l9_496=(*sc_set0.UserUniforms).uv3Scale;
l9_495=l9_496;
float2 l9_497=float2(0.0);
l9_497=l9_495;
float2 l9_498=float2(0.0);
float2 l9_499=(*sc_set0.UserUniforms).uv3Offset;
l9_498=l9_499;
float2 l9_500=float2(0.0);
l9_500=l9_498;
float2 l9_501=float2(0.0);
l9_501=(l9_434*l9_497)+l9_500;
float2 l9_502=float2(0.0);
l9_502=l9_501+(l9_500*(l9_432.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_430=l9_502;
l9_433=l9_430;
}
else
{
float2 l9_503=float2(0.0);
float2 l9_504=float2(0.0);
float2 l9_505=float2(0.0);
float2 l9_506=float2(0.0);
float2 l9_507=float2(0.0);
float2 l9_508=float2(0.0);
ssGlobals l9_509=l9_432;
float2 l9_510;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_511=float2(0.0);
l9_511=l9_509.Surface_UVCoord0;
l9_504=l9_511;
l9_510=l9_504;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_512=float2(0.0);
l9_512=l9_509.Surface_UVCoord1;
l9_505=l9_512;
l9_510=l9_505;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_513=float2(0.0);
l9_513=l9_509.gScreenCoord;
l9_506=l9_513;
l9_510=l9_506;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_514=float2(0.0);
l9_514=l9_509.Surface_UVCoord0;
float2 l9_515=float2(0.0);
float2 l9_516=float2(0.0);
float2 l9_517=float2(0.0);
ssGlobals l9_518=l9_509;
float2 l9_519;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_520=float2(0.0);
float2 l9_521=float2(0.0);
float2 l9_522=float2(0.0);
float2 l9_523=float2(0.0);
float2 l9_524=float2(0.0);
ssGlobals l9_525=l9_518;
float2 l9_526;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_527=float2(0.0);
l9_527=l9_525.Surface_UVCoord0;
l9_521=l9_527;
l9_526=l9_521;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_528=float2(0.0);
l9_528=l9_525.Surface_UVCoord1;
l9_522=l9_528;
l9_526=l9_522;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_529=float2(0.0);
l9_529=l9_525.gScreenCoord;
l9_523=l9_529;
l9_526=l9_523;
}
else
{
float2 l9_530=float2(0.0);
l9_530=l9_525.Surface_UVCoord0;
l9_524=l9_530;
l9_526=l9_524;
}
}
}
l9_520=l9_526;
float2 l9_531=float2(0.0);
float2 l9_532=(*sc_set0.UserUniforms).uv2Scale;
l9_531=l9_532;
float2 l9_533=float2(0.0);
l9_533=l9_531;
float2 l9_534=float2(0.0);
float2 l9_535=(*sc_set0.UserUniforms).uv2Offset;
l9_534=l9_535;
float2 l9_536=float2(0.0);
l9_536=l9_534;
float2 l9_537=float2(0.0);
l9_537=(l9_520*l9_533)+l9_536;
float2 l9_538=float2(0.0);
l9_538=l9_537+(l9_536*(l9_518.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_516=l9_538;
l9_519=l9_516;
}
else
{
float2 l9_539=float2(0.0);
float2 l9_540=float2(0.0);
float2 l9_541=float2(0.0);
float2 l9_542=float2(0.0);
float2 l9_543=float2(0.0);
ssGlobals l9_544=l9_518;
float2 l9_545;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_546=float2(0.0);
l9_546=l9_544.Surface_UVCoord0;
l9_540=l9_546;
l9_545=l9_540;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_547=float2(0.0);
l9_547=l9_544.Surface_UVCoord1;
l9_541=l9_547;
l9_545=l9_541;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_548=float2(0.0);
l9_548=l9_544.gScreenCoord;
l9_542=l9_548;
l9_545=l9_542;
}
else
{
float2 l9_549=float2(0.0);
l9_549=l9_544.Surface_UVCoord0;
l9_543=l9_549;
l9_545=l9_543;
}
}
}
l9_539=l9_545;
float2 l9_550=float2(0.0);
float2 l9_551=(*sc_set0.UserUniforms).uv2Scale;
l9_550=l9_551;
float2 l9_552=float2(0.0);
l9_552=l9_550;
float2 l9_553=float2(0.0);
float2 l9_554=(*sc_set0.UserUniforms).uv2Offset;
l9_553=l9_554;
float2 l9_555=float2(0.0);
l9_555=l9_553;
float2 l9_556=float2(0.0);
l9_556=(l9_539*l9_552)+l9_555;
l9_517=l9_556;
l9_519=l9_517;
}
l9_515=l9_519;
float l9_557=0.0;
float l9_558;
if ((int(Tweak_N67_tmp)!=0))
{
l9_558=1.001;
}
else
{
l9_558=0.001;
}
l9_558-=0.001;
l9_557=l9_558;
float l9_559=0.0;
l9_559=l9_557;
float2 l9_560=float2(0.0);
l9_560=mix(l9_514,l9_515,float2(l9_559));
float2 l9_561=float2(0.0);
l9_561=l9_560;
float2 l9_562=float2(0.0);
l9_562=l9_561;
l9_507=l9_562;
l9_510=l9_507;
}
else
{
float2 l9_563=float2(0.0);
l9_563=l9_509.Surface_UVCoord0;
l9_508=l9_563;
l9_510=l9_508;
}
}
}
}
l9_503=l9_510;
float2 l9_564=float2(0.0);
float2 l9_565=(*sc_set0.UserUniforms).uv3Scale;
l9_564=l9_565;
float2 l9_566=float2(0.0);
l9_566=l9_564;
float2 l9_567=float2(0.0);
float2 l9_568=(*sc_set0.UserUniforms).uv3Offset;
l9_567=l9_568;
float2 l9_569=float2(0.0);
l9_569=l9_567;
float2 l9_570=float2(0.0);
l9_570=(l9_503*l9_566)+l9_569;
l9_431=l9_570;
l9_433=l9_431;
}
l9_429=l9_433;
float l9_571=0.0;
float l9_572;
if ((int(Tweak_N11_tmp)!=0))
{
l9_572=1.001;
}
else
{
l9_572=0.001;
}
l9_572-=0.001;
l9_571=l9_572;
float l9_573=0.0;
l9_573=l9_571;
float2 l9_574=float2(0.0);
l9_574=mix(l9_428,l9_429,float2(l9_573));
float2 l9_575=float2(0.0);
l9_575=l9_574;
float2 l9_576=float2(0.0);
l9_576=l9_575;
l9_373=l9_576;
l9_376=l9_373;
}
else
{
float2 l9_577=float2(0.0);
l9_577=l9_375.Surface_UVCoord0;
l9_374=l9_577;
l9_376=l9_374;
}
}
}
}
l9_369=l9_376;
float4 l9_578=float4(0.0);
int l9_579=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_580=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_580=0;
}
else
{
l9_580=in.varStereoViewID;
}
int l9_581=l9_580;
l9_579=1-l9_581;
}
else
{
int l9_582=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_582=0;
}
else
{
l9_582=in.varStereoViewID;
}
int l9_583=l9_582;
l9_579=l9_583;
}
int l9_584=l9_579;
int l9_585=baseTexLayout_tmp;
int l9_586=l9_584;
float2 l9_587=l9_369;
bool l9_588=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_589=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_590=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_591=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_592=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_593=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_594=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_595=0.0;
bool l9_596=l9_593&&(!l9_591);
float l9_597=1.0;
float l9_598=l9_587.x;
int l9_599=l9_590.x;
if (l9_599==1)
{
l9_598=fract(l9_598);
}
else
{
if (l9_599==2)
{
float l9_600=fract(l9_598);
float l9_601=l9_598-l9_600;
float l9_602=step(0.25,fract(l9_601*0.5));
l9_598=mix(l9_600,1.0-l9_600,fast::clamp(l9_602,0.0,1.0));
}
}
l9_587.x=l9_598;
float l9_603=l9_587.y;
int l9_604=l9_590.y;
if (l9_604==1)
{
l9_603=fract(l9_603);
}
else
{
if (l9_604==2)
{
float l9_605=fract(l9_603);
float l9_606=l9_603-l9_605;
float l9_607=step(0.25,fract(l9_606*0.5));
l9_603=mix(l9_605,1.0-l9_605,fast::clamp(l9_607,0.0,1.0));
}
}
l9_587.y=l9_603;
if (l9_591)
{
bool l9_608=l9_593;
bool l9_609;
if (l9_608)
{
l9_609=l9_590.x==3;
}
else
{
l9_609=l9_608;
}
float l9_610=l9_587.x;
float l9_611=l9_592.x;
float l9_612=l9_592.z;
bool l9_613=l9_609;
float l9_614=l9_597;
float l9_615=fast::clamp(l9_610,l9_611,l9_612);
float l9_616=step(abs(l9_610-l9_615),9.9999997e-06);
l9_614*=(l9_616+((1.0-float(l9_613))*(1.0-l9_616)));
l9_610=l9_615;
l9_587.x=l9_610;
l9_597=l9_614;
bool l9_617=l9_593;
bool l9_618;
if (l9_617)
{
l9_618=l9_590.y==3;
}
else
{
l9_618=l9_617;
}
float l9_619=l9_587.y;
float l9_620=l9_592.y;
float l9_621=l9_592.w;
bool l9_622=l9_618;
float l9_623=l9_597;
float l9_624=fast::clamp(l9_619,l9_620,l9_621);
float l9_625=step(abs(l9_619-l9_624),9.9999997e-06);
l9_623*=(l9_625+((1.0-float(l9_622))*(1.0-l9_625)));
l9_619=l9_624;
l9_587.y=l9_619;
l9_597=l9_623;
}
float2 l9_626=l9_587;
bool l9_627=l9_588;
float3x3 l9_628=l9_589;
if (l9_627)
{
l9_626=float2((l9_628*float3(l9_626,1.0)).xy);
}
float2 l9_629=l9_626;
float2 l9_630=l9_629;
float2 l9_631=l9_630;
l9_587=l9_631;
float l9_632=l9_587.x;
int l9_633=l9_590.x;
bool l9_634=l9_596;
float l9_635=l9_597;
if ((l9_633==0)||(l9_633==3))
{
float l9_636=l9_632;
float l9_637=0.0;
float l9_638=1.0;
bool l9_639=l9_634;
float l9_640=l9_635;
float l9_641=fast::clamp(l9_636,l9_637,l9_638);
float l9_642=step(abs(l9_636-l9_641),9.9999997e-06);
l9_640*=(l9_642+((1.0-float(l9_639))*(1.0-l9_642)));
l9_636=l9_641;
l9_632=l9_636;
l9_635=l9_640;
}
l9_587.x=l9_632;
l9_597=l9_635;
float l9_643=l9_587.y;
int l9_644=l9_590.y;
bool l9_645=l9_596;
float l9_646=l9_597;
if ((l9_644==0)||(l9_644==3))
{
float l9_647=l9_643;
float l9_648=0.0;
float l9_649=1.0;
bool l9_650=l9_645;
float l9_651=l9_646;
float l9_652=fast::clamp(l9_647,l9_648,l9_649);
float l9_653=step(abs(l9_647-l9_652),9.9999997e-06);
l9_651*=(l9_653+((1.0-float(l9_650))*(1.0-l9_653)));
l9_647=l9_652;
l9_643=l9_647;
l9_646=l9_651;
}
l9_587.y=l9_643;
l9_597=l9_646;
float2 l9_654=l9_587;
int l9_655=l9_585;
int l9_656=l9_586;
float l9_657=l9_595;
float2 l9_658=l9_654;
int l9_659=l9_655;
int l9_660=l9_656;
float3 l9_661=float3(0.0);
if (l9_659==0)
{
l9_661=float3(l9_658,0.0);
}
else
{
if (l9_659==1)
{
l9_661=float3(l9_658.x,(l9_658.y*0.5)+(0.5-(float(l9_660)*0.5)),0.0);
}
else
{
l9_661=float3(l9_658,float(l9_660));
}
}
float3 l9_662=l9_661;
float3 l9_663=l9_662;
float2 l9_664=l9_663.xy;
float l9_665=l9_657;
float4 l9_666=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_664,bias(l9_665));
float4 l9_667=l9_666;
float4 l9_668=l9_667;
if (l9_593)
{
l9_668=mix(l9_594,l9_668,float4(l9_597));
}
float4 l9_669=l9_668;
l9_578=l9_669;
l9_365=l9_578;
l9_368=l9_365;
}
else
{
l9_368=l9_366;
}
l9_364=l9_368;
float4 l9_670=float4(0.0);
l9_670=l9_363*l9_364;
float4 l9_671=float4(0.0);
l9_671=l9_670;
float4 l9_672=float4(0.0);
l9_672=l9_671;
l9_26=l9_672.xyz;
l9_28=l9_26;
}
l9_24=l9_28;
float3 l9_673=float3(0.0);
l9_673=l9_24;
float3 l9_674=float3(0.0);
l9_674=l9_673;
float4 l9_675=float4(0.0);
l9_675=float4(l9_674.x,l9_674.y,l9_674.z,l9_675.w);
l9_675.w=(*sc_set0.UserUniforms).Port_Value2_N073;
float4 l9_676=float4(0.0);
l9_676=l9_23*l9_675;
param=l9_676;
param_2=param;
}
else
{
float3 l9_677=float3(0.0);
float3 l9_678=float3(0.0);
float3 l9_679=float3(0.0);
ssGlobals l9_680=param_3;
float3 l9_681;
if ((int(Tweak_N37_tmp)!=0))
{
float3 l9_682=float3(0.0);
float3 l9_683=(*sc_set0.UserUniforms).recolorRed;
l9_682=l9_683;
float3 l9_684=float3(0.0);
l9_684=l9_682;
float4 l9_685=float4(0.0);
float4 l9_686=(*sc_set0.UserUniforms).baseColor;
l9_685=l9_686;
float4 l9_687=float4(0.0);
l9_687=l9_685;
float4 l9_688=float4(0.0);
float4 l9_689=float4(0.0);
float4 l9_690=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_691=l9_680;
float4 l9_692;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_693=float2(0.0);
float2 l9_694=float2(0.0);
float2 l9_695=float2(0.0);
float2 l9_696=float2(0.0);
float2 l9_697=float2(0.0);
float2 l9_698=float2(0.0);
ssGlobals l9_699=l9_691;
float2 l9_700;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_701=float2(0.0);
l9_701=l9_699.Surface_UVCoord0;
l9_694=l9_701;
l9_700=l9_694;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_702=float2(0.0);
l9_702=l9_699.Surface_UVCoord1;
l9_695=l9_702;
l9_700=l9_695;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_703=float2(0.0);
l9_703=l9_699.Surface_UVCoord0;
float2 l9_704=float2(0.0);
float2 l9_705=float2(0.0);
float2 l9_706=float2(0.0);
ssGlobals l9_707=l9_699;
float2 l9_708;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_709=float2(0.0);
float2 l9_710=float2(0.0);
float2 l9_711=float2(0.0);
float2 l9_712=float2(0.0);
float2 l9_713=float2(0.0);
ssGlobals l9_714=l9_707;
float2 l9_715;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_716=float2(0.0);
l9_716=l9_714.Surface_UVCoord0;
l9_710=l9_716;
l9_715=l9_710;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_717=float2(0.0);
l9_717=l9_714.Surface_UVCoord1;
l9_711=l9_717;
l9_715=l9_711;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_718=float2(0.0);
l9_718=l9_714.gScreenCoord;
l9_712=l9_718;
l9_715=l9_712;
}
else
{
float2 l9_719=float2(0.0);
l9_719=l9_714.Surface_UVCoord0;
l9_713=l9_719;
l9_715=l9_713;
}
}
}
l9_709=l9_715;
float2 l9_720=float2(0.0);
float2 l9_721=(*sc_set0.UserUniforms).uv2Scale;
l9_720=l9_721;
float2 l9_722=float2(0.0);
l9_722=l9_720;
float2 l9_723=float2(0.0);
float2 l9_724=(*sc_set0.UserUniforms).uv2Offset;
l9_723=l9_724;
float2 l9_725=float2(0.0);
l9_725=l9_723;
float2 l9_726=float2(0.0);
l9_726=(l9_709*l9_722)+l9_725;
float2 l9_727=float2(0.0);
l9_727=l9_726+(l9_725*(l9_707.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_705=l9_727;
l9_708=l9_705;
}
else
{
float2 l9_728=float2(0.0);
float2 l9_729=float2(0.0);
float2 l9_730=float2(0.0);
float2 l9_731=float2(0.0);
float2 l9_732=float2(0.0);
ssGlobals l9_733=l9_707;
float2 l9_734;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_735=float2(0.0);
l9_735=l9_733.Surface_UVCoord0;
l9_729=l9_735;
l9_734=l9_729;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_736=float2(0.0);
l9_736=l9_733.Surface_UVCoord1;
l9_730=l9_736;
l9_734=l9_730;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_737=float2(0.0);
l9_737=l9_733.gScreenCoord;
l9_731=l9_737;
l9_734=l9_731;
}
else
{
float2 l9_738=float2(0.0);
l9_738=l9_733.Surface_UVCoord0;
l9_732=l9_738;
l9_734=l9_732;
}
}
}
l9_728=l9_734;
float2 l9_739=float2(0.0);
float2 l9_740=(*sc_set0.UserUniforms).uv2Scale;
l9_739=l9_740;
float2 l9_741=float2(0.0);
l9_741=l9_739;
float2 l9_742=float2(0.0);
float2 l9_743=(*sc_set0.UserUniforms).uv2Offset;
l9_742=l9_743;
float2 l9_744=float2(0.0);
l9_744=l9_742;
float2 l9_745=float2(0.0);
l9_745=(l9_728*l9_741)+l9_744;
l9_706=l9_745;
l9_708=l9_706;
}
l9_704=l9_708;
float l9_746=0.0;
float l9_747;
if ((int(Tweak_N67_tmp)!=0))
{
l9_747=1.001;
}
else
{
l9_747=0.001;
}
l9_747-=0.001;
l9_746=l9_747;
float l9_748=0.0;
l9_748=l9_746;
float2 l9_749=float2(0.0);
l9_749=mix(l9_703,l9_704,float2(l9_748));
float2 l9_750=float2(0.0);
l9_750=l9_749;
float2 l9_751=float2(0.0);
l9_751=l9_750;
l9_696=l9_751;
l9_700=l9_696;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_752=float2(0.0);
l9_752=l9_699.Surface_UVCoord0;
float2 l9_753=float2(0.0);
float2 l9_754=float2(0.0);
float2 l9_755=float2(0.0);
ssGlobals l9_756=l9_699;
float2 l9_757;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_758=float2(0.0);
float2 l9_759=float2(0.0);
float2 l9_760=float2(0.0);
float2 l9_761=float2(0.0);
float2 l9_762=float2(0.0);
float2 l9_763=float2(0.0);
ssGlobals l9_764=l9_756;
float2 l9_765;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_766=float2(0.0);
l9_766=l9_764.Surface_UVCoord0;
l9_759=l9_766;
l9_765=l9_759;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_767=float2(0.0);
l9_767=l9_764.Surface_UVCoord1;
l9_760=l9_767;
l9_765=l9_760;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_768=float2(0.0);
l9_768=l9_764.gScreenCoord;
l9_761=l9_768;
l9_765=l9_761;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_769=float2(0.0);
l9_769=l9_764.Surface_UVCoord0;
float2 l9_770=float2(0.0);
float2 l9_771=float2(0.0);
float2 l9_772=float2(0.0);
ssGlobals l9_773=l9_764;
float2 l9_774;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_775=float2(0.0);
float2 l9_776=float2(0.0);
float2 l9_777=float2(0.0);
float2 l9_778=float2(0.0);
float2 l9_779=float2(0.0);
ssGlobals l9_780=l9_773;
float2 l9_781;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_782=float2(0.0);
l9_782=l9_780.Surface_UVCoord0;
l9_776=l9_782;
l9_781=l9_776;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_783=float2(0.0);
l9_783=l9_780.Surface_UVCoord1;
l9_777=l9_783;
l9_781=l9_777;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_784=float2(0.0);
l9_784=l9_780.gScreenCoord;
l9_778=l9_784;
l9_781=l9_778;
}
else
{
float2 l9_785=float2(0.0);
l9_785=l9_780.Surface_UVCoord0;
l9_779=l9_785;
l9_781=l9_779;
}
}
}
l9_775=l9_781;
float2 l9_786=float2(0.0);
float2 l9_787=(*sc_set0.UserUniforms).uv2Scale;
l9_786=l9_787;
float2 l9_788=float2(0.0);
l9_788=l9_786;
float2 l9_789=float2(0.0);
float2 l9_790=(*sc_set0.UserUniforms).uv2Offset;
l9_789=l9_790;
float2 l9_791=float2(0.0);
l9_791=l9_789;
float2 l9_792=float2(0.0);
l9_792=(l9_775*l9_788)+l9_791;
float2 l9_793=float2(0.0);
l9_793=l9_792+(l9_791*(l9_773.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_771=l9_793;
l9_774=l9_771;
}
else
{
float2 l9_794=float2(0.0);
float2 l9_795=float2(0.0);
float2 l9_796=float2(0.0);
float2 l9_797=float2(0.0);
float2 l9_798=float2(0.0);
ssGlobals l9_799=l9_773;
float2 l9_800;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_801=float2(0.0);
l9_801=l9_799.Surface_UVCoord0;
l9_795=l9_801;
l9_800=l9_795;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_802=float2(0.0);
l9_802=l9_799.Surface_UVCoord1;
l9_796=l9_802;
l9_800=l9_796;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_803=float2(0.0);
l9_803=l9_799.gScreenCoord;
l9_797=l9_803;
l9_800=l9_797;
}
else
{
float2 l9_804=float2(0.0);
l9_804=l9_799.Surface_UVCoord0;
l9_798=l9_804;
l9_800=l9_798;
}
}
}
l9_794=l9_800;
float2 l9_805=float2(0.0);
float2 l9_806=(*sc_set0.UserUniforms).uv2Scale;
l9_805=l9_806;
float2 l9_807=float2(0.0);
l9_807=l9_805;
float2 l9_808=float2(0.0);
float2 l9_809=(*sc_set0.UserUniforms).uv2Offset;
l9_808=l9_809;
float2 l9_810=float2(0.0);
l9_810=l9_808;
float2 l9_811=float2(0.0);
l9_811=(l9_794*l9_807)+l9_810;
l9_772=l9_811;
l9_774=l9_772;
}
l9_770=l9_774;
float l9_812=0.0;
float l9_813;
if ((int(Tweak_N67_tmp)!=0))
{
l9_813=1.001;
}
else
{
l9_813=0.001;
}
l9_813-=0.001;
l9_812=l9_813;
float l9_814=0.0;
l9_814=l9_812;
float2 l9_815=float2(0.0);
l9_815=mix(l9_769,l9_770,float2(l9_814));
float2 l9_816=float2(0.0);
l9_816=l9_815;
float2 l9_817=float2(0.0);
l9_817=l9_816;
l9_762=l9_817;
l9_765=l9_762;
}
else
{
float2 l9_818=float2(0.0);
l9_818=l9_764.Surface_UVCoord0;
l9_763=l9_818;
l9_765=l9_763;
}
}
}
}
l9_758=l9_765;
float2 l9_819=float2(0.0);
float2 l9_820=(*sc_set0.UserUniforms).uv3Scale;
l9_819=l9_820;
float2 l9_821=float2(0.0);
l9_821=l9_819;
float2 l9_822=float2(0.0);
float2 l9_823=(*sc_set0.UserUniforms).uv3Offset;
l9_822=l9_823;
float2 l9_824=float2(0.0);
l9_824=l9_822;
float2 l9_825=float2(0.0);
l9_825=(l9_758*l9_821)+l9_824;
float2 l9_826=float2(0.0);
l9_826=l9_825+(l9_824*(l9_756.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_754=l9_826;
l9_757=l9_754;
}
else
{
float2 l9_827=float2(0.0);
float2 l9_828=float2(0.0);
float2 l9_829=float2(0.0);
float2 l9_830=float2(0.0);
float2 l9_831=float2(0.0);
float2 l9_832=float2(0.0);
ssGlobals l9_833=l9_756;
float2 l9_834;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_835=float2(0.0);
l9_835=l9_833.Surface_UVCoord0;
l9_828=l9_835;
l9_834=l9_828;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_836=float2(0.0);
l9_836=l9_833.Surface_UVCoord1;
l9_829=l9_836;
l9_834=l9_829;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_837=float2(0.0);
l9_837=l9_833.gScreenCoord;
l9_830=l9_837;
l9_834=l9_830;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_838=float2(0.0);
l9_838=l9_833.Surface_UVCoord0;
float2 l9_839=float2(0.0);
float2 l9_840=float2(0.0);
float2 l9_841=float2(0.0);
ssGlobals l9_842=l9_833;
float2 l9_843;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_844=float2(0.0);
float2 l9_845=float2(0.0);
float2 l9_846=float2(0.0);
float2 l9_847=float2(0.0);
float2 l9_848=float2(0.0);
ssGlobals l9_849=l9_842;
float2 l9_850;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_851=float2(0.0);
l9_851=l9_849.Surface_UVCoord0;
l9_845=l9_851;
l9_850=l9_845;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_852=float2(0.0);
l9_852=l9_849.Surface_UVCoord1;
l9_846=l9_852;
l9_850=l9_846;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_853=float2(0.0);
l9_853=l9_849.gScreenCoord;
l9_847=l9_853;
l9_850=l9_847;
}
else
{
float2 l9_854=float2(0.0);
l9_854=l9_849.Surface_UVCoord0;
l9_848=l9_854;
l9_850=l9_848;
}
}
}
l9_844=l9_850;
float2 l9_855=float2(0.0);
float2 l9_856=(*sc_set0.UserUniforms).uv2Scale;
l9_855=l9_856;
float2 l9_857=float2(0.0);
l9_857=l9_855;
float2 l9_858=float2(0.0);
float2 l9_859=(*sc_set0.UserUniforms).uv2Offset;
l9_858=l9_859;
float2 l9_860=float2(0.0);
l9_860=l9_858;
float2 l9_861=float2(0.0);
l9_861=(l9_844*l9_857)+l9_860;
float2 l9_862=float2(0.0);
l9_862=l9_861+(l9_860*(l9_842.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_840=l9_862;
l9_843=l9_840;
}
else
{
float2 l9_863=float2(0.0);
float2 l9_864=float2(0.0);
float2 l9_865=float2(0.0);
float2 l9_866=float2(0.0);
float2 l9_867=float2(0.0);
ssGlobals l9_868=l9_842;
float2 l9_869;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_870=float2(0.0);
l9_870=l9_868.Surface_UVCoord0;
l9_864=l9_870;
l9_869=l9_864;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_871=float2(0.0);
l9_871=l9_868.Surface_UVCoord1;
l9_865=l9_871;
l9_869=l9_865;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_872=float2(0.0);
l9_872=l9_868.gScreenCoord;
l9_866=l9_872;
l9_869=l9_866;
}
else
{
float2 l9_873=float2(0.0);
l9_873=l9_868.Surface_UVCoord0;
l9_867=l9_873;
l9_869=l9_867;
}
}
}
l9_863=l9_869;
float2 l9_874=float2(0.0);
float2 l9_875=(*sc_set0.UserUniforms).uv2Scale;
l9_874=l9_875;
float2 l9_876=float2(0.0);
l9_876=l9_874;
float2 l9_877=float2(0.0);
float2 l9_878=(*sc_set0.UserUniforms).uv2Offset;
l9_877=l9_878;
float2 l9_879=float2(0.0);
l9_879=l9_877;
float2 l9_880=float2(0.0);
l9_880=(l9_863*l9_876)+l9_879;
l9_841=l9_880;
l9_843=l9_841;
}
l9_839=l9_843;
float l9_881=0.0;
float l9_882;
if ((int(Tweak_N67_tmp)!=0))
{
l9_882=1.001;
}
else
{
l9_882=0.001;
}
l9_882-=0.001;
l9_881=l9_882;
float l9_883=0.0;
l9_883=l9_881;
float2 l9_884=float2(0.0);
l9_884=mix(l9_838,l9_839,float2(l9_883));
float2 l9_885=float2(0.0);
l9_885=l9_884;
float2 l9_886=float2(0.0);
l9_886=l9_885;
l9_831=l9_886;
l9_834=l9_831;
}
else
{
float2 l9_887=float2(0.0);
l9_887=l9_833.Surface_UVCoord0;
l9_832=l9_887;
l9_834=l9_832;
}
}
}
}
l9_827=l9_834;
float2 l9_888=float2(0.0);
float2 l9_889=(*sc_set0.UserUniforms).uv3Scale;
l9_888=l9_889;
float2 l9_890=float2(0.0);
l9_890=l9_888;
float2 l9_891=float2(0.0);
float2 l9_892=(*sc_set0.UserUniforms).uv3Offset;
l9_891=l9_892;
float2 l9_893=float2(0.0);
l9_893=l9_891;
float2 l9_894=float2(0.0);
l9_894=(l9_827*l9_890)+l9_893;
l9_755=l9_894;
l9_757=l9_755;
}
l9_753=l9_757;
float l9_895=0.0;
float l9_896;
if ((int(Tweak_N11_tmp)!=0))
{
l9_896=1.001;
}
else
{
l9_896=0.001;
}
l9_896-=0.001;
l9_895=l9_896;
float l9_897=0.0;
l9_897=l9_895;
float2 l9_898=float2(0.0);
l9_898=mix(l9_752,l9_753,float2(l9_897));
float2 l9_899=float2(0.0);
l9_899=l9_898;
float2 l9_900=float2(0.0);
l9_900=l9_899;
l9_697=l9_900;
l9_700=l9_697;
}
else
{
float2 l9_901=float2(0.0);
l9_901=l9_699.Surface_UVCoord0;
l9_698=l9_901;
l9_700=l9_698;
}
}
}
}
l9_693=l9_700;
float4 l9_902=float4(0.0);
int l9_903=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_904=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_904=0;
}
else
{
l9_904=in.varStereoViewID;
}
int l9_905=l9_904;
l9_903=1-l9_905;
}
else
{
int l9_906=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_906=0;
}
else
{
l9_906=in.varStereoViewID;
}
int l9_907=l9_906;
l9_903=l9_907;
}
int l9_908=l9_903;
int l9_909=baseTexLayout_tmp;
int l9_910=l9_908;
float2 l9_911=l9_693;
bool l9_912=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_913=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_914=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_915=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_916=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_917=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_918=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_919=0.0;
bool l9_920=l9_917&&(!l9_915);
float l9_921=1.0;
float l9_922=l9_911.x;
int l9_923=l9_914.x;
if (l9_923==1)
{
l9_922=fract(l9_922);
}
else
{
if (l9_923==2)
{
float l9_924=fract(l9_922);
float l9_925=l9_922-l9_924;
float l9_926=step(0.25,fract(l9_925*0.5));
l9_922=mix(l9_924,1.0-l9_924,fast::clamp(l9_926,0.0,1.0));
}
}
l9_911.x=l9_922;
float l9_927=l9_911.y;
int l9_928=l9_914.y;
if (l9_928==1)
{
l9_927=fract(l9_927);
}
else
{
if (l9_928==2)
{
float l9_929=fract(l9_927);
float l9_930=l9_927-l9_929;
float l9_931=step(0.25,fract(l9_930*0.5));
l9_927=mix(l9_929,1.0-l9_929,fast::clamp(l9_931,0.0,1.0));
}
}
l9_911.y=l9_927;
if (l9_915)
{
bool l9_932=l9_917;
bool l9_933;
if (l9_932)
{
l9_933=l9_914.x==3;
}
else
{
l9_933=l9_932;
}
float l9_934=l9_911.x;
float l9_935=l9_916.x;
float l9_936=l9_916.z;
bool l9_937=l9_933;
float l9_938=l9_921;
float l9_939=fast::clamp(l9_934,l9_935,l9_936);
float l9_940=step(abs(l9_934-l9_939),9.9999997e-06);
l9_938*=(l9_940+((1.0-float(l9_937))*(1.0-l9_940)));
l9_934=l9_939;
l9_911.x=l9_934;
l9_921=l9_938;
bool l9_941=l9_917;
bool l9_942;
if (l9_941)
{
l9_942=l9_914.y==3;
}
else
{
l9_942=l9_941;
}
float l9_943=l9_911.y;
float l9_944=l9_916.y;
float l9_945=l9_916.w;
bool l9_946=l9_942;
float l9_947=l9_921;
float l9_948=fast::clamp(l9_943,l9_944,l9_945);
float l9_949=step(abs(l9_943-l9_948),9.9999997e-06);
l9_947*=(l9_949+((1.0-float(l9_946))*(1.0-l9_949)));
l9_943=l9_948;
l9_911.y=l9_943;
l9_921=l9_947;
}
float2 l9_950=l9_911;
bool l9_951=l9_912;
float3x3 l9_952=l9_913;
if (l9_951)
{
l9_950=float2((l9_952*float3(l9_950,1.0)).xy);
}
float2 l9_953=l9_950;
float2 l9_954=l9_953;
float2 l9_955=l9_954;
l9_911=l9_955;
float l9_956=l9_911.x;
int l9_957=l9_914.x;
bool l9_958=l9_920;
float l9_959=l9_921;
if ((l9_957==0)||(l9_957==3))
{
float l9_960=l9_956;
float l9_961=0.0;
float l9_962=1.0;
bool l9_963=l9_958;
float l9_964=l9_959;
float l9_965=fast::clamp(l9_960,l9_961,l9_962);
float l9_966=step(abs(l9_960-l9_965),9.9999997e-06);
l9_964*=(l9_966+((1.0-float(l9_963))*(1.0-l9_966)));
l9_960=l9_965;
l9_956=l9_960;
l9_959=l9_964;
}
l9_911.x=l9_956;
l9_921=l9_959;
float l9_967=l9_911.y;
int l9_968=l9_914.y;
bool l9_969=l9_920;
float l9_970=l9_921;
if ((l9_968==0)||(l9_968==3))
{
float l9_971=l9_967;
float l9_972=0.0;
float l9_973=1.0;
bool l9_974=l9_969;
float l9_975=l9_970;
float l9_976=fast::clamp(l9_971,l9_972,l9_973);
float l9_977=step(abs(l9_971-l9_976),9.9999997e-06);
l9_975*=(l9_977+((1.0-float(l9_974))*(1.0-l9_977)));
l9_971=l9_976;
l9_967=l9_971;
l9_970=l9_975;
}
l9_911.y=l9_967;
l9_921=l9_970;
float2 l9_978=l9_911;
int l9_979=l9_909;
int l9_980=l9_910;
float l9_981=l9_919;
float2 l9_982=l9_978;
int l9_983=l9_979;
int l9_984=l9_980;
float3 l9_985=float3(0.0);
if (l9_983==0)
{
l9_985=float3(l9_982,0.0);
}
else
{
if (l9_983==1)
{
l9_985=float3(l9_982.x,(l9_982.y*0.5)+(0.5-(float(l9_984)*0.5)),0.0);
}
else
{
l9_985=float3(l9_982,float(l9_984));
}
}
float3 l9_986=l9_985;
float3 l9_987=l9_986;
float2 l9_988=l9_987.xy;
float l9_989=l9_981;
float4 l9_990=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_988,bias(l9_989));
float4 l9_991=l9_990;
float4 l9_992=l9_991;
if (l9_917)
{
l9_992=mix(l9_918,l9_992,float4(l9_921));
}
float4 l9_993=l9_992;
l9_902=l9_993;
l9_689=l9_902;
l9_692=l9_689;
}
else
{
l9_692=l9_690;
}
l9_688=l9_692;
float4 l9_994=float4(0.0);
l9_994=l9_687*l9_688;
float4 l9_995=float4(0.0);
l9_995=l9_994;
float4 l9_996=float4(0.0);
l9_996=l9_995;
float l9_997=0.0;
float l9_998=0.0;
float l9_999=0.0;
float3 l9_1000=l9_996.xyz;
float l9_1001=l9_1000.x;
float l9_1002=l9_1000.y;
float l9_1003=l9_1000.z;
l9_997=l9_1001;
l9_998=l9_1002;
l9_999=l9_1003;
float3 l9_1004=float3(0.0);
l9_1004=l9_684*float3(l9_997);
float3 l9_1005=float3(0.0);
float3 l9_1006=(*sc_set0.UserUniforms).recolorGreen;
l9_1005=l9_1006;
float3 l9_1007=float3(0.0);
l9_1007=l9_1005;
float3 l9_1008=float3(0.0);
l9_1008=l9_1007*float3(l9_998);
float3 l9_1009=float3(0.0);
float3 l9_1010=(*sc_set0.UserUniforms).recolorBlue;
l9_1009=l9_1010;
float3 l9_1011=float3(0.0);
l9_1011=l9_1009;
float3 l9_1012=float3(0.0);
l9_1012=l9_1011*float3(l9_999);
float3 l9_1013=float3(0.0);
l9_1013=(l9_1004+l9_1008)+l9_1012;
l9_678=l9_1013;
l9_681=l9_678;
}
else
{
float4 l9_1014=float4(0.0);
float4 l9_1015=(*sc_set0.UserUniforms).baseColor;
l9_1014=l9_1015;
float4 l9_1016=float4(0.0);
l9_1016=l9_1014;
float4 l9_1017=float4(0.0);
float4 l9_1018=float4(0.0);
float4 l9_1019=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_1020=l9_680;
float4 l9_1021;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_1022=float2(0.0);
float2 l9_1023=float2(0.0);
float2 l9_1024=float2(0.0);
float2 l9_1025=float2(0.0);
float2 l9_1026=float2(0.0);
float2 l9_1027=float2(0.0);
ssGlobals l9_1028=l9_1020;
float2 l9_1029;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_1030=float2(0.0);
l9_1030=l9_1028.Surface_UVCoord0;
l9_1023=l9_1030;
l9_1029=l9_1023;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_1031=float2(0.0);
l9_1031=l9_1028.Surface_UVCoord1;
l9_1024=l9_1031;
l9_1029=l9_1024;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_1032=float2(0.0);
l9_1032=l9_1028.Surface_UVCoord0;
float2 l9_1033=float2(0.0);
float2 l9_1034=float2(0.0);
float2 l9_1035=float2(0.0);
ssGlobals l9_1036=l9_1028;
float2 l9_1037;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1038=float2(0.0);
float2 l9_1039=float2(0.0);
float2 l9_1040=float2(0.0);
float2 l9_1041=float2(0.0);
float2 l9_1042=float2(0.0);
ssGlobals l9_1043=l9_1036;
float2 l9_1044;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1045=float2(0.0);
l9_1045=l9_1043.Surface_UVCoord0;
l9_1039=l9_1045;
l9_1044=l9_1039;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1046=float2(0.0);
l9_1046=l9_1043.Surface_UVCoord1;
l9_1040=l9_1046;
l9_1044=l9_1040;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1047=float2(0.0);
l9_1047=l9_1043.gScreenCoord;
l9_1041=l9_1047;
l9_1044=l9_1041;
}
else
{
float2 l9_1048=float2(0.0);
l9_1048=l9_1043.Surface_UVCoord0;
l9_1042=l9_1048;
l9_1044=l9_1042;
}
}
}
l9_1038=l9_1044;
float2 l9_1049=float2(0.0);
float2 l9_1050=(*sc_set0.UserUniforms).uv2Scale;
l9_1049=l9_1050;
float2 l9_1051=float2(0.0);
l9_1051=l9_1049;
float2 l9_1052=float2(0.0);
float2 l9_1053=(*sc_set0.UserUniforms).uv2Offset;
l9_1052=l9_1053;
float2 l9_1054=float2(0.0);
l9_1054=l9_1052;
float2 l9_1055=float2(0.0);
l9_1055=(l9_1038*l9_1051)+l9_1054;
float2 l9_1056=float2(0.0);
l9_1056=l9_1055+(l9_1054*(l9_1036.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1034=l9_1056;
l9_1037=l9_1034;
}
else
{
float2 l9_1057=float2(0.0);
float2 l9_1058=float2(0.0);
float2 l9_1059=float2(0.0);
float2 l9_1060=float2(0.0);
float2 l9_1061=float2(0.0);
ssGlobals l9_1062=l9_1036;
float2 l9_1063;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1064=float2(0.0);
l9_1064=l9_1062.Surface_UVCoord0;
l9_1058=l9_1064;
l9_1063=l9_1058;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1065=float2(0.0);
l9_1065=l9_1062.Surface_UVCoord1;
l9_1059=l9_1065;
l9_1063=l9_1059;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1066=float2(0.0);
l9_1066=l9_1062.gScreenCoord;
l9_1060=l9_1066;
l9_1063=l9_1060;
}
else
{
float2 l9_1067=float2(0.0);
l9_1067=l9_1062.Surface_UVCoord0;
l9_1061=l9_1067;
l9_1063=l9_1061;
}
}
}
l9_1057=l9_1063;
float2 l9_1068=float2(0.0);
float2 l9_1069=(*sc_set0.UserUniforms).uv2Scale;
l9_1068=l9_1069;
float2 l9_1070=float2(0.0);
l9_1070=l9_1068;
float2 l9_1071=float2(0.0);
float2 l9_1072=(*sc_set0.UserUniforms).uv2Offset;
l9_1071=l9_1072;
float2 l9_1073=float2(0.0);
l9_1073=l9_1071;
float2 l9_1074=float2(0.0);
l9_1074=(l9_1057*l9_1070)+l9_1073;
l9_1035=l9_1074;
l9_1037=l9_1035;
}
l9_1033=l9_1037;
float l9_1075=0.0;
float l9_1076;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1076=1.001;
}
else
{
l9_1076=0.001;
}
l9_1076-=0.001;
l9_1075=l9_1076;
float l9_1077=0.0;
l9_1077=l9_1075;
float2 l9_1078=float2(0.0);
l9_1078=mix(l9_1032,l9_1033,float2(l9_1077));
float2 l9_1079=float2(0.0);
l9_1079=l9_1078;
float2 l9_1080=float2(0.0);
l9_1080=l9_1079;
l9_1025=l9_1080;
l9_1029=l9_1025;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_1081=float2(0.0);
l9_1081=l9_1028.Surface_UVCoord0;
float2 l9_1082=float2(0.0);
float2 l9_1083=float2(0.0);
float2 l9_1084=float2(0.0);
ssGlobals l9_1085=l9_1028;
float2 l9_1086;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_1087=float2(0.0);
float2 l9_1088=float2(0.0);
float2 l9_1089=float2(0.0);
float2 l9_1090=float2(0.0);
float2 l9_1091=float2(0.0);
float2 l9_1092=float2(0.0);
ssGlobals l9_1093=l9_1085;
float2 l9_1094;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1095=float2(0.0);
l9_1095=l9_1093.Surface_UVCoord0;
l9_1088=l9_1095;
l9_1094=l9_1088;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1096=float2(0.0);
l9_1096=l9_1093.Surface_UVCoord1;
l9_1089=l9_1096;
l9_1094=l9_1089;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1097=float2(0.0);
l9_1097=l9_1093.gScreenCoord;
l9_1090=l9_1097;
l9_1094=l9_1090;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1098=float2(0.0);
l9_1098=l9_1093.Surface_UVCoord0;
float2 l9_1099=float2(0.0);
float2 l9_1100=float2(0.0);
float2 l9_1101=float2(0.0);
ssGlobals l9_1102=l9_1093;
float2 l9_1103;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1104=float2(0.0);
float2 l9_1105=float2(0.0);
float2 l9_1106=float2(0.0);
float2 l9_1107=float2(0.0);
float2 l9_1108=float2(0.0);
ssGlobals l9_1109=l9_1102;
float2 l9_1110;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1111=float2(0.0);
l9_1111=l9_1109.Surface_UVCoord0;
l9_1105=l9_1111;
l9_1110=l9_1105;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1112=float2(0.0);
l9_1112=l9_1109.Surface_UVCoord1;
l9_1106=l9_1112;
l9_1110=l9_1106;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1113=float2(0.0);
l9_1113=l9_1109.gScreenCoord;
l9_1107=l9_1113;
l9_1110=l9_1107;
}
else
{
float2 l9_1114=float2(0.0);
l9_1114=l9_1109.Surface_UVCoord0;
l9_1108=l9_1114;
l9_1110=l9_1108;
}
}
}
l9_1104=l9_1110;
float2 l9_1115=float2(0.0);
float2 l9_1116=(*sc_set0.UserUniforms).uv2Scale;
l9_1115=l9_1116;
float2 l9_1117=float2(0.0);
l9_1117=l9_1115;
float2 l9_1118=float2(0.0);
float2 l9_1119=(*sc_set0.UserUniforms).uv2Offset;
l9_1118=l9_1119;
float2 l9_1120=float2(0.0);
l9_1120=l9_1118;
float2 l9_1121=float2(0.0);
l9_1121=(l9_1104*l9_1117)+l9_1120;
float2 l9_1122=float2(0.0);
l9_1122=l9_1121+(l9_1120*(l9_1102.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1100=l9_1122;
l9_1103=l9_1100;
}
else
{
float2 l9_1123=float2(0.0);
float2 l9_1124=float2(0.0);
float2 l9_1125=float2(0.0);
float2 l9_1126=float2(0.0);
float2 l9_1127=float2(0.0);
ssGlobals l9_1128=l9_1102;
float2 l9_1129;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1130=float2(0.0);
l9_1130=l9_1128.Surface_UVCoord0;
l9_1124=l9_1130;
l9_1129=l9_1124;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1131=float2(0.0);
l9_1131=l9_1128.Surface_UVCoord1;
l9_1125=l9_1131;
l9_1129=l9_1125;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1132=float2(0.0);
l9_1132=l9_1128.gScreenCoord;
l9_1126=l9_1132;
l9_1129=l9_1126;
}
else
{
float2 l9_1133=float2(0.0);
l9_1133=l9_1128.Surface_UVCoord0;
l9_1127=l9_1133;
l9_1129=l9_1127;
}
}
}
l9_1123=l9_1129;
float2 l9_1134=float2(0.0);
float2 l9_1135=(*sc_set0.UserUniforms).uv2Scale;
l9_1134=l9_1135;
float2 l9_1136=float2(0.0);
l9_1136=l9_1134;
float2 l9_1137=float2(0.0);
float2 l9_1138=(*sc_set0.UserUniforms).uv2Offset;
l9_1137=l9_1138;
float2 l9_1139=float2(0.0);
l9_1139=l9_1137;
float2 l9_1140=float2(0.0);
l9_1140=(l9_1123*l9_1136)+l9_1139;
l9_1101=l9_1140;
l9_1103=l9_1101;
}
l9_1099=l9_1103;
float l9_1141=0.0;
float l9_1142;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1142=1.001;
}
else
{
l9_1142=0.001;
}
l9_1142-=0.001;
l9_1141=l9_1142;
float l9_1143=0.0;
l9_1143=l9_1141;
float2 l9_1144=float2(0.0);
l9_1144=mix(l9_1098,l9_1099,float2(l9_1143));
float2 l9_1145=float2(0.0);
l9_1145=l9_1144;
float2 l9_1146=float2(0.0);
l9_1146=l9_1145;
l9_1091=l9_1146;
l9_1094=l9_1091;
}
else
{
float2 l9_1147=float2(0.0);
l9_1147=l9_1093.Surface_UVCoord0;
l9_1092=l9_1147;
l9_1094=l9_1092;
}
}
}
}
l9_1087=l9_1094;
float2 l9_1148=float2(0.0);
float2 l9_1149=(*sc_set0.UserUniforms).uv3Scale;
l9_1148=l9_1149;
float2 l9_1150=float2(0.0);
l9_1150=l9_1148;
float2 l9_1151=float2(0.0);
float2 l9_1152=(*sc_set0.UserUniforms).uv3Offset;
l9_1151=l9_1152;
float2 l9_1153=float2(0.0);
l9_1153=l9_1151;
float2 l9_1154=float2(0.0);
l9_1154=(l9_1087*l9_1150)+l9_1153;
float2 l9_1155=float2(0.0);
l9_1155=l9_1154+(l9_1153*(l9_1085.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1083=l9_1155;
l9_1086=l9_1083;
}
else
{
float2 l9_1156=float2(0.0);
float2 l9_1157=float2(0.0);
float2 l9_1158=float2(0.0);
float2 l9_1159=float2(0.0);
float2 l9_1160=float2(0.0);
float2 l9_1161=float2(0.0);
ssGlobals l9_1162=l9_1085;
float2 l9_1163;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1164=float2(0.0);
l9_1164=l9_1162.Surface_UVCoord0;
l9_1157=l9_1164;
l9_1163=l9_1157;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1165=float2(0.0);
l9_1165=l9_1162.Surface_UVCoord1;
l9_1158=l9_1165;
l9_1163=l9_1158;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1166=float2(0.0);
l9_1166=l9_1162.gScreenCoord;
l9_1159=l9_1166;
l9_1163=l9_1159;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1167=float2(0.0);
l9_1167=l9_1162.Surface_UVCoord0;
float2 l9_1168=float2(0.0);
float2 l9_1169=float2(0.0);
float2 l9_1170=float2(0.0);
ssGlobals l9_1171=l9_1162;
float2 l9_1172;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1173=float2(0.0);
float2 l9_1174=float2(0.0);
float2 l9_1175=float2(0.0);
float2 l9_1176=float2(0.0);
float2 l9_1177=float2(0.0);
ssGlobals l9_1178=l9_1171;
float2 l9_1179;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1180=float2(0.0);
l9_1180=l9_1178.Surface_UVCoord0;
l9_1174=l9_1180;
l9_1179=l9_1174;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1181=float2(0.0);
l9_1181=l9_1178.Surface_UVCoord1;
l9_1175=l9_1181;
l9_1179=l9_1175;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1182=float2(0.0);
l9_1182=l9_1178.gScreenCoord;
l9_1176=l9_1182;
l9_1179=l9_1176;
}
else
{
float2 l9_1183=float2(0.0);
l9_1183=l9_1178.Surface_UVCoord0;
l9_1177=l9_1183;
l9_1179=l9_1177;
}
}
}
l9_1173=l9_1179;
float2 l9_1184=float2(0.0);
float2 l9_1185=(*sc_set0.UserUniforms).uv2Scale;
l9_1184=l9_1185;
float2 l9_1186=float2(0.0);
l9_1186=l9_1184;
float2 l9_1187=float2(0.0);
float2 l9_1188=(*sc_set0.UserUniforms).uv2Offset;
l9_1187=l9_1188;
float2 l9_1189=float2(0.0);
l9_1189=l9_1187;
float2 l9_1190=float2(0.0);
l9_1190=(l9_1173*l9_1186)+l9_1189;
float2 l9_1191=float2(0.0);
l9_1191=l9_1190+(l9_1189*(l9_1171.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1169=l9_1191;
l9_1172=l9_1169;
}
else
{
float2 l9_1192=float2(0.0);
float2 l9_1193=float2(0.0);
float2 l9_1194=float2(0.0);
float2 l9_1195=float2(0.0);
float2 l9_1196=float2(0.0);
ssGlobals l9_1197=l9_1171;
float2 l9_1198;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1199=float2(0.0);
l9_1199=l9_1197.Surface_UVCoord0;
l9_1193=l9_1199;
l9_1198=l9_1193;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1200=float2(0.0);
l9_1200=l9_1197.Surface_UVCoord1;
l9_1194=l9_1200;
l9_1198=l9_1194;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1201=float2(0.0);
l9_1201=l9_1197.gScreenCoord;
l9_1195=l9_1201;
l9_1198=l9_1195;
}
else
{
float2 l9_1202=float2(0.0);
l9_1202=l9_1197.Surface_UVCoord0;
l9_1196=l9_1202;
l9_1198=l9_1196;
}
}
}
l9_1192=l9_1198;
float2 l9_1203=float2(0.0);
float2 l9_1204=(*sc_set0.UserUniforms).uv2Scale;
l9_1203=l9_1204;
float2 l9_1205=float2(0.0);
l9_1205=l9_1203;
float2 l9_1206=float2(0.0);
float2 l9_1207=(*sc_set0.UserUniforms).uv2Offset;
l9_1206=l9_1207;
float2 l9_1208=float2(0.0);
l9_1208=l9_1206;
float2 l9_1209=float2(0.0);
l9_1209=(l9_1192*l9_1205)+l9_1208;
l9_1170=l9_1209;
l9_1172=l9_1170;
}
l9_1168=l9_1172;
float l9_1210=0.0;
float l9_1211;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1211=1.001;
}
else
{
l9_1211=0.001;
}
l9_1211-=0.001;
l9_1210=l9_1211;
float l9_1212=0.0;
l9_1212=l9_1210;
float2 l9_1213=float2(0.0);
l9_1213=mix(l9_1167,l9_1168,float2(l9_1212));
float2 l9_1214=float2(0.0);
l9_1214=l9_1213;
float2 l9_1215=float2(0.0);
l9_1215=l9_1214;
l9_1160=l9_1215;
l9_1163=l9_1160;
}
else
{
float2 l9_1216=float2(0.0);
l9_1216=l9_1162.Surface_UVCoord0;
l9_1161=l9_1216;
l9_1163=l9_1161;
}
}
}
}
l9_1156=l9_1163;
float2 l9_1217=float2(0.0);
float2 l9_1218=(*sc_set0.UserUniforms).uv3Scale;
l9_1217=l9_1218;
float2 l9_1219=float2(0.0);
l9_1219=l9_1217;
float2 l9_1220=float2(0.0);
float2 l9_1221=(*sc_set0.UserUniforms).uv3Offset;
l9_1220=l9_1221;
float2 l9_1222=float2(0.0);
l9_1222=l9_1220;
float2 l9_1223=float2(0.0);
l9_1223=(l9_1156*l9_1219)+l9_1222;
l9_1084=l9_1223;
l9_1086=l9_1084;
}
l9_1082=l9_1086;
float l9_1224=0.0;
float l9_1225;
if ((int(Tweak_N11_tmp)!=0))
{
l9_1225=1.001;
}
else
{
l9_1225=0.001;
}
l9_1225-=0.001;
l9_1224=l9_1225;
float l9_1226=0.0;
l9_1226=l9_1224;
float2 l9_1227=float2(0.0);
l9_1227=mix(l9_1081,l9_1082,float2(l9_1226));
float2 l9_1228=float2(0.0);
l9_1228=l9_1227;
float2 l9_1229=float2(0.0);
l9_1229=l9_1228;
l9_1026=l9_1229;
l9_1029=l9_1026;
}
else
{
float2 l9_1230=float2(0.0);
l9_1230=l9_1028.Surface_UVCoord0;
l9_1027=l9_1230;
l9_1029=l9_1027;
}
}
}
}
l9_1022=l9_1029;
float4 l9_1231=float4(0.0);
int l9_1232=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1233=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1233=0;
}
else
{
l9_1233=in.varStereoViewID;
}
int l9_1234=l9_1233;
l9_1232=1-l9_1234;
}
else
{
int l9_1235=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1235=0;
}
else
{
l9_1235=in.varStereoViewID;
}
int l9_1236=l9_1235;
l9_1232=l9_1236;
}
int l9_1237=l9_1232;
int l9_1238=baseTexLayout_tmp;
int l9_1239=l9_1237;
float2 l9_1240=l9_1022;
bool l9_1241=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1242=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_1243=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1244=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1245=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_1246=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1247=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_1248=0.0;
bool l9_1249=l9_1246&&(!l9_1244);
float l9_1250=1.0;
float l9_1251=l9_1240.x;
int l9_1252=l9_1243.x;
if (l9_1252==1)
{
l9_1251=fract(l9_1251);
}
else
{
if (l9_1252==2)
{
float l9_1253=fract(l9_1251);
float l9_1254=l9_1251-l9_1253;
float l9_1255=step(0.25,fract(l9_1254*0.5));
l9_1251=mix(l9_1253,1.0-l9_1253,fast::clamp(l9_1255,0.0,1.0));
}
}
l9_1240.x=l9_1251;
float l9_1256=l9_1240.y;
int l9_1257=l9_1243.y;
if (l9_1257==1)
{
l9_1256=fract(l9_1256);
}
else
{
if (l9_1257==2)
{
float l9_1258=fract(l9_1256);
float l9_1259=l9_1256-l9_1258;
float l9_1260=step(0.25,fract(l9_1259*0.5));
l9_1256=mix(l9_1258,1.0-l9_1258,fast::clamp(l9_1260,0.0,1.0));
}
}
l9_1240.y=l9_1256;
if (l9_1244)
{
bool l9_1261=l9_1246;
bool l9_1262;
if (l9_1261)
{
l9_1262=l9_1243.x==3;
}
else
{
l9_1262=l9_1261;
}
float l9_1263=l9_1240.x;
float l9_1264=l9_1245.x;
float l9_1265=l9_1245.z;
bool l9_1266=l9_1262;
float l9_1267=l9_1250;
float l9_1268=fast::clamp(l9_1263,l9_1264,l9_1265);
float l9_1269=step(abs(l9_1263-l9_1268),9.9999997e-06);
l9_1267*=(l9_1269+((1.0-float(l9_1266))*(1.0-l9_1269)));
l9_1263=l9_1268;
l9_1240.x=l9_1263;
l9_1250=l9_1267;
bool l9_1270=l9_1246;
bool l9_1271;
if (l9_1270)
{
l9_1271=l9_1243.y==3;
}
else
{
l9_1271=l9_1270;
}
float l9_1272=l9_1240.y;
float l9_1273=l9_1245.y;
float l9_1274=l9_1245.w;
bool l9_1275=l9_1271;
float l9_1276=l9_1250;
float l9_1277=fast::clamp(l9_1272,l9_1273,l9_1274);
float l9_1278=step(abs(l9_1272-l9_1277),9.9999997e-06);
l9_1276*=(l9_1278+((1.0-float(l9_1275))*(1.0-l9_1278)));
l9_1272=l9_1277;
l9_1240.y=l9_1272;
l9_1250=l9_1276;
}
float2 l9_1279=l9_1240;
bool l9_1280=l9_1241;
float3x3 l9_1281=l9_1242;
if (l9_1280)
{
l9_1279=float2((l9_1281*float3(l9_1279,1.0)).xy);
}
float2 l9_1282=l9_1279;
float2 l9_1283=l9_1282;
float2 l9_1284=l9_1283;
l9_1240=l9_1284;
float l9_1285=l9_1240.x;
int l9_1286=l9_1243.x;
bool l9_1287=l9_1249;
float l9_1288=l9_1250;
if ((l9_1286==0)||(l9_1286==3))
{
float l9_1289=l9_1285;
float l9_1290=0.0;
float l9_1291=1.0;
bool l9_1292=l9_1287;
float l9_1293=l9_1288;
float l9_1294=fast::clamp(l9_1289,l9_1290,l9_1291);
float l9_1295=step(abs(l9_1289-l9_1294),9.9999997e-06);
l9_1293*=(l9_1295+((1.0-float(l9_1292))*(1.0-l9_1295)));
l9_1289=l9_1294;
l9_1285=l9_1289;
l9_1288=l9_1293;
}
l9_1240.x=l9_1285;
l9_1250=l9_1288;
float l9_1296=l9_1240.y;
int l9_1297=l9_1243.y;
bool l9_1298=l9_1249;
float l9_1299=l9_1250;
if ((l9_1297==0)||(l9_1297==3))
{
float l9_1300=l9_1296;
float l9_1301=0.0;
float l9_1302=1.0;
bool l9_1303=l9_1298;
float l9_1304=l9_1299;
float l9_1305=fast::clamp(l9_1300,l9_1301,l9_1302);
float l9_1306=step(abs(l9_1300-l9_1305),9.9999997e-06);
l9_1304*=(l9_1306+((1.0-float(l9_1303))*(1.0-l9_1306)));
l9_1300=l9_1305;
l9_1296=l9_1300;
l9_1299=l9_1304;
}
l9_1240.y=l9_1296;
l9_1250=l9_1299;
float2 l9_1307=l9_1240;
int l9_1308=l9_1238;
int l9_1309=l9_1239;
float l9_1310=l9_1248;
float2 l9_1311=l9_1307;
int l9_1312=l9_1308;
int l9_1313=l9_1309;
float3 l9_1314=float3(0.0);
if (l9_1312==0)
{
l9_1314=float3(l9_1311,0.0);
}
else
{
if (l9_1312==1)
{
l9_1314=float3(l9_1311.x,(l9_1311.y*0.5)+(0.5-(float(l9_1313)*0.5)),0.0);
}
else
{
l9_1314=float3(l9_1311,float(l9_1313));
}
}
float3 l9_1315=l9_1314;
float3 l9_1316=l9_1315;
float2 l9_1317=l9_1316.xy;
float l9_1318=l9_1310;
float4 l9_1319=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_1317,bias(l9_1318));
float4 l9_1320=l9_1319;
float4 l9_1321=l9_1320;
if (l9_1246)
{
l9_1321=mix(l9_1247,l9_1321,float4(l9_1250));
}
float4 l9_1322=l9_1321;
l9_1231=l9_1322;
l9_1018=l9_1231;
l9_1021=l9_1018;
}
else
{
l9_1021=l9_1019;
}
l9_1017=l9_1021;
float4 l9_1323=float4(0.0);
l9_1323=l9_1016*l9_1017;
float4 l9_1324=float4(0.0);
l9_1324=l9_1323;
float4 l9_1325=float4(0.0);
l9_1325=l9_1324;
l9_679=l9_1325.xyz;
l9_681=l9_679;
}
l9_677=l9_681;
float3 l9_1326=float3(0.0);
l9_1326=l9_677;
float3 l9_1327=float3(0.0);
l9_1327=l9_1326;
float4 l9_1328=float4(0.0);
l9_1328=float4(l9_1327.x,l9_1327.y,l9_1327.z,l9_1328.w);
l9_1328.w=(*sc_set0.UserUniforms).Port_Value2_N073;
param_1=l9_1328;
param_2=param_1;
}
Result_N363=param_2;
float4 Export_N364=float4(0.0);
Export_N364=Result_N363;
float2 UVCoord_N1=float2(0.0);
UVCoord_N1=Globals.Surface_UVCoord0;
float Output_N78=0.0;
Output_N78=UVCoord_N1.y;
float Output_N79=0.0;
float param_4=(*sc_set0.UserUniforms).progress_value;
Output_N79=param_4;
float Output_N97=0.0;
Output_N97=step(Output_N78,Output_N79);
float4 Output_N104=float4(0.0);
Output_N104=Export_N364*float4(Output_N97);
float Output_N2=0.0;
Output_N2=Output_N104.w;
float3 Result_N337=float3(0.0);
float3 param_5=float3(0.0);
float3 param_6=float3(0.0);
ssGlobals param_8=Globals;
float3 param_7;
if ((int(Tweak_N354_tmp)!=0))
{
float3 l9_1329=float3(0.0);
l9_1329=param_8.VertexTangent_WorldSpace;
float3 l9_1330=float3(0.0);
l9_1330=param_8.VertexBinormal_WorldSpace;
float3 l9_1331=float3(0.0);
l9_1331=param_8.VertexNormal_WorldSpace;
float3x3 l9_1332=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_1332=float3x3(float3(l9_1329),float3(l9_1330),float3(l9_1331));
float2 l9_1333=float2(0.0);
float2 l9_1334=float2(0.0);
float2 l9_1335=float2(0.0);
float2 l9_1336=float2(0.0);
float2 l9_1337=float2(0.0);
float2 l9_1338=float2(0.0);
ssGlobals l9_1339=param_8;
float2 l9_1340;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_1341=float2(0.0);
l9_1341=l9_1339.Surface_UVCoord0;
l9_1334=l9_1341;
l9_1340=l9_1334;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_1342=float2(0.0);
l9_1342=l9_1339.Surface_UVCoord1;
l9_1335=l9_1342;
l9_1340=l9_1335;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_1343=float2(0.0);
l9_1343=l9_1339.Surface_UVCoord0;
float2 l9_1344=float2(0.0);
float2 l9_1345=float2(0.0);
float2 l9_1346=float2(0.0);
ssGlobals l9_1347=l9_1339;
float2 l9_1348;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1349=float2(0.0);
float2 l9_1350=float2(0.0);
float2 l9_1351=float2(0.0);
float2 l9_1352=float2(0.0);
float2 l9_1353=float2(0.0);
ssGlobals l9_1354=l9_1347;
float2 l9_1355;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1356=float2(0.0);
l9_1356=l9_1354.Surface_UVCoord0;
l9_1350=l9_1356;
l9_1355=l9_1350;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1357=float2(0.0);
l9_1357=l9_1354.Surface_UVCoord1;
l9_1351=l9_1357;
l9_1355=l9_1351;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1358=float2(0.0);
l9_1358=l9_1354.gScreenCoord;
l9_1352=l9_1358;
l9_1355=l9_1352;
}
else
{
float2 l9_1359=float2(0.0);
l9_1359=l9_1354.Surface_UVCoord0;
l9_1353=l9_1359;
l9_1355=l9_1353;
}
}
}
l9_1349=l9_1355;
float2 l9_1360=float2(0.0);
float2 l9_1361=(*sc_set0.UserUniforms).uv2Scale;
l9_1360=l9_1361;
float2 l9_1362=float2(0.0);
l9_1362=l9_1360;
float2 l9_1363=float2(0.0);
float2 l9_1364=(*sc_set0.UserUniforms).uv2Offset;
l9_1363=l9_1364;
float2 l9_1365=float2(0.0);
l9_1365=l9_1363;
float2 l9_1366=float2(0.0);
l9_1366=(l9_1349*l9_1362)+l9_1365;
float2 l9_1367=float2(0.0);
l9_1367=l9_1366+(l9_1365*(l9_1347.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1345=l9_1367;
l9_1348=l9_1345;
}
else
{
float2 l9_1368=float2(0.0);
float2 l9_1369=float2(0.0);
float2 l9_1370=float2(0.0);
float2 l9_1371=float2(0.0);
float2 l9_1372=float2(0.0);
ssGlobals l9_1373=l9_1347;
float2 l9_1374;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1375=float2(0.0);
l9_1375=l9_1373.Surface_UVCoord0;
l9_1369=l9_1375;
l9_1374=l9_1369;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1376=float2(0.0);
l9_1376=l9_1373.Surface_UVCoord1;
l9_1370=l9_1376;
l9_1374=l9_1370;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1377=float2(0.0);
l9_1377=l9_1373.gScreenCoord;
l9_1371=l9_1377;
l9_1374=l9_1371;
}
else
{
float2 l9_1378=float2(0.0);
l9_1378=l9_1373.Surface_UVCoord0;
l9_1372=l9_1378;
l9_1374=l9_1372;
}
}
}
l9_1368=l9_1374;
float2 l9_1379=float2(0.0);
float2 l9_1380=(*sc_set0.UserUniforms).uv2Scale;
l9_1379=l9_1380;
float2 l9_1381=float2(0.0);
l9_1381=l9_1379;
float2 l9_1382=float2(0.0);
float2 l9_1383=(*sc_set0.UserUniforms).uv2Offset;
l9_1382=l9_1383;
float2 l9_1384=float2(0.0);
l9_1384=l9_1382;
float2 l9_1385=float2(0.0);
l9_1385=(l9_1368*l9_1381)+l9_1384;
l9_1346=l9_1385;
l9_1348=l9_1346;
}
l9_1344=l9_1348;
float l9_1386=0.0;
float l9_1387;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1387=1.001;
}
else
{
l9_1387=0.001;
}
l9_1387-=0.001;
l9_1386=l9_1387;
float l9_1388=0.0;
l9_1388=l9_1386;
float2 l9_1389=float2(0.0);
l9_1389=mix(l9_1343,l9_1344,float2(l9_1388));
float2 l9_1390=float2(0.0);
l9_1390=l9_1389;
float2 l9_1391=float2(0.0);
l9_1391=l9_1390;
l9_1336=l9_1391;
l9_1340=l9_1336;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_1392=float2(0.0);
l9_1392=l9_1339.Surface_UVCoord0;
float2 l9_1393=float2(0.0);
float2 l9_1394=float2(0.0);
float2 l9_1395=float2(0.0);
ssGlobals l9_1396=l9_1339;
float2 l9_1397;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_1398=float2(0.0);
float2 l9_1399=float2(0.0);
float2 l9_1400=float2(0.0);
float2 l9_1401=float2(0.0);
float2 l9_1402=float2(0.0);
float2 l9_1403=float2(0.0);
ssGlobals l9_1404=l9_1396;
float2 l9_1405;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1406=float2(0.0);
l9_1406=l9_1404.Surface_UVCoord0;
l9_1399=l9_1406;
l9_1405=l9_1399;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1407=float2(0.0);
l9_1407=l9_1404.Surface_UVCoord1;
l9_1400=l9_1407;
l9_1405=l9_1400;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1408=float2(0.0);
l9_1408=l9_1404.gScreenCoord;
l9_1401=l9_1408;
l9_1405=l9_1401;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1409=float2(0.0);
l9_1409=l9_1404.Surface_UVCoord0;
float2 l9_1410=float2(0.0);
float2 l9_1411=float2(0.0);
float2 l9_1412=float2(0.0);
ssGlobals l9_1413=l9_1404;
float2 l9_1414;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1415=float2(0.0);
float2 l9_1416=float2(0.0);
float2 l9_1417=float2(0.0);
float2 l9_1418=float2(0.0);
float2 l9_1419=float2(0.0);
ssGlobals l9_1420=l9_1413;
float2 l9_1421;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1422=float2(0.0);
l9_1422=l9_1420.Surface_UVCoord0;
l9_1416=l9_1422;
l9_1421=l9_1416;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1423=float2(0.0);
l9_1423=l9_1420.Surface_UVCoord1;
l9_1417=l9_1423;
l9_1421=l9_1417;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1424=float2(0.0);
l9_1424=l9_1420.gScreenCoord;
l9_1418=l9_1424;
l9_1421=l9_1418;
}
else
{
float2 l9_1425=float2(0.0);
l9_1425=l9_1420.Surface_UVCoord0;
l9_1419=l9_1425;
l9_1421=l9_1419;
}
}
}
l9_1415=l9_1421;
float2 l9_1426=float2(0.0);
float2 l9_1427=(*sc_set0.UserUniforms).uv2Scale;
l9_1426=l9_1427;
float2 l9_1428=float2(0.0);
l9_1428=l9_1426;
float2 l9_1429=float2(0.0);
float2 l9_1430=(*sc_set0.UserUniforms).uv2Offset;
l9_1429=l9_1430;
float2 l9_1431=float2(0.0);
l9_1431=l9_1429;
float2 l9_1432=float2(0.0);
l9_1432=(l9_1415*l9_1428)+l9_1431;
float2 l9_1433=float2(0.0);
l9_1433=l9_1432+(l9_1431*(l9_1413.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1411=l9_1433;
l9_1414=l9_1411;
}
else
{
float2 l9_1434=float2(0.0);
float2 l9_1435=float2(0.0);
float2 l9_1436=float2(0.0);
float2 l9_1437=float2(0.0);
float2 l9_1438=float2(0.0);
ssGlobals l9_1439=l9_1413;
float2 l9_1440;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1441=float2(0.0);
l9_1441=l9_1439.Surface_UVCoord0;
l9_1435=l9_1441;
l9_1440=l9_1435;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1442=float2(0.0);
l9_1442=l9_1439.Surface_UVCoord1;
l9_1436=l9_1442;
l9_1440=l9_1436;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1443=float2(0.0);
l9_1443=l9_1439.gScreenCoord;
l9_1437=l9_1443;
l9_1440=l9_1437;
}
else
{
float2 l9_1444=float2(0.0);
l9_1444=l9_1439.Surface_UVCoord0;
l9_1438=l9_1444;
l9_1440=l9_1438;
}
}
}
l9_1434=l9_1440;
float2 l9_1445=float2(0.0);
float2 l9_1446=(*sc_set0.UserUniforms).uv2Scale;
l9_1445=l9_1446;
float2 l9_1447=float2(0.0);
l9_1447=l9_1445;
float2 l9_1448=float2(0.0);
float2 l9_1449=(*sc_set0.UserUniforms).uv2Offset;
l9_1448=l9_1449;
float2 l9_1450=float2(0.0);
l9_1450=l9_1448;
float2 l9_1451=float2(0.0);
l9_1451=(l9_1434*l9_1447)+l9_1450;
l9_1412=l9_1451;
l9_1414=l9_1412;
}
l9_1410=l9_1414;
float l9_1452=0.0;
float l9_1453;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1453=1.001;
}
else
{
l9_1453=0.001;
}
l9_1453-=0.001;
l9_1452=l9_1453;
float l9_1454=0.0;
l9_1454=l9_1452;
float2 l9_1455=float2(0.0);
l9_1455=mix(l9_1409,l9_1410,float2(l9_1454));
float2 l9_1456=float2(0.0);
l9_1456=l9_1455;
float2 l9_1457=float2(0.0);
l9_1457=l9_1456;
l9_1402=l9_1457;
l9_1405=l9_1402;
}
else
{
float2 l9_1458=float2(0.0);
l9_1458=l9_1404.Surface_UVCoord0;
l9_1403=l9_1458;
l9_1405=l9_1403;
}
}
}
}
l9_1398=l9_1405;
float2 l9_1459=float2(0.0);
float2 l9_1460=(*sc_set0.UserUniforms).uv3Scale;
l9_1459=l9_1460;
float2 l9_1461=float2(0.0);
l9_1461=l9_1459;
float2 l9_1462=float2(0.0);
float2 l9_1463=(*sc_set0.UserUniforms).uv3Offset;
l9_1462=l9_1463;
float2 l9_1464=float2(0.0);
l9_1464=l9_1462;
float2 l9_1465=float2(0.0);
l9_1465=(l9_1398*l9_1461)+l9_1464;
float2 l9_1466=float2(0.0);
l9_1466=l9_1465+(l9_1464*(l9_1396.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1394=l9_1466;
l9_1397=l9_1394;
}
else
{
float2 l9_1467=float2(0.0);
float2 l9_1468=float2(0.0);
float2 l9_1469=float2(0.0);
float2 l9_1470=float2(0.0);
float2 l9_1471=float2(0.0);
float2 l9_1472=float2(0.0);
ssGlobals l9_1473=l9_1396;
float2 l9_1474;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1475=float2(0.0);
l9_1475=l9_1473.Surface_UVCoord0;
l9_1468=l9_1475;
l9_1474=l9_1468;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1476=float2(0.0);
l9_1476=l9_1473.Surface_UVCoord1;
l9_1469=l9_1476;
l9_1474=l9_1469;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1477=float2(0.0);
l9_1477=l9_1473.gScreenCoord;
l9_1470=l9_1477;
l9_1474=l9_1470;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1478=float2(0.0);
l9_1478=l9_1473.Surface_UVCoord0;
float2 l9_1479=float2(0.0);
float2 l9_1480=float2(0.0);
float2 l9_1481=float2(0.0);
ssGlobals l9_1482=l9_1473;
float2 l9_1483;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1484=float2(0.0);
float2 l9_1485=float2(0.0);
float2 l9_1486=float2(0.0);
float2 l9_1487=float2(0.0);
float2 l9_1488=float2(0.0);
ssGlobals l9_1489=l9_1482;
float2 l9_1490;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1491=float2(0.0);
l9_1491=l9_1489.Surface_UVCoord0;
l9_1485=l9_1491;
l9_1490=l9_1485;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1492=float2(0.0);
l9_1492=l9_1489.Surface_UVCoord1;
l9_1486=l9_1492;
l9_1490=l9_1486;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1493=float2(0.0);
l9_1493=l9_1489.gScreenCoord;
l9_1487=l9_1493;
l9_1490=l9_1487;
}
else
{
float2 l9_1494=float2(0.0);
l9_1494=l9_1489.Surface_UVCoord0;
l9_1488=l9_1494;
l9_1490=l9_1488;
}
}
}
l9_1484=l9_1490;
float2 l9_1495=float2(0.0);
float2 l9_1496=(*sc_set0.UserUniforms).uv2Scale;
l9_1495=l9_1496;
float2 l9_1497=float2(0.0);
l9_1497=l9_1495;
float2 l9_1498=float2(0.0);
float2 l9_1499=(*sc_set0.UserUniforms).uv2Offset;
l9_1498=l9_1499;
float2 l9_1500=float2(0.0);
l9_1500=l9_1498;
float2 l9_1501=float2(0.0);
l9_1501=(l9_1484*l9_1497)+l9_1500;
float2 l9_1502=float2(0.0);
l9_1502=l9_1501+(l9_1500*(l9_1482.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1480=l9_1502;
l9_1483=l9_1480;
}
else
{
float2 l9_1503=float2(0.0);
float2 l9_1504=float2(0.0);
float2 l9_1505=float2(0.0);
float2 l9_1506=float2(0.0);
float2 l9_1507=float2(0.0);
ssGlobals l9_1508=l9_1482;
float2 l9_1509;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1510=float2(0.0);
l9_1510=l9_1508.Surface_UVCoord0;
l9_1504=l9_1510;
l9_1509=l9_1504;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1511=float2(0.0);
l9_1511=l9_1508.Surface_UVCoord1;
l9_1505=l9_1511;
l9_1509=l9_1505;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1512=float2(0.0);
l9_1512=l9_1508.gScreenCoord;
l9_1506=l9_1512;
l9_1509=l9_1506;
}
else
{
float2 l9_1513=float2(0.0);
l9_1513=l9_1508.Surface_UVCoord0;
l9_1507=l9_1513;
l9_1509=l9_1507;
}
}
}
l9_1503=l9_1509;
float2 l9_1514=float2(0.0);
float2 l9_1515=(*sc_set0.UserUniforms).uv2Scale;
l9_1514=l9_1515;
float2 l9_1516=float2(0.0);
l9_1516=l9_1514;
float2 l9_1517=float2(0.0);
float2 l9_1518=(*sc_set0.UserUniforms).uv2Offset;
l9_1517=l9_1518;
float2 l9_1519=float2(0.0);
l9_1519=l9_1517;
float2 l9_1520=float2(0.0);
l9_1520=(l9_1503*l9_1516)+l9_1519;
l9_1481=l9_1520;
l9_1483=l9_1481;
}
l9_1479=l9_1483;
float l9_1521=0.0;
float l9_1522;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1522=1.001;
}
else
{
l9_1522=0.001;
}
l9_1522-=0.001;
l9_1521=l9_1522;
float l9_1523=0.0;
l9_1523=l9_1521;
float2 l9_1524=float2(0.0);
l9_1524=mix(l9_1478,l9_1479,float2(l9_1523));
float2 l9_1525=float2(0.0);
l9_1525=l9_1524;
float2 l9_1526=float2(0.0);
l9_1526=l9_1525;
l9_1471=l9_1526;
l9_1474=l9_1471;
}
else
{
float2 l9_1527=float2(0.0);
l9_1527=l9_1473.Surface_UVCoord0;
l9_1472=l9_1527;
l9_1474=l9_1472;
}
}
}
}
l9_1467=l9_1474;
float2 l9_1528=float2(0.0);
float2 l9_1529=(*sc_set0.UserUniforms).uv3Scale;
l9_1528=l9_1529;
float2 l9_1530=float2(0.0);
l9_1530=l9_1528;
float2 l9_1531=float2(0.0);
float2 l9_1532=(*sc_set0.UserUniforms).uv3Offset;
l9_1531=l9_1532;
float2 l9_1533=float2(0.0);
l9_1533=l9_1531;
float2 l9_1534=float2(0.0);
l9_1534=(l9_1467*l9_1530)+l9_1533;
l9_1395=l9_1534;
l9_1397=l9_1395;
}
l9_1393=l9_1397;
float l9_1535=0.0;
float l9_1536;
if ((int(Tweak_N11_tmp)!=0))
{
l9_1536=1.001;
}
else
{
l9_1536=0.001;
}
l9_1536-=0.001;
l9_1535=l9_1536;
float l9_1537=0.0;
l9_1537=l9_1535;
float2 l9_1538=float2(0.0);
l9_1538=mix(l9_1392,l9_1393,float2(l9_1537));
float2 l9_1539=float2(0.0);
l9_1539=l9_1538;
float2 l9_1540=float2(0.0);
l9_1540=l9_1539;
l9_1337=l9_1540;
l9_1340=l9_1337;
}
else
{
float2 l9_1541=float2(0.0);
l9_1541=l9_1339.Surface_UVCoord0;
l9_1338=l9_1541;
l9_1340=l9_1338;
}
}
}
}
l9_1333=l9_1340;
float4 l9_1542=float4(0.0);
float2 l9_1543=l9_1333;
int l9_1544=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_1545=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1545=0;
}
else
{
l9_1545=in.varStereoViewID;
}
int l9_1546=l9_1545;
l9_1544=1-l9_1546;
}
else
{
int l9_1547=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1547=0;
}
else
{
l9_1547=in.varStereoViewID;
}
int l9_1548=l9_1547;
l9_1544=l9_1548;
}
int l9_1549=l9_1544;
int l9_1550=normalTexLayout_tmp;
int l9_1551=l9_1549;
float2 l9_1552=l9_1543;
bool l9_1553=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_1554=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_1555=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_1556=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_1557=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_1558=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_1559=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_1560=0.0;
bool l9_1561=l9_1558&&(!l9_1556);
float l9_1562=1.0;
float l9_1563=l9_1552.x;
int l9_1564=l9_1555.x;
if (l9_1564==1)
{
l9_1563=fract(l9_1563);
}
else
{
if (l9_1564==2)
{
float l9_1565=fract(l9_1563);
float l9_1566=l9_1563-l9_1565;
float l9_1567=step(0.25,fract(l9_1566*0.5));
l9_1563=mix(l9_1565,1.0-l9_1565,fast::clamp(l9_1567,0.0,1.0));
}
}
l9_1552.x=l9_1563;
float l9_1568=l9_1552.y;
int l9_1569=l9_1555.y;
if (l9_1569==1)
{
l9_1568=fract(l9_1568);
}
else
{
if (l9_1569==2)
{
float l9_1570=fract(l9_1568);
float l9_1571=l9_1568-l9_1570;
float l9_1572=step(0.25,fract(l9_1571*0.5));
l9_1568=mix(l9_1570,1.0-l9_1570,fast::clamp(l9_1572,0.0,1.0));
}
}
l9_1552.y=l9_1568;
if (l9_1556)
{
bool l9_1573=l9_1558;
bool l9_1574;
if (l9_1573)
{
l9_1574=l9_1555.x==3;
}
else
{
l9_1574=l9_1573;
}
float l9_1575=l9_1552.x;
float l9_1576=l9_1557.x;
float l9_1577=l9_1557.z;
bool l9_1578=l9_1574;
float l9_1579=l9_1562;
float l9_1580=fast::clamp(l9_1575,l9_1576,l9_1577);
float l9_1581=step(abs(l9_1575-l9_1580),9.9999997e-06);
l9_1579*=(l9_1581+((1.0-float(l9_1578))*(1.0-l9_1581)));
l9_1575=l9_1580;
l9_1552.x=l9_1575;
l9_1562=l9_1579;
bool l9_1582=l9_1558;
bool l9_1583;
if (l9_1582)
{
l9_1583=l9_1555.y==3;
}
else
{
l9_1583=l9_1582;
}
float l9_1584=l9_1552.y;
float l9_1585=l9_1557.y;
float l9_1586=l9_1557.w;
bool l9_1587=l9_1583;
float l9_1588=l9_1562;
float l9_1589=fast::clamp(l9_1584,l9_1585,l9_1586);
float l9_1590=step(abs(l9_1584-l9_1589),9.9999997e-06);
l9_1588*=(l9_1590+((1.0-float(l9_1587))*(1.0-l9_1590)));
l9_1584=l9_1589;
l9_1552.y=l9_1584;
l9_1562=l9_1588;
}
float2 l9_1591=l9_1552;
bool l9_1592=l9_1553;
float3x3 l9_1593=l9_1554;
if (l9_1592)
{
l9_1591=float2((l9_1593*float3(l9_1591,1.0)).xy);
}
float2 l9_1594=l9_1591;
float2 l9_1595=l9_1594;
float2 l9_1596=l9_1595;
l9_1552=l9_1596;
float l9_1597=l9_1552.x;
int l9_1598=l9_1555.x;
bool l9_1599=l9_1561;
float l9_1600=l9_1562;
if ((l9_1598==0)||(l9_1598==3))
{
float l9_1601=l9_1597;
float l9_1602=0.0;
float l9_1603=1.0;
bool l9_1604=l9_1599;
float l9_1605=l9_1600;
float l9_1606=fast::clamp(l9_1601,l9_1602,l9_1603);
float l9_1607=step(abs(l9_1601-l9_1606),9.9999997e-06);
l9_1605*=(l9_1607+((1.0-float(l9_1604))*(1.0-l9_1607)));
l9_1601=l9_1606;
l9_1597=l9_1601;
l9_1600=l9_1605;
}
l9_1552.x=l9_1597;
l9_1562=l9_1600;
float l9_1608=l9_1552.y;
int l9_1609=l9_1555.y;
bool l9_1610=l9_1561;
float l9_1611=l9_1562;
if ((l9_1609==0)||(l9_1609==3))
{
float l9_1612=l9_1608;
float l9_1613=0.0;
float l9_1614=1.0;
bool l9_1615=l9_1610;
float l9_1616=l9_1611;
float l9_1617=fast::clamp(l9_1612,l9_1613,l9_1614);
float l9_1618=step(abs(l9_1612-l9_1617),9.9999997e-06);
l9_1616*=(l9_1618+((1.0-float(l9_1615))*(1.0-l9_1618)));
l9_1612=l9_1617;
l9_1608=l9_1612;
l9_1611=l9_1616;
}
l9_1552.y=l9_1608;
l9_1562=l9_1611;
float2 l9_1619=l9_1552;
int l9_1620=l9_1550;
int l9_1621=l9_1551;
float l9_1622=l9_1560;
float2 l9_1623=l9_1619;
int l9_1624=l9_1620;
int l9_1625=l9_1621;
float3 l9_1626=float3(0.0);
if (l9_1624==0)
{
l9_1626=float3(l9_1623,0.0);
}
else
{
if (l9_1624==1)
{
l9_1626=float3(l9_1623.x,(l9_1623.y*0.5)+(0.5-(float(l9_1625)*0.5)),0.0);
}
else
{
l9_1626=float3(l9_1623,float(l9_1625));
}
}
float3 l9_1627=l9_1626;
float3 l9_1628=l9_1627;
float2 l9_1629=l9_1628.xy;
float l9_1630=l9_1622;
float4 l9_1631=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_1629,bias(l9_1630));
float4 l9_1632=l9_1631;
float4 l9_1633=l9_1632;
if (l9_1558)
{
l9_1633=mix(l9_1559,l9_1633,float4(l9_1562));
}
float4 l9_1634=l9_1633;
float4 l9_1635=l9_1634;
float3 l9_1636=(l9_1635.xyz*1.9921875)-float3(1.0);
l9_1635=float4(l9_1636.x,l9_1636.y,l9_1636.z,l9_1635.w);
l9_1542=l9_1635;
float3 l9_1637=float3(0.0);
float3 l9_1638=float3(0.0);
float3 l9_1639=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_1640=param_8;
float3 l9_1641;
if ((int(Tweak_N218_tmp)!=0))
{
float2 l9_1642=float2(0.0);
float2 l9_1643=float2(0.0);
float2 l9_1644=float2(0.0);
float2 l9_1645=float2(0.0);
float2 l9_1646=float2(0.0);
float2 l9_1647=float2(0.0);
ssGlobals l9_1648=l9_1640;
float2 l9_1649;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_1650=float2(0.0);
l9_1650=l9_1648.Surface_UVCoord0;
l9_1643=l9_1650;
l9_1649=l9_1643;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_1651=float2(0.0);
l9_1651=l9_1648.Surface_UVCoord1;
l9_1644=l9_1651;
l9_1649=l9_1644;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_1652=float2(0.0);
l9_1652=l9_1648.Surface_UVCoord0;
float2 l9_1653=float2(0.0);
float2 l9_1654=float2(0.0);
float2 l9_1655=float2(0.0);
ssGlobals l9_1656=l9_1648;
float2 l9_1657;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1658=float2(0.0);
float2 l9_1659=float2(0.0);
float2 l9_1660=float2(0.0);
float2 l9_1661=float2(0.0);
float2 l9_1662=float2(0.0);
ssGlobals l9_1663=l9_1656;
float2 l9_1664;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1665=float2(0.0);
l9_1665=l9_1663.Surface_UVCoord0;
l9_1659=l9_1665;
l9_1664=l9_1659;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1666=float2(0.0);
l9_1666=l9_1663.Surface_UVCoord1;
l9_1660=l9_1666;
l9_1664=l9_1660;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1667=float2(0.0);
l9_1667=l9_1663.gScreenCoord;
l9_1661=l9_1667;
l9_1664=l9_1661;
}
else
{
float2 l9_1668=float2(0.0);
l9_1668=l9_1663.Surface_UVCoord0;
l9_1662=l9_1668;
l9_1664=l9_1662;
}
}
}
l9_1658=l9_1664;
float2 l9_1669=float2(0.0);
float2 l9_1670=(*sc_set0.UserUniforms).uv2Scale;
l9_1669=l9_1670;
float2 l9_1671=float2(0.0);
l9_1671=l9_1669;
float2 l9_1672=float2(0.0);
float2 l9_1673=(*sc_set0.UserUniforms).uv2Offset;
l9_1672=l9_1673;
float2 l9_1674=float2(0.0);
l9_1674=l9_1672;
float2 l9_1675=float2(0.0);
l9_1675=(l9_1658*l9_1671)+l9_1674;
float2 l9_1676=float2(0.0);
l9_1676=l9_1675+(l9_1674*(l9_1656.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1654=l9_1676;
l9_1657=l9_1654;
}
else
{
float2 l9_1677=float2(0.0);
float2 l9_1678=float2(0.0);
float2 l9_1679=float2(0.0);
float2 l9_1680=float2(0.0);
float2 l9_1681=float2(0.0);
ssGlobals l9_1682=l9_1656;
float2 l9_1683;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1684=float2(0.0);
l9_1684=l9_1682.Surface_UVCoord0;
l9_1678=l9_1684;
l9_1683=l9_1678;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1685=float2(0.0);
l9_1685=l9_1682.Surface_UVCoord1;
l9_1679=l9_1685;
l9_1683=l9_1679;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1686=float2(0.0);
l9_1686=l9_1682.gScreenCoord;
l9_1680=l9_1686;
l9_1683=l9_1680;
}
else
{
float2 l9_1687=float2(0.0);
l9_1687=l9_1682.Surface_UVCoord0;
l9_1681=l9_1687;
l9_1683=l9_1681;
}
}
}
l9_1677=l9_1683;
float2 l9_1688=float2(0.0);
float2 l9_1689=(*sc_set0.UserUniforms).uv2Scale;
l9_1688=l9_1689;
float2 l9_1690=float2(0.0);
l9_1690=l9_1688;
float2 l9_1691=float2(0.0);
float2 l9_1692=(*sc_set0.UserUniforms).uv2Offset;
l9_1691=l9_1692;
float2 l9_1693=float2(0.0);
l9_1693=l9_1691;
float2 l9_1694=float2(0.0);
l9_1694=(l9_1677*l9_1690)+l9_1693;
l9_1655=l9_1694;
l9_1657=l9_1655;
}
l9_1653=l9_1657;
float l9_1695=0.0;
float l9_1696;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1696=1.001;
}
else
{
l9_1696=0.001;
}
l9_1696-=0.001;
l9_1695=l9_1696;
float l9_1697=0.0;
l9_1697=l9_1695;
float2 l9_1698=float2(0.0);
l9_1698=mix(l9_1652,l9_1653,float2(l9_1697));
float2 l9_1699=float2(0.0);
l9_1699=l9_1698;
float2 l9_1700=float2(0.0);
l9_1700=l9_1699;
l9_1645=l9_1700;
l9_1649=l9_1645;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_1701=float2(0.0);
l9_1701=l9_1648.Surface_UVCoord0;
float2 l9_1702=float2(0.0);
float2 l9_1703=float2(0.0);
float2 l9_1704=float2(0.0);
ssGlobals l9_1705=l9_1648;
float2 l9_1706;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_1707=float2(0.0);
float2 l9_1708=float2(0.0);
float2 l9_1709=float2(0.0);
float2 l9_1710=float2(0.0);
float2 l9_1711=float2(0.0);
float2 l9_1712=float2(0.0);
ssGlobals l9_1713=l9_1705;
float2 l9_1714;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1715=float2(0.0);
l9_1715=l9_1713.Surface_UVCoord0;
l9_1708=l9_1715;
l9_1714=l9_1708;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1716=float2(0.0);
l9_1716=l9_1713.Surface_UVCoord1;
l9_1709=l9_1716;
l9_1714=l9_1709;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1717=float2(0.0);
l9_1717=l9_1713.gScreenCoord;
l9_1710=l9_1717;
l9_1714=l9_1710;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1718=float2(0.0);
l9_1718=l9_1713.Surface_UVCoord0;
float2 l9_1719=float2(0.0);
float2 l9_1720=float2(0.0);
float2 l9_1721=float2(0.0);
ssGlobals l9_1722=l9_1713;
float2 l9_1723;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1724=float2(0.0);
float2 l9_1725=float2(0.0);
float2 l9_1726=float2(0.0);
float2 l9_1727=float2(0.0);
float2 l9_1728=float2(0.0);
ssGlobals l9_1729=l9_1722;
float2 l9_1730;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1731=float2(0.0);
l9_1731=l9_1729.Surface_UVCoord0;
l9_1725=l9_1731;
l9_1730=l9_1725;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1732=float2(0.0);
l9_1732=l9_1729.Surface_UVCoord1;
l9_1726=l9_1732;
l9_1730=l9_1726;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1733=float2(0.0);
l9_1733=l9_1729.gScreenCoord;
l9_1727=l9_1733;
l9_1730=l9_1727;
}
else
{
float2 l9_1734=float2(0.0);
l9_1734=l9_1729.Surface_UVCoord0;
l9_1728=l9_1734;
l9_1730=l9_1728;
}
}
}
l9_1724=l9_1730;
float2 l9_1735=float2(0.0);
float2 l9_1736=(*sc_set0.UserUniforms).uv2Scale;
l9_1735=l9_1736;
float2 l9_1737=float2(0.0);
l9_1737=l9_1735;
float2 l9_1738=float2(0.0);
float2 l9_1739=(*sc_set0.UserUniforms).uv2Offset;
l9_1738=l9_1739;
float2 l9_1740=float2(0.0);
l9_1740=l9_1738;
float2 l9_1741=float2(0.0);
l9_1741=(l9_1724*l9_1737)+l9_1740;
float2 l9_1742=float2(0.0);
l9_1742=l9_1741+(l9_1740*(l9_1722.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1720=l9_1742;
l9_1723=l9_1720;
}
else
{
float2 l9_1743=float2(0.0);
float2 l9_1744=float2(0.0);
float2 l9_1745=float2(0.0);
float2 l9_1746=float2(0.0);
float2 l9_1747=float2(0.0);
ssGlobals l9_1748=l9_1722;
float2 l9_1749;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1750=float2(0.0);
l9_1750=l9_1748.Surface_UVCoord0;
l9_1744=l9_1750;
l9_1749=l9_1744;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1751=float2(0.0);
l9_1751=l9_1748.Surface_UVCoord1;
l9_1745=l9_1751;
l9_1749=l9_1745;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1752=float2(0.0);
l9_1752=l9_1748.gScreenCoord;
l9_1746=l9_1752;
l9_1749=l9_1746;
}
else
{
float2 l9_1753=float2(0.0);
l9_1753=l9_1748.Surface_UVCoord0;
l9_1747=l9_1753;
l9_1749=l9_1747;
}
}
}
l9_1743=l9_1749;
float2 l9_1754=float2(0.0);
float2 l9_1755=(*sc_set0.UserUniforms).uv2Scale;
l9_1754=l9_1755;
float2 l9_1756=float2(0.0);
l9_1756=l9_1754;
float2 l9_1757=float2(0.0);
float2 l9_1758=(*sc_set0.UserUniforms).uv2Offset;
l9_1757=l9_1758;
float2 l9_1759=float2(0.0);
l9_1759=l9_1757;
float2 l9_1760=float2(0.0);
l9_1760=(l9_1743*l9_1756)+l9_1759;
l9_1721=l9_1760;
l9_1723=l9_1721;
}
l9_1719=l9_1723;
float l9_1761=0.0;
float l9_1762;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1762=1.001;
}
else
{
l9_1762=0.001;
}
l9_1762-=0.001;
l9_1761=l9_1762;
float l9_1763=0.0;
l9_1763=l9_1761;
float2 l9_1764=float2(0.0);
l9_1764=mix(l9_1718,l9_1719,float2(l9_1763));
float2 l9_1765=float2(0.0);
l9_1765=l9_1764;
float2 l9_1766=float2(0.0);
l9_1766=l9_1765;
l9_1711=l9_1766;
l9_1714=l9_1711;
}
else
{
float2 l9_1767=float2(0.0);
l9_1767=l9_1713.Surface_UVCoord0;
l9_1712=l9_1767;
l9_1714=l9_1712;
}
}
}
}
l9_1707=l9_1714;
float2 l9_1768=float2(0.0);
float2 l9_1769=(*sc_set0.UserUniforms).uv3Scale;
l9_1768=l9_1769;
float2 l9_1770=float2(0.0);
l9_1770=l9_1768;
float2 l9_1771=float2(0.0);
float2 l9_1772=(*sc_set0.UserUniforms).uv3Offset;
l9_1771=l9_1772;
float2 l9_1773=float2(0.0);
l9_1773=l9_1771;
float2 l9_1774=float2(0.0);
l9_1774=(l9_1707*l9_1770)+l9_1773;
float2 l9_1775=float2(0.0);
l9_1775=l9_1774+(l9_1773*(l9_1705.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1703=l9_1775;
l9_1706=l9_1703;
}
else
{
float2 l9_1776=float2(0.0);
float2 l9_1777=float2(0.0);
float2 l9_1778=float2(0.0);
float2 l9_1779=float2(0.0);
float2 l9_1780=float2(0.0);
float2 l9_1781=float2(0.0);
ssGlobals l9_1782=l9_1705;
float2 l9_1783;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1784=float2(0.0);
l9_1784=l9_1782.Surface_UVCoord0;
l9_1777=l9_1784;
l9_1783=l9_1777;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1785=float2(0.0);
l9_1785=l9_1782.Surface_UVCoord1;
l9_1778=l9_1785;
l9_1783=l9_1778;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1786=float2(0.0);
l9_1786=l9_1782.gScreenCoord;
l9_1779=l9_1786;
l9_1783=l9_1779;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1787=float2(0.0);
l9_1787=l9_1782.Surface_UVCoord0;
float2 l9_1788=float2(0.0);
float2 l9_1789=float2(0.0);
float2 l9_1790=float2(0.0);
ssGlobals l9_1791=l9_1782;
float2 l9_1792;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1793=float2(0.0);
float2 l9_1794=float2(0.0);
float2 l9_1795=float2(0.0);
float2 l9_1796=float2(0.0);
float2 l9_1797=float2(0.0);
ssGlobals l9_1798=l9_1791;
float2 l9_1799;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1800=float2(0.0);
l9_1800=l9_1798.Surface_UVCoord0;
l9_1794=l9_1800;
l9_1799=l9_1794;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1801=float2(0.0);
l9_1801=l9_1798.Surface_UVCoord1;
l9_1795=l9_1801;
l9_1799=l9_1795;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1802=float2(0.0);
l9_1802=l9_1798.gScreenCoord;
l9_1796=l9_1802;
l9_1799=l9_1796;
}
else
{
float2 l9_1803=float2(0.0);
l9_1803=l9_1798.Surface_UVCoord0;
l9_1797=l9_1803;
l9_1799=l9_1797;
}
}
}
l9_1793=l9_1799;
float2 l9_1804=float2(0.0);
float2 l9_1805=(*sc_set0.UserUniforms).uv2Scale;
l9_1804=l9_1805;
float2 l9_1806=float2(0.0);
l9_1806=l9_1804;
float2 l9_1807=float2(0.0);
float2 l9_1808=(*sc_set0.UserUniforms).uv2Offset;
l9_1807=l9_1808;
float2 l9_1809=float2(0.0);
l9_1809=l9_1807;
float2 l9_1810=float2(0.0);
l9_1810=(l9_1793*l9_1806)+l9_1809;
float2 l9_1811=float2(0.0);
l9_1811=l9_1810+(l9_1809*(l9_1791.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1789=l9_1811;
l9_1792=l9_1789;
}
else
{
float2 l9_1812=float2(0.0);
float2 l9_1813=float2(0.0);
float2 l9_1814=float2(0.0);
float2 l9_1815=float2(0.0);
float2 l9_1816=float2(0.0);
ssGlobals l9_1817=l9_1791;
float2 l9_1818;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1819=float2(0.0);
l9_1819=l9_1817.Surface_UVCoord0;
l9_1813=l9_1819;
l9_1818=l9_1813;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1820=float2(0.0);
l9_1820=l9_1817.Surface_UVCoord1;
l9_1814=l9_1820;
l9_1818=l9_1814;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1821=float2(0.0);
l9_1821=l9_1817.gScreenCoord;
l9_1815=l9_1821;
l9_1818=l9_1815;
}
else
{
float2 l9_1822=float2(0.0);
l9_1822=l9_1817.Surface_UVCoord0;
l9_1816=l9_1822;
l9_1818=l9_1816;
}
}
}
l9_1812=l9_1818;
float2 l9_1823=float2(0.0);
float2 l9_1824=(*sc_set0.UserUniforms).uv2Scale;
l9_1823=l9_1824;
float2 l9_1825=float2(0.0);
l9_1825=l9_1823;
float2 l9_1826=float2(0.0);
float2 l9_1827=(*sc_set0.UserUniforms).uv2Offset;
l9_1826=l9_1827;
float2 l9_1828=float2(0.0);
l9_1828=l9_1826;
float2 l9_1829=float2(0.0);
l9_1829=(l9_1812*l9_1825)+l9_1828;
l9_1790=l9_1829;
l9_1792=l9_1790;
}
l9_1788=l9_1792;
float l9_1830=0.0;
float l9_1831;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1831=1.001;
}
else
{
l9_1831=0.001;
}
l9_1831-=0.001;
l9_1830=l9_1831;
float l9_1832=0.0;
l9_1832=l9_1830;
float2 l9_1833=float2(0.0);
l9_1833=mix(l9_1787,l9_1788,float2(l9_1832));
float2 l9_1834=float2(0.0);
l9_1834=l9_1833;
float2 l9_1835=float2(0.0);
l9_1835=l9_1834;
l9_1780=l9_1835;
l9_1783=l9_1780;
}
else
{
float2 l9_1836=float2(0.0);
l9_1836=l9_1782.Surface_UVCoord0;
l9_1781=l9_1836;
l9_1783=l9_1781;
}
}
}
}
l9_1776=l9_1783;
float2 l9_1837=float2(0.0);
float2 l9_1838=(*sc_set0.UserUniforms).uv3Scale;
l9_1837=l9_1838;
float2 l9_1839=float2(0.0);
l9_1839=l9_1837;
float2 l9_1840=float2(0.0);
float2 l9_1841=(*sc_set0.UserUniforms).uv3Offset;
l9_1840=l9_1841;
float2 l9_1842=float2(0.0);
l9_1842=l9_1840;
float2 l9_1843=float2(0.0);
l9_1843=(l9_1776*l9_1839)+l9_1842;
l9_1704=l9_1843;
l9_1706=l9_1704;
}
l9_1702=l9_1706;
float l9_1844=0.0;
float l9_1845;
if ((int(Tweak_N11_tmp)!=0))
{
l9_1845=1.001;
}
else
{
l9_1845=0.001;
}
l9_1845-=0.001;
l9_1844=l9_1845;
float l9_1846=0.0;
l9_1846=l9_1844;
float2 l9_1847=float2(0.0);
l9_1847=mix(l9_1701,l9_1702,float2(l9_1846));
float2 l9_1848=float2(0.0);
l9_1848=l9_1847;
float2 l9_1849=float2(0.0);
l9_1849=l9_1848;
l9_1646=l9_1849;
l9_1649=l9_1646;
}
else
{
float2 l9_1850=float2(0.0);
l9_1850=l9_1648.Surface_UVCoord0;
l9_1647=l9_1850;
l9_1649=l9_1647;
}
}
}
}
l9_1642=l9_1649;
float4 l9_1851=float4(0.0);
float2 l9_1852=l9_1642;
int l9_1853=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_1854=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1854=0;
}
else
{
l9_1854=in.varStereoViewID;
}
int l9_1855=l9_1854;
l9_1853=1-l9_1855;
}
else
{
int l9_1856=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1856=0;
}
else
{
l9_1856=in.varStereoViewID;
}
int l9_1857=l9_1856;
l9_1853=l9_1857;
}
int l9_1858=l9_1853;
int l9_1859=detailNormalTexLayout_tmp;
int l9_1860=l9_1858;
float2 l9_1861=l9_1852;
bool l9_1862=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_1863=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_1864=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_1865=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_1866=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_1867=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_1868=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_1869=0.0;
bool l9_1870=l9_1867&&(!l9_1865);
float l9_1871=1.0;
float l9_1872=l9_1861.x;
int l9_1873=l9_1864.x;
if (l9_1873==1)
{
l9_1872=fract(l9_1872);
}
else
{
if (l9_1873==2)
{
float l9_1874=fract(l9_1872);
float l9_1875=l9_1872-l9_1874;
float l9_1876=step(0.25,fract(l9_1875*0.5));
l9_1872=mix(l9_1874,1.0-l9_1874,fast::clamp(l9_1876,0.0,1.0));
}
}
l9_1861.x=l9_1872;
float l9_1877=l9_1861.y;
int l9_1878=l9_1864.y;
if (l9_1878==1)
{
l9_1877=fract(l9_1877);
}
else
{
if (l9_1878==2)
{
float l9_1879=fract(l9_1877);
float l9_1880=l9_1877-l9_1879;
float l9_1881=step(0.25,fract(l9_1880*0.5));
l9_1877=mix(l9_1879,1.0-l9_1879,fast::clamp(l9_1881,0.0,1.0));
}
}
l9_1861.y=l9_1877;
if (l9_1865)
{
bool l9_1882=l9_1867;
bool l9_1883;
if (l9_1882)
{
l9_1883=l9_1864.x==3;
}
else
{
l9_1883=l9_1882;
}
float l9_1884=l9_1861.x;
float l9_1885=l9_1866.x;
float l9_1886=l9_1866.z;
bool l9_1887=l9_1883;
float l9_1888=l9_1871;
float l9_1889=fast::clamp(l9_1884,l9_1885,l9_1886);
float l9_1890=step(abs(l9_1884-l9_1889),9.9999997e-06);
l9_1888*=(l9_1890+((1.0-float(l9_1887))*(1.0-l9_1890)));
l9_1884=l9_1889;
l9_1861.x=l9_1884;
l9_1871=l9_1888;
bool l9_1891=l9_1867;
bool l9_1892;
if (l9_1891)
{
l9_1892=l9_1864.y==3;
}
else
{
l9_1892=l9_1891;
}
float l9_1893=l9_1861.y;
float l9_1894=l9_1866.y;
float l9_1895=l9_1866.w;
bool l9_1896=l9_1892;
float l9_1897=l9_1871;
float l9_1898=fast::clamp(l9_1893,l9_1894,l9_1895);
float l9_1899=step(abs(l9_1893-l9_1898),9.9999997e-06);
l9_1897*=(l9_1899+((1.0-float(l9_1896))*(1.0-l9_1899)));
l9_1893=l9_1898;
l9_1861.y=l9_1893;
l9_1871=l9_1897;
}
float2 l9_1900=l9_1861;
bool l9_1901=l9_1862;
float3x3 l9_1902=l9_1863;
if (l9_1901)
{
l9_1900=float2((l9_1902*float3(l9_1900,1.0)).xy);
}
float2 l9_1903=l9_1900;
float2 l9_1904=l9_1903;
float2 l9_1905=l9_1904;
l9_1861=l9_1905;
float l9_1906=l9_1861.x;
int l9_1907=l9_1864.x;
bool l9_1908=l9_1870;
float l9_1909=l9_1871;
if ((l9_1907==0)||(l9_1907==3))
{
float l9_1910=l9_1906;
float l9_1911=0.0;
float l9_1912=1.0;
bool l9_1913=l9_1908;
float l9_1914=l9_1909;
float l9_1915=fast::clamp(l9_1910,l9_1911,l9_1912);
float l9_1916=step(abs(l9_1910-l9_1915),9.9999997e-06);
l9_1914*=(l9_1916+((1.0-float(l9_1913))*(1.0-l9_1916)));
l9_1910=l9_1915;
l9_1906=l9_1910;
l9_1909=l9_1914;
}
l9_1861.x=l9_1906;
l9_1871=l9_1909;
float l9_1917=l9_1861.y;
int l9_1918=l9_1864.y;
bool l9_1919=l9_1870;
float l9_1920=l9_1871;
if ((l9_1918==0)||(l9_1918==3))
{
float l9_1921=l9_1917;
float l9_1922=0.0;
float l9_1923=1.0;
bool l9_1924=l9_1919;
float l9_1925=l9_1920;
float l9_1926=fast::clamp(l9_1921,l9_1922,l9_1923);
float l9_1927=step(abs(l9_1921-l9_1926),9.9999997e-06);
l9_1925*=(l9_1927+((1.0-float(l9_1924))*(1.0-l9_1927)));
l9_1921=l9_1926;
l9_1917=l9_1921;
l9_1920=l9_1925;
}
l9_1861.y=l9_1917;
l9_1871=l9_1920;
float2 l9_1928=l9_1861;
int l9_1929=l9_1859;
int l9_1930=l9_1860;
float l9_1931=l9_1869;
float2 l9_1932=l9_1928;
int l9_1933=l9_1929;
int l9_1934=l9_1930;
float3 l9_1935=float3(0.0);
if (l9_1933==0)
{
l9_1935=float3(l9_1932,0.0);
}
else
{
if (l9_1933==1)
{
l9_1935=float3(l9_1932.x,(l9_1932.y*0.5)+(0.5-(float(l9_1934)*0.5)),0.0);
}
else
{
l9_1935=float3(l9_1932,float(l9_1934));
}
}
float3 l9_1936=l9_1935;
float3 l9_1937=l9_1936;
float2 l9_1938=l9_1937.xy;
float l9_1939=l9_1931;
float4 l9_1940=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_1938,bias(l9_1939));
float4 l9_1941=l9_1940;
float4 l9_1942=l9_1941;
if (l9_1867)
{
l9_1942=mix(l9_1868,l9_1942,float4(l9_1871));
}
float4 l9_1943=l9_1942;
float4 l9_1944=l9_1943;
float3 l9_1945=(l9_1944.xyz*1.9921875)-float3(1.0);
l9_1944=float4(l9_1945.x,l9_1945.y,l9_1945.z,l9_1944.w);
l9_1851=l9_1944;
l9_1638=l9_1851.xyz;
l9_1641=l9_1638;
}
else
{
l9_1641=l9_1639;
}
l9_1637=l9_1641;
float3 l9_1946=float3(0.0);
float3 l9_1947=l9_1542.xyz;
float l9_1948=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_1949=l9_1637;
float l9_1950=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_1951=l9_1947;
float l9_1952=l9_1948;
float3 l9_1953=l9_1949;
float l9_1954=l9_1950;
float3 l9_1955=mix(float3(0.0,0.0,1.0),l9_1951,float3(l9_1952))+float3(0.0,0.0,1.0);
float3 l9_1956=mix(float3(0.0,0.0,1.0),l9_1953,float3(l9_1954))*float3(-1.0,-1.0,1.0);
float3 l9_1957=normalize((l9_1955*dot(l9_1955,l9_1956))-(l9_1956*l9_1955.z));
l9_1949=l9_1957;
float3 l9_1958=l9_1949;
l9_1946=l9_1958;
float3 l9_1959=float3(0.0);
l9_1959=l9_1332*l9_1946;
float3 l9_1960=float3(0.0);
float3 l9_1961=l9_1959;
float l9_1962=dot(l9_1961,l9_1961);
float l9_1963;
if (l9_1962>0.0)
{
l9_1963=1.0/sqrt(l9_1962);
}
else
{
l9_1963=0.0;
}
float l9_1964=l9_1963;
float3 l9_1965=l9_1961*l9_1964;
l9_1960=l9_1965;
param_5=l9_1960;
param_7=param_5;
}
else
{
float3 l9_1966=float3(0.0);
l9_1966=param_8.VertexNormal_WorldSpace;
float3 l9_1967=float3(0.0);
float3 l9_1968=l9_1966;
float l9_1969=dot(l9_1968,l9_1968);
float l9_1970;
if (l9_1969>0.0)
{
l9_1970=1.0/sqrt(l9_1969);
}
else
{
l9_1970=0.0;
}
float l9_1971=l9_1970;
float3 l9_1972=l9_1968*l9_1971;
l9_1967=l9_1972;
param_6=l9_1967;
param_7=param_6;
}
Result_N337=param_7;
float3 Export_N334=float3(0.0);
Export_N334=Result_N337;
float3 Result_N294=float3(0.0);
float3 param_9=float3(0.0);
float3 param_10=float3(0.0);
ssGlobals param_12=Globals;
float3 param_11;
if (NODE_38_DROPLIST_ITEM_tmp==2)
{
float4 l9_1973=float4(0.0);
l9_1973=param_12.VertexColor;
float4 l9_1974=float4(0.0);
float4 l9_1975=float4(0.0);
float4 l9_1976=(*sc_set0.UserUniforms).Port_Default_N132;
ssGlobals l9_1977=param_12;
float4 l9_1978;
if ((int(Tweak_N223_tmp)!=0))
{
float2 l9_1979=float2(0.0);
float2 l9_1980=float2(0.0);
float2 l9_1981=float2(0.0);
float2 l9_1982=float2(0.0);
float2 l9_1983=float2(0.0);
float2 l9_1984=float2(0.0);
ssGlobals l9_1985=l9_1977;
float2 l9_1986;
if (NODE_76_DROPLIST_ITEM_tmp==0)
{
float2 l9_1987=float2(0.0);
l9_1987=l9_1985.Surface_UVCoord0;
l9_1980=l9_1987;
l9_1986=l9_1980;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==1)
{
float2 l9_1988=float2(0.0);
l9_1988=l9_1985.Surface_UVCoord1;
l9_1981=l9_1988;
l9_1986=l9_1981;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==2)
{
float2 l9_1989=float2(0.0);
l9_1989=l9_1985.Surface_UVCoord0;
float2 l9_1990=float2(0.0);
float2 l9_1991=float2(0.0);
float2 l9_1992=float2(0.0);
ssGlobals l9_1993=l9_1985;
float2 l9_1994;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1995=float2(0.0);
float2 l9_1996=float2(0.0);
float2 l9_1997=float2(0.0);
float2 l9_1998=float2(0.0);
float2 l9_1999=float2(0.0);
ssGlobals l9_2000=l9_1993;
float2 l9_2001;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2002=float2(0.0);
l9_2002=l9_2000.Surface_UVCoord0;
l9_1996=l9_2002;
l9_2001=l9_1996;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2003=float2(0.0);
l9_2003=l9_2000.Surface_UVCoord1;
l9_1997=l9_2003;
l9_2001=l9_1997;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2004=float2(0.0);
l9_2004=l9_2000.gScreenCoord;
l9_1998=l9_2004;
l9_2001=l9_1998;
}
else
{
float2 l9_2005=float2(0.0);
l9_2005=l9_2000.Surface_UVCoord0;
l9_1999=l9_2005;
l9_2001=l9_1999;
}
}
}
l9_1995=l9_2001;
float2 l9_2006=float2(0.0);
float2 l9_2007=(*sc_set0.UserUniforms).uv2Scale;
l9_2006=l9_2007;
float2 l9_2008=float2(0.0);
l9_2008=l9_2006;
float2 l9_2009=float2(0.0);
float2 l9_2010=(*sc_set0.UserUniforms).uv2Offset;
l9_2009=l9_2010;
float2 l9_2011=float2(0.0);
l9_2011=l9_2009;
float2 l9_2012=float2(0.0);
l9_2012=(l9_1995*l9_2008)+l9_2011;
float2 l9_2013=float2(0.0);
l9_2013=l9_2012+(l9_2011*(l9_1993.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1991=l9_2013;
l9_1994=l9_1991;
}
else
{
float2 l9_2014=float2(0.0);
float2 l9_2015=float2(0.0);
float2 l9_2016=float2(0.0);
float2 l9_2017=float2(0.0);
float2 l9_2018=float2(0.0);
ssGlobals l9_2019=l9_1993;
float2 l9_2020;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2021=float2(0.0);
l9_2021=l9_2019.Surface_UVCoord0;
l9_2015=l9_2021;
l9_2020=l9_2015;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2022=float2(0.0);
l9_2022=l9_2019.Surface_UVCoord1;
l9_2016=l9_2022;
l9_2020=l9_2016;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2023=float2(0.0);
l9_2023=l9_2019.gScreenCoord;
l9_2017=l9_2023;
l9_2020=l9_2017;
}
else
{
float2 l9_2024=float2(0.0);
l9_2024=l9_2019.Surface_UVCoord0;
l9_2018=l9_2024;
l9_2020=l9_2018;
}
}
}
l9_2014=l9_2020;
float2 l9_2025=float2(0.0);
float2 l9_2026=(*sc_set0.UserUniforms).uv2Scale;
l9_2025=l9_2026;
float2 l9_2027=float2(0.0);
l9_2027=l9_2025;
float2 l9_2028=float2(0.0);
float2 l9_2029=(*sc_set0.UserUniforms).uv2Offset;
l9_2028=l9_2029;
float2 l9_2030=float2(0.0);
l9_2030=l9_2028;
float2 l9_2031=float2(0.0);
l9_2031=(l9_2014*l9_2027)+l9_2030;
l9_1992=l9_2031;
l9_1994=l9_1992;
}
l9_1990=l9_1994;
float l9_2032=0.0;
float l9_2033;
if ((int(Tweak_N67_tmp)!=0))
{
l9_2033=1.001;
}
else
{
l9_2033=0.001;
}
l9_2033-=0.001;
l9_2032=l9_2033;
float l9_2034=0.0;
l9_2034=l9_2032;
float2 l9_2035=float2(0.0);
l9_2035=mix(l9_1989,l9_1990,float2(l9_2034));
float2 l9_2036=float2(0.0);
l9_2036=l9_2035;
float2 l9_2037=float2(0.0);
l9_2037=l9_2036;
l9_1982=l9_2037;
l9_1986=l9_1982;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==3)
{
float2 l9_2038=float2(0.0);
l9_2038=l9_1985.Surface_UVCoord0;
float2 l9_2039=float2(0.0);
float2 l9_2040=float2(0.0);
float2 l9_2041=float2(0.0);
ssGlobals l9_2042=l9_1985;
float2 l9_2043;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_2044=float2(0.0);
float2 l9_2045=float2(0.0);
float2 l9_2046=float2(0.0);
float2 l9_2047=float2(0.0);
float2 l9_2048=float2(0.0);
float2 l9_2049=float2(0.0);
ssGlobals l9_2050=l9_2042;
float2 l9_2051;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2052=float2(0.0);
l9_2052=l9_2050.Surface_UVCoord0;
l9_2045=l9_2052;
l9_2051=l9_2045;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2053=float2(0.0);
l9_2053=l9_2050.Surface_UVCoord1;
l9_2046=l9_2053;
l9_2051=l9_2046;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2054=float2(0.0);
l9_2054=l9_2050.gScreenCoord;
l9_2047=l9_2054;
l9_2051=l9_2047;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2055=float2(0.0);
l9_2055=l9_2050.Surface_UVCoord0;
float2 l9_2056=float2(0.0);
float2 l9_2057=float2(0.0);
float2 l9_2058=float2(0.0);
ssGlobals l9_2059=l9_2050;
float2 l9_2060;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2061=float2(0.0);
float2 l9_2062=float2(0.0);
float2 l9_2063=float2(0.0);
float2 l9_2064=float2(0.0);
float2 l9_2065=float2(0.0);
ssGlobals l9_2066=l9_2059;
float2 l9_2067;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2068=float2(0.0);
l9_2068=l9_2066.Surface_UVCoord0;
l9_2062=l9_2068;
l9_2067=l9_2062;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2069=float2(0.0);
l9_2069=l9_2066.Surface_UVCoord1;
l9_2063=l9_2069;
l9_2067=l9_2063;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2070=float2(0.0);
l9_2070=l9_2066.gScreenCoord;
l9_2064=l9_2070;
l9_2067=l9_2064;
}
else
{
float2 l9_2071=float2(0.0);
l9_2071=l9_2066.Surface_UVCoord0;
l9_2065=l9_2071;
l9_2067=l9_2065;
}
}
}
l9_2061=l9_2067;
float2 l9_2072=float2(0.0);
float2 l9_2073=(*sc_set0.UserUniforms).uv2Scale;
l9_2072=l9_2073;
float2 l9_2074=float2(0.0);
l9_2074=l9_2072;
float2 l9_2075=float2(0.0);
float2 l9_2076=(*sc_set0.UserUniforms).uv2Offset;
l9_2075=l9_2076;
float2 l9_2077=float2(0.0);
l9_2077=l9_2075;
float2 l9_2078=float2(0.0);
l9_2078=(l9_2061*l9_2074)+l9_2077;
float2 l9_2079=float2(0.0);
l9_2079=l9_2078+(l9_2077*(l9_2059.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2057=l9_2079;
l9_2060=l9_2057;
}
else
{
float2 l9_2080=float2(0.0);
float2 l9_2081=float2(0.0);
float2 l9_2082=float2(0.0);
float2 l9_2083=float2(0.0);
float2 l9_2084=float2(0.0);
ssGlobals l9_2085=l9_2059;
float2 l9_2086;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2087=float2(0.0);
l9_2087=l9_2085.Surface_UVCoord0;
l9_2081=l9_2087;
l9_2086=l9_2081;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2088=float2(0.0);
l9_2088=l9_2085.Surface_UVCoord1;
l9_2082=l9_2088;
l9_2086=l9_2082;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2089=float2(0.0);
l9_2089=l9_2085.gScreenCoord;
l9_2083=l9_2089;
l9_2086=l9_2083;
}
else
{
float2 l9_2090=float2(0.0);
l9_2090=l9_2085.Surface_UVCoord0;
l9_2084=l9_2090;
l9_2086=l9_2084;
}
}
}
l9_2080=l9_2086;
float2 l9_2091=float2(0.0);
float2 l9_2092=(*sc_set0.UserUniforms).uv2Scale;
l9_2091=l9_2092;
float2 l9_2093=float2(0.0);
l9_2093=l9_2091;
float2 l9_2094=float2(0.0);
float2 l9_2095=(*sc_set0.UserUniforms).uv2Offset;
l9_2094=l9_2095;
float2 l9_2096=float2(0.0);
l9_2096=l9_2094;
float2 l9_2097=float2(0.0);
l9_2097=(l9_2080*l9_2093)+l9_2096;
l9_2058=l9_2097;
l9_2060=l9_2058;
}
l9_2056=l9_2060;
float l9_2098=0.0;
float l9_2099;
if ((int(Tweak_N67_tmp)!=0))
{
l9_2099=1.001;
}
else
{
l9_2099=0.001;
}
l9_2099-=0.001;
l9_2098=l9_2099;
float l9_2100=0.0;
l9_2100=l9_2098;
float2 l9_2101=float2(0.0);
l9_2101=mix(l9_2055,l9_2056,float2(l9_2100));
float2 l9_2102=float2(0.0);
l9_2102=l9_2101;
float2 l9_2103=float2(0.0);
l9_2103=l9_2102;
l9_2048=l9_2103;
l9_2051=l9_2048;
}
else
{
float2 l9_2104=float2(0.0);
l9_2104=l9_2050.Surface_UVCoord0;
l9_2049=l9_2104;
l9_2051=l9_2049;
}
}
}
}
l9_2044=l9_2051;
float2 l9_2105=float2(0.0);
float2 l9_2106=(*sc_set0.UserUniforms).uv3Scale;
l9_2105=l9_2106;
float2 l9_2107=float2(0.0);
l9_2107=l9_2105;
float2 l9_2108=float2(0.0);
float2 l9_2109=(*sc_set0.UserUniforms).uv3Offset;
l9_2108=l9_2109;
float2 l9_2110=float2(0.0);
l9_2110=l9_2108;
float2 l9_2111=float2(0.0);
l9_2111=(l9_2044*l9_2107)+l9_2110;
float2 l9_2112=float2(0.0);
l9_2112=l9_2111+(l9_2110*(l9_2042.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2040=l9_2112;
l9_2043=l9_2040;
}
else
{
float2 l9_2113=float2(0.0);
float2 l9_2114=float2(0.0);
float2 l9_2115=float2(0.0);
float2 l9_2116=float2(0.0);
float2 l9_2117=float2(0.0);
float2 l9_2118=float2(0.0);
ssGlobals l9_2119=l9_2042;
float2 l9_2120;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2121=float2(0.0);
l9_2121=l9_2119.Surface_UVCoord0;
l9_2114=l9_2121;
l9_2120=l9_2114;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2122=float2(0.0);
l9_2122=l9_2119.Surface_UVCoord1;
l9_2115=l9_2122;
l9_2120=l9_2115;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2123=float2(0.0);
l9_2123=l9_2119.gScreenCoord;
l9_2116=l9_2123;
l9_2120=l9_2116;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2124=float2(0.0);
l9_2124=l9_2119.Surface_UVCoord0;
float2 l9_2125=float2(0.0);
float2 l9_2126=float2(0.0);
float2 l9_2127=float2(0.0);
ssGlobals l9_2128=l9_2119;
float2 l9_2129;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2130=float2(0.0);
float2 l9_2131=float2(0.0);
float2 l9_2132=float2(0.0);
float2 l9_2133=float2(0.0);
float2 l9_2134=float2(0.0);
ssGlobals l9_2135=l9_2128;
float2 l9_2136;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2137=float2(0.0);
l9_2137=l9_2135.Surface_UVCoord0;
l9_2131=l9_2137;
l9_2136=l9_2131;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2138=float2(0.0);
l9_2138=l9_2135.Surface_UVCoord1;
l9_2132=l9_2138;
l9_2136=l9_2132;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2139=float2(0.0);
l9_2139=l9_2135.gScreenCoord;
l9_2133=l9_2139;
l9_2136=l9_2133;
}
else
{
float2 l9_2140=float2(0.0);
l9_2140=l9_2135.Surface_UVCoord0;
l9_2134=l9_2140;
l9_2136=l9_2134;
}
}
}
l9_2130=l9_2136;
float2 l9_2141=float2(0.0);
float2 l9_2142=(*sc_set0.UserUniforms).uv2Scale;
l9_2141=l9_2142;
float2 l9_2143=float2(0.0);
l9_2143=l9_2141;
float2 l9_2144=float2(0.0);
float2 l9_2145=(*sc_set0.UserUniforms).uv2Offset;
l9_2144=l9_2145;
float2 l9_2146=float2(0.0);
l9_2146=l9_2144;
float2 l9_2147=float2(0.0);
l9_2147=(l9_2130*l9_2143)+l9_2146;
float2 l9_2148=float2(0.0);
l9_2148=l9_2147+(l9_2146*(l9_2128.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2126=l9_2148;
l9_2129=l9_2126;
}
else
{
float2 l9_2149=float2(0.0);
float2 l9_2150=float2(0.0);
float2 l9_2151=float2(0.0);
float2 l9_2152=float2(0.0);
float2 l9_2153=float2(0.0);
ssGlobals l9_2154=l9_2128;
float2 l9_2155;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2156=float2(0.0);
l9_2156=l9_2154.Surface_UVCoord0;
l9_2150=l9_2156;
l9_2155=l9_2150;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2157=float2(0.0);
l9_2157=l9_2154.Surface_UVCoord1;
l9_2151=l9_2157;
l9_2155=l9_2151;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2158=float2(0.0);
l9_2158=l9_2154.gScreenCoord;
l9_2152=l9_2158;
l9_2155=l9_2152;
}
else
{
float2 l9_2159=float2(0.0);
l9_2159=l9_2154.Surface_UVCoord0;
l9_2153=l9_2159;
l9_2155=l9_2153;
}
}
}
l9_2149=l9_2155;
float2 l9_2160=float2(0.0);
float2 l9_2161=(*sc_set0.UserUniforms).uv2Scale;
l9_2160=l9_2161;
float2 l9_2162=float2(0.0);
l9_2162=l9_2160;
float2 l9_2163=float2(0.0);
float2 l9_2164=(*sc_set0.UserUniforms).uv2Offset;
l9_2163=l9_2164;
float2 l9_2165=float2(0.0);
l9_2165=l9_2163;
float2 l9_2166=float2(0.0);
l9_2166=(l9_2149*l9_2162)+l9_2165;
l9_2127=l9_2166;
l9_2129=l9_2127;
}
l9_2125=l9_2129;
float l9_2167=0.0;
float l9_2168;
if ((int(Tweak_N67_tmp)!=0))
{
l9_2168=1.001;
}
else
{
l9_2168=0.001;
}
l9_2168-=0.001;
l9_2167=l9_2168;
float l9_2169=0.0;
l9_2169=l9_2167;
float2 l9_2170=float2(0.0);
l9_2170=mix(l9_2124,l9_2125,float2(l9_2169));
float2 l9_2171=float2(0.0);
l9_2171=l9_2170;
float2 l9_2172=float2(0.0);
l9_2172=l9_2171;
l9_2117=l9_2172;
l9_2120=l9_2117;
}
else
{
float2 l9_2173=float2(0.0);
l9_2173=l9_2119.Surface_UVCoord0;
l9_2118=l9_2173;
l9_2120=l9_2118;
}
}
}
}
l9_2113=l9_2120;
float2 l9_2174=float2(0.0);
float2 l9_2175=(*sc_set0.UserUniforms).uv3Scale;
l9_2174=l9_2175;
float2 l9_2176=float2(0.0);
l9_2176=l9_2174;
float2 l9_2177=float2(0.0);
float2 l9_2178=(*sc_set0.UserUniforms).uv3Offset;
l9_2177=l9_2178;
float2 l9_2179=float2(0.0);
l9_2179=l9_2177;
float2 l9_2180=float2(0.0);
l9_2180=(l9_2113*l9_2176)+l9_2179;
l9_2041=l9_2180;
l9_2043=l9_2041;
}
l9_2039=l9_2043;
float l9_2181=0.0;
float l9_2182;
if ((int(Tweak_N11_tmp)!=0))
{
l9_2182=1.001;
}
else
{
l9_2182=0.001;
}
l9_2182-=0.001;
l9_2181=l9_2182;
float l9_2183=0.0;
l9_2183=l9_2181;
float2 l9_2184=float2(0.0);
l9_2184=mix(l9_2038,l9_2039,float2(l9_2183));
float2 l9_2185=float2(0.0);
l9_2185=l9_2184;
float2 l9_2186=float2(0.0);
l9_2186=l9_2185;
l9_1983=l9_2186;
l9_1986=l9_1983;
}
else
{
float2 l9_2187=float2(0.0);
l9_2187=l9_1985.Surface_UVCoord0;
l9_1984=l9_2187;
l9_1986=l9_1984;
}
}
}
}
l9_1979=l9_1986;
float4 l9_2188=float4(0.0);
int l9_2189=0;
if ((int(emissiveTexHasSwappedViews_tmp)!=0))
{
int l9_2190=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2190=0;
}
else
{
l9_2190=in.varStereoViewID;
}
int l9_2191=l9_2190;
l9_2189=1-l9_2191;
}
else
{
int l9_2192=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2192=0;
}
else
{
l9_2192=in.varStereoViewID;
}
int l9_2193=l9_2192;
l9_2189=l9_2193;
}
int l9_2194=l9_2189;
int l9_2195=emissiveTexLayout_tmp;
int l9_2196=l9_2194;
float2 l9_2197=l9_1979;
bool l9_2198=(int(SC_USE_UV_TRANSFORM_emissiveTex_tmp)!=0);
float3x3 l9_2199=(*sc_set0.UserUniforms).emissiveTexTransform;
int2 l9_2200=int2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp,SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp);
bool l9_2201=(int(SC_USE_UV_MIN_MAX_emissiveTex_tmp)!=0);
float4 l9_2202=(*sc_set0.UserUniforms).emissiveTexUvMinMax;
bool l9_2203=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp)!=0);
float4 l9_2204=(*sc_set0.UserUniforms).emissiveTexBorderColor;
float l9_2205=0.0;
bool l9_2206=l9_2203&&(!l9_2201);
float l9_2207=1.0;
float l9_2208=l9_2197.x;
int l9_2209=l9_2200.x;
if (l9_2209==1)
{
l9_2208=fract(l9_2208);
}
else
{
if (l9_2209==2)
{
float l9_2210=fract(l9_2208);
float l9_2211=l9_2208-l9_2210;
float l9_2212=step(0.25,fract(l9_2211*0.5));
l9_2208=mix(l9_2210,1.0-l9_2210,fast::clamp(l9_2212,0.0,1.0));
}
}
l9_2197.x=l9_2208;
float l9_2213=l9_2197.y;
int l9_2214=l9_2200.y;
if (l9_2214==1)
{
l9_2213=fract(l9_2213);
}
else
{
if (l9_2214==2)
{
float l9_2215=fract(l9_2213);
float l9_2216=l9_2213-l9_2215;
float l9_2217=step(0.25,fract(l9_2216*0.5));
l9_2213=mix(l9_2215,1.0-l9_2215,fast::clamp(l9_2217,0.0,1.0));
}
}
l9_2197.y=l9_2213;
if (l9_2201)
{
bool l9_2218=l9_2203;
bool l9_2219;
if (l9_2218)
{
l9_2219=l9_2200.x==3;
}
else
{
l9_2219=l9_2218;
}
float l9_2220=l9_2197.x;
float l9_2221=l9_2202.x;
float l9_2222=l9_2202.z;
bool l9_2223=l9_2219;
float l9_2224=l9_2207;
float l9_2225=fast::clamp(l9_2220,l9_2221,l9_2222);
float l9_2226=step(abs(l9_2220-l9_2225),9.9999997e-06);
l9_2224*=(l9_2226+((1.0-float(l9_2223))*(1.0-l9_2226)));
l9_2220=l9_2225;
l9_2197.x=l9_2220;
l9_2207=l9_2224;
bool l9_2227=l9_2203;
bool l9_2228;
if (l9_2227)
{
l9_2228=l9_2200.y==3;
}
else
{
l9_2228=l9_2227;
}
float l9_2229=l9_2197.y;
float l9_2230=l9_2202.y;
float l9_2231=l9_2202.w;
bool l9_2232=l9_2228;
float l9_2233=l9_2207;
float l9_2234=fast::clamp(l9_2229,l9_2230,l9_2231);
float l9_2235=step(abs(l9_2229-l9_2234),9.9999997e-06);
l9_2233*=(l9_2235+((1.0-float(l9_2232))*(1.0-l9_2235)));
l9_2229=l9_2234;
l9_2197.y=l9_2229;
l9_2207=l9_2233;
}
float2 l9_2236=l9_2197;
bool l9_2237=l9_2198;
float3x3 l9_2238=l9_2199;
if (l9_2237)
{
l9_2236=float2((l9_2238*float3(l9_2236,1.0)).xy);
}
float2 l9_2239=l9_2236;
float2 l9_2240=l9_2239;
float2 l9_2241=l9_2240;
l9_2197=l9_2241;
float l9_2242=l9_2197.x;
int l9_2243=l9_2200.x;
bool l9_2244=l9_2206;
float l9_2245=l9_2207;
if ((l9_2243==0)||(l9_2243==3))
{
float l9_2246=l9_2242;
float l9_2247=0.0;
float l9_2248=1.0;
bool l9_2249=l9_2244;
float l9_2250=l9_2245;
float l9_2251=fast::clamp(l9_2246,l9_2247,l9_2248);
float l9_2252=step(abs(l9_2246-l9_2251),9.9999997e-06);
l9_2250*=(l9_2252+((1.0-float(l9_2249))*(1.0-l9_2252)));
l9_2246=l9_2251;
l9_2242=l9_2246;
l9_2245=l9_2250;
}
l9_2197.x=l9_2242;
l9_2207=l9_2245;
float l9_2253=l9_2197.y;
int l9_2254=l9_2200.y;
bool l9_2255=l9_2206;
float l9_2256=l9_2207;
if ((l9_2254==0)||(l9_2254==3))
{
float l9_2257=l9_2253;
float l9_2258=0.0;
float l9_2259=1.0;
bool l9_2260=l9_2255;
float l9_2261=l9_2256;
float l9_2262=fast::clamp(l9_2257,l9_2258,l9_2259);
float l9_2263=step(abs(l9_2257-l9_2262),9.9999997e-06);
l9_2261*=(l9_2263+((1.0-float(l9_2260))*(1.0-l9_2263)));
l9_2257=l9_2262;
l9_2253=l9_2257;
l9_2256=l9_2261;
}
l9_2197.y=l9_2253;
l9_2207=l9_2256;
float2 l9_2264=l9_2197;
int l9_2265=l9_2195;
int l9_2266=l9_2196;
float l9_2267=l9_2205;
float2 l9_2268=l9_2264;
int l9_2269=l9_2265;
int l9_2270=l9_2266;
float3 l9_2271=float3(0.0);
if (l9_2269==0)
{
l9_2271=float3(l9_2268,0.0);
}
else
{
if (l9_2269==1)
{
l9_2271=float3(l9_2268.x,(l9_2268.y*0.5)+(0.5-(float(l9_2270)*0.5)),0.0);
}
else
{
l9_2271=float3(l9_2268,float(l9_2270));
}
}
float3 l9_2272=l9_2271;
float3 l9_2273=l9_2272;
float2 l9_2274=l9_2273.xy;
float l9_2275=l9_2267;
float4 l9_2276=sc_set0.emissiveTex.sample(sc_set0.emissiveTexSmpSC,l9_2274,bias(l9_2275));
float4 l9_2277=l9_2276;
float4 l9_2278=l9_2277;
if (l9_2203)
{
l9_2278=mix(l9_2204,l9_2278,float4(l9_2207));
}
float4 l9_2279=l9_2278;
l9_2188=l9_2279;
l9_1975=l9_2188;
l9_1978=l9_1975;
}
else
{
l9_1978=l9_1976;
}
l9_1974=l9_1978;
float3 l9_2280=float3(0.0);
l9_2280=l9_1973.xyz+l9_1974.xyz;
param_9=l9_2280;
param_11=param_9;
}
else
{
float4 l9_2281=float4(0.0);
float4 l9_2282=float4(0.0);
float4 l9_2283=(*sc_set0.UserUniforms).Port_Default_N132;
ssGlobals l9_2284=param_12;
float4 l9_2285;
if ((int(Tweak_N223_tmp)!=0))
{
float2 l9_2286=float2(0.0);
float2 l9_2287=float2(0.0);
float2 l9_2288=float2(0.0);
float2 l9_2289=float2(0.0);
float2 l9_2290=float2(0.0);
float2 l9_2291=float2(0.0);
ssGlobals l9_2292=l9_2284;
float2 l9_2293;
if (NODE_76_DROPLIST_ITEM_tmp==0)
{
float2 l9_2294=float2(0.0);
l9_2294=l9_2292.Surface_UVCoord0;
l9_2287=l9_2294;
l9_2293=l9_2287;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==1)
{
float2 l9_2295=float2(0.0);
l9_2295=l9_2292.Surface_UVCoord1;
l9_2288=l9_2295;
l9_2293=l9_2288;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==2)
{
float2 l9_2296=float2(0.0);
l9_2296=l9_2292.Surface_UVCoord0;
float2 l9_2297=float2(0.0);
float2 l9_2298=float2(0.0);
float2 l9_2299=float2(0.0);
ssGlobals l9_2300=l9_2292;
float2 l9_2301;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2302=float2(0.0);
float2 l9_2303=float2(0.0);
float2 l9_2304=float2(0.0);
float2 l9_2305=float2(0.0);
float2 l9_2306=float2(0.0);
ssGlobals l9_2307=l9_2300;
float2 l9_2308;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2309=float2(0.0);
l9_2309=l9_2307.Surface_UVCoord0;
l9_2303=l9_2309;
l9_2308=l9_2303;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2310=float2(0.0);
l9_2310=l9_2307.Surface_UVCoord1;
l9_2304=l9_2310;
l9_2308=l9_2304;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2311=float2(0.0);
l9_2311=l9_2307.gScreenCoord;
l9_2305=l9_2311;
l9_2308=l9_2305;
}
else
{
float2 l9_2312=float2(0.0);
l9_2312=l9_2307.Surface_UVCoord0;
l9_2306=l9_2312;
l9_2308=l9_2306;
}
}
}
l9_2302=l9_2308;
float2 l9_2313=float2(0.0);
float2 l9_2314=(*sc_set0.UserUniforms).uv2Scale;
l9_2313=l9_2314;
float2 l9_2315=float2(0.0);
l9_2315=l9_2313;
float2 l9_2316=float2(0.0);
float2 l9_2317=(*sc_set0.UserUniforms).uv2Offset;
l9_2316=l9_2317;
float2 l9_2318=float2(0.0);
l9_2318=l9_2316;
float2 l9_2319=float2(0.0);
l9_2319=(l9_2302*l9_2315)+l9_2318;
float2 l9_2320=float2(0.0);
l9_2320=l9_2319+(l9_2318*(l9_2300.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2298=l9_2320;
l9_2301=l9_2298;
}
else
{
float2 l9_2321=float2(0.0);
float2 l9_2322=float2(0.0);
float2 l9_2323=float2(0.0);
float2 l9_2324=float2(0.0);
float2 l9_2325=float2(0.0);
ssGlobals l9_2326=l9_2300;
float2 l9_2327;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2328=float2(0.0);
l9_2328=l9_2326.Surface_UVCoord0;
l9_2322=l9_2328;
l9_2327=l9_2322;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2329=float2(0.0);
l9_2329=l9_2326.Surface_UVCoord1;
l9_2323=l9_2329;
l9_2327=l9_2323;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2330=float2(0.0);
l9_2330=l9_2326.gScreenCoord;
l9_2324=l9_2330;
l9_2327=l9_2324;
}
else
{
float2 l9_2331=float2(0.0);
l9_2331=l9_2326.Surface_UVCoord0;
l9_2325=l9_2331;
l9_2327=l9_2325;
}
}
}
l9_2321=l9_2327;
float2 l9_2332=float2(0.0);
float2 l9_2333=(*sc_set0.UserUniforms).uv2Scale;
l9_2332=l9_2333;
float2 l9_2334=float2(0.0);
l9_2334=l9_2332;
float2 l9_2335=float2(0.0);
float2 l9_2336=(*sc_set0.UserUniforms).uv2Offset;
l9_2335=l9_2336;
float2 l9_2337=float2(0.0);
l9_2337=l9_2335;
float2 l9_2338=float2(0.0);
l9_2338=(l9_2321*l9_2334)+l9_2337;
l9_2299=l9_2338;
l9_2301=l9_2299;
}
l9_2297=l9_2301;
float l9_2339=0.0;
float l9_2340;
if ((int(Tweak_N67_tmp)!=0))
{
l9_2340=1.001;
}
else
{
l9_2340=0.001;
}
l9_2340-=0.001;
l9_2339=l9_2340;
float l9_2341=0.0;
l9_2341=l9_2339;
float2 l9_2342=float2(0.0);
l9_2342=mix(l9_2296,l9_2297,float2(l9_2341));
float2 l9_2343=float2(0.0);
l9_2343=l9_2342;
float2 l9_2344=float2(0.0);
l9_2344=l9_2343;
l9_2289=l9_2344;
l9_2293=l9_2289;
}
else
{
if (NODE_76_DROPLIST_ITEM_tmp==3)
{
float2 l9_2345=float2(0.0);
l9_2345=l9_2292.Surface_UVCoord0;
float2 l9_2346=float2(0.0);
float2 l9_2347=float2(0.0);
float2 l9_2348=float2(0.0);
ssGlobals l9_2349=l9_2292;
float2 l9_2350;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_2351=float2(0.0);
float2 l9_2352=float2(0.0);
float2 l9_2353=float2(0.0);
float2 l9_2354=float2(0.0);
float2 l9_2355=float2(0.0);
float2 l9_2356=float2(0.0);
ssGlobals l9_2357=l9_2349;
float2 l9_2358;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2359=float2(0.0);
l9_2359=l9_2357.Surface_UVCoord0;
l9_2352=l9_2359;
l9_2358=l9_2352;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2360=float2(0.0);
l9_2360=l9_2357.Surface_UVCoord1;
l9_2353=l9_2360;
l9_2358=l9_2353;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2361=float2(0.0);
l9_2361=l9_2357.gScreenCoord;
l9_2354=l9_2361;
l9_2358=l9_2354;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2362=float2(0.0);
l9_2362=l9_2357.Surface_UVCoord0;
float2 l9_2363=float2(0.0);
float2 l9_2364=float2(0.0);
float2 l9_2365=float2(0.0);
ssGlobals l9_2366=l9_2357;
float2 l9_2367;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2368=float2(0.0);
float2 l9_2369=float2(0.0);
float2 l9_2370=float2(0.0);
float2 l9_2371=float2(0.0);
float2 l9_2372=float2(0.0);
ssGlobals l9_2373=l9_2366;
float2 l9_2374;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2375=float2(0.0);
l9_2375=l9_2373.Surface_UVCoord0;
l9_2369=l9_2375;
l9_2374=l9_2369;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2376=float2(0.0);
l9_2376=l9_2373.Surface_UVCoord1;
l9_2370=l9_2376;
l9_2374=l9_2370;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2377=float2(0.0);
l9_2377=l9_2373.gScreenCoord;
l9_2371=l9_2377;
l9_2374=l9_2371;
}
else
{
float2 l9_2378=float2(0.0);
l9_2378=l9_2373.Surface_UVCoord0;
l9_2372=l9_2378;
l9_2374=l9_2372;
}
}
}
l9_2368=l9_2374;
float2 l9_2379=float2(0.0);
float2 l9_2380=(*sc_set0.UserUniforms).uv2Scale;
l9_2379=l9_2380;
float2 l9_2381=float2(0.0);
l9_2381=l9_2379;
float2 l9_2382=float2(0.0);
float2 l9_2383=(*sc_set0.UserUniforms).uv2Offset;
l9_2382=l9_2383;
float2 l9_2384=float2(0.0);
l9_2384=l9_2382;
float2 l9_2385=float2(0.0);
l9_2385=(l9_2368*l9_2381)+l9_2384;
float2 l9_2386=float2(0.0);
l9_2386=l9_2385+(l9_2384*(l9_2366.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2364=l9_2386;
l9_2367=l9_2364;
}
else
{
float2 l9_2387=float2(0.0);
float2 l9_2388=float2(0.0);
float2 l9_2389=float2(0.0);
float2 l9_2390=float2(0.0);
float2 l9_2391=float2(0.0);
ssGlobals l9_2392=l9_2366;
float2 l9_2393;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2394=float2(0.0);
l9_2394=l9_2392.Surface_UVCoord0;
l9_2388=l9_2394;
l9_2393=l9_2388;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2395=float2(0.0);
l9_2395=l9_2392.Surface_UVCoord1;
l9_2389=l9_2395;
l9_2393=l9_2389;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2396=float2(0.0);
l9_2396=l9_2392.gScreenCoord;
l9_2390=l9_2396;
l9_2393=l9_2390;
}
else
{
float2 l9_2397=float2(0.0);
l9_2397=l9_2392.Surface_UVCoord0;
l9_2391=l9_2397;
l9_2393=l9_2391;
}
}
}
l9_2387=l9_2393;
float2 l9_2398=float2(0.0);
float2 l9_2399=(*sc_set0.UserUniforms).uv2Scale;
l9_2398=l9_2399;
float2 l9_2400=float2(0.0);
l9_2400=l9_2398;
float2 l9_2401=float2(0.0);
float2 l9_2402=(*sc_set0.UserUniforms).uv2Offset;
l9_2401=l9_2402;
float2 l9_2403=float2(0.0);
l9_2403=l9_2401;
float2 l9_2404=float2(0.0);
l9_2404=(l9_2387*l9_2400)+l9_2403;
l9_2365=l9_2404;
l9_2367=l9_2365;
}
l9_2363=l9_2367;
float l9_2405=0.0;
float l9_2406;
if ((int(Tweak_N67_tmp)!=0))
{
l9_2406=1.001;
}
else
{
l9_2406=0.001;
}
l9_2406-=0.001;
l9_2405=l9_2406;
float l9_2407=0.0;
l9_2407=l9_2405;
float2 l9_2408=float2(0.0);
l9_2408=mix(l9_2362,l9_2363,float2(l9_2407));
float2 l9_2409=float2(0.0);
l9_2409=l9_2408;
float2 l9_2410=float2(0.0);
l9_2410=l9_2409;
l9_2355=l9_2410;
l9_2358=l9_2355;
}
else
{
float2 l9_2411=float2(0.0);
l9_2411=l9_2357.Surface_UVCoord0;
l9_2356=l9_2411;
l9_2358=l9_2356;
}
}
}
}
l9_2351=l9_2358;
float2 l9_2412=float2(0.0);
float2 l9_2413=(*sc_set0.UserUniforms).uv3Scale;
l9_2412=l9_2413;
float2 l9_2414=float2(0.0);
l9_2414=l9_2412;
float2 l9_2415=float2(0.0);
float2 l9_2416=(*sc_set0.UserUniforms).uv3Offset;
l9_2415=l9_2416;
float2 l9_2417=float2(0.0);
l9_2417=l9_2415;
float2 l9_2418=float2(0.0);
l9_2418=(l9_2351*l9_2414)+l9_2417;
float2 l9_2419=float2(0.0);
l9_2419=l9_2418+(l9_2417*(l9_2349.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2347=l9_2419;
l9_2350=l9_2347;
}
else
{
float2 l9_2420=float2(0.0);
float2 l9_2421=float2(0.0);
float2 l9_2422=float2(0.0);
float2 l9_2423=float2(0.0);
float2 l9_2424=float2(0.0);
float2 l9_2425=float2(0.0);
ssGlobals l9_2426=l9_2349;
float2 l9_2427;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2428=float2(0.0);
l9_2428=l9_2426.Surface_UVCoord0;
l9_2421=l9_2428;
l9_2427=l9_2421;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2429=float2(0.0);
l9_2429=l9_2426.Surface_UVCoord1;
l9_2422=l9_2429;
l9_2427=l9_2422;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2430=float2(0.0);
l9_2430=l9_2426.gScreenCoord;
l9_2423=l9_2430;
l9_2427=l9_2423;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2431=float2(0.0);
l9_2431=l9_2426.Surface_UVCoord0;
float2 l9_2432=float2(0.0);
float2 l9_2433=float2(0.0);
float2 l9_2434=float2(0.0);
ssGlobals l9_2435=l9_2426;
float2 l9_2436;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2437=float2(0.0);
float2 l9_2438=float2(0.0);
float2 l9_2439=float2(0.0);
float2 l9_2440=float2(0.0);
float2 l9_2441=float2(0.0);
ssGlobals l9_2442=l9_2435;
float2 l9_2443;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2444=float2(0.0);
l9_2444=l9_2442.Surface_UVCoord0;
l9_2438=l9_2444;
l9_2443=l9_2438;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2445=float2(0.0);
l9_2445=l9_2442.Surface_UVCoord1;
l9_2439=l9_2445;
l9_2443=l9_2439;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2446=float2(0.0);
l9_2446=l9_2442.gScreenCoord;
l9_2440=l9_2446;
l9_2443=l9_2440;
}
else
{
float2 l9_2447=float2(0.0);
l9_2447=l9_2442.Surface_UVCoord0;
l9_2441=l9_2447;
l9_2443=l9_2441;
}
}
}
l9_2437=l9_2443;
float2 l9_2448=float2(0.0);
float2 l9_2449=(*sc_set0.UserUniforms).uv2Scale;
l9_2448=l9_2449;
float2 l9_2450=float2(0.0);
l9_2450=l9_2448;
float2 l9_2451=float2(0.0);
float2 l9_2452=(*sc_set0.UserUniforms).uv2Offset;
l9_2451=l9_2452;
float2 l9_2453=float2(0.0);
l9_2453=l9_2451;
float2 l9_2454=float2(0.0);
l9_2454=(l9_2437*l9_2450)+l9_2453;
float2 l9_2455=float2(0.0);
l9_2455=l9_2454+(l9_2453*(l9_2435.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2433=l9_2455;
l9_2436=l9_2433;
}
else
{
float2 l9_2456=float2(0.0);
float2 l9_2457=float2(0.0);
float2 l9_2458=float2(0.0);
float2 l9_2459=float2(0.0);
float2 l9_2460=float2(0.0);
ssGlobals l9_2461=l9_2435;
float2 l9_2462;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2463=float2(0.0);
l9_2463=l9_2461.Surface_UVCoord0;
l9_2457=l9_2463;
l9_2462=l9_2457;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2464=float2(0.0);
l9_2464=l9_2461.Surface_UVCoord1;
l9_2458=l9_2464;
l9_2462=l9_2458;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2465=float2(0.0);
l9_2465=l9_2461.gScreenCoord;
l9_2459=l9_2465;
l9_2462=l9_2459;
}
else
{
float2 l9_2466=float2(0.0);
l9_2466=l9_2461.Surface_UVCoord0;
l9_2460=l9_2466;
l9_2462=l9_2460;
}
}
}
l9_2456=l9_2462;
float2 l9_2467=float2(0.0);
float2 l9_2468=(*sc_set0.UserUniforms).uv2Scale;
l9_2467=l9_2468;
float2 l9_2469=float2(0.0);
l9_2469=l9_2467;
float2 l9_2470=float2(0.0);
float2 l9_2471=(*sc_set0.UserUniforms).uv2Offset;
l9_2470=l9_2471;
float2 l9_2472=float2(0.0);
l9_2472=l9_2470;
float2 l9_2473=float2(0.0);
l9_2473=(l9_2456*l9_2469)+l9_2472;
l9_2434=l9_2473;
l9_2436=l9_2434;
}
l9_2432=l9_2436;
float l9_2474=0.0;
float l9_2475;
if ((int(Tweak_N67_tmp)!=0))
{
l9_2475=1.001;
}
else
{
l9_2475=0.001;
}
l9_2475-=0.001;
l9_2474=l9_2475;
float l9_2476=0.0;
l9_2476=l9_2474;
float2 l9_2477=float2(0.0);
l9_2477=mix(l9_2431,l9_2432,float2(l9_2476));
float2 l9_2478=float2(0.0);
l9_2478=l9_2477;
float2 l9_2479=float2(0.0);
l9_2479=l9_2478;
l9_2424=l9_2479;
l9_2427=l9_2424;
}
else
{
float2 l9_2480=float2(0.0);
l9_2480=l9_2426.Surface_UVCoord0;
l9_2425=l9_2480;
l9_2427=l9_2425;
}
}
}
}
l9_2420=l9_2427;
float2 l9_2481=float2(0.0);
float2 l9_2482=(*sc_set0.UserUniforms).uv3Scale;
l9_2481=l9_2482;
float2 l9_2483=float2(0.0);
l9_2483=l9_2481;
float2 l9_2484=float2(0.0);
float2 l9_2485=(*sc_set0.UserUniforms).uv3Offset;
l9_2484=l9_2485;
float2 l9_2486=float2(0.0);
l9_2486=l9_2484;
float2 l9_2487=float2(0.0);
l9_2487=(l9_2420*l9_2483)+l9_2486;
l9_2348=l9_2487;
l9_2350=l9_2348;
}
l9_2346=l9_2350;
float l9_2488=0.0;
float l9_2489;
if ((int(Tweak_N11_tmp)!=0))
{
l9_2489=1.001;
}
else
{
l9_2489=0.001;
}
l9_2489-=0.001;
l9_2488=l9_2489;
float l9_2490=0.0;
l9_2490=l9_2488;
float2 l9_2491=float2(0.0);
l9_2491=mix(l9_2345,l9_2346,float2(l9_2490));
float2 l9_2492=float2(0.0);
l9_2492=l9_2491;
float2 l9_2493=float2(0.0);
l9_2493=l9_2492;
l9_2290=l9_2493;
l9_2293=l9_2290;
}
else
{
float2 l9_2494=float2(0.0);
l9_2494=l9_2292.Surface_UVCoord0;
l9_2291=l9_2494;
l9_2293=l9_2291;
}
}
}
}
l9_2286=l9_2293;
float4 l9_2495=float4(0.0);
int l9_2496=0;
if ((int(emissiveTexHasSwappedViews_tmp)!=0))
{
int l9_2497=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2497=0;
}
else
{
l9_2497=in.varStereoViewID;
}
int l9_2498=l9_2497;
l9_2496=1-l9_2498;
}
else
{
int l9_2499=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2499=0;
}
else
{
l9_2499=in.varStereoViewID;
}
int l9_2500=l9_2499;
l9_2496=l9_2500;
}
int l9_2501=l9_2496;
int l9_2502=emissiveTexLayout_tmp;
int l9_2503=l9_2501;
float2 l9_2504=l9_2286;
bool l9_2505=(int(SC_USE_UV_TRANSFORM_emissiveTex_tmp)!=0);
float3x3 l9_2506=(*sc_set0.UserUniforms).emissiveTexTransform;
int2 l9_2507=int2(SC_SOFTWARE_WRAP_MODE_U_emissiveTex_tmp,SC_SOFTWARE_WRAP_MODE_V_emissiveTex_tmp);
bool l9_2508=(int(SC_USE_UV_MIN_MAX_emissiveTex_tmp)!=0);
float4 l9_2509=(*sc_set0.UserUniforms).emissiveTexUvMinMax;
bool l9_2510=(int(SC_USE_CLAMP_TO_BORDER_emissiveTex_tmp)!=0);
float4 l9_2511=(*sc_set0.UserUniforms).emissiveTexBorderColor;
float l9_2512=0.0;
bool l9_2513=l9_2510&&(!l9_2508);
float l9_2514=1.0;
float l9_2515=l9_2504.x;
int l9_2516=l9_2507.x;
if (l9_2516==1)
{
l9_2515=fract(l9_2515);
}
else
{
if (l9_2516==2)
{
float l9_2517=fract(l9_2515);
float l9_2518=l9_2515-l9_2517;
float l9_2519=step(0.25,fract(l9_2518*0.5));
l9_2515=mix(l9_2517,1.0-l9_2517,fast::clamp(l9_2519,0.0,1.0));
}
}
l9_2504.x=l9_2515;
float l9_2520=l9_2504.y;
int l9_2521=l9_2507.y;
if (l9_2521==1)
{
l9_2520=fract(l9_2520);
}
else
{
if (l9_2521==2)
{
float l9_2522=fract(l9_2520);
float l9_2523=l9_2520-l9_2522;
float l9_2524=step(0.25,fract(l9_2523*0.5));
l9_2520=mix(l9_2522,1.0-l9_2522,fast::clamp(l9_2524,0.0,1.0));
}
}
l9_2504.y=l9_2520;
if (l9_2508)
{
bool l9_2525=l9_2510;
bool l9_2526;
if (l9_2525)
{
l9_2526=l9_2507.x==3;
}
else
{
l9_2526=l9_2525;
}
float l9_2527=l9_2504.x;
float l9_2528=l9_2509.x;
float l9_2529=l9_2509.z;
bool l9_2530=l9_2526;
float l9_2531=l9_2514;
float l9_2532=fast::clamp(l9_2527,l9_2528,l9_2529);
float l9_2533=step(abs(l9_2527-l9_2532),9.9999997e-06);
l9_2531*=(l9_2533+((1.0-float(l9_2530))*(1.0-l9_2533)));
l9_2527=l9_2532;
l9_2504.x=l9_2527;
l9_2514=l9_2531;
bool l9_2534=l9_2510;
bool l9_2535;
if (l9_2534)
{
l9_2535=l9_2507.y==3;
}
else
{
l9_2535=l9_2534;
}
float l9_2536=l9_2504.y;
float l9_2537=l9_2509.y;
float l9_2538=l9_2509.w;
bool l9_2539=l9_2535;
float l9_2540=l9_2514;
float l9_2541=fast::clamp(l9_2536,l9_2537,l9_2538);
float l9_2542=step(abs(l9_2536-l9_2541),9.9999997e-06);
l9_2540*=(l9_2542+((1.0-float(l9_2539))*(1.0-l9_2542)));
l9_2536=l9_2541;
l9_2504.y=l9_2536;
l9_2514=l9_2540;
}
float2 l9_2543=l9_2504;
bool l9_2544=l9_2505;
float3x3 l9_2545=l9_2506;
if (l9_2544)
{
l9_2543=float2((l9_2545*float3(l9_2543,1.0)).xy);
}
float2 l9_2546=l9_2543;
float2 l9_2547=l9_2546;
float2 l9_2548=l9_2547;
l9_2504=l9_2548;
float l9_2549=l9_2504.x;
int l9_2550=l9_2507.x;
bool l9_2551=l9_2513;
float l9_2552=l9_2514;
if ((l9_2550==0)||(l9_2550==3))
{
float l9_2553=l9_2549;
float l9_2554=0.0;
float l9_2555=1.0;
bool l9_2556=l9_2551;
float l9_2557=l9_2552;
float l9_2558=fast::clamp(l9_2553,l9_2554,l9_2555);
float l9_2559=step(abs(l9_2553-l9_2558),9.9999997e-06);
l9_2557*=(l9_2559+((1.0-float(l9_2556))*(1.0-l9_2559)));
l9_2553=l9_2558;
l9_2549=l9_2553;
l9_2552=l9_2557;
}
l9_2504.x=l9_2549;
l9_2514=l9_2552;
float l9_2560=l9_2504.y;
int l9_2561=l9_2507.y;
bool l9_2562=l9_2513;
float l9_2563=l9_2514;
if ((l9_2561==0)||(l9_2561==3))
{
float l9_2564=l9_2560;
float l9_2565=0.0;
float l9_2566=1.0;
bool l9_2567=l9_2562;
float l9_2568=l9_2563;
float l9_2569=fast::clamp(l9_2564,l9_2565,l9_2566);
float l9_2570=step(abs(l9_2564-l9_2569),9.9999997e-06);
l9_2568*=(l9_2570+((1.0-float(l9_2567))*(1.0-l9_2570)));
l9_2564=l9_2569;
l9_2560=l9_2564;
l9_2563=l9_2568;
}
l9_2504.y=l9_2560;
l9_2514=l9_2563;
float2 l9_2571=l9_2504;
int l9_2572=l9_2502;
int l9_2573=l9_2503;
float l9_2574=l9_2512;
float2 l9_2575=l9_2571;
int l9_2576=l9_2572;
int l9_2577=l9_2573;
float3 l9_2578=float3(0.0);
if (l9_2576==0)
{
l9_2578=float3(l9_2575,0.0);
}
else
{
if (l9_2576==1)
{
l9_2578=float3(l9_2575.x,(l9_2575.y*0.5)+(0.5-(float(l9_2577)*0.5)),0.0);
}
else
{
l9_2578=float3(l9_2575,float(l9_2577));
}
}
float3 l9_2579=l9_2578;
float3 l9_2580=l9_2579;
float2 l9_2581=l9_2580.xy;
float l9_2582=l9_2574;
float4 l9_2583=sc_set0.emissiveTex.sample(sc_set0.emissiveTexSmpSC,l9_2581,bias(l9_2582));
float4 l9_2584=l9_2583;
float4 l9_2585=l9_2584;
if (l9_2510)
{
l9_2585=mix(l9_2511,l9_2585,float4(l9_2514));
}
float4 l9_2586=l9_2585;
l9_2495=l9_2586;
l9_2282=l9_2495;
l9_2285=l9_2282;
}
else
{
l9_2285=l9_2283;
}
l9_2281=l9_2285;
param_10=l9_2281.xyz;
param_11=param_10;
}
Result_N294=param_11;
float3 Output_N236=float3(0.0);
float3 param_13=(*sc_set0.UserUniforms).emissiveColor;
Output_N236=param_13;
float3 Value_N295=float3(0.0);
Value_N295=Output_N236;
float Output_N233=0.0;
float param_14=(*sc_set0.UserUniforms).emissiveIntensity;
Output_N233=param_14;
float Value_N296=0.0;
Value_N296=Output_N233;
float3 Output_N297=float3(0.0);
Output_N297=(Result_N294*Value_N295)*float3(Value_N296);
float3 Output_N82=float3(0.0);
float3 param_15=Output_N297;
float3 l9_2587;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_2587=float3(pow(param_15.x,2.2),pow(param_15.y,2.2),pow(param_15.z,2.2));
}
else
{
l9_2587=param_15*param_15;
}
float3 l9_2588=l9_2587;
Output_N82=l9_2588;
float3 Result_N134=float3(0.0);
float3 param_16=float3(0.0);
float3 param_17=(*sc_set0.UserUniforms).Port_Default_N134;
ssGlobals param_19=Globals;
float3 param_18;
if ((int(Tweak_N179_tmp)!=0))
{
float l9_2589=0.0;
float l9_2590=(*sc_set0.UserUniforms).reflectionIntensity;
l9_2589=l9_2590;
float l9_2591=0.0;
l9_2591=l9_2589;
float3 l9_2592=float3(0.0);
l9_2592=param_19.ViewDirWS;
float3 l9_2593=float3(0.0);
float3 l9_2594=float3(0.0);
float3 l9_2595=float3(0.0);
ssGlobals l9_2596=param_19;
float3 l9_2597;
if ((int(Tweak_N354_tmp)!=0))
{
float3 l9_2598=float3(0.0);
l9_2598=l9_2596.VertexTangent_WorldSpace;
float3 l9_2599=float3(0.0);
l9_2599=l9_2596.VertexBinormal_WorldSpace;
float3 l9_2600=float3(0.0);
l9_2600=l9_2596.VertexNormal_WorldSpace;
float3x3 l9_2601=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_2601=float3x3(float3(l9_2598),float3(l9_2599),float3(l9_2600));
float2 l9_2602=float2(0.0);
float2 l9_2603=float2(0.0);
float2 l9_2604=float2(0.0);
float2 l9_2605=float2(0.0);
float2 l9_2606=float2(0.0);
float2 l9_2607=float2(0.0);
ssGlobals l9_2608=l9_2596;
float2 l9_2609;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_2610=float2(0.0);
l9_2610=l9_2608.Surface_UVCoord0;
l9_2603=l9_2610;
l9_2609=l9_2603;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_2611=float2(0.0);
l9_2611=l9_2608.Surface_UVCoord1;
l9_2604=l9_2611;
l9_2609=l9_2604;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_2612=float2(0.0);
l9_2612=l9_2608.Surface_UVCoord0;
float2 l9_2613=float2(0.0);
float2 l9_2614=float2(0.0);
float2 l9_2615=float2(0.0);
ssGlobals l9_2616=l9_2608;
float2 l9_2617;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2618=float2(0.0);
float2 l9_2619=float2(0.0);
float2 l9_2620=float2(0.0);
float2 l9_2621=float2(0.0);
float2 l9_2622=float2(0.0);
ssGlobals l9_2623=l9_2616;
float2 l9_2624;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2625=float2(0.0);
l9_2625=l9_2623.Surface_UVCoord0;
l9_2619=l9_2625;
l9_2624=l9_2619;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2626=float2(0.0);
l9_2626=l9_2623.Surface_UVCoord1;
l9_2620=l9_2626;
l9_2624=l9_2620;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2627=float2(0.0);
l9_2627=l9_2623.gScreenCoord;
l9_2621=l9_2627;
l9_2624=l9_2621;
}
else
{
float2 l9_2628=float2(0.0);
l9_2628=l9_2623.Surface_UVCoord0;
l9_2622=l9_2628;
l9_2624=l9_2622;
}
}
}
l9_2618=l9_2624;
float2 l9_2629=float2(0.0);
float2 l9_2630=(*sc_set0.UserUniforms).uv2Scale;
l9_2629=l9_2630;
float2 l9_2631=float2(0.0);
l9_2631=l9_2629;
float2 l9_2632=float2(0.0);
float2 l9_2633=(*sc_set0.UserUniforms).uv2Offset;
l9_2632=l9_2633;
float2 l9_2634=float2(0.0);
l9_2634=l9_2632;
float2 l9_2635=float2(0.0);
l9_2635=(l9_2618*l9_2631)+l9_2634;
float2 l9_2636=float2(0.0);
l9_2636=l9_2635+(l9_2634*(l9_2616.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2614=l9_2636;
l9_2617=l9_2614;
}
else
{
float2 l9_2637=float2(0.0);
float2 l9_2638=float2(0.0);
float2 l9_2639=float2(0.0);
float2 l9_2640=float2(0.0);
float2 l9_2641=float2(0.0);
ssGlobals l9_2642=l9_2616;
float2 l9_2643;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2644=float2(0.0);
l9_2644=l9_2642.Surface_UVCoord0;
l9_2638=l9_2644;
l9_2643=l9_2638;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2645=float2(0.0);
l9_2645=l9_2642.Surface_UVCoord1;
l9_2639=l9_2645;
l9_2643=l9_2639;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2646=float2(0.0);
l9_2646=l9_2642.gScreenCoord;
l9_2640=l9_2646;
l9_2643=l9_2640;
}
else
{
float2 l9_2647=float2(0.0);
l9_2647=l9_2642.Surface_UVCoord0;
l9_2641=l9_2647;
l9_2643=l9_2641;
}
}
}
l9_2637=l9_2643;
float2 l9_2648=float2(0.0);
float2 l9_2649=(*sc_set0.UserUniforms).uv2Scale;
l9_2648=l9_2649;
float2 l9_2650=float2(0.0);
l9_2650=l9_2648;
float2 l9_2651=float2(0.0);
float2 l9_2652=(*sc_set0.UserUniforms).uv2Offset;
l9_2651=l9_2652;
float2 l9_2653=float2(0.0);
l9_2653=l9_2651;
float2 l9_2654=float2(0.0);
l9_2654=(l9_2637*l9_2650)+l9_2653;
l9_2615=l9_2654;
l9_2617=l9_2615;
}
l9_2613=l9_2617;
float l9_2655=0.0;
float l9_2656;
if ((int(Tweak_N67_tmp)!=0))
{
l9_2656=1.001;
}
else
{
l9_2656=0.001;
}
l9_2656-=0.001;
l9_2655=l9_2656;
float l9_2657=0.0;
l9_2657=l9_2655;
float2 l9_2658=float2(0.0);
l9_2658=mix(l9_2612,l9_2613,float2(l9_2657));
float2 l9_2659=float2(0.0);
l9_2659=l9_2658;
float2 l9_2660=float2(0.0);
l9_2660=l9_2659;
l9_2605=l9_2660;
l9_2609=l9_2605;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_2661=float2(0.0);
l9_2661=l9_2608.Surface_UVCoord0;
float2 l9_2662=float2(0.0);
float2 l9_2663=float2(0.0);
float2 l9_2664=float2(0.0);
ssGlobals l9_2665=l9_2608;
float2 l9_2666;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_2667=float2(0.0);
float2 l9_2668=float2(0.0);
float2 l9_2669=float2(0.0);
float2 l9_2670=float2(0.0);
float2 l9_2671=float2(0.0);
float2 l9_2672=float2(0.0);
ssGlobals l9_2673=l9_2665;
float2 l9_2674;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2675=float2(0.0);
l9_2675=l9_2673.Surface_UVCoord0;
l9_2668=l9_2675;
l9_2674=l9_2668;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2676=float2(0.0);
l9_2676=l9_2673.Surface_UVCoord1;
l9_2669=l9_2676;
l9_2674=l9_2669;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2677=float2(0.0);
l9_2677=l9_2673.gScreenCoord;
l9_2670=l9_2677;
l9_2674=l9_2670;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2678=float2(0.0);
l9_2678=l9_2673.Surface_UVCoord0;
float2 l9_2679=float2(0.0);
float2 l9_2680=float2(0.0);
float2 l9_2681=float2(0.0);
ssGlobals l9_2682=l9_2673;
float2 l9_2683;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2684=float2(0.0);
float2 l9_2685=float2(0.0);
float2 l9_2686=float2(0.0);
float2 l9_2687=float2(0.0);
float2 l9_2688=float2(0.0);
ssGlobals l9_2689=l9_2682;
float2 l9_2690;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2691=float2(0.0);
l9_2691=l9_2689.Surface_UVCoord0;
l9_2685=l9_2691;
l9_2690=l9_2685;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2692=float2(0.0);
l9_2692=l9_2689.Surface_UVCoord1;
l9_2686=l9_2692;
l9_2690=l9_2686;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2693=float2(0.0);
l9_2693=l9_2689.gScreenCoord;
l9_2687=l9_2693;
l9_2690=l9_2687;
}
else
{
float2 l9_2694=float2(0.0);
l9_2694=l9_2689.Surface_UVCoord0;
l9_2688=l9_2694;
l9_2690=l9_2688;
}
}
}
l9_2684=l9_2690;
float2 l9_2695=float2(0.0);
float2 l9_2696=(*sc_set0.UserUniforms).uv2Scale;
l9_2695=l9_2696;
float2 l9_2697=float2(0.0);
l9_2697=l9_2695;
float2 l9_2698=float2(0.0);
float2 l9_2699=(*sc_set0.UserUniforms).uv2Offset;
l9_2698=l9_2699;
float2 l9_2700=float2(0.0);
l9_2700=l9_2698;
float2 l9_2701=float2(0.0);
l9_2701=(l9_2684*l9_2697)+l9_2700;
float2 l9_2702=float2(0.0);
l9_2702=l9_2701+(l9_2700*(l9_2682.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2680=l9_2702;
l9_2683=l9_2680;
}
else
{
float2 l9_2703=float2(0.0);
float2 l9_2704=float2(0.0);
float2 l9_2705=float2(0.0);
float2 l9_2706=float2(0.0);
float2 l9_2707=float2(0.0);
ssGlobals l9_2708=l9_2682;
float2 l9_2709;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2710=float2(0.0);
l9_2710=l9_2708.Surface_UVCoord0;
l9_2704=l9_2710;
l9_2709=l9_2704;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2711=float2(0.0);
l9_2711=l9_2708.Surface_UVCoord1;
l9_2705=l9_2711;
l9_2709=l9_2705;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2712=float2(0.0);
l9_2712=l9_2708.gScreenCoord;
l9_2706=l9_2712;
l9_2709=l9_2706;
}
else
{
float2 l9_2713=float2(0.0);
l9_2713=l9_2708.Surface_UVCoord0;
l9_2707=l9_2713;
l9_2709=l9_2707;
}
}
}
l9_2703=l9_2709;
float2 l9_2714=float2(0.0);
float2 l9_2715=(*sc_set0.UserUniforms).uv2Scale;
l9_2714=l9_2715;
float2 l9_2716=float2(0.0);
l9_2716=l9_2714;
float2 l9_2717=float2(0.0);
float2 l9_2718=(*sc_set0.UserUniforms).uv2Offset;
l9_2717=l9_2718;
float2 l9_2719=float2(0.0);
l9_2719=l9_2717;
float2 l9_2720=float2(0.0);
l9_2720=(l9_2703*l9_2716)+l9_2719;
l9_2681=l9_2720;
l9_2683=l9_2681;
}
l9_2679=l9_2683;
float l9_2721=0.0;
float l9_2722;
if ((int(Tweak_N67_tmp)!=0))
{
l9_2722=1.001;
}
else
{
l9_2722=0.001;
}
l9_2722-=0.001;
l9_2721=l9_2722;
float l9_2723=0.0;
l9_2723=l9_2721;
float2 l9_2724=float2(0.0);
l9_2724=mix(l9_2678,l9_2679,float2(l9_2723));
float2 l9_2725=float2(0.0);
l9_2725=l9_2724;
float2 l9_2726=float2(0.0);
l9_2726=l9_2725;
l9_2671=l9_2726;
l9_2674=l9_2671;
}
else
{
float2 l9_2727=float2(0.0);
l9_2727=l9_2673.Surface_UVCoord0;
l9_2672=l9_2727;
l9_2674=l9_2672;
}
}
}
}
l9_2667=l9_2674;
float2 l9_2728=float2(0.0);
float2 l9_2729=(*sc_set0.UserUniforms).uv3Scale;
l9_2728=l9_2729;
float2 l9_2730=float2(0.0);
l9_2730=l9_2728;
float2 l9_2731=float2(0.0);
float2 l9_2732=(*sc_set0.UserUniforms).uv3Offset;
l9_2731=l9_2732;
float2 l9_2733=float2(0.0);
l9_2733=l9_2731;
float2 l9_2734=float2(0.0);
l9_2734=(l9_2667*l9_2730)+l9_2733;
float2 l9_2735=float2(0.0);
l9_2735=l9_2734+(l9_2733*(l9_2665.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2663=l9_2735;
l9_2666=l9_2663;
}
else
{
float2 l9_2736=float2(0.0);
float2 l9_2737=float2(0.0);
float2 l9_2738=float2(0.0);
float2 l9_2739=float2(0.0);
float2 l9_2740=float2(0.0);
float2 l9_2741=float2(0.0);
ssGlobals l9_2742=l9_2665;
float2 l9_2743;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2744=float2(0.0);
l9_2744=l9_2742.Surface_UVCoord0;
l9_2737=l9_2744;
l9_2743=l9_2737;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2745=float2(0.0);
l9_2745=l9_2742.Surface_UVCoord1;
l9_2738=l9_2745;
l9_2743=l9_2738;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2746=float2(0.0);
l9_2746=l9_2742.gScreenCoord;
l9_2739=l9_2746;
l9_2743=l9_2739;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2747=float2(0.0);
l9_2747=l9_2742.Surface_UVCoord0;
float2 l9_2748=float2(0.0);
float2 l9_2749=float2(0.0);
float2 l9_2750=float2(0.0);
ssGlobals l9_2751=l9_2742;
float2 l9_2752;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2753=float2(0.0);
float2 l9_2754=float2(0.0);
float2 l9_2755=float2(0.0);
float2 l9_2756=float2(0.0);
float2 l9_2757=float2(0.0);
ssGlobals l9_2758=l9_2751;
float2 l9_2759;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2760=float2(0.0);
l9_2760=l9_2758.Surface_UVCoord0;
l9_2754=l9_2760;
l9_2759=l9_2754;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2761=float2(0.0);
l9_2761=l9_2758.Surface_UVCoord1;
l9_2755=l9_2761;
l9_2759=l9_2755;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2762=float2(0.0);
l9_2762=l9_2758.gScreenCoord;
l9_2756=l9_2762;
l9_2759=l9_2756;
}
else
{
float2 l9_2763=float2(0.0);
l9_2763=l9_2758.Surface_UVCoord0;
l9_2757=l9_2763;
l9_2759=l9_2757;
}
}
}
l9_2753=l9_2759;
float2 l9_2764=float2(0.0);
float2 l9_2765=(*sc_set0.UserUniforms).uv2Scale;
l9_2764=l9_2765;
float2 l9_2766=float2(0.0);
l9_2766=l9_2764;
float2 l9_2767=float2(0.0);
float2 l9_2768=(*sc_set0.UserUniforms).uv2Offset;
l9_2767=l9_2768;
float2 l9_2769=float2(0.0);
l9_2769=l9_2767;
float2 l9_2770=float2(0.0);
l9_2770=(l9_2753*l9_2766)+l9_2769;
float2 l9_2771=float2(0.0);
l9_2771=l9_2770+(l9_2769*(l9_2751.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2749=l9_2771;
l9_2752=l9_2749;
}
else
{
float2 l9_2772=float2(0.0);
float2 l9_2773=float2(0.0);
float2 l9_2774=float2(0.0);
float2 l9_2775=float2(0.0);
float2 l9_2776=float2(0.0);
ssGlobals l9_2777=l9_2751;
float2 l9_2778;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2779=float2(0.0);
l9_2779=l9_2777.Surface_UVCoord0;
l9_2773=l9_2779;
l9_2778=l9_2773;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2780=float2(0.0);
l9_2780=l9_2777.Surface_UVCoord1;
l9_2774=l9_2780;
l9_2778=l9_2774;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2781=float2(0.0);
l9_2781=l9_2777.gScreenCoord;
l9_2775=l9_2781;
l9_2778=l9_2775;
}
else
{
float2 l9_2782=float2(0.0);
l9_2782=l9_2777.Surface_UVCoord0;
l9_2776=l9_2782;
l9_2778=l9_2776;
}
}
}
l9_2772=l9_2778;
float2 l9_2783=float2(0.0);
float2 l9_2784=(*sc_set0.UserUniforms).uv2Scale;
l9_2783=l9_2784;
float2 l9_2785=float2(0.0);
l9_2785=l9_2783;
float2 l9_2786=float2(0.0);
float2 l9_2787=(*sc_set0.UserUniforms).uv2Offset;
l9_2786=l9_2787;
float2 l9_2788=float2(0.0);
l9_2788=l9_2786;
float2 l9_2789=float2(0.0);
l9_2789=(l9_2772*l9_2785)+l9_2788;
l9_2750=l9_2789;
l9_2752=l9_2750;
}
l9_2748=l9_2752;
float l9_2790=0.0;
float l9_2791;
if ((int(Tweak_N67_tmp)!=0))
{
l9_2791=1.001;
}
else
{
l9_2791=0.001;
}
l9_2791-=0.001;
l9_2790=l9_2791;
float l9_2792=0.0;
l9_2792=l9_2790;
float2 l9_2793=float2(0.0);
l9_2793=mix(l9_2747,l9_2748,float2(l9_2792));
float2 l9_2794=float2(0.0);
l9_2794=l9_2793;
float2 l9_2795=float2(0.0);
l9_2795=l9_2794;
l9_2740=l9_2795;
l9_2743=l9_2740;
}
else
{
float2 l9_2796=float2(0.0);
l9_2796=l9_2742.Surface_UVCoord0;
l9_2741=l9_2796;
l9_2743=l9_2741;
}
}
}
}
l9_2736=l9_2743;
float2 l9_2797=float2(0.0);
float2 l9_2798=(*sc_set0.UserUniforms).uv3Scale;
l9_2797=l9_2798;
float2 l9_2799=float2(0.0);
l9_2799=l9_2797;
float2 l9_2800=float2(0.0);
float2 l9_2801=(*sc_set0.UserUniforms).uv3Offset;
l9_2800=l9_2801;
float2 l9_2802=float2(0.0);
l9_2802=l9_2800;
float2 l9_2803=float2(0.0);
l9_2803=(l9_2736*l9_2799)+l9_2802;
l9_2664=l9_2803;
l9_2666=l9_2664;
}
l9_2662=l9_2666;
float l9_2804=0.0;
float l9_2805;
if ((int(Tweak_N11_tmp)!=0))
{
l9_2805=1.001;
}
else
{
l9_2805=0.001;
}
l9_2805-=0.001;
l9_2804=l9_2805;
float l9_2806=0.0;
l9_2806=l9_2804;
float2 l9_2807=float2(0.0);
l9_2807=mix(l9_2661,l9_2662,float2(l9_2806));
float2 l9_2808=float2(0.0);
l9_2808=l9_2807;
float2 l9_2809=float2(0.0);
l9_2809=l9_2808;
l9_2606=l9_2809;
l9_2609=l9_2606;
}
else
{
float2 l9_2810=float2(0.0);
l9_2810=l9_2608.Surface_UVCoord0;
l9_2607=l9_2810;
l9_2609=l9_2607;
}
}
}
}
l9_2602=l9_2609;
float4 l9_2811=float4(0.0);
float2 l9_2812=l9_2602;
int l9_2813=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_2814=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2814=0;
}
else
{
l9_2814=in.varStereoViewID;
}
int l9_2815=l9_2814;
l9_2813=1-l9_2815;
}
else
{
int l9_2816=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_2816=0;
}
else
{
l9_2816=in.varStereoViewID;
}
int l9_2817=l9_2816;
l9_2813=l9_2817;
}
int l9_2818=l9_2813;
int l9_2819=normalTexLayout_tmp;
int l9_2820=l9_2818;
float2 l9_2821=l9_2812;
bool l9_2822=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_2823=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_2824=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_2825=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_2826=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_2827=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_2828=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_2829=0.0;
bool l9_2830=l9_2827&&(!l9_2825);
float l9_2831=1.0;
float l9_2832=l9_2821.x;
int l9_2833=l9_2824.x;
if (l9_2833==1)
{
l9_2832=fract(l9_2832);
}
else
{
if (l9_2833==2)
{
float l9_2834=fract(l9_2832);
float l9_2835=l9_2832-l9_2834;
float l9_2836=step(0.25,fract(l9_2835*0.5));
l9_2832=mix(l9_2834,1.0-l9_2834,fast::clamp(l9_2836,0.0,1.0));
}
}
l9_2821.x=l9_2832;
float l9_2837=l9_2821.y;
int l9_2838=l9_2824.y;
if (l9_2838==1)
{
l9_2837=fract(l9_2837);
}
else
{
if (l9_2838==2)
{
float l9_2839=fract(l9_2837);
float l9_2840=l9_2837-l9_2839;
float l9_2841=step(0.25,fract(l9_2840*0.5));
l9_2837=mix(l9_2839,1.0-l9_2839,fast::clamp(l9_2841,0.0,1.0));
}
}
l9_2821.y=l9_2837;
if (l9_2825)
{
bool l9_2842=l9_2827;
bool l9_2843;
if (l9_2842)
{
l9_2843=l9_2824.x==3;
}
else
{
l9_2843=l9_2842;
}
float l9_2844=l9_2821.x;
float l9_2845=l9_2826.x;
float l9_2846=l9_2826.z;
bool l9_2847=l9_2843;
float l9_2848=l9_2831;
float l9_2849=fast::clamp(l9_2844,l9_2845,l9_2846);
float l9_2850=step(abs(l9_2844-l9_2849),9.9999997e-06);
l9_2848*=(l9_2850+((1.0-float(l9_2847))*(1.0-l9_2850)));
l9_2844=l9_2849;
l9_2821.x=l9_2844;
l9_2831=l9_2848;
bool l9_2851=l9_2827;
bool l9_2852;
if (l9_2851)
{
l9_2852=l9_2824.y==3;
}
else
{
l9_2852=l9_2851;
}
float l9_2853=l9_2821.y;
float l9_2854=l9_2826.y;
float l9_2855=l9_2826.w;
bool l9_2856=l9_2852;
float l9_2857=l9_2831;
float l9_2858=fast::clamp(l9_2853,l9_2854,l9_2855);
float l9_2859=step(abs(l9_2853-l9_2858),9.9999997e-06);
l9_2857*=(l9_2859+((1.0-float(l9_2856))*(1.0-l9_2859)));
l9_2853=l9_2858;
l9_2821.y=l9_2853;
l9_2831=l9_2857;
}
float2 l9_2860=l9_2821;
bool l9_2861=l9_2822;
float3x3 l9_2862=l9_2823;
if (l9_2861)
{
l9_2860=float2((l9_2862*float3(l9_2860,1.0)).xy);
}
float2 l9_2863=l9_2860;
float2 l9_2864=l9_2863;
float2 l9_2865=l9_2864;
l9_2821=l9_2865;
float l9_2866=l9_2821.x;
int l9_2867=l9_2824.x;
bool l9_2868=l9_2830;
float l9_2869=l9_2831;
if ((l9_2867==0)||(l9_2867==3))
{
float l9_2870=l9_2866;
float l9_2871=0.0;
float l9_2872=1.0;
bool l9_2873=l9_2868;
float l9_2874=l9_2869;
float l9_2875=fast::clamp(l9_2870,l9_2871,l9_2872);
float l9_2876=step(abs(l9_2870-l9_2875),9.9999997e-06);
l9_2874*=(l9_2876+((1.0-float(l9_2873))*(1.0-l9_2876)));
l9_2870=l9_2875;
l9_2866=l9_2870;
l9_2869=l9_2874;
}
l9_2821.x=l9_2866;
l9_2831=l9_2869;
float l9_2877=l9_2821.y;
int l9_2878=l9_2824.y;
bool l9_2879=l9_2830;
float l9_2880=l9_2831;
if ((l9_2878==0)||(l9_2878==3))
{
float l9_2881=l9_2877;
float l9_2882=0.0;
float l9_2883=1.0;
bool l9_2884=l9_2879;
float l9_2885=l9_2880;
float l9_2886=fast::clamp(l9_2881,l9_2882,l9_2883);
float l9_2887=step(abs(l9_2881-l9_2886),9.9999997e-06);
l9_2885*=(l9_2887+((1.0-float(l9_2884))*(1.0-l9_2887)));
l9_2881=l9_2886;
l9_2877=l9_2881;
l9_2880=l9_2885;
}
l9_2821.y=l9_2877;
l9_2831=l9_2880;
float2 l9_2888=l9_2821;
int l9_2889=l9_2819;
int l9_2890=l9_2820;
float l9_2891=l9_2829;
float2 l9_2892=l9_2888;
int l9_2893=l9_2889;
int l9_2894=l9_2890;
float3 l9_2895=float3(0.0);
if (l9_2893==0)
{
l9_2895=float3(l9_2892,0.0);
}
else
{
if (l9_2893==1)
{
l9_2895=float3(l9_2892.x,(l9_2892.y*0.5)+(0.5-(float(l9_2894)*0.5)),0.0);
}
else
{
l9_2895=float3(l9_2892,float(l9_2894));
}
}
float3 l9_2896=l9_2895;
float3 l9_2897=l9_2896;
float2 l9_2898=l9_2897.xy;
float l9_2899=l9_2891;
float4 l9_2900=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_2898,bias(l9_2899));
float4 l9_2901=l9_2900;
float4 l9_2902=l9_2901;
if (l9_2827)
{
l9_2902=mix(l9_2828,l9_2902,float4(l9_2831));
}
float4 l9_2903=l9_2902;
float4 l9_2904=l9_2903;
float3 l9_2905=(l9_2904.xyz*1.9921875)-float3(1.0);
l9_2904=float4(l9_2905.x,l9_2905.y,l9_2905.z,l9_2904.w);
l9_2811=l9_2904;
float3 l9_2906=float3(0.0);
float3 l9_2907=float3(0.0);
float3 l9_2908=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_2909=l9_2596;
float3 l9_2910;
if ((int(Tweak_N218_tmp)!=0))
{
float2 l9_2911=float2(0.0);
float2 l9_2912=float2(0.0);
float2 l9_2913=float2(0.0);
float2 l9_2914=float2(0.0);
float2 l9_2915=float2(0.0);
float2 l9_2916=float2(0.0);
ssGlobals l9_2917=l9_2909;
float2 l9_2918;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_2919=float2(0.0);
l9_2919=l9_2917.Surface_UVCoord0;
l9_2912=l9_2919;
l9_2918=l9_2912;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_2920=float2(0.0);
l9_2920=l9_2917.Surface_UVCoord1;
l9_2913=l9_2920;
l9_2918=l9_2913;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_2921=float2(0.0);
l9_2921=l9_2917.Surface_UVCoord0;
float2 l9_2922=float2(0.0);
float2 l9_2923=float2(0.0);
float2 l9_2924=float2(0.0);
ssGlobals l9_2925=l9_2917;
float2 l9_2926;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2927=float2(0.0);
float2 l9_2928=float2(0.0);
float2 l9_2929=float2(0.0);
float2 l9_2930=float2(0.0);
float2 l9_2931=float2(0.0);
ssGlobals l9_2932=l9_2925;
float2 l9_2933;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2934=float2(0.0);
l9_2934=l9_2932.Surface_UVCoord0;
l9_2928=l9_2934;
l9_2933=l9_2928;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2935=float2(0.0);
l9_2935=l9_2932.Surface_UVCoord1;
l9_2929=l9_2935;
l9_2933=l9_2929;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2936=float2(0.0);
l9_2936=l9_2932.gScreenCoord;
l9_2930=l9_2936;
l9_2933=l9_2930;
}
else
{
float2 l9_2937=float2(0.0);
l9_2937=l9_2932.Surface_UVCoord0;
l9_2931=l9_2937;
l9_2933=l9_2931;
}
}
}
l9_2927=l9_2933;
float2 l9_2938=float2(0.0);
float2 l9_2939=(*sc_set0.UserUniforms).uv2Scale;
l9_2938=l9_2939;
float2 l9_2940=float2(0.0);
l9_2940=l9_2938;
float2 l9_2941=float2(0.0);
float2 l9_2942=(*sc_set0.UserUniforms).uv2Offset;
l9_2941=l9_2942;
float2 l9_2943=float2(0.0);
l9_2943=l9_2941;
float2 l9_2944=float2(0.0);
l9_2944=(l9_2927*l9_2940)+l9_2943;
float2 l9_2945=float2(0.0);
l9_2945=l9_2944+(l9_2943*(l9_2925.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2923=l9_2945;
l9_2926=l9_2923;
}
else
{
float2 l9_2946=float2(0.0);
float2 l9_2947=float2(0.0);
float2 l9_2948=float2(0.0);
float2 l9_2949=float2(0.0);
float2 l9_2950=float2(0.0);
ssGlobals l9_2951=l9_2925;
float2 l9_2952;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_2953=float2(0.0);
l9_2953=l9_2951.Surface_UVCoord0;
l9_2947=l9_2953;
l9_2952=l9_2947;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_2954=float2(0.0);
l9_2954=l9_2951.Surface_UVCoord1;
l9_2948=l9_2954;
l9_2952=l9_2948;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_2955=float2(0.0);
l9_2955=l9_2951.gScreenCoord;
l9_2949=l9_2955;
l9_2952=l9_2949;
}
else
{
float2 l9_2956=float2(0.0);
l9_2956=l9_2951.Surface_UVCoord0;
l9_2950=l9_2956;
l9_2952=l9_2950;
}
}
}
l9_2946=l9_2952;
float2 l9_2957=float2(0.0);
float2 l9_2958=(*sc_set0.UserUniforms).uv2Scale;
l9_2957=l9_2958;
float2 l9_2959=float2(0.0);
l9_2959=l9_2957;
float2 l9_2960=float2(0.0);
float2 l9_2961=(*sc_set0.UserUniforms).uv2Offset;
l9_2960=l9_2961;
float2 l9_2962=float2(0.0);
l9_2962=l9_2960;
float2 l9_2963=float2(0.0);
l9_2963=(l9_2946*l9_2959)+l9_2962;
l9_2924=l9_2963;
l9_2926=l9_2924;
}
l9_2922=l9_2926;
float l9_2964=0.0;
float l9_2965;
if ((int(Tweak_N67_tmp)!=0))
{
l9_2965=1.001;
}
else
{
l9_2965=0.001;
}
l9_2965-=0.001;
l9_2964=l9_2965;
float l9_2966=0.0;
l9_2966=l9_2964;
float2 l9_2967=float2(0.0);
l9_2967=mix(l9_2921,l9_2922,float2(l9_2966));
float2 l9_2968=float2(0.0);
l9_2968=l9_2967;
float2 l9_2969=float2(0.0);
l9_2969=l9_2968;
l9_2914=l9_2969;
l9_2918=l9_2914;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_2970=float2(0.0);
l9_2970=l9_2917.Surface_UVCoord0;
float2 l9_2971=float2(0.0);
float2 l9_2972=float2(0.0);
float2 l9_2973=float2(0.0);
ssGlobals l9_2974=l9_2917;
float2 l9_2975;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_2976=float2(0.0);
float2 l9_2977=float2(0.0);
float2 l9_2978=float2(0.0);
float2 l9_2979=float2(0.0);
float2 l9_2980=float2(0.0);
float2 l9_2981=float2(0.0);
ssGlobals l9_2982=l9_2974;
float2 l9_2983;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_2984=float2(0.0);
l9_2984=l9_2982.Surface_UVCoord0;
l9_2977=l9_2984;
l9_2983=l9_2977;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_2985=float2(0.0);
l9_2985=l9_2982.Surface_UVCoord1;
l9_2978=l9_2985;
l9_2983=l9_2978;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_2986=float2(0.0);
l9_2986=l9_2982.gScreenCoord;
l9_2979=l9_2986;
l9_2983=l9_2979;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_2987=float2(0.0);
l9_2987=l9_2982.Surface_UVCoord0;
float2 l9_2988=float2(0.0);
float2 l9_2989=float2(0.0);
float2 l9_2990=float2(0.0);
ssGlobals l9_2991=l9_2982;
float2 l9_2992;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_2993=float2(0.0);
float2 l9_2994=float2(0.0);
float2 l9_2995=float2(0.0);
float2 l9_2996=float2(0.0);
float2 l9_2997=float2(0.0);
ssGlobals l9_2998=l9_2991;
float2 l9_2999;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3000=float2(0.0);
l9_3000=l9_2998.Surface_UVCoord0;
l9_2994=l9_3000;
l9_2999=l9_2994;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3001=float2(0.0);
l9_3001=l9_2998.Surface_UVCoord1;
l9_2995=l9_3001;
l9_2999=l9_2995;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3002=float2(0.0);
l9_3002=l9_2998.gScreenCoord;
l9_2996=l9_3002;
l9_2999=l9_2996;
}
else
{
float2 l9_3003=float2(0.0);
l9_3003=l9_2998.Surface_UVCoord0;
l9_2997=l9_3003;
l9_2999=l9_2997;
}
}
}
l9_2993=l9_2999;
float2 l9_3004=float2(0.0);
float2 l9_3005=(*sc_set0.UserUniforms).uv2Scale;
l9_3004=l9_3005;
float2 l9_3006=float2(0.0);
l9_3006=l9_3004;
float2 l9_3007=float2(0.0);
float2 l9_3008=(*sc_set0.UserUniforms).uv2Offset;
l9_3007=l9_3008;
float2 l9_3009=float2(0.0);
l9_3009=l9_3007;
float2 l9_3010=float2(0.0);
l9_3010=(l9_2993*l9_3006)+l9_3009;
float2 l9_3011=float2(0.0);
l9_3011=l9_3010+(l9_3009*(l9_2991.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_2989=l9_3011;
l9_2992=l9_2989;
}
else
{
float2 l9_3012=float2(0.0);
float2 l9_3013=float2(0.0);
float2 l9_3014=float2(0.0);
float2 l9_3015=float2(0.0);
float2 l9_3016=float2(0.0);
ssGlobals l9_3017=l9_2991;
float2 l9_3018;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3019=float2(0.0);
l9_3019=l9_3017.Surface_UVCoord0;
l9_3013=l9_3019;
l9_3018=l9_3013;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3020=float2(0.0);
l9_3020=l9_3017.Surface_UVCoord1;
l9_3014=l9_3020;
l9_3018=l9_3014;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3021=float2(0.0);
l9_3021=l9_3017.gScreenCoord;
l9_3015=l9_3021;
l9_3018=l9_3015;
}
else
{
float2 l9_3022=float2(0.0);
l9_3022=l9_3017.Surface_UVCoord0;
l9_3016=l9_3022;
l9_3018=l9_3016;
}
}
}
l9_3012=l9_3018;
float2 l9_3023=float2(0.0);
float2 l9_3024=(*sc_set0.UserUniforms).uv2Scale;
l9_3023=l9_3024;
float2 l9_3025=float2(0.0);
l9_3025=l9_3023;
float2 l9_3026=float2(0.0);
float2 l9_3027=(*sc_set0.UserUniforms).uv2Offset;
l9_3026=l9_3027;
float2 l9_3028=float2(0.0);
l9_3028=l9_3026;
float2 l9_3029=float2(0.0);
l9_3029=(l9_3012*l9_3025)+l9_3028;
l9_2990=l9_3029;
l9_2992=l9_2990;
}
l9_2988=l9_2992;
float l9_3030=0.0;
float l9_3031;
if ((int(Tweak_N67_tmp)!=0))
{
l9_3031=1.001;
}
else
{
l9_3031=0.001;
}
l9_3031-=0.001;
l9_3030=l9_3031;
float l9_3032=0.0;
l9_3032=l9_3030;
float2 l9_3033=float2(0.0);
l9_3033=mix(l9_2987,l9_2988,float2(l9_3032));
float2 l9_3034=float2(0.0);
l9_3034=l9_3033;
float2 l9_3035=float2(0.0);
l9_3035=l9_3034;
l9_2980=l9_3035;
l9_2983=l9_2980;
}
else
{
float2 l9_3036=float2(0.0);
l9_3036=l9_2982.Surface_UVCoord0;
l9_2981=l9_3036;
l9_2983=l9_2981;
}
}
}
}
l9_2976=l9_2983;
float2 l9_3037=float2(0.0);
float2 l9_3038=(*sc_set0.UserUniforms).uv3Scale;
l9_3037=l9_3038;
float2 l9_3039=float2(0.0);
l9_3039=l9_3037;
float2 l9_3040=float2(0.0);
float2 l9_3041=(*sc_set0.UserUniforms).uv3Offset;
l9_3040=l9_3041;
float2 l9_3042=float2(0.0);
l9_3042=l9_3040;
float2 l9_3043=float2(0.0);
l9_3043=(l9_2976*l9_3039)+l9_3042;
float2 l9_3044=float2(0.0);
l9_3044=l9_3043+(l9_3042*(l9_2974.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_2972=l9_3044;
l9_2975=l9_2972;
}
else
{
float2 l9_3045=float2(0.0);
float2 l9_3046=float2(0.0);
float2 l9_3047=float2(0.0);
float2 l9_3048=float2(0.0);
float2 l9_3049=float2(0.0);
float2 l9_3050=float2(0.0);
ssGlobals l9_3051=l9_2974;
float2 l9_3052;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3053=float2(0.0);
l9_3053=l9_3051.Surface_UVCoord0;
l9_3046=l9_3053;
l9_3052=l9_3046;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3054=float2(0.0);
l9_3054=l9_3051.Surface_UVCoord1;
l9_3047=l9_3054;
l9_3052=l9_3047;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3055=float2(0.0);
l9_3055=l9_3051.gScreenCoord;
l9_3048=l9_3055;
l9_3052=l9_3048;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3056=float2(0.0);
l9_3056=l9_3051.Surface_UVCoord0;
float2 l9_3057=float2(0.0);
float2 l9_3058=float2(0.0);
float2 l9_3059=float2(0.0);
ssGlobals l9_3060=l9_3051;
float2 l9_3061;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3062=float2(0.0);
float2 l9_3063=float2(0.0);
float2 l9_3064=float2(0.0);
float2 l9_3065=float2(0.0);
float2 l9_3066=float2(0.0);
ssGlobals l9_3067=l9_3060;
float2 l9_3068;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3069=float2(0.0);
l9_3069=l9_3067.Surface_UVCoord0;
l9_3063=l9_3069;
l9_3068=l9_3063;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3070=float2(0.0);
l9_3070=l9_3067.Surface_UVCoord1;
l9_3064=l9_3070;
l9_3068=l9_3064;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3071=float2(0.0);
l9_3071=l9_3067.gScreenCoord;
l9_3065=l9_3071;
l9_3068=l9_3065;
}
else
{
float2 l9_3072=float2(0.0);
l9_3072=l9_3067.Surface_UVCoord0;
l9_3066=l9_3072;
l9_3068=l9_3066;
}
}
}
l9_3062=l9_3068;
float2 l9_3073=float2(0.0);
float2 l9_3074=(*sc_set0.UserUniforms).uv2Scale;
l9_3073=l9_3074;
float2 l9_3075=float2(0.0);
l9_3075=l9_3073;
float2 l9_3076=float2(0.0);
float2 l9_3077=(*sc_set0.UserUniforms).uv2Offset;
l9_3076=l9_3077;
float2 l9_3078=float2(0.0);
l9_3078=l9_3076;
float2 l9_3079=float2(0.0);
l9_3079=(l9_3062*l9_3075)+l9_3078;
float2 l9_3080=float2(0.0);
l9_3080=l9_3079+(l9_3078*(l9_3060.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3058=l9_3080;
l9_3061=l9_3058;
}
else
{
float2 l9_3081=float2(0.0);
float2 l9_3082=float2(0.0);
float2 l9_3083=float2(0.0);
float2 l9_3084=float2(0.0);
float2 l9_3085=float2(0.0);
ssGlobals l9_3086=l9_3060;
float2 l9_3087;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3088=float2(0.0);
l9_3088=l9_3086.Surface_UVCoord0;
l9_3082=l9_3088;
l9_3087=l9_3082;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3089=float2(0.0);
l9_3089=l9_3086.Surface_UVCoord1;
l9_3083=l9_3089;
l9_3087=l9_3083;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3090=float2(0.0);
l9_3090=l9_3086.gScreenCoord;
l9_3084=l9_3090;
l9_3087=l9_3084;
}
else
{
float2 l9_3091=float2(0.0);
l9_3091=l9_3086.Surface_UVCoord0;
l9_3085=l9_3091;
l9_3087=l9_3085;
}
}
}
l9_3081=l9_3087;
float2 l9_3092=float2(0.0);
float2 l9_3093=(*sc_set0.UserUniforms).uv2Scale;
l9_3092=l9_3093;
float2 l9_3094=float2(0.0);
l9_3094=l9_3092;
float2 l9_3095=float2(0.0);
float2 l9_3096=(*sc_set0.UserUniforms).uv2Offset;
l9_3095=l9_3096;
float2 l9_3097=float2(0.0);
l9_3097=l9_3095;
float2 l9_3098=float2(0.0);
l9_3098=(l9_3081*l9_3094)+l9_3097;
l9_3059=l9_3098;
l9_3061=l9_3059;
}
l9_3057=l9_3061;
float l9_3099=0.0;
float l9_3100;
if ((int(Tweak_N67_tmp)!=0))
{
l9_3100=1.001;
}
else
{
l9_3100=0.001;
}
l9_3100-=0.001;
l9_3099=l9_3100;
float l9_3101=0.0;
l9_3101=l9_3099;
float2 l9_3102=float2(0.0);
l9_3102=mix(l9_3056,l9_3057,float2(l9_3101));
float2 l9_3103=float2(0.0);
l9_3103=l9_3102;
float2 l9_3104=float2(0.0);
l9_3104=l9_3103;
l9_3049=l9_3104;
l9_3052=l9_3049;
}
else
{
float2 l9_3105=float2(0.0);
l9_3105=l9_3051.Surface_UVCoord0;
l9_3050=l9_3105;
l9_3052=l9_3050;
}
}
}
}
l9_3045=l9_3052;
float2 l9_3106=float2(0.0);
float2 l9_3107=(*sc_set0.UserUniforms).uv3Scale;
l9_3106=l9_3107;
float2 l9_3108=float2(0.0);
l9_3108=l9_3106;
float2 l9_3109=float2(0.0);
float2 l9_3110=(*sc_set0.UserUniforms).uv3Offset;
l9_3109=l9_3110;
float2 l9_3111=float2(0.0);
l9_3111=l9_3109;
float2 l9_3112=float2(0.0);
l9_3112=(l9_3045*l9_3108)+l9_3111;
l9_2973=l9_3112;
l9_2975=l9_2973;
}
l9_2971=l9_2975;
float l9_3113=0.0;
float l9_3114;
if ((int(Tweak_N11_tmp)!=0))
{
l9_3114=1.001;
}
else
{
l9_3114=0.001;
}
l9_3114-=0.001;
l9_3113=l9_3114;
float l9_3115=0.0;
l9_3115=l9_3113;
float2 l9_3116=float2(0.0);
l9_3116=mix(l9_2970,l9_2971,float2(l9_3115));
float2 l9_3117=float2(0.0);
l9_3117=l9_3116;
float2 l9_3118=float2(0.0);
l9_3118=l9_3117;
l9_2915=l9_3118;
l9_2918=l9_2915;
}
else
{
float2 l9_3119=float2(0.0);
l9_3119=l9_2917.Surface_UVCoord0;
l9_2916=l9_3119;
l9_2918=l9_2916;
}
}
}
}
l9_2911=l9_2918;
float4 l9_3120=float4(0.0);
float2 l9_3121=l9_2911;
int l9_3122=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_3123=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3123=0;
}
else
{
l9_3123=in.varStereoViewID;
}
int l9_3124=l9_3123;
l9_3122=1-l9_3124;
}
else
{
int l9_3125=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3125=0;
}
else
{
l9_3125=in.varStereoViewID;
}
int l9_3126=l9_3125;
l9_3122=l9_3126;
}
int l9_3127=l9_3122;
int l9_3128=detailNormalTexLayout_tmp;
int l9_3129=l9_3127;
float2 l9_3130=l9_3121;
bool l9_3131=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_3132=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_3133=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_3134=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_3135=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_3136=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_3137=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_3138=0.0;
bool l9_3139=l9_3136&&(!l9_3134);
float l9_3140=1.0;
float l9_3141=l9_3130.x;
int l9_3142=l9_3133.x;
if (l9_3142==1)
{
l9_3141=fract(l9_3141);
}
else
{
if (l9_3142==2)
{
float l9_3143=fract(l9_3141);
float l9_3144=l9_3141-l9_3143;
float l9_3145=step(0.25,fract(l9_3144*0.5));
l9_3141=mix(l9_3143,1.0-l9_3143,fast::clamp(l9_3145,0.0,1.0));
}
}
l9_3130.x=l9_3141;
float l9_3146=l9_3130.y;
int l9_3147=l9_3133.y;
if (l9_3147==1)
{
l9_3146=fract(l9_3146);
}
else
{
if (l9_3147==2)
{
float l9_3148=fract(l9_3146);
float l9_3149=l9_3146-l9_3148;
float l9_3150=step(0.25,fract(l9_3149*0.5));
l9_3146=mix(l9_3148,1.0-l9_3148,fast::clamp(l9_3150,0.0,1.0));
}
}
l9_3130.y=l9_3146;
if (l9_3134)
{
bool l9_3151=l9_3136;
bool l9_3152;
if (l9_3151)
{
l9_3152=l9_3133.x==3;
}
else
{
l9_3152=l9_3151;
}
float l9_3153=l9_3130.x;
float l9_3154=l9_3135.x;
float l9_3155=l9_3135.z;
bool l9_3156=l9_3152;
float l9_3157=l9_3140;
float l9_3158=fast::clamp(l9_3153,l9_3154,l9_3155);
float l9_3159=step(abs(l9_3153-l9_3158),9.9999997e-06);
l9_3157*=(l9_3159+((1.0-float(l9_3156))*(1.0-l9_3159)));
l9_3153=l9_3158;
l9_3130.x=l9_3153;
l9_3140=l9_3157;
bool l9_3160=l9_3136;
bool l9_3161;
if (l9_3160)
{
l9_3161=l9_3133.y==3;
}
else
{
l9_3161=l9_3160;
}
float l9_3162=l9_3130.y;
float l9_3163=l9_3135.y;
float l9_3164=l9_3135.w;
bool l9_3165=l9_3161;
float l9_3166=l9_3140;
float l9_3167=fast::clamp(l9_3162,l9_3163,l9_3164);
float l9_3168=step(abs(l9_3162-l9_3167),9.9999997e-06);
l9_3166*=(l9_3168+((1.0-float(l9_3165))*(1.0-l9_3168)));
l9_3162=l9_3167;
l9_3130.y=l9_3162;
l9_3140=l9_3166;
}
float2 l9_3169=l9_3130;
bool l9_3170=l9_3131;
float3x3 l9_3171=l9_3132;
if (l9_3170)
{
l9_3169=float2((l9_3171*float3(l9_3169,1.0)).xy);
}
float2 l9_3172=l9_3169;
float2 l9_3173=l9_3172;
float2 l9_3174=l9_3173;
l9_3130=l9_3174;
float l9_3175=l9_3130.x;
int l9_3176=l9_3133.x;
bool l9_3177=l9_3139;
float l9_3178=l9_3140;
if ((l9_3176==0)||(l9_3176==3))
{
float l9_3179=l9_3175;
float l9_3180=0.0;
float l9_3181=1.0;
bool l9_3182=l9_3177;
float l9_3183=l9_3178;
float l9_3184=fast::clamp(l9_3179,l9_3180,l9_3181);
float l9_3185=step(abs(l9_3179-l9_3184),9.9999997e-06);
l9_3183*=(l9_3185+((1.0-float(l9_3182))*(1.0-l9_3185)));
l9_3179=l9_3184;
l9_3175=l9_3179;
l9_3178=l9_3183;
}
l9_3130.x=l9_3175;
l9_3140=l9_3178;
float l9_3186=l9_3130.y;
int l9_3187=l9_3133.y;
bool l9_3188=l9_3139;
float l9_3189=l9_3140;
if ((l9_3187==0)||(l9_3187==3))
{
float l9_3190=l9_3186;
float l9_3191=0.0;
float l9_3192=1.0;
bool l9_3193=l9_3188;
float l9_3194=l9_3189;
float l9_3195=fast::clamp(l9_3190,l9_3191,l9_3192);
float l9_3196=step(abs(l9_3190-l9_3195),9.9999997e-06);
l9_3194*=(l9_3196+((1.0-float(l9_3193))*(1.0-l9_3196)));
l9_3190=l9_3195;
l9_3186=l9_3190;
l9_3189=l9_3194;
}
l9_3130.y=l9_3186;
l9_3140=l9_3189;
float2 l9_3197=l9_3130;
int l9_3198=l9_3128;
int l9_3199=l9_3129;
float l9_3200=l9_3138;
float2 l9_3201=l9_3197;
int l9_3202=l9_3198;
int l9_3203=l9_3199;
float3 l9_3204=float3(0.0);
if (l9_3202==0)
{
l9_3204=float3(l9_3201,0.0);
}
else
{
if (l9_3202==1)
{
l9_3204=float3(l9_3201.x,(l9_3201.y*0.5)+(0.5-(float(l9_3203)*0.5)),0.0);
}
else
{
l9_3204=float3(l9_3201,float(l9_3203));
}
}
float3 l9_3205=l9_3204;
float3 l9_3206=l9_3205;
float2 l9_3207=l9_3206.xy;
float l9_3208=l9_3200;
float4 l9_3209=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_3207,bias(l9_3208));
float4 l9_3210=l9_3209;
float4 l9_3211=l9_3210;
if (l9_3136)
{
l9_3211=mix(l9_3137,l9_3211,float4(l9_3140));
}
float4 l9_3212=l9_3211;
float4 l9_3213=l9_3212;
float3 l9_3214=(l9_3213.xyz*1.9921875)-float3(1.0);
l9_3213=float4(l9_3214.x,l9_3214.y,l9_3214.z,l9_3213.w);
l9_3120=l9_3213;
l9_2907=l9_3120.xyz;
l9_2910=l9_2907;
}
else
{
l9_2910=l9_2908;
}
l9_2906=l9_2910;
float3 l9_3215=float3(0.0);
float3 l9_3216=l9_2811.xyz;
float l9_3217=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_3218=l9_2906;
float l9_3219=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_3220=l9_3216;
float l9_3221=l9_3217;
float3 l9_3222=l9_3218;
float l9_3223=l9_3219;
float3 l9_3224=mix(float3(0.0,0.0,1.0),l9_3220,float3(l9_3221))+float3(0.0,0.0,1.0);
float3 l9_3225=mix(float3(0.0,0.0,1.0),l9_3222,float3(l9_3223))*float3(-1.0,-1.0,1.0);
float3 l9_3226=normalize((l9_3224*dot(l9_3224,l9_3225))-(l9_3225*l9_3224.z));
l9_3218=l9_3226;
float3 l9_3227=l9_3218;
l9_3215=l9_3227;
float3 l9_3228=float3(0.0);
l9_3228=l9_2601*l9_3215;
float3 l9_3229=float3(0.0);
float3 l9_3230=l9_3228;
float l9_3231=dot(l9_3230,l9_3230);
float l9_3232;
if (l9_3231>0.0)
{
l9_3232=1.0/sqrt(l9_3231);
}
else
{
l9_3232=0.0;
}
float l9_3233=l9_3232;
float3 l9_3234=l9_3230*l9_3233;
l9_3229=l9_3234;
l9_2594=l9_3229;
l9_2597=l9_2594;
}
else
{
float3 l9_3235=float3(0.0);
l9_3235=l9_2596.VertexNormal_WorldSpace;
float3 l9_3236=float3(0.0);
float3 l9_3237=l9_3235;
float l9_3238=dot(l9_3237,l9_3237);
float l9_3239;
if (l9_3238>0.0)
{
l9_3239=1.0/sqrt(l9_3238);
}
else
{
l9_3239=0.0;
}
float l9_3240=l9_3239;
float3 l9_3241=l9_3237*l9_3240;
l9_3236=l9_3241;
l9_2595=l9_3236;
l9_2597=l9_2595;
}
l9_2593=l9_2597;
float3 l9_3242=float3(0.0);
l9_3242=l9_2593;
float3 l9_3243=float3(0.0);
l9_3243=l9_3242;
float3 l9_3244=float3(0.0);
l9_3244=reflect(l9_2592,l9_3243);
float3 l9_3245=float3(0.0);
l9_3245=l9_3244*(*sc_set0.UserUniforms).Port_Input1_N257;
float3 l9_3246=float3(0.0);
l9_3246=l9_3245;
float2 l9_3247=float2(0.0);
l9_3247=float2(l9_3246.x,l9_3246.y);
float l9_3248=0.0;
float l9_3249=0.0;
float l9_3250=0.0;
float3 l9_3251=l9_3246;
float l9_3252=l9_3251.x;
float l9_3253=l9_3251.y;
float l9_3254=l9_3251.z;
l9_3248=l9_3252;
l9_3249=l9_3253;
l9_3250=l9_3254;
float l9_3255=0.0;
l9_3255=l9_3248*l9_3248;
float l9_3256=0.0;
l9_3256=l9_3249*l9_3249;
float l9_3257=0.0;
l9_3257=l9_3250+(*sc_set0.UserUniforms).Port_Input1_N264;
float l9_3258=0.0;
l9_3258=l9_3257*l9_3257;
float l9_3259=0.0;
l9_3259=(l9_3255+l9_3256)+l9_3258;
float l9_3260=0.0;
float l9_3261;
if (l9_3259<=0.0)
{
l9_3261=0.0;
}
else
{
l9_3261=sqrt(l9_3259);
}
l9_3260=l9_3261;
float l9_3262=0.0;
l9_3262=l9_3260*(*sc_set0.UserUniforms).Port_Input1_N268;
float2 l9_3263=float2(0.0);
l9_3263=l9_3247/float2(l9_3262);
float2 l9_3264=float2(0.0);
l9_3264=l9_3263+float2((*sc_set0.UserUniforms).Port_Input1_N270);
float2 l9_3265=float2(0.0);
l9_3265=float2(1.0)-l9_3264;
float2 l9_3266=float2(0.0);
l9_3266=l9_3265;
float4 l9_3267=float4(0.0);
int l9_3268=0;
if ((int(reflectionTexHasSwappedViews_tmp)!=0))
{
int l9_3269=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3269=0;
}
else
{
l9_3269=in.varStereoViewID;
}
int l9_3270=l9_3269;
l9_3268=1-l9_3270;
}
else
{
int l9_3271=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3271=0;
}
else
{
l9_3271=in.varStereoViewID;
}
int l9_3272=l9_3271;
l9_3268=l9_3272;
}
int l9_3273=l9_3268;
int l9_3274=reflectionTexLayout_tmp;
int l9_3275=l9_3273;
float2 l9_3276=l9_3266;
bool l9_3277=(int(SC_USE_UV_TRANSFORM_reflectionTex_tmp)!=0);
float3x3 l9_3278=(*sc_set0.UserUniforms).reflectionTexTransform;
int2 l9_3279=int2(SC_SOFTWARE_WRAP_MODE_U_reflectionTex_tmp,SC_SOFTWARE_WRAP_MODE_V_reflectionTex_tmp);
bool l9_3280=(int(SC_USE_UV_MIN_MAX_reflectionTex_tmp)!=0);
float4 l9_3281=(*sc_set0.UserUniforms).reflectionTexUvMinMax;
bool l9_3282=(int(SC_USE_CLAMP_TO_BORDER_reflectionTex_tmp)!=0);
float4 l9_3283=(*sc_set0.UserUniforms).reflectionTexBorderColor;
float l9_3284=0.0;
bool l9_3285=l9_3282&&(!l9_3280);
float l9_3286=1.0;
float l9_3287=l9_3276.x;
int l9_3288=l9_3279.x;
if (l9_3288==1)
{
l9_3287=fract(l9_3287);
}
else
{
if (l9_3288==2)
{
float l9_3289=fract(l9_3287);
float l9_3290=l9_3287-l9_3289;
float l9_3291=step(0.25,fract(l9_3290*0.5));
l9_3287=mix(l9_3289,1.0-l9_3289,fast::clamp(l9_3291,0.0,1.0));
}
}
l9_3276.x=l9_3287;
float l9_3292=l9_3276.y;
int l9_3293=l9_3279.y;
if (l9_3293==1)
{
l9_3292=fract(l9_3292);
}
else
{
if (l9_3293==2)
{
float l9_3294=fract(l9_3292);
float l9_3295=l9_3292-l9_3294;
float l9_3296=step(0.25,fract(l9_3295*0.5));
l9_3292=mix(l9_3294,1.0-l9_3294,fast::clamp(l9_3296,0.0,1.0));
}
}
l9_3276.y=l9_3292;
if (l9_3280)
{
bool l9_3297=l9_3282;
bool l9_3298;
if (l9_3297)
{
l9_3298=l9_3279.x==3;
}
else
{
l9_3298=l9_3297;
}
float l9_3299=l9_3276.x;
float l9_3300=l9_3281.x;
float l9_3301=l9_3281.z;
bool l9_3302=l9_3298;
float l9_3303=l9_3286;
float l9_3304=fast::clamp(l9_3299,l9_3300,l9_3301);
float l9_3305=step(abs(l9_3299-l9_3304),9.9999997e-06);
l9_3303*=(l9_3305+((1.0-float(l9_3302))*(1.0-l9_3305)));
l9_3299=l9_3304;
l9_3276.x=l9_3299;
l9_3286=l9_3303;
bool l9_3306=l9_3282;
bool l9_3307;
if (l9_3306)
{
l9_3307=l9_3279.y==3;
}
else
{
l9_3307=l9_3306;
}
float l9_3308=l9_3276.y;
float l9_3309=l9_3281.y;
float l9_3310=l9_3281.w;
bool l9_3311=l9_3307;
float l9_3312=l9_3286;
float l9_3313=fast::clamp(l9_3308,l9_3309,l9_3310);
float l9_3314=step(abs(l9_3308-l9_3313),9.9999997e-06);
l9_3312*=(l9_3314+((1.0-float(l9_3311))*(1.0-l9_3314)));
l9_3308=l9_3313;
l9_3276.y=l9_3308;
l9_3286=l9_3312;
}
float2 l9_3315=l9_3276;
bool l9_3316=l9_3277;
float3x3 l9_3317=l9_3278;
if (l9_3316)
{
l9_3315=float2((l9_3317*float3(l9_3315,1.0)).xy);
}
float2 l9_3318=l9_3315;
float2 l9_3319=l9_3318;
float2 l9_3320=l9_3319;
l9_3276=l9_3320;
float l9_3321=l9_3276.x;
int l9_3322=l9_3279.x;
bool l9_3323=l9_3285;
float l9_3324=l9_3286;
if ((l9_3322==0)||(l9_3322==3))
{
float l9_3325=l9_3321;
float l9_3326=0.0;
float l9_3327=1.0;
bool l9_3328=l9_3323;
float l9_3329=l9_3324;
float l9_3330=fast::clamp(l9_3325,l9_3326,l9_3327);
float l9_3331=step(abs(l9_3325-l9_3330),9.9999997e-06);
l9_3329*=(l9_3331+((1.0-float(l9_3328))*(1.0-l9_3331)));
l9_3325=l9_3330;
l9_3321=l9_3325;
l9_3324=l9_3329;
}
l9_3276.x=l9_3321;
l9_3286=l9_3324;
float l9_3332=l9_3276.y;
int l9_3333=l9_3279.y;
bool l9_3334=l9_3285;
float l9_3335=l9_3286;
if ((l9_3333==0)||(l9_3333==3))
{
float l9_3336=l9_3332;
float l9_3337=0.0;
float l9_3338=1.0;
bool l9_3339=l9_3334;
float l9_3340=l9_3335;
float l9_3341=fast::clamp(l9_3336,l9_3337,l9_3338);
float l9_3342=step(abs(l9_3336-l9_3341),9.9999997e-06);
l9_3340*=(l9_3342+((1.0-float(l9_3339))*(1.0-l9_3342)));
l9_3336=l9_3341;
l9_3332=l9_3336;
l9_3335=l9_3340;
}
l9_3276.y=l9_3332;
l9_3286=l9_3335;
float2 l9_3343=l9_3276;
int l9_3344=l9_3274;
int l9_3345=l9_3275;
float l9_3346=l9_3284;
float2 l9_3347=l9_3343;
int l9_3348=l9_3344;
int l9_3349=l9_3345;
float3 l9_3350=float3(0.0);
if (l9_3348==0)
{
l9_3350=float3(l9_3347,0.0);
}
else
{
if (l9_3348==1)
{
l9_3350=float3(l9_3347.x,(l9_3347.y*0.5)+(0.5-(float(l9_3349)*0.5)),0.0);
}
else
{
l9_3350=float3(l9_3347,float(l9_3349));
}
}
float3 l9_3351=l9_3350;
float3 l9_3352=l9_3351;
float2 l9_3353=l9_3352.xy;
float l9_3354=l9_3346;
float4 l9_3355=sc_set0.reflectionTex.sample(sc_set0.reflectionTexSmpSC,l9_3353,bias(l9_3354));
float4 l9_3356=l9_3355;
float4 l9_3357=l9_3356;
if (l9_3282)
{
l9_3357=mix(l9_3283,l9_3357,float4(l9_3286));
}
float4 l9_3358=l9_3357;
l9_3267=l9_3358;
float3 l9_3359=float3(0.0);
float3 l9_3360=float3(0.0);
float3 l9_3361=(*sc_set0.UserUniforms).Port_Default_N041;
ssGlobals l9_3362=param_19;
float3 l9_3363;
if ((int(Tweak_N177_tmp)!=0))
{
float2 l9_3364=float2(0.0);
float2 l9_3365=float2(0.0);
float2 l9_3366=float2(0.0);
float2 l9_3367=float2(0.0);
float2 l9_3368=float2(0.0);
float2 l9_3369=float2(0.0);
ssGlobals l9_3370=l9_3362;
float2 l9_3371;
if (NODE_228_DROPLIST_ITEM_tmp==0)
{
float2 l9_3372=float2(0.0);
l9_3372=l9_3370.Surface_UVCoord0;
l9_3365=l9_3372;
l9_3371=l9_3365;
}
else
{
if (NODE_228_DROPLIST_ITEM_tmp==1)
{
float2 l9_3373=float2(0.0);
l9_3373=l9_3370.Surface_UVCoord1;
l9_3366=l9_3373;
l9_3371=l9_3366;
}
else
{
if (NODE_228_DROPLIST_ITEM_tmp==2)
{
float2 l9_3374=float2(0.0);
l9_3374=l9_3370.Surface_UVCoord0;
float2 l9_3375=float2(0.0);
float2 l9_3376=float2(0.0);
float2 l9_3377=float2(0.0);
ssGlobals l9_3378=l9_3370;
float2 l9_3379;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3380=float2(0.0);
float2 l9_3381=float2(0.0);
float2 l9_3382=float2(0.0);
float2 l9_3383=float2(0.0);
float2 l9_3384=float2(0.0);
ssGlobals l9_3385=l9_3378;
float2 l9_3386;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3387=float2(0.0);
l9_3387=l9_3385.Surface_UVCoord0;
l9_3381=l9_3387;
l9_3386=l9_3381;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3388=float2(0.0);
l9_3388=l9_3385.Surface_UVCoord1;
l9_3382=l9_3388;
l9_3386=l9_3382;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3389=float2(0.0);
l9_3389=l9_3385.gScreenCoord;
l9_3383=l9_3389;
l9_3386=l9_3383;
}
else
{
float2 l9_3390=float2(0.0);
l9_3390=l9_3385.Surface_UVCoord0;
l9_3384=l9_3390;
l9_3386=l9_3384;
}
}
}
l9_3380=l9_3386;
float2 l9_3391=float2(0.0);
float2 l9_3392=(*sc_set0.UserUniforms).uv2Scale;
l9_3391=l9_3392;
float2 l9_3393=float2(0.0);
l9_3393=l9_3391;
float2 l9_3394=float2(0.0);
float2 l9_3395=(*sc_set0.UserUniforms).uv2Offset;
l9_3394=l9_3395;
float2 l9_3396=float2(0.0);
l9_3396=l9_3394;
float2 l9_3397=float2(0.0);
l9_3397=(l9_3380*l9_3393)+l9_3396;
float2 l9_3398=float2(0.0);
l9_3398=l9_3397+(l9_3396*(l9_3378.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3376=l9_3398;
l9_3379=l9_3376;
}
else
{
float2 l9_3399=float2(0.0);
float2 l9_3400=float2(0.0);
float2 l9_3401=float2(0.0);
float2 l9_3402=float2(0.0);
float2 l9_3403=float2(0.0);
ssGlobals l9_3404=l9_3378;
float2 l9_3405;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3406=float2(0.0);
l9_3406=l9_3404.Surface_UVCoord0;
l9_3400=l9_3406;
l9_3405=l9_3400;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3407=float2(0.0);
l9_3407=l9_3404.Surface_UVCoord1;
l9_3401=l9_3407;
l9_3405=l9_3401;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3408=float2(0.0);
l9_3408=l9_3404.gScreenCoord;
l9_3402=l9_3408;
l9_3405=l9_3402;
}
else
{
float2 l9_3409=float2(0.0);
l9_3409=l9_3404.Surface_UVCoord0;
l9_3403=l9_3409;
l9_3405=l9_3403;
}
}
}
l9_3399=l9_3405;
float2 l9_3410=float2(0.0);
float2 l9_3411=(*sc_set0.UserUniforms).uv2Scale;
l9_3410=l9_3411;
float2 l9_3412=float2(0.0);
l9_3412=l9_3410;
float2 l9_3413=float2(0.0);
float2 l9_3414=(*sc_set0.UserUniforms).uv2Offset;
l9_3413=l9_3414;
float2 l9_3415=float2(0.0);
l9_3415=l9_3413;
float2 l9_3416=float2(0.0);
l9_3416=(l9_3399*l9_3412)+l9_3415;
l9_3377=l9_3416;
l9_3379=l9_3377;
}
l9_3375=l9_3379;
float l9_3417=0.0;
float l9_3418;
if ((int(Tweak_N67_tmp)!=0))
{
l9_3418=1.001;
}
else
{
l9_3418=0.001;
}
l9_3418-=0.001;
l9_3417=l9_3418;
float l9_3419=0.0;
l9_3419=l9_3417;
float2 l9_3420=float2(0.0);
l9_3420=mix(l9_3374,l9_3375,float2(l9_3419));
float2 l9_3421=float2(0.0);
l9_3421=l9_3420;
float2 l9_3422=float2(0.0);
l9_3422=l9_3421;
l9_3367=l9_3422;
l9_3371=l9_3367;
}
else
{
if (NODE_228_DROPLIST_ITEM_tmp==3)
{
float2 l9_3423=float2(0.0);
l9_3423=l9_3370.Surface_UVCoord0;
float2 l9_3424=float2(0.0);
float2 l9_3425=float2(0.0);
float2 l9_3426=float2(0.0);
ssGlobals l9_3427=l9_3370;
float2 l9_3428;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_3429=float2(0.0);
float2 l9_3430=float2(0.0);
float2 l9_3431=float2(0.0);
float2 l9_3432=float2(0.0);
float2 l9_3433=float2(0.0);
float2 l9_3434=float2(0.0);
ssGlobals l9_3435=l9_3427;
float2 l9_3436;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3437=float2(0.0);
l9_3437=l9_3435.Surface_UVCoord0;
l9_3430=l9_3437;
l9_3436=l9_3430;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3438=float2(0.0);
l9_3438=l9_3435.Surface_UVCoord1;
l9_3431=l9_3438;
l9_3436=l9_3431;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3439=float2(0.0);
l9_3439=l9_3435.gScreenCoord;
l9_3432=l9_3439;
l9_3436=l9_3432;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3440=float2(0.0);
l9_3440=l9_3435.Surface_UVCoord0;
float2 l9_3441=float2(0.0);
float2 l9_3442=float2(0.0);
float2 l9_3443=float2(0.0);
ssGlobals l9_3444=l9_3435;
float2 l9_3445;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3446=float2(0.0);
float2 l9_3447=float2(0.0);
float2 l9_3448=float2(0.0);
float2 l9_3449=float2(0.0);
float2 l9_3450=float2(0.0);
ssGlobals l9_3451=l9_3444;
float2 l9_3452;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3453=float2(0.0);
l9_3453=l9_3451.Surface_UVCoord0;
l9_3447=l9_3453;
l9_3452=l9_3447;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3454=float2(0.0);
l9_3454=l9_3451.Surface_UVCoord1;
l9_3448=l9_3454;
l9_3452=l9_3448;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3455=float2(0.0);
l9_3455=l9_3451.gScreenCoord;
l9_3449=l9_3455;
l9_3452=l9_3449;
}
else
{
float2 l9_3456=float2(0.0);
l9_3456=l9_3451.Surface_UVCoord0;
l9_3450=l9_3456;
l9_3452=l9_3450;
}
}
}
l9_3446=l9_3452;
float2 l9_3457=float2(0.0);
float2 l9_3458=(*sc_set0.UserUniforms).uv2Scale;
l9_3457=l9_3458;
float2 l9_3459=float2(0.0);
l9_3459=l9_3457;
float2 l9_3460=float2(0.0);
float2 l9_3461=(*sc_set0.UserUniforms).uv2Offset;
l9_3460=l9_3461;
float2 l9_3462=float2(0.0);
l9_3462=l9_3460;
float2 l9_3463=float2(0.0);
l9_3463=(l9_3446*l9_3459)+l9_3462;
float2 l9_3464=float2(0.0);
l9_3464=l9_3463+(l9_3462*(l9_3444.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3442=l9_3464;
l9_3445=l9_3442;
}
else
{
float2 l9_3465=float2(0.0);
float2 l9_3466=float2(0.0);
float2 l9_3467=float2(0.0);
float2 l9_3468=float2(0.0);
float2 l9_3469=float2(0.0);
ssGlobals l9_3470=l9_3444;
float2 l9_3471;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3472=float2(0.0);
l9_3472=l9_3470.Surface_UVCoord0;
l9_3466=l9_3472;
l9_3471=l9_3466;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3473=float2(0.0);
l9_3473=l9_3470.Surface_UVCoord1;
l9_3467=l9_3473;
l9_3471=l9_3467;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3474=float2(0.0);
l9_3474=l9_3470.gScreenCoord;
l9_3468=l9_3474;
l9_3471=l9_3468;
}
else
{
float2 l9_3475=float2(0.0);
l9_3475=l9_3470.Surface_UVCoord0;
l9_3469=l9_3475;
l9_3471=l9_3469;
}
}
}
l9_3465=l9_3471;
float2 l9_3476=float2(0.0);
float2 l9_3477=(*sc_set0.UserUniforms).uv2Scale;
l9_3476=l9_3477;
float2 l9_3478=float2(0.0);
l9_3478=l9_3476;
float2 l9_3479=float2(0.0);
float2 l9_3480=(*sc_set0.UserUniforms).uv2Offset;
l9_3479=l9_3480;
float2 l9_3481=float2(0.0);
l9_3481=l9_3479;
float2 l9_3482=float2(0.0);
l9_3482=(l9_3465*l9_3478)+l9_3481;
l9_3443=l9_3482;
l9_3445=l9_3443;
}
l9_3441=l9_3445;
float l9_3483=0.0;
float l9_3484;
if ((int(Tweak_N67_tmp)!=0))
{
l9_3484=1.001;
}
else
{
l9_3484=0.001;
}
l9_3484-=0.001;
l9_3483=l9_3484;
float l9_3485=0.0;
l9_3485=l9_3483;
float2 l9_3486=float2(0.0);
l9_3486=mix(l9_3440,l9_3441,float2(l9_3485));
float2 l9_3487=float2(0.0);
l9_3487=l9_3486;
float2 l9_3488=float2(0.0);
l9_3488=l9_3487;
l9_3433=l9_3488;
l9_3436=l9_3433;
}
else
{
float2 l9_3489=float2(0.0);
l9_3489=l9_3435.Surface_UVCoord0;
l9_3434=l9_3489;
l9_3436=l9_3434;
}
}
}
}
l9_3429=l9_3436;
float2 l9_3490=float2(0.0);
float2 l9_3491=(*sc_set0.UserUniforms).uv3Scale;
l9_3490=l9_3491;
float2 l9_3492=float2(0.0);
l9_3492=l9_3490;
float2 l9_3493=float2(0.0);
float2 l9_3494=(*sc_set0.UserUniforms).uv3Offset;
l9_3493=l9_3494;
float2 l9_3495=float2(0.0);
l9_3495=l9_3493;
float2 l9_3496=float2(0.0);
l9_3496=(l9_3429*l9_3492)+l9_3495;
float2 l9_3497=float2(0.0);
l9_3497=l9_3496+(l9_3495*(l9_3427.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_3425=l9_3497;
l9_3428=l9_3425;
}
else
{
float2 l9_3498=float2(0.0);
float2 l9_3499=float2(0.0);
float2 l9_3500=float2(0.0);
float2 l9_3501=float2(0.0);
float2 l9_3502=float2(0.0);
float2 l9_3503=float2(0.0);
ssGlobals l9_3504=l9_3427;
float2 l9_3505;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3506=float2(0.0);
l9_3506=l9_3504.Surface_UVCoord0;
l9_3499=l9_3506;
l9_3505=l9_3499;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3507=float2(0.0);
l9_3507=l9_3504.Surface_UVCoord1;
l9_3500=l9_3507;
l9_3505=l9_3500;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3508=float2(0.0);
l9_3508=l9_3504.gScreenCoord;
l9_3501=l9_3508;
l9_3505=l9_3501;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3509=float2(0.0);
l9_3509=l9_3504.Surface_UVCoord0;
float2 l9_3510=float2(0.0);
float2 l9_3511=float2(0.0);
float2 l9_3512=float2(0.0);
ssGlobals l9_3513=l9_3504;
float2 l9_3514;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3515=float2(0.0);
float2 l9_3516=float2(0.0);
float2 l9_3517=float2(0.0);
float2 l9_3518=float2(0.0);
float2 l9_3519=float2(0.0);
ssGlobals l9_3520=l9_3513;
float2 l9_3521;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3522=float2(0.0);
l9_3522=l9_3520.Surface_UVCoord0;
l9_3516=l9_3522;
l9_3521=l9_3516;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3523=float2(0.0);
l9_3523=l9_3520.Surface_UVCoord1;
l9_3517=l9_3523;
l9_3521=l9_3517;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3524=float2(0.0);
l9_3524=l9_3520.gScreenCoord;
l9_3518=l9_3524;
l9_3521=l9_3518;
}
else
{
float2 l9_3525=float2(0.0);
l9_3525=l9_3520.Surface_UVCoord0;
l9_3519=l9_3525;
l9_3521=l9_3519;
}
}
}
l9_3515=l9_3521;
float2 l9_3526=float2(0.0);
float2 l9_3527=(*sc_set0.UserUniforms).uv2Scale;
l9_3526=l9_3527;
float2 l9_3528=float2(0.0);
l9_3528=l9_3526;
float2 l9_3529=float2(0.0);
float2 l9_3530=(*sc_set0.UserUniforms).uv2Offset;
l9_3529=l9_3530;
float2 l9_3531=float2(0.0);
l9_3531=l9_3529;
float2 l9_3532=float2(0.0);
l9_3532=(l9_3515*l9_3528)+l9_3531;
float2 l9_3533=float2(0.0);
l9_3533=l9_3532+(l9_3531*(l9_3513.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3511=l9_3533;
l9_3514=l9_3511;
}
else
{
float2 l9_3534=float2(0.0);
float2 l9_3535=float2(0.0);
float2 l9_3536=float2(0.0);
float2 l9_3537=float2(0.0);
float2 l9_3538=float2(0.0);
ssGlobals l9_3539=l9_3513;
float2 l9_3540;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3541=float2(0.0);
l9_3541=l9_3539.Surface_UVCoord0;
l9_3535=l9_3541;
l9_3540=l9_3535;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3542=float2(0.0);
l9_3542=l9_3539.Surface_UVCoord1;
l9_3536=l9_3542;
l9_3540=l9_3536;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3543=float2(0.0);
l9_3543=l9_3539.gScreenCoord;
l9_3537=l9_3543;
l9_3540=l9_3537;
}
else
{
float2 l9_3544=float2(0.0);
l9_3544=l9_3539.Surface_UVCoord0;
l9_3538=l9_3544;
l9_3540=l9_3538;
}
}
}
l9_3534=l9_3540;
float2 l9_3545=float2(0.0);
float2 l9_3546=(*sc_set0.UserUniforms).uv2Scale;
l9_3545=l9_3546;
float2 l9_3547=float2(0.0);
l9_3547=l9_3545;
float2 l9_3548=float2(0.0);
float2 l9_3549=(*sc_set0.UserUniforms).uv2Offset;
l9_3548=l9_3549;
float2 l9_3550=float2(0.0);
l9_3550=l9_3548;
float2 l9_3551=float2(0.0);
l9_3551=(l9_3534*l9_3547)+l9_3550;
l9_3512=l9_3551;
l9_3514=l9_3512;
}
l9_3510=l9_3514;
float l9_3552=0.0;
float l9_3553;
if ((int(Tweak_N67_tmp)!=0))
{
l9_3553=1.001;
}
else
{
l9_3553=0.001;
}
l9_3553-=0.001;
l9_3552=l9_3553;
float l9_3554=0.0;
l9_3554=l9_3552;
float2 l9_3555=float2(0.0);
l9_3555=mix(l9_3509,l9_3510,float2(l9_3554));
float2 l9_3556=float2(0.0);
l9_3556=l9_3555;
float2 l9_3557=float2(0.0);
l9_3557=l9_3556;
l9_3502=l9_3557;
l9_3505=l9_3502;
}
else
{
float2 l9_3558=float2(0.0);
l9_3558=l9_3504.Surface_UVCoord0;
l9_3503=l9_3558;
l9_3505=l9_3503;
}
}
}
}
l9_3498=l9_3505;
float2 l9_3559=float2(0.0);
float2 l9_3560=(*sc_set0.UserUniforms).uv3Scale;
l9_3559=l9_3560;
float2 l9_3561=float2(0.0);
l9_3561=l9_3559;
float2 l9_3562=float2(0.0);
float2 l9_3563=(*sc_set0.UserUniforms).uv3Offset;
l9_3562=l9_3563;
float2 l9_3564=float2(0.0);
l9_3564=l9_3562;
float2 l9_3565=float2(0.0);
l9_3565=(l9_3498*l9_3561)+l9_3564;
l9_3426=l9_3565;
l9_3428=l9_3426;
}
l9_3424=l9_3428;
float l9_3566=0.0;
float l9_3567;
if ((int(Tweak_N11_tmp)!=0))
{
l9_3567=1.001;
}
else
{
l9_3567=0.001;
}
l9_3567-=0.001;
l9_3566=l9_3567;
float l9_3568=0.0;
l9_3568=l9_3566;
float2 l9_3569=float2(0.0);
l9_3569=mix(l9_3423,l9_3424,float2(l9_3568));
float2 l9_3570=float2(0.0);
l9_3570=l9_3569;
float2 l9_3571=float2(0.0);
l9_3571=l9_3570;
l9_3368=l9_3571;
l9_3371=l9_3368;
}
else
{
float2 l9_3572=float2(0.0);
l9_3572=l9_3370.Surface_UVCoord0;
l9_3369=l9_3572;
l9_3371=l9_3369;
}
}
}
}
l9_3364=l9_3371;
float4 l9_3573=float4(0.0);
int l9_3574=0;
if ((int(reflectionModulationTexHasSwappedViews_tmp)!=0))
{
int l9_3575=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3575=0;
}
else
{
l9_3575=in.varStereoViewID;
}
int l9_3576=l9_3575;
l9_3574=1-l9_3576;
}
else
{
int l9_3577=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3577=0;
}
else
{
l9_3577=in.varStereoViewID;
}
int l9_3578=l9_3577;
l9_3574=l9_3578;
}
int l9_3579=l9_3574;
int l9_3580=reflectionModulationTexLayout_tmp;
int l9_3581=l9_3579;
float2 l9_3582=l9_3364;
bool l9_3583=(int(SC_USE_UV_TRANSFORM_reflectionModulationTex_tmp)!=0);
float3x3 l9_3584=(*sc_set0.UserUniforms).reflectionModulationTexTransform;
int2 l9_3585=int2(SC_SOFTWARE_WRAP_MODE_U_reflectionModulationTex_tmp,SC_SOFTWARE_WRAP_MODE_V_reflectionModulationTex_tmp);
bool l9_3586=(int(SC_USE_UV_MIN_MAX_reflectionModulationTex_tmp)!=0);
float4 l9_3587=(*sc_set0.UserUniforms).reflectionModulationTexUvMinMax;
bool l9_3588=(int(SC_USE_CLAMP_TO_BORDER_reflectionModulationTex_tmp)!=0);
float4 l9_3589=(*sc_set0.UserUniforms).reflectionModulationTexBorderColor;
float l9_3590=0.0;
bool l9_3591=l9_3588&&(!l9_3586);
float l9_3592=1.0;
float l9_3593=l9_3582.x;
int l9_3594=l9_3585.x;
if (l9_3594==1)
{
l9_3593=fract(l9_3593);
}
else
{
if (l9_3594==2)
{
float l9_3595=fract(l9_3593);
float l9_3596=l9_3593-l9_3595;
float l9_3597=step(0.25,fract(l9_3596*0.5));
l9_3593=mix(l9_3595,1.0-l9_3595,fast::clamp(l9_3597,0.0,1.0));
}
}
l9_3582.x=l9_3593;
float l9_3598=l9_3582.y;
int l9_3599=l9_3585.y;
if (l9_3599==1)
{
l9_3598=fract(l9_3598);
}
else
{
if (l9_3599==2)
{
float l9_3600=fract(l9_3598);
float l9_3601=l9_3598-l9_3600;
float l9_3602=step(0.25,fract(l9_3601*0.5));
l9_3598=mix(l9_3600,1.0-l9_3600,fast::clamp(l9_3602,0.0,1.0));
}
}
l9_3582.y=l9_3598;
if (l9_3586)
{
bool l9_3603=l9_3588;
bool l9_3604;
if (l9_3603)
{
l9_3604=l9_3585.x==3;
}
else
{
l9_3604=l9_3603;
}
float l9_3605=l9_3582.x;
float l9_3606=l9_3587.x;
float l9_3607=l9_3587.z;
bool l9_3608=l9_3604;
float l9_3609=l9_3592;
float l9_3610=fast::clamp(l9_3605,l9_3606,l9_3607);
float l9_3611=step(abs(l9_3605-l9_3610),9.9999997e-06);
l9_3609*=(l9_3611+((1.0-float(l9_3608))*(1.0-l9_3611)));
l9_3605=l9_3610;
l9_3582.x=l9_3605;
l9_3592=l9_3609;
bool l9_3612=l9_3588;
bool l9_3613;
if (l9_3612)
{
l9_3613=l9_3585.y==3;
}
else
{
l9_3613=l9_3612;
}
float l9_3614=l9_3582.y;
float l9_3615=l9_3587.y;
float l9_3616=l9_3587.w;
bool l9_3617=l9_3613;
float l9_3618=l9_3592;
float l9_3619=fast::clamp(l9_3614,l9_3615,l9_3616);
float l9_3620=step(abs(l9_3614-l9_3619),9.9999997e-06);
l9_3618*=(l9_3620+((1.0-float(l9_3617))*(1.0-l9_3620)));
l9_3614=l9_3619;
l9_3582.y=l9_3614;
l9_3592=l9_3618;
}
float2 l9_3621=l9_3582;
bool l9_3622=l9_3583;
float3x3 l9_3623=l9_3584;
if (l9_3622)
{
l9_3621=float2((l9_3623*float3(l9_3621,1.0)).xy);
}
float2 l9_3624=l9_3621;
float2 l9_3625=l9_3624;
float2 l9_3626=l9_3625;
l9_3582=l9_3626;
float l9_3627=l9_3582.x;
int l9_3628=l9_3585.x;
bool l9_3629=l9_3591;
float l9_3630=l9_3592;
if ((l9_3628==0)||(l9_3628==3))
{
float l9_3631=l9_3627;
float l9_3632=0.0;
float l9_3633=1.0;
bool l9_3634=l9_3629;
float l9_3635=l9_3630;
float l9_3636=fast::clamp(l9_3631,l9_3632,l9_3633);
float l9_3637=step(abs(l9_3631-l9_3636),9.9999997e-06);
l9_3635*=(l9_3637+((1.0-float(l9_3634))*(1.0-l9_3637)));
l9_3631=l9_3636;
l9_3627=l9_3631;
l9_3630=l9_3635;
}
l9_3582.x=l9_3627;
l9_3592=l9_3630;
float l9_3638=l9_3582.y;
int l9_3639=l9_3585.y;
bool l9_3640=l9_3591;
float l9_3641=l9_3592;
if ((l9_3639==0)||(l9_3639==3))
{
float l9_3642=l9_3638;
float l9_3643=0.0;
float l9_3644=1.0;
bool l9_3645=l9_3640;
float l9_3646=l9_3641;
float l9_3647=fast::clamp(l9_3642,l9_3643,l9_3644);
float l9_3648=step(abs(l9_3642-l9_3647),9.9999997e-06);
l9_3646*=(l9_3648+((1.0-float(l9_3645))*(1.0-l9_3648)));
l9_3642=l9_3647;
l9_3638=l9_3642;
l9_3641=l9_3646;
}
l9_3582.y=l9_3638;
l9_3592=l9_3641;
float2 l9_3649=l9_3582;
int l9_3650=l9_3580;
int l9_3651=l9_3581;
float l9_3652=l9_3590;
float2 l9_3653=l9_3649;
int l9_3654=l9_3650;
int l9_3655=l9_3651;
float3 l9_3656=float3(0.0);
if (l9_3654==0)
{
l9_3656=float3(l9_3653,0.0);
}
else
{
if (l9_3654==1)
{
l9_3656=float3(l9_3653.x,(l9_3653.y*0.5)+(0.5-(float(l9_3655)*0.5)),0.0);
}
else
{
l9_3656=float3(l9_3653,float(l9_3655));
}
}
float3 l9_3657=l9_3656;
float3 l9_3658=l9_3657;
float2 l9_3659=l9_3658.xy;
float l9_3660=l9_3652;
float4 l9_3661=sc_set0.reflectionModulationTex.sample(sc_set0.reflectionModulationTexSmpSC,l9_3659,bias(l9_3660));
float4 l9_3662=l9_3661;
float4 l9_3663=l9_3662;
if (l9_3588)
{
l9_3663=mix(l9_3589,l9_3663,float4(l9_3592));
}
float4 l9_3664=l9_3663;
l9_3573=l9_3664;
l9_3360=l9_3573.xyz;
l9_3363=l9_3360;
}
else
{
l9_3363=l9_3361;
}
l9_3359=l9_3363;
float3 l9_3665=float3(0.0);
l9_3665=l9_3267.xyz*l9_3359;
float3 l9_3666=float3(0.0);
float3 l9_3667=l9_3665;
float3 l9_3668;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3668=float3(pow(l9_3667.x,2.2),pow(l9_3667.y,2.2),pow(l9_3667.z,2.2));
}
else
{
l9_3668=l9_3667*l9_3667;
}
float3 l9_3669=l9_3668;
l9_3666=l9_3669;
float3 l9_3670=float3(0.0);
l9_3670=float3(l9_2591)*l9_3666;
param_16=l9_3670;
param_18=param_16;
}
else
{
param_18=param_17;
}
Result_N134=param_18;
float3 Export_N303=float3(0.0);
Export_N303=Result_N134;
float3 Value_N298=float3(0.0);
Value_N298=Export_N303;
float3 Result_N173=float3(0.0);
float3 param_20=float3(0.0);
float3 param_21=(*sc_set0.UserUniforms).Port_Default_N173;
ssGlobals param_23=Globals;
float3 param_22;
if ((int(Tweak_N74_tmp)!=0))
{
float3 l9_3671=float3(0.0);
float3 l9_3672=(*sc_set0.UserUniforms).rimColor;
l9_3671=l9_3672;
float3 l9_3673=float3(0.0);
l9_3673=l9_3671;
float l9_3674=0.0;
float l9_3675=(*sc_set0.UserUniforms).rimIntensity;
l9_3674=l9_3675;
float l9_3676=0.0;
l9_3676=l9_3674;
float3 l9_3677=float3(0.0);
float3 l9_3678=float3(0.0);
float3 l9_3679=(*sc_set0.UserUniforms).Port_Default_N170;
ssGlobals l9_3680=param_23;
float3 l9_3681;
if ((int(Tweak_N216_tmp)!=0))
{
float2 l9_3682=float2(0.0);
float2 l9_3683=float2(0.0);
float2 l9_3684=float2(0.0);
float2 l9_3685=float2(0.0);
float2 l9_3686=float2(0.0);
float2 l9_3687=float2(0.0);
ssGlobals l9_3688=l9_3680;
float2 l9_3689;
if (NODE_315_DROPLIST_ITEM_tmp==0)
{
float2 l9_3690=float2(0.0);
l9_3690=l9_3688.Surface_UVCoord0;
l9_3683=l9_3690;
l9_3689=l9_3683;
}
else
{
if (NODE_315_DROPLIST_ITEM_tmp==1)
{
float2 l9_3691=float2(0.0);
l9_3691=l9_3688.Surface_UVCoord1;
l9_3684=l9_3691;
l9_3689=l9_3684;
}
else
{
if (NODE_315_DROPLIST_ITEM_tmp==2)
{
float2 l9_3692=float2(0.0);
l9_3692=l9_3688.Surface_UVCoord0;
float2 l9_3693=float2(0.0);
float2 l9_3694=float2(0.0);
float2 l9_3695=float2(0.0);
ssGlobals l9_3696=l9_3688;
float2 l9_3697;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3698=float2(0.0);
float2 l9_3699=float2(0.0);
float2 l9_3700=float2(0.0);
float2 l9_3701=float2(0.0);
float2 l9_3702=float2(0.0);
ssGlobals l9_3703=l9_3696;
float2 l9_3704;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3705=float2(0.0);
l9_3705=l9_3703.Surface_UVCoord0;
l9_3699=l9_3705;
l9_3704=l9_3699;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3706=float2(0.0);
l9_3706=l9_3703.Surface_UVCoord1;
l9_3700=l9_3706;
l9_3704=l9_3700;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3707=float2(0.0);
l9_3707=l9_3703.gScreenCoord;
l9_3701=l9_3707;
l9_3704=l9_3701;
}
else
{
float2 l9_3708=float2(0.0);
l9_3708=l9_3703.Surface_UVCoord0;
l9_3702=l9_3708;
l9_3704=l9_3702;
}
}
}
l9_3698=l9_3704;
float2 l9_3709=float2(0.0);
float2 l9_3710=(*sc_set0.UserUniforms).uv2Scale;
l9_3709=l9_3710;
float2 l9_3711=float2(0.0);
l9_3711=l9_3709;
float2 l9_3712=float2(0.0);
float2 l9_3713=(*sc_set0.UserUniforms).uv2Offset;
l9_3712=l9_3713;
float2 l9_3714=float2(0.0);
l9_3714=l9_3712;
float2 l9_3715=float2(0.0);
l9_3715=(l9_3698*l9_3711)+l9_3714;
float2 l9_3716=float2(0.0);
l9_3716=l9_3715+(l9_3714*(l9_3696.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3694=l9_3716;
l9_3697=l9_3694;
}
else
{
float2 l9_3717=float2(0.0);
float2 l9_3718=float2(0.0);
float2 l9_3719=float2(0.0);
float2 l9_3720=float2(0.0);
float2 l9_3721=float2(0.0);
ssGlobals l9_3722=l9_3696;
float2 l9_3723;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3724=float2(0.0);
l9_3724=l9_3722.Surface_UVCoord0;
l9_3718=l9_3724;
l9_3723=l9_3718;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3725=float2(0.0);
l9_3725=l9_3722.Surface_UVCoord1;
l9_3719=l9_3725;
l9_3723=l9_3719;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3726=float2(0.0);
l9_3726=l9_3722.gScreenCoord;
l9_3720=l9_3726;
l9_3723=l9_3720;
}
else
{
float2 l9_3727=float2(0.0);
l9_3727=l9_3722.Surface_UVCoord0;
l9_3721=l9_3727;
l9_3723=l9_3721;
}
}
}
l9_3717=l9_3723;
float2 l9_3728=float2(0.0);
float2 l9_3729=(*sc_set0.UserUniforms).uv2Scale;
l9_3728=l9_3729;
float2 l9_3730=float2(0.0);
l9_3730=l9_3728;
float2 l9_3731=float2(0.0);
float2 l9_3732=(*sc_set0.UserUniforms).uv2Offset;
l9_3731=l9_3732;
float2 l9_3733=float2(0.0);
l9_3733=l9_3731;
float2 l9_3734=float2(0.0);
l9_3734=(l9_3717*l9_3730)+l9_3733;
l9_3695=l9_3734;
l9_3697=l9_3695;
}
l9_3693=l9_3697;
float l9_3735=0.0;
float l9_3736;
if ((int(Tweak_N67_tmp)!=0))
{
l9_3736=1.001;
}
else
{
l9_3736=0.001;
}
l9_3736-=0.001;
l9_3735=l9_3736;
float l9_3737=0.0;
l9_3737=l9_3735;
float2 l9_3738=float2(0.0);
l9_3738=mix(l9_3692,l9_3693,float2(l9_3737));
float2 l9_3739=float2(0.0);
l9_3739=l9_3738;
float2 l9_3740=float2(0.0);
l9_3740=l9_3739;
l9_3685=l9_3740;
l9_3689=l9_3685;
}
else
{
if (NODE_315_DROPLIST_ITEM_tmp==3)
{
float2 l9_3741=float2(0.0);
l9_3741=l9_3688.Surface_UVCoord0;
float2 l9_3742=float2(0.0);
float2 l9_3743=float2(0.0);
float2 l9_3744=float2(0.0);
ssGlobals l9_3745=l9_3688;
float2 l9_3746;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_3747=float2(0.0);
float2 l9_3748=float2(0.0);
float2 l9_3749=float2(0.0);
float2 l9_3750=float2(0.0);
float2 l9_3751=float2(0.0);
float2 l9_3752=float2(0.0);
ssGlobals l9_3753=l9_3745;
float2 l9_3754;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3755=float2(0.0);
l9_3755=l9_3753.Surface_UVCoord0;
l9_3748=l9_3755;
l9_3754=l9_3748;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3756=float2(0.0);
l9_3756=l9_3753.Surface_UVCoord1;
l9_3749=l9_3756;
l9_3754=l9_3749;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3757=float2(0.0);
l9_3757=l9_3753.gScreenCoord;
l9_3750=l9_3757;
l9_3754=l9_3750;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3758=float2(0.0);
l9_3758=l9_3753.Surface_UVCoord0;
float2 l9_3759=float2(0.0);
float2 l9_3760=float2(0.0);
float2 l9_3761=float2(0.0);
ssGlobals l9_3762=l9_3753;
float2 l9_3763;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3764=float2(0.0);
float2 l9_3765=float2(0.0);
float2 l9_3766=float2(0.0);
float2 l9_3767=float2(0.0);
float2 l9_3768=float2(0.0);
ssGlobals l9_3769=l9_3762;
float2 l9_3770;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3771=float2(0.0);
l9_3771=l9_3769.Surface_UVCoord0;
l9_3765=l9_3771;
l9_3770=l9_3765;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3772=float2(0.0);
l9_3772=l9_3769.Surface_UVCoord1;
l9_3766=l9_3772;
l9_3770=l9_3766;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3773=float2(0.0);
l9_3773=l9_3769.gScreenCoord;
l9_3767=l9_3773;
l9_3770=l9_3767;
}
else
{
float2 l9_3774=float2(0.0);
l9_3774=l9_3769.Surface_UVCoord0;
l9_3768=l9_3774;
l9_3770=l9_3768;
}
}
}
l9_3764=l9_3770;
float2 l9_3775=float2(0.0);
float2 l9_3776=(*sc_set0.UserUniforms).uv2Scale;
l9_3775=l9_3776;
float2 l9_3777=float2(0.0);
l9_3777=l9_3775;
float2 l9_3778=float2(0.0);
float2 l9_3779=(*sc_set0.UserUniforms).uv2Offset;
l9_3778=l9_3779;
float2 l9_3780=float2(0.0);
l9_3780=l9_3778;
float2 l9_3781=float2(0.0);
l9_3781=(l9_3764*l9_3777)+l9_3780;
float2 l9_3782=float2(0.0);
l9_3782=l9_3781+(l9_3780*(l9_3762.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3760=l9_3782;
l9_3763=l9_3760;
}
else
{
float2 l9_3783=float2(0.0);
float2 l9_3784=float2(0.0);
float2 l9_3785=float2(0.0);
float2 l9_3786=float2(0.0);
float2 l9_3787=float2(0.0);
ssGlobals l9_3788=l9_3762;
float2 l9_3789;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3790=float2(0.0);
l9_3790=l9_3788.Surface_UVCoord0;
l9_3784=l9_3790;
l9_3789=l9_3784;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3791=float2(0.0);
l9_3791=l9_3788.Surface_UVCoord1;
l9_3785=l9_3791;
l9_3789=l9_3785;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3792=float2(0.0);
l9_3792=l9_3788.gScreenCoord;
l9_3786=l9_3792;
l9_3789=l9_3786;
}
else
{
float2 l9_3793=float2(0.0);
l9_3793=l9_3788.Surface_UVCoord0;
l9_3787=l9_3793;
l9_3789=l9_3787;
}
}
}
l9_3783=l9_3789;
float2 l9_3794=float2(0.0);
float2 l9_3795=(*sc_set0.UserUniforms).uv2Scale;
l9_3794=l9_3795;
float2 l9_3796=float2(0.0);
l9_3796=l9_3794;
float2 l9_3797=float2(0.0);
float2 l9_3798=(*sc_set0.UserUniforms).uv2Offset;
l9_3797=l9_3798;
float2 l9_3799=float2(0.0);
l9_3799=l9_3797;
float2 l9_3800=float2(0.0);
l9_3800=(l9_3783*l9_3796)+l9_3799;
l9_3761=l9_3800;
l9_3763=l9_3761;
}
l9_3759=l9_3763;
float l9_3801=0.0;
float l9_3802;
if ((int(Tweak_N67_tmp)!=0))
{
l9_3802=1.001;
}
else
{
l9_3802=0.001;
}
l9_3802-=0.001;
l9_3801=l9_3802;
float l9_3803=0.0;
l9_3803=l9_3801;
float2 l9_3804=float2(0.0);
l9_3804=mix(l9_3758,l9_3759,float2(l9_3803));
float2 l9_3805=float2(0.0);
l9_3805=l9_3804;
float2 l9_3806=float2(0.0);
l9_3806=l9_3805;
l9_3751=l9_3806;
l9_3754=l9_3751;
}
else
{
float2 l9_3807=float2(0.0);
l9_3807=l9_3753.Surface_UVCoord0;
l9_3752=l9_3807;
l9_3754=l9_3752;
}
}
}
}
l9_3747=l9_3754;
float2 l9_3808=float2(0.0);
float2 l9_3809=(*sc_set0.UserUniforms).uv3Scale;
l9_3808=l9_3809;
float2 l9_3810=float2(0.0);
l9_3810=l9_3808;
float2 l9_3811=float2(0.0);
float2 l9_3812=(*sc_set0.UserUniforms).uv3Offset;
l9_3811=l9_3812;
float2 l9_3813=float2(0.0);
l9_3813=l9_3811;
float2 l9_3814=float2(0.0);
l9_3814=(l9_3747*l9_3810)+l9_3813;
float2 l9_3815=float2(0.0);
l9_3815=l9_3814+(l9_3813*(l9_3745.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_3743=l9_3815;
l9_3746=l9_3743;
}
else
{
float2 l9_3816=float2(0.0);
float2 l9_3817=float2(0.0);
float2 l9_3818=float2(0.0);
float2 l9_3819=float2(0.0);
float2 l9_3820=float2(0.0);
float2 l9_3821=float2(0.0);
ssGlobals l9_3822=l9_3745;
float2 l9_3823;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_3824=float2(0.0);
l9_3824=l9_3822.Surface_UVCoord0;
l9_3817=l9_3824;
l9_3823=l9_3817;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_3825=float2(0.0);
l9_3825=l9_3822.Surface_UVCoord1;
l9_3818=l9_3825;
l9_3823=l9_3818;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_3826=float2(0.0);
l9_3826=l9_3822.gScreenCoord;
l9_3819=l9_3826;
l9_3823=l9_3819;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_3827=float2(0.0);
l9_3827=l9_3822.Surface_UVCoord0;
float2 l9_3828=float2(0.0);
float2 l9_3829=float2(0.0);
float2 l9_3830=float2(0.0);
ssGlobals l9_3831=l9_3822;
float2 l9_3832;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_3833=float2(0.0);
float2 l9_3834=float2(0.0);
float2 l9_3835=float2(0.0);
float2 l9_3836=float2(0.0);
float2 l9_3837=float2(0.0);
ssGlobals l9_3838=l9_3831;
float2 l9_3839;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3840=float2(0.0);
l9_3840=l9_3838.Surface_UVCoord0;
l9_3834=l9_3840;
l9_3839=l9_3834;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3841=float2(0.0);
l9_3841=l9_3838.Surface_UVCoord1;
l9_3835=l9_3841;
l9_3839=l9_3835;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3842=float2(0.0);
l9_3842=l9_3838.gScreenCoord;
l9_3836=l9_3842;
l9_3839=l9_3836;
}
else
{
float2 l9_3843=float2(0.0);
l9_3843=l9_3838.Surface_UVCoord0;
l9_3837=l9_3843;
l9_3839=l9_3837;
}
}
}
l9_3833=l9_3839;
float2 l9_3844=float2(0.0);
float2 l9_3845=(*sc_set0.UserUniforms).uv2Scale;
l9_3844=l9_3845;
float2 l9_3846=float2(0.0);
l9_3846=l9_3844;
float2 l9_3847=float2(0.0);
float2 l9_3848=(*sc_set0.UserUniforms).uv2Offset;
l9_3847=l9_3848;
float2 l9_3849=float2(0.0);
l9_3849=l9_3847;
float2 l9_3850=float2(0.0);
l9_3850=(l9_3833*l9_3846)+l9_3849;
float2 l9_3851=float2(0.0);
l9_3851=l9_3850+(l9_3849*(l9_3831.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_3829=l9_3851;
l9_3832=l9_3829;
}
else
{
float2 l9_3852=float2(0.0);
float2 l9_3853=float2(0.0);
float2 l9_3854=float2(0.0);
float2 l9_3855=float2(0.0);
float2 l9_3856=float2(0.0);
ssGlobals l9_3857=l9_3831;
float2 l9_3858;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_3859=float2(0.0);
l9_3859=l9_3857.Surface_UVCoord0;
l9_3853=l9_3859;
l9_3858=l9_3853;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_3860=float2(0.0);
l9_3860=l9_3857.Surface_UVCoord1;
l9_3854=l9_3860;
l9_3858=l9_3854;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_3861=float2(0.0);
l9_3861=l9_3857.gScreenCoord;
l9_3855=l9_3861;
l9_3858=l9_3855;
}
else
{
float2 l9_3862=float2(0.0);
l9_3862=l9_3857.Surface_UVCoord0;
l9_3856=l9_3862;
l9_3858=l9_3856;
}
}
}
l9_3852=l9_3858;
float2 l9_3863=float2(0.0);
float2 l9_3864=(*sc_set0.UserUniforms).uv2Scale;
l9_3863=l9_3864;
float2 l9_3865=float2(0.0);
l9_3865=l9_3863;
float2 l9_3866=float2(0.0);
float2 l9_3867=(*sc_set0.UserUniforms).uv2Offset;
l9_3866=l9_3867;
float2 l9_3868=float2(0.0);
l9_3868=l9_3866;
float2 l9_3869=float2(0.0);
l9_3869=(l9_3852*l9_3865)+l9_3868;
l9_3830=l9_3869;
l9_3832=l9_3830;
}
l9_3828=l9_3832;
float l9_3870=0.0;
float l9_3871;
if ((int(Tweak_N67_tmp)!=0))
{
l9_3871=1.001;
}
else
{
l9_3871=0.001;
}
l9_3871-=0.001;
l9_3870=l9_3871;
float l9_3872=0.0;
l9_3872=l9_3870;
float2 l9_3873=float2(0.0);
l9_3873=mix(l9_3827,l9_3828,float2(l9_3872));
float2 l9_3874=float2(0.0);
l9_3874=l9_3873;
float2 l9_3875=float2(0.0);
l9_3875=l9_3874;
l9_3820=l9_3875;
l9_3823=l9_3820;
}
else
{
float2 l9_3876=float2(0.0);
l9_3876=l9_3822.Surface_UVCoord0;
l9_3821=l9_3876;
l9_3823=l9_3821;
}
}
}
}
l9_3816=l9_3823;
float2 l9_3877=float2(0.0);
float2 l9_3878=(*sc_set0.UserUniforms).uv3Scale;
l9_3877=l9_3878;
float2 l9_3879=float2(0.0);
l9_3879=l9_3877;
float2 l9_3880=float2(0.0);
float2 l9_3881=(*sc_set0.UserUniforms).uv3Offset;
l9_3880=l9_3881;
float2 l9_3882=float2(0.0);
l9_3882=l9_3880;
float2 l9_3883=float2(0.0);
l9_3883=(l9_3816*l9_3879)+l9_3882;
l9_3744=l9_3883;
l9_3746=l9_3744;
}
l9_3742=l9_3746;
float l9_3884=0.0;
float l9_3885;
if ((int(Tweak_N11_tmp)!=0))
{
l9_3885=1.001;
}
else
{
l9_3885=0.001;
}
l9_3885-=0.001;
l9_3884=l9_3885;
float l9_3886=0.0;
l9_3886=l9_3884;
float2 l9_3887=float2(0.0);
l9_3887=mix(l9_3741,l9_3742,float2(l9_3886));
float2 l9_3888=float2(0.0);
l9_3888=l9_3887;
float2 l9_3889=float2(0.0);
l9_3889=l9_3888;
l9_3686=l9_3889;
l9_3689=l9_3686;
}
else
{
float2 l9_3890=float2(0.0);
l9_3890=l9_3688.Surface_UVCoord0;
l9_3687=l9_3890;
l9_3689=l9_3687;
}
}
}
}
l9_3682=l9_3689;
float4 l9_3891=float4(0.0);
int l9_3892=0;
if ((int(rimColorTexHasSwappedViews_tmp)!=0))
{
int l9_3893=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3893=0;
}
else
{
l9_3893=in.varStereoViewID;
}
int l9_3894=l9_3893;
l9_3892=1-l9_3894;
}
else
{
int l9_3895=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_3895=0;
}
else
{
l9_3895=in.varStereoViewID;
}
int l9_3896=l9_3895;
l9_3892=l9_3896;
}
int l9_3897=l9_3892;
int l9_3898=rimColorTexLayout_tmp;
int l9_3899=l9_3897;
float2 l9_3900=l9_3682;
bool l9_3901=(int(SC_USE_UV_TRANSFORM_rimColorTex_tmp)!=0);
float3x3 l9_3902=(*sc_set0.UserUniforms).rimColorTexTransform;
int2 l9_3903=int2(SC_SOFTWARE_WRAP_MODE_U_rimColorTex_tmp,SC_SOFTWARE_WRAP_MODE_V_rimColorTex_tmp);
bool l9_3904=(int(SC_USE_UV_MIN_MAX_rimColorTex_tmp)!=0);
float4 l9_3905=(*sc_set0.UserUniforms).rimColorTexUvMinMax;
bool l9_3906=(int(SC_USE_CLAMP_TO_BORDER_rimColorTex_tmp)!=0);
float4 l9_3907=(*sc_set0.UserUniforms).rimColorTexBorderColor;
float l9_3908=0.0;
bool l9_3909=l9_3906&&(!l9_3904);
float l9_3910=1.0;
float l9_3911=l9_3900.x;
int l9_3912=l9_3903.x;
if (l9_3912==1)
{
l9_3911=fract(l9_3911);
}
else
{
if (l9_3912==2)
{
float l9_3913=fract(l9_3911);
float l9_3914=l9_3911-l9_3913;
float l9_3915=step(0.25,fract(l9_3914*0.5));
l9_3911=mix(l9_3913,1.0-l9_3913,fast::clamp(l9_3915,0.0,1.0));
}
}
l9_3900.x=l9_3911;
float l9_3916=l9_3900.y;
int l9_3917=l9_3903.y;
if (l9_3917==1)
{
l9_3916=fract(l9_3916);
}
else
{
if (l9_3917==2)
{
float l9_3918=fract(l9_3916);
float l9_3919=l9_3916-l9_3918;
float l9_3920=step(0.25,fract(l9_3919*0.5));
l9_3916=mix(l9_3918,1.0-l9_3918,fast::clamp(l9_3920,0.0,1.0));
}
}
l9_3900.y=l9_3916;
if (l9_3904)
{
bool l9_3921=l9_3906;
bool l9_3922;
if (l9_3921)
{
l9_3922=l9_3903.x==3;
}
else
{
l9_3922=l9_3921;
}
float l9_3923=l9_3900.x;
float l9_3924=l9_3905.x;
float l9_3925=l9_3905.z;
bool l9_3926=l9_3922;
float l9_3927=l9_3910;
float l9_3928=fast::clamp(l9_3923,l9_3924,l9_3925);
float l9_3929=step(abs(l9_3923-l9_3928),9.9999997e-06);
l9_3927*=(l9_3929+((1.0-float(l9_3926))*(1.0-l9_3929)));
l9_3923=l9_3928;
l9_3900.x=l9_3923;
l9_3910=l9_3927;
bool l9_3930=l9_3906;
bool l9_3931;
if (l9_3930)
{
l9_3931=l9_3903.y==3;
}
else
{
l9_3931=l9_3930;
}
float l9_3932=l9_3900.y;
float l9_3933=l9_3905.y;
float l9_3934=l9_3905.w;
bool l9_3935=l9_3931;
float l9_3936=l9_3910;
float l9_3937=fast::clamp(l9_3932,l9_3933,l9_3934);
float l9_3938=step(abs(l9_3932-l9_3937),9.9999997e-06);
l9_3936*=(l9_3938+((1.0-float(l9_3935))*(1.0-l9_3938)));
l9_3932=l9_3937;
l9_3900.y=l9_3932;
l9_3910=l9_3936;
}
float2 l9_3939=l9_3900;
bool l9_3940=l9_3901;
float3x3 l9_3941=l9_3902;
if (l9_3940)
{
l9_3939=float2((l9_3941*float3(l9_3939,1.0)).xy);
}
float2 l9_3942=l9_3939;
float2 l9_3943=l9_3942;
float2 l9_3944=l9_3943;
l9_3900=l9_3944;
float l9_3945=l9_3900.x;
int l9_3946=l9_3903.x;
bool l9_3947=l9_3909;
float l9_3948=l9_3910;
if ((l9_3946==0)||(l9_3946==3))
{
float l9_3949=l9_3945;
float l9_3950=0.0;
float l9_3951=1.0;
bool l9_3952=l9_3947;
float l9_3953=l9_3948;
float l9_3954=fast::clamp(l9_3949,l9_3950,l9_3951);
float l9_3955=step(abs(l9_3949-l9_3954),9.9999997e-06);
l9_3953*=(l9_3955+((1.0-float(l9_3952))*(1.0-l9_3955)));
l9_3949=l9_3954;
l9_3945=l9_3949;
l9_3948=l9_3953;
}
l9_3900.x=l9_3945;
l9_3910=l9_3948;
float l9_3956=l9_3900.y;
int l9_3957=l9_3903.y;
bool l9_3958=l9_3909;
float l9_3959=l9_3910;
if ((l9_3957==0)||(l9_3957==3))
{
float l9_3960=l9_3956;
float l9_3961=0.0;
float l9_3962=1.0;
bool l9_3963=l9_3958;
float l9_3964=l9_3959;
float l9_3965=fast::clamp(l9_3960,l9_3961,l9_3962);
float l9_3966=step(abs(l9_3960-l9_3965),9.9999997e-06);
l9_3964*=(l9_3966+((1.0-float(l9_3963))*(1.0-l9_3966)));
l9_3960=l9_3965;
l9_3956=l9_3960;
l9_3959=l9_3964;
}
l9_3900.y=l9_3956;
l9_3910=l9_3959;
float2 l9_3967=l9_3900;
int l9_3968=l9_3898;
int l9_3969=l9_3899;
float l9_3970=l9_3908;
float2 l9_3971=l9_3967;
int l9_3972=l9_3968;
int l9_3973=l9_3969;
float3 l9_3974=float3(0.0);
if (l9_3972==0)
{
l9_3974=float3(l9_3971,0.0);
}
else
{
if (l9_3972==1)
{
l9_3974=float3(l9_3971.x,(l9_3971.y*0.5)+(0.5-(float(l9_3973)*0.5)),0.0);
}
else
{
l9_3974=float3(l9_3971,float(l9_3973));
}
}
float3 l9_3975=l9_3974;
float3 l9_3976=l9_3975;
float2 l9_3977=l9_3976.xy;
float l9_3978=l9_3970;
float4 l9_3979=sc_set0.rimColorTex.sample(sc_set0.rimColorTexSmpSC,l9_3977,bias(l9_3978));
float4 l9_3980=l9_3979;
float4 l9_3981=l9_3980;
if (l9_3906)
{
l9_3981=mix(l9_3907,l9_3981,float4(l9_3910));
}
float4 l9_3982=l9_3981;
l9_3891=l9_3982;
l9_3678=l9_3891.xyz;
l9_3681=l9_3678;
}
else
{
l9_3681=l9_3679;
}
l9_3677=l9_3681;
float3 l9_3983=float3(0.0);
l9_3983=(l9_3673*float3(l9_3676))*l9_3677;
float3 l9_3984=float3(0.0);
float3 l9_3985=l9_3983;
float3 l9_3986;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_3986=float3(pow(l9_3985.x,2.2),pow(l9_3985.y,2.2),pow(l9_3985.z,2.2));
}
else
{
l9_3986=l9_3985*l9_3985;
}
float3 l9_3987=l9_3986;
l9_3984=l9_3987;
float l9_3988=0.0;
float l9_3989=0.0;
float l9_3990=0.0;
ssGlobals l9_3991=param_23;
float l9_3992;
if ((int(rimInvert_tmp)!=0))
{
float3 l9_3993=float3(0.0);
float3 l9_3994=float3(0.0);
float3 l9_3995=float3(0.0);
ssGlobals l9_3996=l9_3991;
float3 l9_3997;
if ((int(Tweak_N354_tmp)!=0))
{
float3 l9_3998=float3(0.0);
l9_3998=l9_3996.VertexTangent_WorldSpace;
float3 l9_3999=float3(0.0);
l9_3999=l9_3996.VertexBinormal_WorldSpace;
float3 l9_4000=float3(0.0);
l9_4000=l9_3996.VertexNormal_WorldSpace;
float3x3 l9_4001=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_4001=float3x3(float3(l9_3998),float3(l9_3999),float3(l9_4000));
float2 l9_4002=float2(0.0);
float2 l9_4003=float2(0.0);
float2 l9_4004=float2(0.0);
float2 l9_4005=float2(0.0);
float2 l9_4006=float2(0.0);
float2 l9_4007=float2(0.0);
ssGlobals l9_4008=l9_3996;
float2 l9_4009;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_4010=float2(0.0);
l9_4010=l9_4008.Surface_UVCoord0;
l9_4003=l9_4010;
l9_4009=l9_4003;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_4011=float2(0.0);
l9_4011=l9_4008.Surface_UVCoord1;
l9_4004=l9_4011;
l9_4009=l9_4004;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_4012=float2(0.0);
l9_4012=l9_4008.Surface_UVCoord0;
float2 l9_4013=float2(0.0);
float2 l9_4014=float2(0.0);
float2 l9_4015=float2(0.0);
ssGlobals l9_4016=l9_4008;
float2 l9_4017;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4018=float2(0.0);
float2 l9_4019=float2(0.0);
float2 l9_4020=float2(0.0);
float2 l9_4021=float2(0.0);
float2 l9_4022=float2(0.0);
ssGlobals l9_4023=l9_4016;
float2 l9_4024;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4025=float2(0.0);
l9_4025=l9_4023.Surface_UVCoord0;
l9_4019=l9_4025;
l9_4024=l9_4019;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4026=float2(0.0);
l9_4026=l9_4023.Surface_UVCoord1;
l9_4020=l9_4026;
l9_4024=l9_4020;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4027=float2(0.0);
l9_4027=l9_4023.gScreenCoord;
l9_4021=l9_4027;
l9_4024=l9_4021;
}
else
{
float2 l9_4028=float2(0.0);
l9_4028=l9_4023.Surface_UVCoord0;
l9_4022=l9_4028;
l9_4024=l9_4022;
}
}
}
l9_4018=l9_4024;
float2 l9_4029=float2(0.0);
float2 l9_4030=(*sc_set0.UserUniforms).uv2Scale;
l9_4029=l9_4030;
float2 l9_4031=float2(0.0);
l9_4031=l9_4029;
float2 l9_4032=float2(0.0);
float2 l9_4033=(*sc_set0.UserUniforms).uv2Offset;
l9_4032=l9_4033;
float2 l9_4034=float2(0.0);
l9_4034=l9_4032;
float2 l9_4035=float2(0.0);
l9_4035=(l9_4018*l9_4031)+l9_4034;
float2 l9_4036=float2(0.0);
l9_4036=l9_4035+(l9_4034*(l9_4016.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4014=l9_4036;
l9_4017=l9_4014;
}
else
{
float2 l9_4037=float2(0.0);
float2 l9_4038=float2(0.0);
float2 l9_4039=float2(0.0);
float2 l9_4040=float2(0.0);
float2 l9_4041=float2(0.0);
ssGlobals l9_4042=l9_4016;
float2 l9_4043;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4044=float2(0.0);
l9_4044=l9_4042.Surface_UVCoord0;
l9_4038=l9_4044;
l9_4043=l9_4038;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4045=float2(0.0);
l9_4045=l9_4042.Surface_UVCoord1;
l9_4039=l9_4045;
l9_4043=l9_4039;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4046=float2(0.0);
l9_4046=l9_4042.gScreenCoord;
l9_4040=l9_4046;
l9_4043=l9_4040;
}
else
{
float2 l9_4047=float2(0.0);
l9_4047=l9_4042.Surface_UVCoord0;
l9_4041=l9_4047;
l9_4043=l9_4041;
}
}
}
l9_4037=l9_4043;
float2 l9_4048=float2(0.0);
float2 l9_4049=(*sc_set0.UserUniforms).uv2Scale;
l9_4048=l9_4049;
float2 l9_4050=float2(0.0);
l9_4050=l9_4048;
float2 l9_4051=float2(0.0);
float2 l9_4052=(*sc_set0.UserUniforms).uv2Offset;
l9_4051=l9_4052;
float2 l9_4053=float2(0.0);
l9_4053=l9_4051;
float2 l9_4054=float2(0.0);
l9_4054=(l9_4037*l9_4050)+l9_4053;
l9_4015=l9_4054;
l9_4017=l9_4015;
}
l9_4013=l9_4017;
float l9_4055=0.0;
float l9_4056;
if ((int(Tweak_N67_tmp)!=0))
{
l9_4056=1.001;
}
else
{
l9_4056=0.001;
}
l9_4056-=0.001;
l9_4055=l9_4056;
float l9_4057=0.0;
l9_4057=l9_4055;
float2 l9_4058=float2(0.0);
l9_4058=mix(l9_4012,l9_4013,float2(l9_4057));
float2 l9_4059=float2(0.0);
l9_4059=l9_4058;
float2 l9_4060=float2(0.0);
l9_4060=l9_4059;
l9_4005=l9_4060;
l9_4009=l9_4005;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_4061=float2(0.0);
l9_4061=l9_4008.Surface_UVCoord0;
float2 l9_4062=float2(0.0);
float2 l9_4063=float2(0.0);
float2 l9_4064=float2(0.0);
ssGlobals l9_4065=l9_4008;
float2 l9_4066;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_4067=float2(0.0);
float2 l9_4068=float2(0.0);
float2 l9_4069=float2(0.0);
float2 l9_4070=float2(0.0);
float2 l9_4071=float2(0.0);
float2 l9_4072=float2(0.0);
ssGlobals l9_4073=l9_4065;
float2 l9_4074;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4075=float2(0.0);
l9_4075=l9_4073.Surface_UVCoord0;
l9_4068=l9_4075;
l9_4074=l9_4068;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4076=float2(0.0);
l9_4076=l9_4073.Surface_UVCoord1;
l9_4069=l9_4076;
l9_4074=l9_4069;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4077=float2(0.0);
l9_4077=l9_4073.gScreenCoord;
l9_4070=l9_4077;
l9_4074=l9_4070;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4078=float2(0.0);
l9_4078=l9_4073.Surface_UVCoord0;
float2 l9_4079=float2(0.0);
float2 l9_4080=float2(0.0);
float2 l9_4081=float2(0.0);
ssGlobals l9_4082=l9_4073;
float2 l9_4083;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4084=float2(0.0);
float2 l9_4085=float2(0.0);
float2 l9_4086=float2(0.0);
float2 l9_4087=float2(0.0);
float2 l9_4088=float2(0.0);
ssGlobals l9_4089=l9_4082;
float2 l9_4090;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4091=float2(0.0);
l9_4091=l9_4089.Surface_UVCoord0;
l9_4085=l9_4091;
l9_4090=l9_4085;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4092=float2(0.0);
l9_4092=l9_4089.Surface_UVCoord1;
l9_4086=l9_4092;
l9_4090=l9_4086;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4093=float2(0.0);
l9_4093=l9_4089.gScreenCoord;
l9_4087=l9_4093;
l9_4090=l9_4087;
}
else
{
float2 l9_4094=float2(0.0);
l9_4094=l9_4089.Surface_UVCoord0;
l9_4088=l9_4094;
l9_4090=l9_4088;
}
}
}
l9_4084=l9_4090;
float2 l9_4095=float2(0.0);
float2 l9_4096=(*sc_set0.UserUniforms).uv2Scale;
l9_4095=l9_4096;
float2 l9_4097=float2(0.0);
l9_4097=l9_4095;
float2 l9_4098=float2(0.0);
float2 l9_4099=(*sc_set0.UserUniforms).uv2Offset;
l9_4098=l9_4099;
float2 l9_4100=float2(0.0);
l9_4100=l9_4098;
float2 l9_4101=float2(0.0);
l9_4101=(l9_4084*l9_4097)+l9_4100;
float2 l9_4102=float2(0.0);
l9_4102=l9_4101+(l9_4100*(l9_4082.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4080=l9_4102;
l9_4083=l9_4080;
}
else
{
float2 l9_4103=float2(0.0);
float2 l9_4104=float2(0.0);
float2 l9_4105=float2(0.0);
float2 l9_4106=float2(0.0);
float2 l9_4107=float2(0.0);
ssGlobals l9_4108=l9_4082;
float2 l9_4109;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4110=float2(0.0);
l9_4110=l9_4108.Surface_UVCoord0;
l9_4104=l9_4110;
l9_4109=l9_4104;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4111=float2(0.0);
l9_4111=l9_4108.Surface_UVCoord1;
l9_4105=l9_4111;
l9_4109=l9_4105;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4112=float2(0.0);
l9_4112=l9_4108.gScreenCoord;
l9_4106=l9_4112;
l9_4109=l9_4106;
}
else
{
float2 l9_4113=float2(0.0);
l9_4113=l9_4108.Surface_UVCoord0;
l9_4107=l9_4113;
l9_4109=l9_4107;
}
}
}
l9_4103=l9_4109;
float2 l9_4114=float2(0.0);
float2 l9_4115=(*sc_set0.UserUniforms).uv2Scale;
l9_4114=l9_4115;
float2 l9_4116=float2(0.0);
l9_4116=l9_4114;
float2 l9_4117=float2(0.0);
float2 l9_4118=(*sc_set0.UserUniforms).uv2Offset;
l9_4117=l9_4118;
float2 l9_4119=float2(0.0);
l9_4119=l9_4117;
float2 l9_4120=float2(0.0);
l9_4120=(l9_4103*l9_4116)+l9_4119;
l9_4081=l9_4120;
l9_4083=l9_4081;
}
l9_4079=l9_4083;
float l9_4121=0.0;
float l9_4122;
if ((int(Tweak_N67_tmp)!=0))
{
l9_4122=1.001;
}
else
{
l9_4122=0.001;
}
l9_4122-=0.001;
l9_4121=l9_4122;
float l9_4123=0.0;
l9_4123=l9_4121;
float2 l9_4124=float2(0.0);
l9_4124=mix(l9_4078,l9_4079,float2(l9_4123));
float2 l9_4125=float2(0.0);
l9_4125=l9_4124;
float2 l9_4126=float2(0.0);
l9_4126=l9_4125;
l9_4071=l9_4126;
l9_4074=l9_4071;
}
else
{
float2 l9_4127=float2(0.0);
l9_4127=l9_4073.Surface_UVCoord0;
l9_4072=l9_4127;
l9_4074=l9_4072;
}
}
}
}
l9_4067=l9_4074;
float2 l9_4128=float2(0.0);
float2 l9_4129=(*sc_set0.UserUniforms).uv3Scale;
l9_4128=l9_4129;
float2 l9_4130=float2(0.0);
l9_4130=l9_4128;
float2 l9_4131=float2(0.0);
float2 l9_4132=(*sc_set0.UserUniforms).uv3Offset;
l9_4131=l9_4132;
float2 l9_4133=float2(0.0);
l9_4133=l9_4131;
float2 l9_4134=float2(0.0);
l9_4134=(l9_4067*l9_4130)+l9_4133;
float2 l9_4135=float2(0.0);
l9_4135=l9_4134+(l9_4133*(l9_4065.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_4063=l9_4135;
l9_4066=l9_4063;
}
else
{
float2 l9_4136=float2(0.0);
float2 l9_4137=float2(0.0);
float2 l9_4138=float2(0.0);
float2 l9_4139=float2(0.0);
float2 l9_4140=float2(0.0);
float2 l9_4141=float2(0.0);
ssGlobals l9_4142=l9_4065;
float2 l9_4143;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4144=float2(0.0);
l9_4144=l9_4142.Surface_UVCoord0;
l9_4137=l9_4144;
l9_4143=l9_4137;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4145=float2(0.0);
l9_4145=l9_4142.Surface_UVCoord1;
l9_4138=l9_4145;
l9_4143=l9_4138;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4146=float2(0.0);
l9_4146=l9_4142.gScreenCoord;
l9_4139=l9_4146;
l9_4143=l9_4139;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4147=float2(0.0);
l9_4147=l9_4142.Surface_UVCoord0;
float2 l9_4148=float2(0.0);
float2 l9_4149=float2(0.0);
float2 l9_4150=float2(0.0);
ssGlobals l9_4151=l9_4142;
float2 l9_4152;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4153=float2(0.0);
float2 l9_4154=float2(0.0);
float2 l9_4155=float2(0.0);
float2 l9_4156=float2(0.0);
float2 l9_4157=float2(0.0);
ssGlobals l9_4158=l9_4151;
float2 l9_4159;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4160=float2(0.0);
l9_4160=l9_4158.Surface_UVCoord0;
l9_4154=l9_4160;
l9_4159=l9_4154;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4161=float2(0.0);
l9_4161=l9_4158.Surface_UVCoord1;
l9_4155=l9_4161;
l9_4159=l9_4155;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4162=float2(0.0);
l9_4162=l9_4158.gScreenCoord;
l9_4156=l9_4162;
l9_4159=l9_4156;
}
else
{
float2 l9_4163=float2(0.0);
l9_4163=l9_4158.Surface_UVCoord0;
l9_4157=l9_4163;
l9_4159=l9_4157;
}
}
}
l9_4153=l9_4159;
float2 l9_4164=float2(0.0);
float2 l9_4165=(*sc_set0.UserUniforms).uv2Scale;
l9_4164=l9_4165;
float2 l9_4166=float2(0.0);
l9_4166=l9_4164;
float2 l9_4167=float2(0.0);
float2 l9_4168=(*sc_set0.UserUniforms).uv2Offset;
l9_4167=l9_4168;
float2 l9_4169=float2(0.0);
l9_4169=l9_4167;
float2 l9_4170=float2(0.0);
l9_4170=(l9_4153*l9_4166)+l9_4169;
float2 l9_4171=float2(0.0);
l9_4171=l9_4170+(l9_4169*(l9_4151.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4149=l9_4171;
l9_4152=l9_4149;
}
else
{
float2 l9_4172=float2(0.0);
float2 l9_4173=float2(0.0);
float2 l9_4174=float2(0.0);
float2 l9_4175=float2(0.0);
float2 l9_4176=float2(0.0);
ssGlobals l9_4177=l9_4151;
float2 l9_4178;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4179=float2(0.0);
l9_4179=l9_4177.Surface_UVCoord0;
l9_4173=l9_4179;
l9_4178=l9_4173;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4180=float2(0.0);
l9_4180=l9_4177.Surface_UVCoord1;
l9_4174=l9_4180;
l9_4178=l9_4174;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4181=float2(0.0);
l9_4181=l9_4177.gScreenCoord;
l9_4175=l9_4181;
l9_4178=l9_4175;
}
else
{
float2 l9_4182=float2(0.0);
l9_4182=l9_4177.Surface_UVCoord0;
l9_4176=l9_4182;
l9_4178=l9_4176;
}
}
}
l9_4172=l9_4178;
float2 l9_4183=float2(0.0);
float2 l9_4184=(*sc_set0.UserUniforms).uv2Scale;
l9_4183=l9_4184;
float2 l9_4185=float2(0.0);
l9_4185=l9_4183;
float2 l9_4186=float2(0.0);
float2 l9_4187=(*sc_set0.UserUniforms).uv2Offset;
l9_4186=l9_4187;
float2 l9_4188=float2(0.0);
l9_4188=l9_4186;
float2 l9_4189=float2(0.0);
l9_4189=(l9_4172*l9_4185)+l9_4188;
l9_4150=l9_4189;
l9_4152=l9_4150;
}
l9_4148=l9_4152;
float l9_4190=0.0;
float l9_4191;
if ((int(Tweak_N67_tmp)!=0))
{
l9_4191=1.001;
}
else
{
l9_4191=0.001;
}
l9_4191-=0.001;
l9_4190=l9_4191;
float l9_4192=0.0;
l9_4192=l9_4190;
float2 l9_4193=float2(0.0);
l9_4193=mix(l9_4147,l9_4148,float2(l9_4192));
float2 l9_4194=float2(0.0);
l9_4194=l9_4193;
float2 l9_4195=float2(0.0);
l9_4195=l9_4194;
l9_4140=l9_4195;
l9_4143=l9_4140;
}
else
{
float2 l9_4196=float2(0.0);
l9_4196=l9_4142.Surface_UVCoord0;
l9_4141=l9_4196;
l9_4143=l9_4141;
}
}
}
}
l9_4136=l9_4143;
float2 l9_4197=float2(0.0);
float2 l9_4198=(*sc_set0.UserUniforms).uv3Scale;
l9_4197=l9_4198;
float2 l9_4199=float2(0.0);
l9_4199=l9_4197;
float2 l9_4200=float2(0.0);
float2 l9_4201=(*sc_set0.UserUniforms).uv3Offset;
l9_4200=l9_4201;
float2 l9_4202=float2(0.0);
l9_4202=l9_4200;
float2 l9_4203=float2(0.0);
l9_4203=(l9_4136*l9_4199)+l9_4202;
l9_4064=l9_4203;
l9_4066=l9_4064;
}
l9_4062=l9_4066;
float l9_4204=0.0;
float l9_4205;
if ((int(Tweak_N11_tmp)!=0))
{
l9_4205=1.001;
}
else
{
l9_4205=0.001;
}
l9_4205-=0.001;
l9_4204=l9_4205;
float l9_4206=0.0;
l9_4206=l9_4204;
float2 l9_4207=float2(0.0);
l9_4207=mix(l9_4061,l9_4062,float2(l9_4206));
float2 l9_4208=float2(0.0);
l9_4208=l9_4207;
float2 l9_4209=float2(0.0);
l9_4209=l9_4208;
l9_4006=l9_4209;
l9_4009=l9_4006;
}
else
{
float2 l9_4210=float2(0.0);
l9_4210=l9_4008.Surface_UVCoord0;
l9_4007=l9_4210;
l9_4009=l9_4007;
}
}
}
}
l9_4002=l9_4009;
float4 l9_4211=float4(0.0);
float2 l9_4212=l9_4002;
int l9_4213=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_4214=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4214=0;
}
else
{
l9_4214=in.varStereoViewID;
}
int l9_4215=l9_4214;
l9_4213=1-l9_4215;
}
else
{
int l9_4216=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4216=0;
}
else
{
l9_4216=in.varStereoViewID;
}
int l9_4217=l9_4216;
l9_4213=l9_4217;
}
int l9_4218=l9_4213;
int l9_4219=normalTexLayout_tmp;
int l9_4220=l9_4218;
float2 l9_4221=l9_4212;
bool l9_4222=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_4223=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_4224=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_4225=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_4226=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_4227=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_4228=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_4229=0.0;
bool l9_4230=l9_4227&&(!l9_4225);
float l9_4231=1.0;
float l9_4232=l9_4221.x;
int l9_4233=l9_4224.x;
if (l9_4233==1)
{
l9_4232=fract(l9_4232);
}
else
{
if (l9_4233==2)
{
float l9_4234=fract(l9_4232);
float l9_4235=l9_4232-l9_4234;
float l9_4236=step(0.25,fract(l9_4235*0.5));
l9_4232=mix(l9_4234,1.0-l9_4234,fast::clamp(l9_4236,0.0,1.0));
}
}
l9_4221.x=l9_4232;
float l9_4237=l9_4221.y;
int l9_4238=l9_4224.y;
if (l9_4238==1)
{
l9_4237=fract(l9_4237);
}
else
{
if (l9_4238==2)
{
float l9_4239=fract(l9_4237);
float l9_4240=l9_4237-l9_4239;
float l9_4241=step(0.25,fract(l9_4240*0.5));
l9_4237=mix(l9_4239,1.0-l9_4239,fast::clamp(l9_4241,0.0,1.0));
}
}
l9_4221.y=l9_4237;
if (l9_4225)
{
bool l9_4242=l9_4227;
bool l9_4243;
if (l9_4242)
{
l9_4243=l9_4224.x==3;
}
else
{
l9_4243=l9_4242;
}
float l9_4244=l9_4221.x;
float l9_4245=l9_4226.x;
float l9_4246=l9_4226.z;
bool l9_4247=l9_4243;
float l9_4248=l9_4231;
float l9_4249=fast::clamp(l9_4244,l9_4245,l9_4246);
float l9_4250=step(abs(l9_4244-l9_4249),9.9999997e-06);
l9_4248*=(l9_4250+((1.0-float(l9_4247))*(1.0-l9_4250)));
l9_4244=l9_4249;
l9_4221.x=l9_4244;
l9_4231=l9_4248;
bool l9_4251=l9_4227;
bool l9_4252;
if (l9_4251)
{
l9_4252=l9_4224.y==3;
}
else
{
l9_4252=l9_4251;
}
float l9_4253=l9_4221.y;
float l9_4254=l9_4226.y;
float l9_4255=l9_4226.w;
bool l9_4256=l9_4252;
float l9_4257=l9_4231;
float l9_4258=fast::clamp(l9_4253,l9_4254,l9_4255);
float l9_4259=step(abs(l9_4253-l9_4258),9.9999997e-06);
l9_4257*=(l9_4259+((1.0-float(l9_4256))*(1.0-l9_4259)));
l9_4253=l9_4258;
l9_4221.y=l9_4253;
l9_4231=l9_4257;
}
float2 l9_4260=l9_4221;
bool l9_4261=l9_4222;
float3x3 l9_4262=l9_4223;
if (l9_4261)
{
l9_4260=float2((l9_4262*float3(l9_4260,1.0)).xy);
}
float2 l9_4263=l9_4260;
float2 l9_4264=l9_4263;
float2 l9_4265=l9_4264;
l9_4221=l9_4265;
float l9_4266=l9_4221.x;
int l9_4267=l9_4224.x;
bool l9_4268=l9_4230;
float l9_4269=l9_4231;
if ((l9_4267==0)||(l9_4267==3))
{
float l9_4270=l9_4266;
float l9_4271=0.0;
float l9_4272=1.0;
bool l9_4273=l9_4268;
float l9_4274=l9_4269;
float l9_4275=fast::clamp(l9_4270,l9_4271,l9_4272);
float l9_4276=step(abs(l9_4270-l9_4275),9.9999997e-06);
l9_4274*=(l9_4276+((1.0-float(l9_4273))*(1.0-l9_4276)));
l9_4270=l9_4275;
l9_4266=l9_4270;
l9_4269=l9_4274;
}
l9_4221.x=l9_4266;
l9_4231=l9_4269;
float l9_4277=l9_4221.y;
int l9_4278=l9_4224.y;
bool l9_4279=l9_4230;
float l9_4280=l9_4231;
if ((l9_4278==0)||(l9_4278==3))
{
float l9_4281=l9_4277;
float l9_4282=0.0;
float l9_4283=1.0;
bool l9_4284=l9_4279;
float l9_4285=l9_4280;
float l9_4286=fast::clamp(l9_4281,l9_4282,l9_4283);
float l9_4287=step(abs(l9_4281-l9_4286),9.9999997e-06);
l9_4285*=(l9_4287+((1.0-float(l9_4284))*(1.0-l9_4287)));
l9_4281=l9_4286;
l9_4277=l9_4281;
l9_4280=l9_4285;
}
l9_4221.y=l9_4277;
l9_4231=l9_4280;
float2 l9_4288=l9_4221;
int l9_4289=l9_4219;
int l9_4290=l9_4220;
float l9_4291=l9_4229;
float2 l9_4292=l9_4288;
int l9_4293=l9_4289;
int l9_4294=l9_4290;
float3 l9_4295=float3(0.0);
if (l9_4293==0)
{
l9_4295=float3(l9_4292,0.0);
}
else
{
if (l9_4293==1)
{
l9_4295=float3(l9_4292.x,(l9_4292.y*0.5)+(0.5-(float(l9_4294)*0.5)),0.0);
}
else
{
l9_4295=float3(l9_4292,float(l9_4294));
}
}
float3 l9_4296=l9_4295;
float3 l9_4297=l9_4296;
float2 l9_4298=l9_4297.xy;
float l9_4299=l9_4291;
float4 l9_4300=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_4298,bias(l9_4299));
float4 l9_4301=l9_4300;
float4 l9_4302=l9_4301;
if (l9_4227)
{
l9_4302=mix(l9_4228,l9_4302,float4(l9_4231));
}
float4 l9_4303=l9_4302;
float4 l9_4304=l9_4303;
float3 l9_4305=(l9_4304.xyz*1.9921875)-float3(1.0);
l9_4304=float4(l9_4305.x,l9_4305.y,l9_4305.z,l9_4304.w);
l9_4211=l9_4304;
float3 l9_4306=float3(0.0);
float3 l9_4307=float3(0.0);
float3 l9_4308=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_4309=l9_3996;
float3 l9_4310;
if ((int(Tweak_N218_tmp)!=0))
{
float2 l9_4311=float2(0.0);
float2 l9_4312=float2(0.0);
float2 l9_4313=float2(0.0);
float2 l9_4314=float2(0.0);
float2 l9_4315=float2(0.0);
float2 l9_4316=float2(0.0);
ssGlobals l9_4317=l9_4309;
float2 l9_4318;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_4319=float2(0.0);
l9_4319=l9_4317.Surface_UVCoord0;
l9_4312=l9_4319;
l9_4318=l9_4312;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_4320=float2(0.0);
l9_4320=l9_4317.Surface_UVCoord1;
l9_4313=l9_4320;
l9_4318=l9_4313;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_4321=float2(0.0);
l9_4321=l9_4317.Surface_UVCoord0;
float2 l9_4322=float2(0.0);
float2 l9_4323=float2(0.0);
float2 l9_4324=float2(0.0);
ssGlobals l9_4325=l9_4317;
float2 l9_4326;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4327=float2(0.0);
float2 l9_4328=float2(0.0);
float2 l9_4329=float2(0.0);
float2 l9_4330=float2(0.0);
float2 l9_4331=float2(0.0);
ssGlobals l9_4332=l9_4325;
float2 l9_4333;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4334=float2(0.0);
l9_4334=l9_4332.Surface_UVCoord0;
l9_4328=l9_4334;
l9_4333=l9_4328;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4335=float2(0.0);
l9_4335=l9_4332.Surface_UVCoord1;
l9_4329=l9_4335;
l9_4333=l9_4329;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4336=float2(0.0);
l9_4336=l9_4332.gScreenCoord;
l9_4330=l9_4336;
l9_4333=l9_4330;
}
else
{
float2 l9_4337=float2(0.0);
l9_4337=l9_4332.Surface_UVCoord0;
l9_4331=l9_4337;
l9_4333=l9_4331;
}
}
}
l9_4327=l9_4333;
float2 l9_4338=float2(0.0);
float2 l9_4339=(*sc_set0.UserUniforms).uv2Scale;
l9_4338=l9_4339;
float2 l9_4340=float2(0.0);
l9_4340=l9_4338;
float2 l9_4341=float2(0.0);
float2 l9_4342=(*sc_set0.UserUniforms).uv2Offset;
l9_4341=l9_4342;
float2 l9_4343=float2(0.0);
l9_4343=l9_4341;
float2 l9_4344=float2(0.0);
l9_4344=(l9_4327*l9_4340)+l9_4343;
float2 l9_4345=float2(0.0);
l9_4345=l9_4344+(l9_4343*(l9_4325.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4323=l9_4345;
l9_4326=l9_4323;
}
else
{
float2 l9_4346=float2(0.0);
float2 l9_4347=float2(0.0);
float2 l9_4348=float2(0.0);
float2 l9_4349=float2(0.0);
float2 l9_4350=float2(0.0);
ssGlobals l9_4351=l9_4325;
float2 l9_4352;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4353=float2(0.0);
l9_4353=l9_4351.Surface_UVCoord0;
l9_4347=l9_4353;
l9_4352=l9_4347;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4354=float2(0.0);
l9_4354=l9_4351.Surface_UVCoord1;
l9_4348=l9_4354;
l9_4352=l9_4348;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4355=float2(0.0);
l9_4355=l9_4351.gScreenCoord;
l9_4349=l9_4355;
l9_4352=l9_4349;
}
else
{
float2 l9_4356=float2(0.0);
l9_4356=l9_4351.Surface_UVCoord0;
l9_4350=l9_4356;
l9_4352=l9_4350;
}
}
}
l9_4346=l9_4352;
float2 l9_4357=float2(0.0);
float2 l9_4358=(*sc_set0.UserUniforms).uv2Scale;
l9_4357=l9_4358;
float2 l9_4359=float2(0.0);
l9_4359=l9_4357;
float2 l9_4360=float2(0.0);
float2 l9_4361=(*sc_set0.UserUniforms).uv2Offset;
l9_4360=l9_4361;
float2 l9_4362=float2(0.0);
l9_4362=l9_4360;
float2 l9_4363=float2(0.0);
l9_4363=(l9_4346*l9_4359)+l9_4362;
l9_4324=l9_4363;
l9_4326=l9_4324;
}
l9_4322=l9_4326;
float l9_4364=0.0;
float l9_4365;
if ((int(Tweak_N67_tmp)!=0))
{
l9_4365=1.001;
}
else
{
l9_4365=0.001;
}
l9_4365-=0.001;
l9_4364=l9_4365;
float l9_4366=0.0;
l9_4366=l9_4364;
float2 l9_4367=float2(0.0);
l9_4367=mix(l9_4321,l9_4322,float2(l9_4366));
float2 l9_4368=float2(0.0);
l9_4368=l9_4367;
float2 l9_4369=float2(0.0);
l9_4369=l9_4368;
l9_4314=l9_4369;
l9_4318=l9_4314;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_4370=float2(0.0);
l9_4370=l9_4317.Surface_UVCoord0;
float2 l9_4371=float2(0.0);
float2 l9_4372=float2(0.0);
float2 l9_4373=float2(0.0);
ssGlobals l9_4374=l9_4317;
float2 l9_4375;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_4376=float2(0.0);
float2 l9_4377=float2(0.0);
float2 l9_4378=float2(0.0);
float2 l9_4379=float2(0.0);
float2 l9_4380=float2(0.0);
float2 l9_4381=float2(0.0);
ssGlobals l9_4382=l9_4374;
float2 l9_4383;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4384=float2(0.0);
l9_4384=l9_4382.Surface_UVCoord0;
l9_4377=l9_4384;
l9_4383=l9_4377;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4385=float2(0.0);
l9_4385=l9_4382.Surface_UVCoord1;
l9_4378=l9_4385;
l9_4383=l9_4378;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4386=float2(0.0);
l9_4386=l9_4382.gScreenCoord;
l9_4379=l9_4386;
l9_4383=l9_4379;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4387=float2(0.0);
l9_4387=l9_4382.Surface_UVCoord0;
float2 l9_4388=float2(0.0);
float2 l9_4389=float2(0.0);
float2 l9_4390=float2(0.0);
ssGlobals l9_4391=l9_4382;
float2 l9_4392;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4393=float2(0.0);
float2 l9_4394=float2(0.0);
float2 l9_4395=float2(0.0);
float2 l9_4396=float2(0.0);
float2 l9_4397=float2(0.0);
ssGlobals l9_4398=l9_4391;
float2 l9_4399;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4400=float2(0.0);
l9_4400=l9_4398.Surface_UVCoord0;
l9_4394=l9_4400;
l9_4399=l9_4394;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4401=float2(0.0);
l9_4401=l9_4398.Surface_UVCoord1;
l9_4395=l9_4401;
l9_4399=l9_4395;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4402=float2(0.0);
l9_4402=l9_4398.gScreenCoord;
l9_4396=l9_4402;
l9_4399=l9_4396;
}
else
{
float2 l9_4403=float2(0.0);
l9_4403=l9_4398.Surface_UVCoord0;
l9_4397=l9_4403;
l9_4399=l9_4397;
}
}
}
l9_4393=l9_4399;
float2 l9_4404=float2(0.0);
float2 l9_4405=(*sc_set0.UserUniforms).uv2Scale;
l9_4404=l9_4405;
float2 l9_4406=float2(0.0);
l9_4406=l9_4404;
float2 l9_4407=float2(0.0);
float2 l9_4408=(*sc_set0.UserUniforms).uv2Offset;
l9_4407=l9_4408;
float2 l9_4409=float2(0.0);
l9_4409=l9_4407;
float2 l9_4410=float2(0.0);
l9_4410=(l9_4393*l9_4406)+l9_4409;
float2 l9_4411=float2(0.0);
l9_4411=l9_4410+(l9_4409*(l9_4391.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4389=l9_4411;
l9_4392=l9_4389;
}
else
{
float2 l9_4412=float2(0.0);
float2 l9_4413=float2(0.0);
float2 l9_4414=float2(0.0);
float2 l9_4415=float2(0.0);
float2 l9_4416=float2(0.0);
ssGlobals l9_4417=l9_4391;
float2 l9_4418;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4419=float2(0.0);
l9_4419=l9_4417.Surface_UVCoord0;
l9_4413=l9_4419;
l9_4418=l9_4413;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4420=float2(0.0);
l9_4420=l9_4417.Surface_UVCoord1;
l9_4414=l9_4420;
l9_4418=l9_4414;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4421=float2(0.0);
l9_4421=l9_4417.gScreenCoord;
l9_4415=l9_4421;
l9_4418=l9_4415;
}
else
{
float2 l9_4422=float2(0.0);
l9_4422=l9_4417.Surface_UVCoord0;
l9_4416=l9_4422;
l9_4418=l9_4416;
}
}
}
l9_4412=l9_4418;
float2 l9_4423=float2(0.0);
float2 l9_4424=(*sc_set0.UserUniforms).uv2Scale;
l9_4423=l9_4424;
float2 l9_4425=float2(0.0);
l9_4425=l9_4423;
float2 l9_4426=float2(0.0);
float2 l9_4427=(*sc_set0.UserUniforms).uv2Offset;
l9_4426=l9_4427;
float2 l9_4428=float2(0.0);
l9_4428=l9_4426;
float2 l9_4429=float2(0.0);
l9_4429=(l9_4412*l9_4425)+l9_4428;
l9_4390=l9_4429;
l9_4392=l9_4390;
}
l9_4388=l9_4392;
float l9_4430=0.0;
float l9_4431;
if ((int(Tweak_N67_tmp)!=0))
{
l9_4431=1.001;
}
else
{
l9_4431=0.001;
}
l9_4431-=0.001;
l9_4430=l9_4431;
float l9_4432=0.0;
l9_4432=l9_4430;
float2 l9_4433=float2(0.0);
l9_4433=mix(l9_4387,l9_4388,float2(l9_4432));
float2 l9_4434=float2(0.0);
l9_4434=l9_4433;
float2 l9_4435=float2(0.0);
l9_4435=l9_4434;
l9_4380=l9_4435;
l9_4383=l9_4380;
}
else
{
float2 l9_4436=float2(0.0);
l9_4436=l9_4382.Surface_UVCoord0;
l9_4381=l9_4436;
l9_4383=l9_4381;
}
}
}
}
l9_4376=l9_4383;
float2 l9_4437=float2(0.0);
float2 l9_4438=(*sc_set0.UserUniforms).uv3Scale;
l9_4437=l9_4438;
float2 l9_4439=float2(0.0);
l9_4439=l9_4437;
float2 l9_4440=float2(0.0);
float2 l9_4441=(*sc_set0.UserUniforms).uv3Offset;
l9_4440=l9_4441;
float2 l9_4442=float2(0.0);
l9_4442=l9_4440;
float2 l9_4443=float2(0.0);
l9_4443=(l9_4376*l9_4439)+l9_4442;
float2 l9_4444=float2(0.0);
l9_4444=l9_4443+(l9_4442*(l9_4374.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_4372=l9_4444;
l9_4375=l9_4372;
}
else
{
float2 l9_4445=float2(0.0);
float2 l9_4446=float2(0.0);
float2 l9_4447=float2(0.0);
float2 l9_4448=float2(0.0);
float2 l9_4449=float2(0.0);
float2 l9_4450=float2(0.0);
ssGlobals l9_4451=l9_4374;
float2 l9_4452;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4453=float2(0.0);
l9_4453=l9_4451.Surface_UVCoord0;
l9_4446=l9_4453;
l9_4452=l9_4446;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4454=float2(0.0);
l9_4454=l9_4451.Surface_UVCoord1;
l9_4447=l9_4454;
l9_4452=l9_4447;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4455=float2(0.0);
l9_4455=l9_4451.gScreenCoord;
l9_4448=l9_4455;
l9_4452=l9_4448;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4456=float2(0.0);
l9_4456=l9_4451.Surface_UVCoord0;
float2 l9_4457=float2(0.0);
float2 l9_4458=float2(0.0);
float2 l9_4459=float2(0.0);
ssGlobals l9_4460=l9_4451;
float2 l9_4461;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4462=float2(0.0);
float2 l9_4463=float2(0.0);
float2 l9_4464=float2(0.0);
float2 l9_4465=float2(0.0);
float2 l9_4466=float2(0.0);
ssGlobals l9_4467=l9_4460;
float2 l9_4468;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4469=float2(0.0);
l9_4469=l9_4467.Surface_UVCoord0;
l9_4463=l9_4469;
l9_4468=l9_4463;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4470=float2(0.0);
l9_4470=l9_4467.Surface_UVCoord1;
l9_4464=l9_4470;
l9_4468=l9_4464;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4471=float2(0.0);
l9_4471=l9_4467.gScreenCoord;
l9_4465=l9_4471;
l9_4468=l9_4465;
}
else
{
float2 l9_4472=float2(0.0);
l9_4472=l9_4467.Surface_UVCoord0;
l9_4466=l9_4472;
l9_4468=l9_4466;
}
}
}
l9_4462=l9_4468;
float2 l9_4473=float2(0.0);
float2 l9_4474=(*sc_set0.UserUniforms).uv2Scale;
l9_4473=l9_4474;
float2 l9_4475=float2(0.0);
l9_4475=l9_4473;
float2 l9_4476=float2(0.0);
float2 l9_4477=(*sc_set0.UserUniforms).uv2Offset;
l9_4476=l9_4477;
float2 l9_4478=float2(0.0);
l9_4478=l9_4476;
float2 l9_4479=float2(0.0);
l9_4479=(l9_4462*l9_4475)+l9_4478;
float2 l9_4480=float2(0.0);
l9_4480=l9_4479+(l9_4478*(l9_4460.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4458=l9_4480;
l9_4461=l9_4458;
}
else
{
float2 l9_4481=float2(0.0);
float2 l9_4482=float2(0.0);
float2 l9_4483=float2(0.0);
float2 l9_4484=float2(0.0);
float2 l9_4485=float2(0.0);
ssGlobals l9_4486=l9_4460;
float2 l9_4487;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4488=float2(0.0);
l9_4488=l9_4486.Surface_UVCoord0;
l9_4482=l9_4488;
l9_4487=l9_4482;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4489=float2(0.0);
l9_4489=l9_4486.Surface_UVCoord1;
l9_4483=l9_4489;
l9_4487=l9_4483;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4490=float2(0.0);
l9_4490=l9_4486.gScreenCoord;
l9_4484=l9_4490;
l9_4487=l9_4484;
}
else
{
float2 l9_4491=float2(0.0);
l9_4491=l9_4486.Surface_UVCoord0;
l9_4485=l9_4491;
l9_4487=l9_4485;
}
}
}
l9_4481=l9_4487;
float2 l9_4492=float2(0.0);
float2 l9_4493=(*sc_set0.UserUniforms).uv2Scale;
l9_4492=l9_4493;
float2 l9_4494=float2(0.0);
l9_4494=l9_4492;
float2 l9_4495=float2(0.0);
float2 l9_4496=(*sc_set0.UserUniforms).uv2Offset;
l9_4495=l9_4496;
float2 l9_4497=float2(0.0);
l9_4497=l9_4495;
float2 l9_4498=float2(0.0);
l9_4498=(l9_4481*l9_4494)+l9_4497;
l9_4459=l9_4498;
l9_4461=l9_4459;
}
l9_4457=l9_4461;
float l9_4499=0.0;
float l9_4500;
if ((int(Tweak_N67_tmp)!=0))
{
l9_4500=1.001;
}
else
{
l9_4500=0.001;
}
l9_4500-=0.001;
l9_4499=l9_4500;
float l9_4501=0.0;
l9_4501=l9_4499;
float2 l9_4502=float2(0.0);
l9_4502=mix(l9_4456,l9_4457,float2(l9_4501));
float2 l9_4503=float2(0.0);
l9_4503=l9_4502;
float2 l9_4504=float2(0.0);
l9_4504=l9_4503;
l9_4449=l9_4504;
l9_4452=l9_4449;
}
else
{
float2 l9_4505=float2(0.0);
l9_4505=l9_4451.Surface_UVCoord0;
l9_4450=l9_4505;
l9_4452=l9_4450;
}
}
}
}
l9_4445=l9_4452;
float2 l9_4506=float2(0.0);
float2 l9_4507=(*sc_set0.UserUniforms).uv3Scale;
l9_4506=l9_4507;
float2 l9_4508=float2(0.0);
l9_4508=l9_4506;
float2 l9_4509=float2(0.0);
float2 l9_4510=(*sc_set0.UserUniforms).uv3Offset;
l9_4509=l9_4510;
float2 l9_4511=float2(0.0);
l9_4511=l9_4509;
float2 l9_4512=float2(0.0);
l9_4512=(l9_4445*l9_4508)+l9_4511;
l9_4373=l9_4512;
l9_4375=l9_4373;
}
l9_4371=l9_4375;
float l9_4513=0.0;
float l9_4514;
if ((int(Tweak_N11_tmp)!=0))
{
l9_4514=1.001;
}
else
{
l9_4514=0.001;
}
l9_4514-=0.001;
l9_4513=l9_4514;
float l9_4515=0.0;
l9_4515=l9_4513;
float2 l9_4516=float2(0.0);
l9_4516=mix(l9_4370,l9_4371,float2(l9_4515));
float2 l9_4517=float2(0.0);
l9_4517=l9_4516;
float2 l9_4518=float2(0.0);
l9_4518=l9_4517;
l9_4315=l9_4518;
l9_4318=l9_4315;
}
else
{
float2 l9_4519=float2(0.0);
l9_4519=l9_4317.Surface_UVCoord0;
l9_4316=l9_4519;
l9_4318=l9_4316;
}
}
}
}
l9_4311=l9_4318;
float4 l9_4520=float4(0.0);
float2 l9_4521=l9_4311;
int l9_4522=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_4523=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4523=0;
}
else
{
l9_4523=in.varStereoViewID;
}
int l9_4524=l9_4523;
l9_4522=1-l9_4524;
}
else
{
int l9_4525=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4525=0;
}
else
{
l9_4525=in.varStereoViewID;
}
int l9_4526=l9_4525;
l9_4522=l9_4526;
}
int l9_4527=l9_4522;
int l9_4528=detailNormalTexLayout_tmp;
int l9_4529=l9_4527;
float2 l9_4530=l9_4521;
bool l9_4531=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_4532=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_4533=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_4534=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_4535=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_4536=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_4537=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_4538=0.0;
bool l9_4539=l9_4536&&(!l9_4534);
float l9_4540=1.0;
float l9_4541=l9_4530.x;
int l9_4542=l9_4533.x;
if (l9_4542==1)
{
l9_4541=fract(l9_4541);
}
else
{
if (l9_4542==2)
{
float l9_4543=fract(l9_4541);
float l9_4544=l9_4541-l9_4543;
float l9_4545=step(0.25,fract(l9_4544*0.5));
l9_4541=mix(l9_4543,1.0-l9_4543,fast::clamp(l9_4545,0.0,1.0));
}
}
l9_4530.x=l9_4541;
float l9_4546=l9_4530.y;
int l9_4547=l9_4533.y;
if (l9_4547==1)
{
l9_4546=fract(l9_4546);
}
else
{
if (l9_4547==2)
{
float l9_4548=fract(l9_4546);
float l9_4549=l9_4546-l9_4548;
float l9_4550=step(0.25,fract(l9_4549*0.5));
l9_4546=mix(l9_4548,1.0-l9_4548,fast::clamp(l9_4550,0.0,1.0));
}
}
l9_4530.y=l9_4546;
if (l9_4534)
{
bool l9_4551=l9_4536;
bool l9_4552;
if (l9_4551)
{
l9_4552=l9_4533.x==3;
}
else
{
l9_4552=l9_4551;
}
float l9_4553=l9_4530.x;
float l9_4554=l9_4535.x;
float l9_4555=l9_4535.z;
bool l9_4556=l9_4552;
float l9_4557=l9_4540;
float l9_4558=fast::clamp(l9_4553,l9_4554,l9_4555);
float l9_4559=step(abs(l9_4553-l9_4558),9.9999997e-06);
l9_4557*=(l9_4559+((1.0-float(l9_4556))*(1.0-l9_4559)));
l9_4553=l9_4558;
l9_4530.x=l9_4553;
l9_4540=l9_4557;
bool l9_4560=l9_4536;
bool l9_4561;
if (l9_4560)
{
l9_4561=l9_4533.y==3;
}
else
{
l9_4561=l9_4560;
}
float l9_4562=l9_4530.y;
float l9_4563=l9_4535.y;
float l9_4564=l9_4535.w;
bool l9_4565=l9_4561;
float l9_4566=l9_4540;
float l9_4567=fast::clamp(l9_4562,l9_4563,l9_4564);
float l9_4568=step(abs(l9_4562-l9_4567),9.9999997e-06);
l9_4566*=(l9_4568+((1.0-float(l9_4565))*(1.0-l9_4568)));
l9_4562=l9_4567;
l9_4530.y=l9_4562;
l9_4540=l9_4566;
}
float2 l9_4569=l9_4530;
bool l9_4570=l9_4531;
float3x3 l9_4571=l9_4532;
if (l9_4570)
{
l9_4569=float2((l9_4571*float3(l9_4569,1.0)).xy);
}
float2 l9_4572=l9_4569;
float2 l9_4573=l9_4572;
float2 l9_4574=l9_4573;
l9_4530=l9_4574;
float l9_4575=l9_4530.x;
int l9_4576=l9_4533.x;
bool l9_4577=l9_4539;
float l9_4578=l9_4540;
if ((l9_4576==0)||(l9_4576==3))
{
float l9_4579=l9_4575;
float l9_4580=0.0;
float l9_4581=1.0;
bool l9_4582=l9_4577;
float l9_4583=l9_4578;
float l9_4584=fast::clamp(l9_4579,l9_4580,l9_4581);
float l9_4585=step(abs(l9_4579-l9_4584),9.9999997e-06);
l9_4583*=(l9_4585+((1.0-float(l9_4582))*(1.0-l9_4585)));
l9_4579=l9_4584;
l9_4575=l9_4579;
l9_4578=l9_4583;
}
l9_4530.x=l9_4575;
l9_4540=l9_4578;
float l9_4586=l9_4530.y;
int l9_4587=l9_4533.y;
bool l9_4588=l9_4539;
float l9_4589=l9_4540;
if ((l9_4587==0)||(l9_4587==3))
{
float l9_4590=l9_4586;
float l9_4591=0.0;
float l9_4592=1.0;
bool l9_4593=l9_4588;
float l9_4594=l9_4589;
float l9_4595=fast::clamp(l9_4590,l9_4591,l9_4592);
float l9_4596=step(abs(l9_4590-l9_4595),9.9999997e-06);
l9_4594*=(l9_4596+((1.0-float(l9_4593))*(1.0-l9_4596)));
l9_4590=l9_4595;
l9_4586=l9_4590;
l9_4589=l9_4594;
}
l9_4530.y=l9_4586;
l9_4540=l9_4589;
float2 l9_4597=l9_4530;
int l9_4598=l9_4528;
int l9_4599=l9_4529;
float l9_4600=l9_4538;
float2 l9_4601=l9_4597;
int l9_4602=l9_4598;
int l9_4603=l9_4599;
float3 l9_4604=float3(0.0);
if (l9_4602==0)
{
l9_4604=float3(l9_4601,0.0);
}
else
{
if (l9_4602==1)
{
l9_4604=float3(l9_4601.x,(l9_4601.y*0.5)+(0.5-(float(l9_4603)*0.5)),0.0);
}
else
{
l9_4604=float3(l9_4601,float(l9_4603));
}
}
float3 l9_4605=l9_4604;
float3 l9_4606=l9_4605;
float2 l9_4607=l9_4606.xy;
float l9_4608=l9_4600;
float4 l9_4609=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_4607,bias(l9_4608));
float4 l9_4610=l9_4609;
float4 l9_4611=l9_4610;
if (l9_4536)
{
l9_4611=mix(l9_4537,l9_4611,float4(l9_4540));
}
float4 l9_4612=l9_4611;
float4 l9_4613=l9_4612;
float3 l9_4614=(l9_4613.xyz*1.9921875)-float3(1.0);
l9_4613=float4(l9_4614.x,l9_4614.y,l9_4614.z,l9_4613.w);
l9_4520=l9_4613;
l9_4307=l9_4520.xyz;
l9_4310=l9_4307;
}
else
{
l9_4310=l9_4308;
}
l9_4306=l9_4310;
float3 l9_4615=float3(0.0);
float3 l9_4616=l9_4211.xyz;
float l9_4617=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_4618=l9_4306;
float l9_4619=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_4620=l9_4616;
float l9_4621=l9_4617;
float3 l9_4622=l9_4618;
float l9_4623=l9_4619;
float3 l9_4624=mix(float3(0.0,0.0,1.0),l9_4620,float3(l9_4621))+float3(0.0,0.0,1.0);
float3 l9_4625=mix(float3(0.0,0.0,1.0),l9_4622,float3(l9_4623))*float3(-1.0,-1.0,1.0);
float3 l9_4626=normalize((l9_4624*dot(l9_4624,l9_4625))-(l9_4625*l9_4624.z));
l9_4618=l9_4626;
float3 l9_4627=l9_4618;
l9_4615=l9_4627;
float3 l9_4628=float3(0.0);
l9_4628=l9_4001*l9_4615;
float3 l9_4629=float3(0.0);
float3 l9_4630=l9_4628;
float l9_4631=dot(l9_4630,l9_4630);
float l9_4632;
if (l9_4631>0.0)
{
l9_4632=1.0/sqrt(l9_4631);
}
else
{
l9_4632=0.0;
}
float l9_4633=l9_4632;
float3 l9_4634=l9_4630*l9_4633;
l9_4629=l9_4634;
l9_3994=l9_4629;
l9_3997=l9_3994;
}
else
{
float3 l9_4635=float3(0.0);
l9_4635=l9_3996.VertexNormal_WorldSpace;
float3 l9_4636=float3(0.0);
float3 l9_4637=l9_4635;
float l9_4638=dot(l9_4637,l9_4637);
float l9_4639;
if (l9_4638>0.0)
{
l9_4639=1.0/sqrt(l9_4638);
}
else
{
l9_4639=0.0;
}
float l9_4640=l9_4639;
float3 l9_4641=l9_4637*l9_4640;
l9_4636=l9_4641;
l9_3995=l9_4636;
l9_3997=l9_3995;
}
l9_3993=l9_3997;
float3 l9_4642=float3(0.0);
l9_4642=l9_3993;
float3 l9_4643=float3(0.0);
l9_4643=l9_4642;
float3 l9_4644=float3(0.0);
l9_4644=-l9_3991.ViewDirWS;
float l9_4645=0.0;
l9_4645=dot(l9_4643,l9_4644);
float l9_4646=0.0;
l9_4646=abs(l9_4645);
l9_3989=l9_4646;
l9_3992=l9_3989;
}
else
{
float3 l9_4647=float3(0.0);
float3 l9_4648=float3(0.0);
float3 l9_4649=float3(0.0);
ssGlobals l9_4650=l9_3991;
float3 l9_4651;
if ((int(Tweak_N354_tmp)!=0))
{
float3 l9_4652=float3(0.0);
l9_4652=l9_4650.VertexTangent_WorldSpace;
float3 l9_4653=float3(0.0);
l9_4653=l9_4650.VertexBinormal_WorldSpace;
float3 l9_4654=float3(0.0);
l9_4654=l9_4650.VertexNormal_WorldSpace;
float3x3 l9_4655=float3x3(float3(0.0),float3(0.0),float3(0.0));
l9_4655=float3x3(float3(l9_4652),float3(l9_4653),float3(l9_4654));
float2 l9_4656=float2(0.0);
float2 l9_4657=float2(0.0);
float2 l9_4658=float2(0.0);
float2 l9_4659=float2(0.0);
float2 l9_4660=float2(0.0);
float2 l9_4661=float2(0.0);
ssGlobals l9_4662=l9_4650;
float2 l9_4663;
if (NODE_181_DROPLIST_ITEM_tmp==0)
{
float2 l9_4664=float2(0.0);
l9_4664=l9_4662.Surface_UVCoord0;
l9_4657=l9_4664;
l9_4663=l9_4657;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==1)
{
float2 l9_4665=float2(0.0);
l9_4665=l9_4662.Surface_UVCoord1;
l9_4658=l9_4665;
l9_4663=l9_4658;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==2)
{
float2 l9_4666=float2(0.0);
l9_4666=l9_4662.Surface_UVCoord0;
float2 l9_4667=float2(0.0);
float2 l9_4668=float2(0.0);
float2 l9_4669=float2(0.0);
ssGlobals l9_4670=l9_4662;
float2 l9_4671;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4672=float2(0.0);
float2 l9_4673=float2(0.0);
float2 l9_4674=float2(0.0);
float2 l9_4675=float2(0.0);
float2 l9_4676=float2(0.0);
ssGlobals l9_4677=l9_4670;
float2 l9_4678;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4679=float2(0.0);
l9_4679=l9_4677.Surface_UVCoord0;
l9_4673=l9_4679;
l9_4678=l9_4673;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4680=float2(0.0);
l9_4680=l9_4677.Surface_UVCoord1;
l9_4674=l9_4680;
l9_4678=l9_4674;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4681=float2(0.0);
l9_4681=l9_4677.gScreenCoord;
l9_4675=l9_4681;
l9_4678=l9_4675;
}
else
{
float2 l9_4682=float2(0.0);
l9_4682=l9_4677.Surface_UVCoord0;
l9_4676=l9_4682;
l9_4678=l9_4676;
}
}
}
l9_4672=l9_4678;
float2 l9_4683=float2(0.0);
float2 l9_4684=(*sc_set0.UserUniforms).uv2Scale;
l9_4683=l9_4684;
float2 l9_4685=float2(0.0);
l9_4685=l9_4683;
float2 l9_4686=float2(0.0);
float2 l9_4687=(*sc_set0.UserUniforms).uv2Offset;
l9_4686=l9_4687;
float2 l9_4688=float2(0.0);
l9_4688=l9_4686;
float2 l9_4689=float2(0.0);
l9_4689=(l9_4672*l9_4685)+l9_4688;
float2 l9_4690=float2(0.0);
l9_4690=l9_4689+(l9_4688*(l9_4670.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4668=l9_4690;
l9_4671=l9_4668;
}
else
{
float2 l9_4691=float2(0.0);
float2 l9_4692=float2(0.0);
float2 l9_4693=float2(0.0);
float2 l9_4694=float2(0.0);
float2 l9_4695=float2(0.0);
ssGlobals l9_4696=l9_4670;
float2 l9_4697;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4698=float2(0.0);
l9_4698=l9_4696.Surface_UVCoord0;
l9_4692=l9_4698;
l9_4697=l9_4692;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4699=float2(0.0);
l9_4699=l9_4696.Surface_UVCoord1;
l9_4693=l9_4699;
l9_4697=l9_4693;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4700=float2(0.0);
l9_4700=l9_4696.gScreenCoord;
l9_4694=l9_4700;
l9_4697=l9_4694;
}
else
{
float2 l9_4701=float2(0.0);
l9_4701=l9_4696.Surface_UVCoord0;
l9_4695=l9_4701;
l9_4697=l9_4695;
}
}
}
l9_4691=l9_4697;
float2 l9_4702=float2(0.0);
float2 l9_4703=(*sc_set0.UserUniforms).uv2Scale;
l9_4702=l9_4703;
float2 l9_4704=float2(0.0);
l9_4704=l9_4702;
float2 l9_4705=float2(0.0);
float2 l9_4706=(*sc_set0.UserUniforms).uv2Offset;
l9_4705=l9_4706;
float2 l9_4707=float2(0.0);
l9_4707=l9_4705;
float2 l9_4708=float2(0.0);
l9_4708=(l9_4691*l9_4704)+l9_4707;
l9_4669=l9_4708;
l9_4671=l9_4669;
}
l9_4667=l9_4671;
float l9_4709=0.0;
float l9_4710;
if ((int(Tweak_N67_tmp)!=0))
{
l9_4710=1.001;
}
else
{
l9_4710=0.001;
}
l9_4710-=0.001;
l9_4709=l9_4710;
float l9_4711=0.0;
l9_4711=l9_4709;
float2 l9_4712=float2(0.0);
l9_4712=mix(l9_4666,l9_4667,float2(l9_4711));
float2 l9_4713=float2(0.0);
l9_4713=l9_4712;
float2 l9_4714=float2(0.0);
l9_4714=l9_4713;
l9_4659=l9_4714;
l9_4663=l9_4659;
}
else
{
if (NODE_181_DROPLIST_ITEM_tmp==3)
{
float2 l9_4715=float2(0.0);
l9_4715=l9_4662.Surface_UVCoord0;
float2 l9_4716=float2(0.0);
float2 l9_4717=float2(0.0);
float2 l9_4718=float2(0.0);
ssGlobals l9_4719=l9_4662;
float2 l9_4720;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_4721=float2(0.0);
float2 l9_4722=float2(0.0);
float2 l9_4723=float2(0.0);
float2 l9_4724=float2(0.0);
float2 l9_4725=float2(0.0);
float2 l9_4726=float2(0.0);
ssGlobals l9_4727=l9_4719;
float2 l9_4728;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4729=float2(0.0);
l9_4729=l9_4727.Surface_UVCoord0;
l9_4722=l9_4729;
l9_4728=l9_4722;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4730=float2(0.0);
l9_4730=l9_4727.Surface_UVCoord1;
l9_4723=l9_4730;
l9_4728=l9_4723;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4731=float2(0.0);
l9_4731=l9_4727.gScreenCoord;
l9_4724=l9_4731;
l9_4728=l9_4724;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4732=float2(0.0);
l9_4732=l9_4727.Surface_UVCoord0;
float2 l9_4733=float2(0.0);
float2 l9_4734=float2(0.0);
float2 l9_4735=float2(0.0);
ssGlobals l9_4736=l9_4727;
float2 l9_4737;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4738=float2(0.0);
float2 l9_4739=float2(0.0);
float2 l9_4740=float2(0.0);
float2 l9_4741=float2(0.0);
float2 l9_4742=float2(0.0);
ssGlobals l9_4743=l9_4736;
float2 l9_4744;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4745=float2(0.0);
l9_4745=l9_4743.Surface_UVCoord0;
l9_4739=l9_4745;
l9_4744=l9_4739;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4746=float2(0.0);
l9_4746=l9_4743.Surface_UVCoord1;
l9_4740=l9_4746;
l9_4744=l9_4740;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4747=float2(0.0);
l9_4747=l9_4743.gScreenCoord;
l9_4741=l9_4747;
l9_4744=l9_4741;
}
else
{
float2 l9_4748=float2(0.0);
l9_4748=l9_4743.Surface_UVCoord0;
l9_4742=l9_4748;
l9_4744=l9_4742;
}
}
}
l9_4738=l9_4744;
float2 l9_4749=float2(0.0);
float2 l9_4750=(*sc_set0.UserUniforms).uv2Scale;
l9_4749=l9_4750;
float2 l9_4751=float2(0.0);
l9_4751=l9_4749;
float2 l9_4752=float2(0.0);
float2 l9_4753=(*sc_set0.UserUniforms).uv2Offset;
l9_4752=l9_4753;
float2 l9_4754=float2(0.0);
l9_4754=l9_4752;
float2 l9_4755=float2(0.0);
l9_4755=(l9_4738*l9_4751)+l9_4754;
float2 l9_4756=float2(0.0);
l9_4756=l9_4755+(l9_4754*(l9_4736.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4734=l9_4756;
l9_4737=l9_4734;
}
else
{
float2 l9_4757=float2(0.0);
float2 l9_4758=float2(0.0);
float2 l9_4759=float2(0.0);
float2 l9_4760=float2(0.0);
float2 l9_4761=float2(0.0);
ssGlobals l9_4762=l9_4736;
float2 l9_4763;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4764=float2(0.0);
l9_4764=l9_4762.Surface_UVCoord0;
l9_4758=l9_4764;
l9_4763=l9_4758;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4765=float2(0.0);
l9_4765=l9_4762.Surface_UVCoord1;
l9_4759=l9_4765;
l9_4763=l9_4759;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4766=float2(0.0);
l9_4766=l9_4762.gScreenCoord;
l9_4760=l9_4766;
l9_4763=l9_4760;
}
else
{
float2 l9_4767=float2(0.0);
l9_4767=l9_4762.Surface_UVCoord0;
l9_4761=l9_4767;
l9_4763=l9_4761;
}
}
}
l9_4757=l9_4763;
float2 l9_4768=float2(0.0);
float2 l9_4769=(*sc_set0.UserUniforms).uv2Scale;
l9_4768=l9_4769;
float2 l9_4770=float2(0.0);
l9_4770=l9_4768;
float2 l9_4771=float2(0.0);
float2 l9_4772=(*sc_set0.UserUniforms).uv2Offset;
l9_4771=l9_4772;
float2 l9_4773=float2(0.0);
l9_4773=l9_4771;
float2 l9_4774=float2(0.0);
l9_4774=(l9_4757*l9_4770)+l9_4773;
l9_4735=l9_4774;
l9_4737=l9_4735;
}
l9_4733=l9_4737;
float l9_4775=0.0;
float l9_4776;
if ((int(Tweak_N67_tmp)!=0))
{
l9_4776=1.001;
}
else
{
l9_4776=0.001;
}
l9_4776-=0.001;
l9_4775=l9_4776;
float l9_4777=0.0;
l9_4777=l9_4775;
float2 l9_4778=float2(0.0);
l9_4778=mix(l9_4732,l9_4733,float2(l9_4777));
float2 l9_4779=float2(0.0);
l9_4779=l9_4778;
float2 l9_4780=float2(0.0);
l9_4780=l9_4779;
l9_4725=l9_4780;
l9_4728=l9_4725;
}
else
{
float2 l9_4781=float2(0.0);
l9_4781=l9_4727.Surface_UVCoord0;
l9_4726=l9_4781;
l9_4728=l9_4726;
}
}
}
}
l9_4721=l9_4728;
float2 l9_4782=float2(0.0);
float2 l9_4783=(*sc_set0.UserUniforms).uv3Scale;
l9_4782=l9_4783;
float2 l9_4784=float2(0.0);
l9_4784=l9_4782;
float2 l9_4785=float2(0.0);
float2 l9_4786=(*sc_set0.UserUniforms).uv3Offset;
l9_4785=l9_4786;
float2 l9_4787=float2(0.0);
l9_4787=l9_4785;
float2 l9_4788=float2(0.0);
l9_4788=(l9_4721*l9_4784)+l9_4787;
float2 l9_4789=float2(0.0);
l9_4789=l9_4788+(l9_4787*(l9_4719.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_4717=l9_4789;
l9_4720=l9_4717;
}
else
{
float2 l9_4790=float2(0.0);
float2 l9_4791=float2(0.0);
float2 l9_4792=float2(0.0);
float2 l9_4793=float2(0.0);
float2 l9_4794=float2(0.0);
float2 l9_4795=float2(0.0);
ssGlobals l9_4796=l9_4719;
float2 l9_4797;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_4798=float2(0.0);
l9_4798=l9_4796.Surface_UVCoord0;
l9_4791=l9_4798;
l9_4797=l9_4791;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_4799=float2(0.0);
l9_4799=l9_4796.Surface_UVCoord1;
l9_4792=l9_4799;
l9_4797=l9_4792;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_4800=float2(0.0);
l9_4800=l9_4796.gScreenCoord;
l9_4793=l9_4800;
l9_4797=l9_4793;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_4801=float2(0.0);
l9_4801=l9_4796.Surface_UVCoord0;
float2 l9_4802=float2(0.0);
float2 l9_4803=float2(0.0);
float2 l9_4804=float2(0.0);
ssGlobals l9_4805=l9_4796;
float2 l9_4806;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4807=float2(0.0);
float2 l9_4808=float2(0.0);
float2 l9_4809=float2(0.0);
float2 l9_4810=float2(0.0);
float2 l9_4811=float2(0.0);
ssGlobals l9_4812=l9_4805;
float2 l9_4813;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4814=float2(0.0);
l9_4814=l9_4812.Surface_UVCoord0;
l9_4808=l9_4814;
l9_4813=l9_4808;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4815=float2(0.0);
l9_4815=l9_4812.Surface_UVCoord1;
l9_4809=l9_4815;
l9_4813=l9_4809;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4816=float2(0.0);
l9_4816=l9_4812.gScreenCoord;
l9_4810=l9_4816;
l9_4813=l9_4810;
}
else
{
float2 l9_4817=float2(0.0);
l9_4817=l9_4812.Surface_UVCoord0;
l9_4811=l9_4817;
l9_4813=l9_4811;
}
}
}
l9_4807=l9_4813;
float2 l9_4818=float2(0.0);
float2 l9_4819=(*sc_set0.UserUniforms).uv2Scale;
l9_4818=l9_4819;
float2 l9_4820=float2(0.0);
l9_4820=l9_4818;
float2 l9_4821=float2(0.0);
float2 l9_4822=(*sc_set0.UserUniforms).uv2Offset;
l9_4821=l9_4822;
float2 l9_4823=float2(0.0);
l9_4823=l9_4821;
float2 l9_4824=float2(0.0);
l9_4824=(l9_4807*l9_4820)+l9_4823;
float2 l9_4825=float2(0.0);
l9_4825=l9_4824+(l9_4823*(l9_4805.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4803=l9_4825;
l9_4806=l9_4803;
}
else
{
float2 l9_4826=float2(0.0);
float2 l9_4827=float2(0.0);
float2 l9_4828=float2(0.0);
float2 l9_4829=float2(0.0);
float2 l9_4830=float2(0.0);
ssGlobals l9_4831=l9_4805;
float2 l9_4832;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4833=float2(0.0);
l9_4833=l9_4831.Surface_UVCoord0;
l9_4827=l9_4833;
l9_4832=l9_4827;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4834=float2(0.0);
l9_4834=l9_4831.Surface_UVCoord1;
l9_4828=l9_4834;
l9_4832=l9_4828;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4835=float2(0.0);
l9_4835=l9_4831.gScreenCoord;
l9_4829=l9_4835;
l9_4832=l9_4829;
}
else
{
float2 l9_4836=float2(0.0);
l9_4836=l9_4831.Surface_UVCoord0;
l9_4830=l9_4836;
l9_4832=l9_4830;
}
}
}
l9_4826=l9_4832;
float2 l9_4837=float2(0.0);
float2 l9_4838=(*sc_set0.UserUniforms).uv2Scale;
l9_4837=l9_4838;
float2 l9_4839=float2(0.0);
l9_4839=l9_4837;
float2 l9_4840=float2(0.0);
float2 l9_4841=(*sc_set0.UserUniforms).uv2Offset;
l9_4840=l9_4841;
float2 l9_4842=float2(0.0);
l9_4842=l9_4840;
float2 l9_4843=float2(0.0);
l9_4843=(l9_4826*l9_4839)+l9_4842;
l9_4804=l9_4843;
l9_4806=l9_4804;
}
l9_4802=l9_4806;
float l9_4844=0.0;
float l9_4845;
if ((int(Tweak_N67_tmp)!=0))
{
l9_4845=1.001;
}
else
{
l9_4845=0.001;
}
l9_4845-=0.001;
l9_4844=l9_4845;
float l9_4846=0.0;
l9_4846=l9_4844;
float2 l9_4847=float2(0.0);
l9_4847=mix(l9_4801,l9_4802,float2(l9_4846));
float2 l9_4848=float2(0.0);
l9_4848=l9_4847;
float2 l9_4849=float2(0.0);
l9_4849=l9_4848;
l9_4794=l9_4849;
l9_4797=l9_4794;
}
else
{
float2 l9_4850=float2(0.0);
l9_4850=l9_4796.Surface_UVCoord0;
l9_4795=l9_4850;
l9_4797=l9_4795;
}
}
}
}
l9_4790=l9_4797;
float2 l9_4851=float2(0.0);
float2 l9_4852=(*sc_set0.UserUniforms).uv3Scale;
l9_4851=l9_4852;
float2 l9_4853=float2(0.0);
l9_4853=l9_4851;
float2 l9_4854=float2(0.0);
float2 l9_4855=(*sc_set0.UserUniforms).uv3Offset;
l9_4854=l9_4855;
float2 l9_4856=float2(0.0);
l9_4856=l9_4854;
float2 l9_4857=float2(0.0);
l9_4857=(l9_4790*l9_4853)+l9_4856;
l9_4718=l9_4857;
l9_4720=l9_4718;
}
l9_4716=l9_4720;
float l9_4858=0.0;
float l9_4859;
if ((int(Tweak_N11_tmp)!=0))
{
l9_4859=1.001;
}
else
{
l9_4859=0.001;
}
l9_4859-=0.001;
l9_4858=l9_4859;
float l9_4860=0.0;
l9_4860=l9_4858;
float2 l9_4861=float2(0.0);
l9_4861=mix(l9_4715,l9_4716,float2(l9_4860));
float2 l9_4862=float2(0.0);
l9_4862=l9_4861;
float2 l9_4863=float2(0.0);
l9_4863=l9_4862;
l9_4660=l9_4863;
l9_4663=l9_4660;
}
else
{
float2 l9_4864=float2(0.0);
l9_4864=l9_4662.Surface_UVCoord0;
l9_4661=l9_4864;
l9_4663=l9_4661;
}
}
}
}
l9_4656=l9_4663;
float4 l9_4865=float4(0.0);
float2 l9_4866=l9_4656;
int l9_4867=0;
if ((int(normalTexHasSwappedViews_tmp)!=0))
{
int l9_4868=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4868=0;
}
else
{
l9_4868=in.varStereoViewID;
}
int l9_4869=l9_4868;
l9_4867=1-l9_4869;
}
else
{
int l9_4870=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_4870=0;
}
else
{
l9_4870=in.varStereoViewID;
}
int l9_4871=l9_4870;
l9_4867=l9_4871;
}
int l9_4872=l9_4867;
int l9_4873=normalTexLayout_tmp;
int l9_4874=l9_4872;
float2 l9_4875=l9_4866;
bool l9_4876=(int(SC_USE_UV_TRANSFORM_normalTex_tmp)!=0);
float3x3 l9_4877=(*sc_set0.UserUniforms).normalTexTransform;
int2 l9_4878=int2(SC_SOFTWARE_WRAP_MODE_U_normalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_normalTex_tmp);
bool l9_4879=(int(SC_USE_UV_MIN_MAX_normalTex_tmp)!=0);
float4 l9_4880=(*sc_set0.UserUniforms).normalTexUvMinMax;
bool l9_4881=(int(SC_USE_CLAMP_TO_BORDER_normalTex_tmp)!=0);
float4 l9_4882=(*sc_set0.UserUniforms).normalTexBorderColor;
float l9_4883=0.0;
bool l9_4884=l9_4881&&(!l9_4879);
float l9_4885=1.0;
float l9_4886=l9_4875.x;
int l9_4887=l9_4878.x;
if (l9_4887==1)
{
l9_4886=fract(l9_4886);
}
else
{
if (l9_4887==2)
{
float l9_4888=fract(l9_4886);
float l9_4889=l9_4886-l9_4888;
float l9_4890=step(0.25,fract(l9_4889*0.5));
l9_4886=mix(l9_4888,1.0-l9_4888,fast::clamp(l9_4890,0.0,1.0));
}
}
l9_4875.x=l9_4886;
float l9_4891=l9_4875.y;
int l9_4892=l9_4878.y;
if (l9_4892==1)
{
l9_4891=fract(l9_4891);
}
else
{
if (l9_4892==2)
{
float l9_4893=fract(l9_4891);
float l9_4894=l9_4891-l9_4893;
float l9_4895=step(0.25,fract(l9_4894*0.5));
l9_4891=mix(l9_4893,1.0-l9_4893,fast::clamp(l9_4895,0.0,1.0));
}
}
l9_4875.y=l9_4891;
if (l9_4879)
{
bool l9_4896=l9_4881;
bool l9_4897;
if (l9_4896)
{
l9_4897=l9_4878.x==3;
}
else
{
l9_4897=l9_4896;
}
float l9_4898=l9_4875.x;
float l9_4899=l9_4880.x;
float l9_4900=l9_4880.z;
bool l9_4901=l9_4897;
float l9_4902=l9_4885;
float l9_4903=fast::clamp(l9_4898,l9_4899,l9_4900);
float l9_4904=step(abs(l9_4898-l9_4903),9.9999997e-06);
l9_4902*=(l9_4904+((1.0-float(l9_4901))*(1.0-l9_4904)));
l9_4898=l9_4903;
l9_4875.x=l9_4898;
l9_4885=l9_4902;
bool l9_4905=l9_4881;
bool l9_4906;
if (l9_4905)
{
l9_4906=l9_4878.y==3;
}
else
{
l9_4906=l9_4905;
}
float l9_4907=l9_4875.y;
float l9_4908=l9_4880.y;
float l9_4909=l9_4880.w;
bool l9_4910=l9_4906;
float l9_4911=l9_4885;
float l9_4912=fast::clamp(l9_4907,l9_4908,l9_4909);
float l9_4913=step(abs(l9_4907-l9_4912),9.9999997e-06);
l9_4911*=(l9_4913+((1.0-float(l9_4910))*(1.0-l9_4913)));
l9_4907=l9_4912;
l9_4875.y=l9_4907;
l9_4885=l9_4911;
}
float2 l9_4914=l9_4875;
bool l9_4915=l9_4876;
float3x3 l9_4916=l9_4877;
if (l9_4915)
{
l9_4914=float2((l9_4916*float3(l9_4914,1.0)).xy);
}
float2 l9_4917=l9_4914;
float2 l9_4918=l9_4917;
float2 l9_4919=l9_4918;
l9_4875=l9_4919;
float l9_4920=l9_4875.x;
int l9_4921=l9_4878.x;
bool l9_4922=l9_4884;
float l9_4923=l9_4885;
if ((l9_4921==0)||(l9_4921==3))
{
float l9_4924=l9_4920;
float l9_4925=0.0;
float l9_4926=1.0;
bool l9_4927=l9_4922;
float l9_4928=l9_4923;
float l9_4929=fast::clamp(l9_4924,l9_4925,l9_4926);
float l9_4930=step(abs(l9_4924-l9_4929),9.9999997e-06);
l9_4928*=(l9_4930+((1.0-float(l9_4927))*(1.0-l9_4930)));
l9_4924=l9_4929;
l9_4920=l9_4924;
l9_4923=l9_4928;
}
l9_4875.x=l9_4920;
l9_4885=l9_4923;
float l9_4931=l9_4875.y;
int l9_4932=l9_4878.y;
bool l9_4933=l9_4884;
float l9_4934=l9_4885;
if ((l9_4932==0)||(l9_4932==3))
{
float l9_4935=l9_4931;
float l9_4936=0.0;
float l9_4937=1.0;
bool l9_4938=l9_4933;
float l9_4939=l9_4934;
float l9_4940=fast::clamp(l9_4935,l9_4936,l9_4937);
float l9_4941=step(abs(l9_4935-l9_4940),9.9999997e-06);
l9_4939*=(l9_4941+((1.0-float(l9_4938))*(1.0-l9_4941)));
l9_4935=l9_4940;
l9_4931=l9_4935;
l9_4934=l9_4939;
}
l9_4875.y=l9_4931;
l9_4885=l9_4934;
float2 l9_4942=l9_4875;
int l9_4943=l9_4873;
int l9_4944=l9_4874;
float l9_4945=l9_4883;
float2 l9_4946=l9_4942;
int l9_4947=l9_4943;
int l9_4948=l9_4944;
float3 l9_4949=float3(0.0);
if (l9_4947==0)
{
l9_4949=float3(l9_4946,0.0);
}
else
{
if (l9_4947==1)
{
l9_4949=float3(l9_4946.x,(l9_4946.y*0.5)+(0.5-(float(l9_4948)*0.5)),0.0);
}
else
{
l9_4949=float3(l9_4946,float(l9_4948));
}
}
float3 l9_4950=l9_4949;
float3 l9_4951=l9_4950;
float2 l9_4952=l9_4951.xy;
float l9_4953=l9_4945;
float4 l9_4954=sc_set0.normalTex.sample(sc_set0.normalTexSmpSC,l9_4952,bias(l9_4953));
float4 l9_4955=l9_4954;
float4 l9_4956=l9_4955;
if (l9_4881)
{
l9_4956=mix(l9_4882,l9_4956,float4(l9_4885));
}
float4 l9_4957=l9_4956;
float4 l9_4958=l9_4957;
float3 l9_4959=(l9_4958.xyz*1.9921875)-float3(1.0);
l9_4958=float4(l9_4959.x,l9_4959.y,l9_4959.z,l9_4958.w);
l9_4865=l9_4958;
float3 l9_4960=float3(0.0);
float3 l9_4961=float3(0.0);
float3 l9_4962=(*sc_set0.UserUniforms).Port_Default_N113;
ssGlobals l9_4963=l9_4650;
float3 l9_4964;
if ((int(Tweak_N218_tmp)!=0))
{
float2 l9_4965=float2(0.0);
float2 l9_4966=float2(0.0);
float2 l9_4967=float2(0.0);
float2 l9_4968=float2(0.0);
float2 l9_4969=float2(0.0);
float2 l9_4970=float2(0.0);
ssGlobals l9_4971=l9_4963;
float2 l9_4972;
if (NODE_184_DROPLIST_ITEM_tmp==0)
{
float2 l9_4973=float2(0.0);
l9_4973=l9_4971.Surface_UVCoord0;
l9_4966=l9_4973;
l9_4972=l9_4966;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==1)
{
float2 l9_4974=float2(0.0);
l9_4974=l9_4971.Surface_UVCoord1;
l9_4967=l9_4974;
l9_4972=l9_4967;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==2)
{
float2 l9_4975=float2(0.0);
l9_4975=l9_4971.Surface_UVCoord0;
float2 l9_4976=float2(0.0);
float2 l9_4977=float2(0.0);
float2 l9_4978=float2(0.0);
ssGlobals l9_4979=l9_4971;
float2 l9_4980;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_4981=float2(0.0);
float2 l9_4982=float2(0.0);
float2 l9_4983=float2(0.0);
float2 l9_4984=float2(0.0);
float2 l9_4985=float2(0.0);
ssGlobals l9_4986=l9_4979;
float2 l9_4987;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_4988=float2(0.0);
l9_4988=l9_4986.Surface_UVCoord0;
l9_4982=l9_4988;
l9_4987=l9_4982;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_4989=float2(0.0);
l9_4989=l9_4986.Surface_UVCoord1;
l9_4983=l9_4989;
l9_4987=l9_4983;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_4990=float2(0.0);
l9_4990=l9_4986.gScreenCoord;
l9_4984=l9_4990;
l9_4987=l9_4984;
}
else
{
float2 l9_4991=float2(0.0);
l9_4991=l9_4986.Surface_UVCoord0;
l9_4985=l9_4991;
l9_4987=l9_4985;
}
}
}
l9_4981=l9_4987;
float2 l9_4992=float2(0.0);
float2 l9_4993=(*sc_set0.UserUniforms).uv2Scale;
l9_4992=l9_4993;
float2 l9_4994=float2(0.0);
l9_4994=l9_4992;
float2 l9_4995=float2(0.0);
float2 l9_4996=(*sc_set0.UserUniforms).uv2Offset;
l9_4995=l9_4996;
float2 l9_4997=float2(0.0);
l9_4997=l9_4995;
float2 l9_4998=float2(0.0);
l9_4998=(l9_4981*l9_4994)+l9_4997;
float2 l9_4999=float2(0.0);
l9_4999=l9_4998+(l9_4997*(l9_4979.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_4977=l9_4999;
l9_4980=l9_4977;
}
else
{
float2 l9_5000=float2(0.0);
float2 l9_5001=float2(0.0);
float2 l9_5002=float2(0.0);
float2 l9_5003=float2(0.0);
float2 l9_5004=float2(0.0);
ssGlobals l9_5005=l9_4979;
float2 l9_5006;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5007=float2(0.0);
l9_5007=l9_5005.Surface_UVCoord0;
l9_5001=l9_5007;
l9_5006=l9_5001;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5008=float2(0.0);
l9_5008=l9_5005.Surface_UVCoord1;
l9_5002=l9_5008;
l9_5006=l9_5002;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5009=float2(0.0);
l9_5009=l9_5005.gScreenCoord;
l9_5003=l9_5009;
l9_5006=l9_5003;
}
else
{
float2 l9_5010=float2(0.0);
l9_5010=l9_5005.Surface_UVCoord0;
l9_5004=l9_5010;
l9_5006=l9_5004;
}
}
}
l9_5000=l9_5006;
float2 l9_5011=float2(0.0);
float2 l9_5012=(*sc_set0.UserUniforms).uv2Scale;
l9_5011=l9_5012;
float2 l9_5013=float2(0.0);
l9_5013=l9_5011;
float2 l9_5014=float2(0.0);
float2 l9_5015=(*sc_set0.UserUniforms).uv2Offset;
l9_5014=l9_5015;
float2 l9_5016=float2(0.0);
l9_5016=l9_5014;
float2 l9_5017=float2(0.0);
l9_5017=(l9_5000*l9_5013)+l9_5016;
l9_4978=l9_5017;
l9_4980=l9_4978;
}
l9_4976=l9_4980;
float l9_5018=0.0;
float l9_5019;
if ((int(Tweak_N67_tmp)!=0))
{
l9_5019=1.001;
}
else
{
l9_5019=0.001;
}
l9_5019-=0.001;
l9_5018=l9_5019;
float l9_5020=0.0;
l9_5020=l9_5018;
float2 l9_5021=float2(0.0);
l9_5021=mix(l9_4975,l9_4976,float2(l9_5020));
float2 l9_5022=float2(0.0);
l9_5022=l9_5021;
float2 l9_5023=float2(0.0);
l9_5023=l9_5022;
l9_4968=l9_5023;
l9_4972=l9_4968;
}
else
{
if (NODE_184_DROPLIST_ITEM_tmp==3)
{
float2 l9_5024=float2(0.0);
l9_5024=l9_4971.Surface_UVCoord0;
float2 l9_5025=float2(0.0);
float2 l9_5026=float2(0.0);
float2 l9_5027=float2(0.0);
ssGlobals l9_5028=l9_4971;
float2 l9_5029;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_5030=float2(0.0);
float2 l9_5031=float2(0.0);
float2 l9_5032=float2(0.0);
float2 l9_5033=float2(0.0);
float2 l9_5034=float2(0.0);
float2 l9_5035=float2(0.0);
ssGlobals l9_5036=l9_5028;
float2 l9_5037;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5038=float2(0.0);
l9_5038=l9_5036.Surface_UVCoord0;
l9_5031=l9_5038;
l9_5037=l9_5031;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5039=float2(0.0);
l9_5039=l9_5036.Surface_UVCoord1;
l9_5032=l9_5039;
l9_5037=l9_5032;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5040=float2(0.0);
l9_5040=l9_5036.gScreenCoord;
l9_5033=l9_5040;
l9_5037=l9_5033;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5041=float2(0.0);
l9_5041=l9_5036.Surface_UVCoord0;
float2 l9_5042=float2(0.0);
float2 l9_5043=float2(0.0);
float2 l9_5044=float2(0.0);
ssGlobals l9_5045=l9_5036;
float2 l9_5046;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_5047=float2(0.0);
float2 l9_5048=float2(0.0);
float2 l9_5049=float2(0.0);
float2 l9_5050=float2(0.0);
float2 l9_5051=float2(0.0);
ssGlobals l9_5052=l9_5045;
float2 l9_5053;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5054=float2(0.0);
l9_5054=l9_5052.Surface_UVCoord0;
l9_5048=l9_5054;
l9_5053=l9_5048;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5055=float2(0.0);
l9_5055=l9_5052.Surface_UVCoord1;
l9_5049=l9_5055;
l9_5053=l9_5049;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5056=float2(0.0);
l9_5056=l9_5052.gScreenCoord;
l9_5050=l9_5056;
l9_5053=l9_5050;
}
else
{
float2 l9_5057=float2(0.0);
l9_5057=l9_5052.Surface_UVCoord0;
l9_5051=l9_5057;
l9_5053=l9_5051;
}
}
}
l9_5047=l9_5053;
float2 l9_5058=float2(0.0);
float2 l9_5059=(*sc_set0.UserUniforms).uv2Scale;
l9_5058=l9_5059;
float2 l9_5060=float2(0.0);
l9_5060=l9_5058;
float2 l9_5061=float2(0.0);
float2 l9_5062=(*sc_set0.UserUniforms).uv2Offset;
l9_5061=l9_5062;
float2 l9_5063=float2(0.0);
l9_5063=l9_5061;
float2 l9_5064=float2(0.0);
l9_5064=(l9_5047*l9_5060)+l9_5063;
float2 l9_5065=float2(0.0);
l9_5065=l9_5064+(l9_5063*(l9_5045.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5043=l9_5065;
l9_5046=l9_5043;
}
else
{
float2 l9_5066=float2(0.0);
float2 l9_5067=float2(0.0);
float2 l9_5068=float2(0.0);
float2 l9_5069=float2(0.0);
float2 l9_5070=float2(0.0);
ssGlobals l9_5071=l9_5045;
float2 l9_5072;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5073=float2(0.0);
l9_5073=l9_5071.Surface_UVCoord0;
l9_5067=l9_5073;
l9_5072=l9_5067;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5074=float2(0.0);
l9_5074=l9_5071.Surface_UVCoord1;
l9_5068=l9_5074;
l9_5072=l9_5068;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5075=float2(0.0);
l9_5075=l9_5071.gScreenCoord;
l9_5069=l9_5075;
l9_5072=l9_5069;
}
else
{
float2 l9_5076=float2(0.0);
l9_5076=l9_5071.Surface_UVCoord0;
l9_5070=l9_5076;
l9_5072=l9_5070;
}
}
}
l9_5066=l9_5072;
float2 l9_5077=float2(0.0);
float2 l9_5078=(*sc_set0.UserUniforms).uv2Scale;
l9_5077=l9_5078;
float2 l9_5079=float2(0.0);
l9_5079=l9_5077;
float2 l9_5080=float2(0.0);
float2 l9_5081=(*sc_set0.UserUniforms).uv2Offset;
l9_5080=l9_5081;
float2 l9_5082=float2(0.0);
l9_5082=l9_5080;
float2 l9_5083=float2(0.0);
l9_5083=(l9_5066*l9_5079)+l9_5082;
l9_5044=l9_5083;
l9_5046=l9_5044;
}
l9_5042=l9_5046;
float l9_5084=0.0;
float l9_5085;
if ((int(Tweak_N67_tmp)!=0))
{
l9_5085=1.001;
}
else
{
l9_5085=0.001;
}
l9_5085-=0.001;
l9_5084=l9_5085;
float l9_5086=0.0;
l9_5086=l9_5084;
float2 l9_5087=float2(0.0);
l9_5087=mix(l9_5041,l9_5042,float2(l9_5086));
float2 l9_5088=float2(0.0);
l9_5088=l9_5087;
float2 l9_5089=float2(0.0);
l9_5089=l9_5088;
l9_5034=l9_5089;
l9_5037=l9_5034;
}
else
{
float2 l9_5090=float2(0.0);
l9_5090=l9_5036.Surface_UVCoord0;
l9_5035=l9_5090;
l9_5037=l9_5035;
}
}
}
}
l9_5030=l9_5037;
float2 l9_5091=float2(0.0);
float2 l9_5092=(*sc_set0.UserUniforms).uv3Scale;
l9_5091=l9_5092;
float2 l9_5093=float2(0.0);
l9_5093=l9_5091;
float2 l9_5094=float2(0.0);
float2 l9_5095=(*sc_set0.UserUniforms).uv3Offset;
l9_5094=l9_5095;
float2 l9_5096=float2(0.0);
l9_5096=l9_5094;
float2 l9_5097=float2(0.0);
l9_5097=(l9_5030*l9_5093)+l9_5096;
float2 l9_5098=float2(0.0);
l9_5098=l9_5097+(l9_5096*(l9_5028.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_5026=l9_5098;
l9_5029=l9_5026;
}
else
{
float2 l9_5099=float2(0.0);
float2 l9_5100=float2(0.0);
float2 l9_5101=float2(0.0);
float2 l9_5102=float2(0.0);
float2 l9_5103=float2(0.0);
float2 l9_5104=float2(0.0);
ssGlobals l9_5105=l9_5028;
float2 l9_5106;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_5107=float2(0.0);
l9_5107=l9_5105.Surface_UVCoord0;
l9_5100=l9_5107;
l9_5106=l9_5100;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_5108=float2(0.0);
l9_5108=l9_5105.Surface_UVCoord1;
l9_5101=l9_5108;
l9_5106=l9_5101;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_5109=float2(0.0);
l9_5109=l9_5105.gScreenCoord;
l9_5102=l9_5109;
l9_5106=l9_5102;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_5110=float2(0.0);
l9_5110=l9_5105.Surface_UVCoord0;
float2 l9_5111=float2(0.0);
float2 l9_5112=float2(0.0);
float2 l9_5113=float2(0.0);
ssGlobals l9_5114=l9_5105;
float2 l9_5115;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_5116=float2(0.0);
float2 l9_5117=float2(0.0);
float2 l9_5118=float2(0.0);
float2 l9_5119=float2(0.0);
float2 l9_5120=float2(0.0);
ssGlobals l9_5121=l9_5114;
float2 l9_5122;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5123=float2(0.0);
l9_5123=l9_5121.Surface_UVCoord0;
l9_5117=l9_5123;
l9_5122=l9_5117;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5124=float2(0.0);
l9_5124=l9_5121.Surface_UVCoord1;
l9_5118=l9_5124;
l9_5122=l9_5118;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5125=float2(0.0);
l9_5125=l9_5121.gScreenCoord;
l9_5119=l9_5125;
l9_5122=l9_5119;
}
else
{
float2 l9_5126=float2(0.0);
l9_5126=l9_5121.Surface_UVCoord0;
l9_5120=l9_5126;
l9_5122=l9_5120;
}
}
}
l9_5116=l9_5122;
float2 l9_5127=float2(0.0);
float2 l9_5128=(*sc_set0.UserUniforms).uv2Scale;
l9_5127=l9_5128;
float2 l9_5129=float2(0.0);
l9_5129=l9_5127;
float2 l9_5130=float2(0.0);
float2 l9_5131=(*sc_set0.UserUniforms).uv2Offset;
l9_5130=l9_5131;
float2 l9_5132=float2(0.0);
l9_5132=l9_5130;
float2 l9_5133=float2(0.0);
l9_5133=(l9_5116*l9_5129)+l9_5132;
float2 l9_5134=float2(0.0);
l9_5134=l9_5133+(l9_5132*(l9_5114.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_5112=l9_5134;
l9_5115=l9_5112;
}
else
{
float2 l9_5135=float2(0.0);
float2 l9_5136=float2(0.0);
float2 l9_5137=float2(0.0);
float2 l9_5138=float2(0.0);
float2 l9_5139=float2(0.0);
ssGlobals l9_5140=l9_5114;
float2 l9_5141;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_5142=float2(0.0);
l9_5142=l9_5140.Surface_UVCoord0;
l9_5136=l9_5142;
l9_5141=l9_5136;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_5143=float2(0.0);
l9_5143=l9_5140.Surface_UVCoord1;
l9_5137=l9_5143;
l9_5141=l9_5137;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_5144=float2(0.0);
l9_5144=l9_5140.gScreenCoord;
l9_5138=l9_5144;
l9_5141=l9_5138;
}
else
{
float2 l9_5145=float2(0.0);
l9_5145=l9_5140.Surface_UVCoord0;
l9_5139=l9_5145;
l9_5141=l9_5139;
}
}
}
l9_5135=l9_5141;
float2 l9_5146=float2(0.0);
float2 l9_5147=(*sc_set0.UserUniforms).uv2Scale;
l9_5146=l9_5147;
float2 l9_5148=float2(0.0);
l9_5148=l9_5146;
float2 l9_5149=float2(0.0);
float2 l9_5150=(*sc_set0.UserUniforms).uv2Offset;
l9_5149=l9_5150;
float2 l9_5151=float2(0.0);
l9_5151=l9_5149;
float2 l9_5152=float2(0.0);
l9_5152=(l9_5135*l9_5148)+l9_5151;
l9_5113=l9_5152;
l9_5115=l9_5113;
}
l9_5111=l9_5115;
float l9_5153=0.0;
float l9_5154;
if ((int(Tweak_N67_tmp)!=0))
{
l9_5154=1.001;
}
else
{
l9_5154=0.001;
}
l9_5154-=0.001;
l9_5153=l9_5154;
float l9_5155=0.0;
l9_5155=l9_5153;
float2 l9_5156=float2(0.0);
l9_5156=mix(l9_5110,l9_5111,float2(l9_5155));
float2 l9_5157=float2(0.0);
l9_5157=l9_5156;
float2 l9_5158=float2(0.0);
l9_5158=l9_5157;
l9_5103=l9_5158;
l9_5106=l9_5103;
}
else
{
float2 l9_5159=float2(0.0);
l9_5159=l9_5105.Surface_UVCoord0;
l9_5104=l9_5159;
l9_5106=l9_5104;
}
}
}
}
l9_5099=l9_5106;
float2 l9_5160=float2(0.0);
float2 l9_5161=(*sc_set0.UserUniforms).uv3Scale;
l9_5160=l9_5161;
float2 l9_5162=float2(0.0);
l9_5162=l9_5160;
float2 l9_5163=float2(0.0);
float2 l9_5164=(*sc_set0.UserUniforms).uv3Offset;
l9_5163=l9_5164;
float2 l9_5165=float2(0.0);
l9_5165=l9_5163;
float2 l9_5166=float2(0.0);
l9_5166=(l9_5099*l9_5162)+l9_5165;
l9_5027=l9_5166;
l9_5029=l9_5027;
}
l9_5025=l9_5029;
float l9_5167=0.0;
float l9_5168;
if ((int(Tweak_N11_tmp)!=0))
{
l9_5168=1.001;
}
else
{
l9_5168=0.001;
}
l9_5168-=0.001;
l9_5167=l9_5168;
float l9_5169=0.0;
l9_5169=l9_5167;
float2 l9_5170=float2(0.0);
l9_5170=mix(l9_5024,l9_5025,float2(l9_5169));
float2 l9_5171=float2(0.0);
l9_5171=l9_5170;
float2 l9_5172=float2(0.0);
l9_5172=l9_5171;
l9_4969=l9_5172;
l9_4972=l9_4969;
}
else
{
float2 l9_5173=float2(0.0);
l9_5173=l9_4971.Surface_UVCoord0;
l9_4970=l9_5173;
l9_4972=l9_4970;
}
}
}
}
l9_4965=l9_4972;
float4 l9_5174=float4(0.0);
float2 l9_5175=l9_4965;
int l9_5176=0;
if ((int(detailNormalTexHasSwappedViews_tmp)!=0))
{
int l9_5177=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5177=0;
}
else
{
l9_5177=in.varStereoViewID;
}
int l9_5178=l9_5177;
l9_5176=1-l9_5178;
}
else
{
int l9_5179=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5179=0;
}
else
{
l9_5179=in.varStereoViewID;
}
int l9_5180=l9_5179;
l9_5176=l9_5180;
}
int l9_5181=l9_5176;
int l9_5182=detailNormalTexLayout_tmp;
int l9_5183=l9_5181;
float2 l9_5184=l9_5175;
bool l9_5185=(int(SC_USE_UV_TRANSFORM_detailNormalTex_tmp)!=0);
float3x3 l9_5186=(*sc_set0.UserUniforms).detailNormalTexTransform;
int2 l9_5187=int2(SC_SOFTWARE_WRAP_MODE_U_detailNormalTex_tmp,SC_SOFTWARE_WRAP_MODE_V_detailNormalTex_tmp);
bool l9_5188=(int(SC_USE_UV_MIN_MAX_detailNormalTex_tmp)!=0);
float4 l9_5189=(*sc_set0.UserUniforms).detailNormalTexUvMinMax;
bool l9_5190=(int(SC_USE_CLAMP_TO_BORDER_detailNormalTex_tmp)!=0);
float4 l9_5191=(*sc_set0.UserUniforms).detailNormalTexBorderColor;
float l9_5192=0.0;
bool l9_5193=l9_5190&&(!l9_5188);
float l9_5194=1.0;
float l9_5195=l9_5184.x;
int l9_5196=l9_5187.x;
if (l9_5196==1)
{
l9_5195=fract(l9_5195);
}
else
{
if (l9_5196==2)
{
float l9_5197=fract(l9_5195);
float l9_5198=l9_5195-l9_5197;
float l9_5199=step(0.25,fract(l9_5198*0.5));
l9_5195=mix(l9_5197,1.0-l9_5197,fast::clamp(l9_5199,0.0,1.0));
}
}
l9_5184.x=l9_5195;
float l9_5200=l9_5184.y;
int l9_5201=l9_5187.y;
if (l9_5201==1)
{
l9_5200=fract(l9_5200);
}
else
{
if (l9_5201==2)
{
float l9_5202=fract(l9_5200);
float l9_5203=l9_5200-l9_5202;
float l9_5204=step(0.25,fract(l9_5203*0.5));
l9_5200=mix(l9_5202,1.0-l9_5202,fast::clamp(l9_5204,0.0,1.0));
}
}
l9_5184.y=l9_5200;
if (l9_5188)
{
bool l9_5205=l9_5190;
bool l9_5206;
if (l9_5205)
{
l9_5206=l9_5187.x==3;
}
else
{
l9_5206=l9_5205;
}
float l9_5207=l9_5184.x;
float l9_5208=l9_5189.x;
float l9_5209=l9_5189.z;
bool l9_5210=l9_5206;
float l9_5211=l9_5194;
float l9_5212=fast::clamp(l9_5207,l9_5208,l9_5209);
float l9_5213=step(abs(l9_5207-l9_5212),9.9999997e-06);
l9_5211*=(l9_5213+((1.0-float(l9_5210))*(1.0-l9_5213)));
l9_5207=l9_5212;
l9_5184.x=l9_5207;
l9_5194=l9_5211;
bool l9_5214=l9_5190;
bool l9_5215;
if (l9_5214)
{
l9_5215=l9_5187.y==3;
}
else
{
l9_5215=l9_5214;
}
float l9_5216=l9_5184.y;
float l9_5217=l9_5189.y;
float l9_5218=l9_5189.w;
bool l9_5219=l9_5215;
float l9_5220=l9_5194;
float l9_5221=fast::clamp(l9_5216,l9_5217,l9_5218);
float l9_5222=step(abs(l9_5216-l9_5221),9.9999997e-06);
l9_5220*=(l9_5222+((1.0-float(l9_5219))*(1.0-l9_5222)));
l9_5216=l9_5221;
l9_5184.y=l9_5216;
l9_5194=l9_5220;
}
float2 l9_5223=l9_5184;
bool l9_5224=l9_5185;
float3x3 l9_5225=l9_5186;
if (l9_5224)
{
l9_5223=float2((l9_5225*float3(l9_5223,1.0)).xy);
}
float2 l9_5226=l9_5223;
float2 l9_5227=l9_5226;
float2 l9_5228=l9_5227;
l9_5184=l9_5228;
float l9_5229=l9_5184.x;
int l9_5230=l9_5187.x;
bool l9_5231=l9_5193;
float l9_5232=l9_5194;
if ((l9_5230==0)||(l9_5230==3))
{
float l9_5233=l9_5229;
float l9_5234=0.0;
float l9_5235=1.0;
bool l9_5236=l9_5231;
float l9_5237=l9_5232;
float l9_5238=fast::clamp(l9_5233,l9_5234,l9_5235);
float l9_5239=step(abs(l9_5233-l9_5238),9.9999997e-06);
l9_5237*=(l9_5239+((1.0-float(l9_5236))*(1.0-l9_5239)));
l9_5233=l9_5238;
l9_5229=l9_5233;
l9_5232=l9_5237;
}
l9_5184.x=l9_5229;
l9_5194=l9_5232;
float l9_5240=l9_5184.y;
int l9_5241=l9_5187.y;
bool l9_5242=l9_5193;
float l9_5243=l9_5194;
if ((l9_5241==0)||(l9_5241==3))
{
float l9_5244=l9_5240;
float l9_5245=0.0;
float l9_5246=1.0;
bool l9_5247=l9_5242;
float l9_5248=l9_5243;
float l9_5249=fast::clamp(l9_5244,l9_5245,l9_5246);
float l9_5250=step(abs(l9_5244-l9_5249),9.9999997e-06);
l9_5248*=(l9_5250+((1.0-float(l9_5247))*(1.0-l9_5250)));
l9_5244=l9_5249;
l9_5240=l9_5244;
l9_5243=l9_5248;
}
l9_5184.y=l9_5240;
l9_5194=l9_5243;
float2 l9_5251=l9_5184;
int l9_5252=l9_5182;
int l9_5253=l9_5183;
float l9_5254=l9_5192;
float2 l9_5255=l9_5251;
int l9_5256=l9_5252;
int l9_5257=l9_5253;
float3 l9_5258=float3(0.0);
if (l9_5256==0)
{
l9_5258=float3(l9_5255,0.0);
}
else
{
if (l9_5256==1)
{
l9_5258=float3(l9_5255.x,(l9_5255.y*0.5)+(0.5-(float(l9_5257)*0.5)),0.0);
}
else
{
l9_5258=float3(l9_5255,float(l9_5257));
}
}
float3 l9_5259=l9_5258;
float3 l9_5260=l9_5259;
float2 l9_5261=l9_5260.xy;
float l9_5262=l9_5254;
float4 l9_5263=sc_set0.detailNormalTex.sample(sc_set0.detailNormalTexSmpSC,l9_5261,bias(l9_5262));
float4 l9_5264=l9_5263;
float4 l9_5265=l9_5264;
if (l9_5190)
{
l9_5265=mix(l9_5191,l9_5265,float4(l9_5194));
}
float4 l9_5266=l9_5265;
float4 l9_5267=l9_5266;
float3 l9_5268=(l9_5267.xyz*1.9921875)-float3(1.0);
l9_5267=float4(l9_5268.x,l9_5268.y,l9_5268.z,l9_5267.w);
l9_5174=l9_5267;
l9_4961=l9_5174.xyz;
l9_4964=l9_4961;
}
else
{
l9_4964=l9_4962;
}
l9_4960=l9_4964;
float3 l9_5269=float3(0.0);
float3 l9_5270=l9_4865.xyz;
float l9_5271=(*sc_set0.UserUniforms).Port_Strength1_N200;
float3 l9_5272=l9_4960;
float l9_5273=(*sc_set0.UserUniforms).Port_Strength2_N200;
float3 l9_5274=l9_5270;
float l9_5275=l9_5271;
float3 l9_5276=l9_5272;
float l9_5277=l9_5273;
float3 l9_5278=mix(float3(0.0,0.0,1.0),l9_5274,float3(l9_5275))+float3(0.0,0.0,1.0);
float3 l9_5279=mix(float3(0.0,0.0,1.0),l9_5276,float3(l9_5277))*float3(-1.0,-1.0,1.0);
float3 l9_5280=normalize((l9_5278*dot(l9_5278,l9_5279))-(l9_5279*l9_5278.z));
l9_5272=l9_5280;
float3 l9_5281=l9_5272;
l9_5269=l9_5281;
float3 l9_5282=float3(0.0);
l9_5282=l9_4655*l9_5269;
float3 l9_5283=float3(0.0);
float3 l9_5284=l9_5282;
float l9_5285=dot(l9_5284,l9_5284);
float l9_5286;
if (l9_5285>0.0)
{
l9_5286=1.0/sqrt(l9_5285);
}
else
{
l9_5286=0.0;
}
float l9_5287=l9_5286;
float3 l9_5288=l9_5284*l9_5287;
l9_5283=l9_5288;
l9_4648=l9_5283;
l9_4651=l9_4648;
}
else
{
float3 l9_5289=float3(0.0);
l9_5289=l9_4650.VertexNormal_WorldSpace;
float3 l9_5290=float3(0.0);
float3 l9_5291=l9_5289;
float l9_5292=dot(l9_5291,l9_5291);
float l9_5293;
if (l9_5292>0.0)
{
l9_5293=1.0/sqrt(l9_5292);
}
else
{
l9_5293=0.0;
}
float l9_5294=l9_5293;
float3 l9_5295=l9_5291*l9_5294;
l9_5290=l9_5295;
l9_4649=l9_5290;
l9_4651=l9_4649;
}
l9_4647=l9_4651;
float3 l9_5296=float3(0.0);
l9_5296=l9_4647;
float3 l9_5297=float3(0.0);
l9_5297=l9_5296;
float3 l9_5298=float3(0.0);
l9_5298=-l9_3991.ViewDirWS;
float l9_5299=0.0;
l9_5299=dot(l9_5297,l9_5298);
float l9_5300=0.0;
l9_5300=abs(l9_5299);
float l9_5301=0.0;
l9_5301=1.0-l9_5300;
l9_3990=l9_5301;
l9_3992=l9_3990;
}
l9_3988=l9_3992;
float l9_5302=0.0;
float l9_5303=(*sc_set0.UserUniforms).rimExponent;
l9_5302=l9_5303;
float l9_5304=0.0;
l9_5304=l9_5302;
float l9_5305=0.0;
float l9_5306;
if (l9_3988<=0.0)
{
l9_5306=0.0;
}
else
{
l9_5306=pow(l9_3988,l9_5304);
}
l9_5305=l9_5306;
float3 l9_5307=float3(0.0);
l9_5307=l9_3984*float3(l9_5305);
param_20=l9_5307;
param_22=param_20;
}
else
{
param_22=param_21;
}
Result_N173=param_22;
float3 Export_N347=float3(0.0);
Export_N347=Result_N173;
float3 Value_N306=float3(0.0);
Value_N306=Export_N347;
float3 Output_N299=float3(0.0);
Output_N299=(Output_N82+Value_N298)+Value_N306;
float3 Output_N251=float3(0.0);
float3 param_24=Output_N299;
float3 l9_5308;
if (SC_DEVICE_CLASS_tmp>=2)
{
l9_5308=float3(pow(param_24.x,0.45454544),pow(param_24.y,0.45454544),pow(param_24.z,0.45454544));
}
else
{
l9_5308=sqrt(param_24);
}
float3 l9_5309=l9_5308;
Output_N251=l9_5309;
float3 Export_N300=float3(0.0);
Export_N300=Output_N251;
float4 Output_N36=float4(0.0);
float3 param_25=Output_N104.xyz;
float param_26=Output_N2;
float3 param_27=Export_N334;
float3 param_28=Export_N300;
float3 param_29=(*sc_set0.UserUniforms).Port_AO_N036;
ssGlobals param_31=Globals;
if (!(int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_31.BumpedNormal=param_27;
}
param_26=fast::clamp(param_26,0.0,1.0);
float l9_5310=param_26;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_5310<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_5311=gl_FragCoord;
float2 l9_5312=floor(mod(l9_5311.xy,float2(4.0)));
float l9_5313=(mod(dot(l9_5312,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_5310<l9_5313)
{
discard_fragment();
}
}
param_25=fast::max(param_25,float3(0.0));
float4 param_30;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
param_30=float4(param_25,param_26);
}
else
{
param_28=fast::max(param_28,float3(0.0));
float l9_5314=0.0;
float l9_5315=1.0;
float3 l9_5316=float3(1.0);
float3 l9_5317=param_25;
float l9_5318=param_26;
float3 l9_5319=param_31.BumpedNormal;
float3 l9_5320=param_31.PositionWS;
float3 l9_5321=param_31.ViewDirWS;
float3 l9_5322=param_28;
float l9_5323=l9_5314;
float l9_5324=l9_5315;
float3 l9_5325=param_29;
float3 l9_5326=l9_5316;
param_30=ngsCalculateLighting(l9_5317,l9_5318,l9_5319,l9_5320,l9_5321,l9_5322,l9_5323,l9_5324,l9_5325,l9_5326,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.sc_EnvmapDiffuse,sc_set0.sc_EnvmapDiffuseSmpSC,sc_set0.sc_EnvmapSpecular,sc_set0.sc_EnvmapSpecularSmpSC,sc_set0.sc_ScreenTexture,sc_set0.sc_ScreenTextureSmpSC,sc_set0.sc_ShadowTexture,sc_set0.sc_ShadowTextureSmpSC,sc_set0.sc_SSAOTexture,sc_set0.sc_SSAOTextureSmpSC,sc_set0.sc_RayTracedShadowTexture,sc_set0.sc_RayTracedShadowTextureSmpSC,sc_set0.sc_RayTracedDiffIndTexture,sc_set0.sc_RayTracedDiffIndTextureSmpSC,sc_set0.sc_RayTracedAoTexture,sc_set0.sc_RayTracedAoTextureSmpSC,gl_FragCoord,in.varShadowTex,out.FragColor0);
}
param_30=fast::max(param_30,float4(0.0));
Output_N36=param_30;
FinalColor=Output_N36;
bool l9_5327=(*sc_set0.UserUniforms).isProxyMode!=0;
if (l9_5327)
{
float4 param_32=FinalColor;
if ((int(sc_ProxyAlphaOne_tmp)!=0))
{
param_32.w=1.0;
}
float4 l9_5328=fast::max(param_32,float4(0.0));
float4 param_33=l9_5328;
if (sc_ShaderCacheConstant_tmp!=0)
{
param_33.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=param_33;
return out;
}
float4 param_34=FinalColor;
if ((int(sc_ProjectiveShadowsCaster_tmp)!=0))
{
float4 l9_5329=param_34;
float4 l9_5330=l9_5329;
float l9_5331=1.0;
if ((((int(sc_BlendMode_Normal_tmp)!=0)||(int(sc_BlendMode_AlphaToCoverage_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaHardware_tmp)!=0))||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_5331=l9_5330.w;
}
else
{
if ((int(sc_BlendMode_PremultipliedAlpha_tmp)!=0))
{
l9_5331=fast::clamp(l9_5330.w*2.0,0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_5331=fast::clamp(dot(l9_5330.xyz,float3(l9_5330.w)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
l9_5331=1.0;
}
else
{
if ((int(sc_BlendMode_Multiply_tmp)!=0))
{
l9_5331=(1.0-dot(l9_5330.xyz,float3(0.33333001)))*l9_5330.w;
}
else
{
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_5331=(1.0-fast::clamp(dot(l9_5330.xyz,float3(1.0)),0.0,1.0))*l9_5330.w;
}
else
{
if ((int(sc_BlendMode_ColoredGlass_tmp)!=0))
{
l9_5331=fast::clamp(dot(l9_5330.xyz,float3(1.0)),0.0,1.0)*l9_5330.w;
}
else
{
if ((int(sc_BlendMode_Add_tmp)!=0))
{
l9_5331=fast::clamp(dot(l9_5330.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_AddWithAlphaFactor_tmp)!=0))
{
l9_5331=fast::clamp(dot(l9_5330.xyz,float3(1.0)),0.0,1.0)*l9_5330.w;
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0))
{
l9_5331=dot(l9_5330.xyz,float3(0.33333001))*l9_5330.w;
}
else
{
if ((int(sc_BlendMode_Min_tmp)!=0))
{
l9_5331=1.0-fast::clamp(dot(l9_5330.xyz,float3(1.0)),0.0,1.0);
}
else
{
if ((int(sc_BlendMode_Max_tmp)!=0))
{
l9_5331=fast::clamp(dot(l9_5330.xyz,float3(1.0)),0.0,1.0);
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
float l9_5332=l9_5331;
float l9_5333=l9_5332;
float l9_5334=(*sc_set0.UserUniforms).sc_ShadowDensity*l9_5333;
float3 l9_5335=mix((*sc_set0.UserUniforms).sc_ShadowColor.xyz,(*sc_set0.UserUniforms).sc_ShadowColor.xyz*l9_5329.xyz,float3((*sc_set0.UserUniforms).sc_ShadowColor.w));
float4 l9_5336=float4(l9_5335.x,l9_5335.y,l9_5335.z,l9_5334);
param_34=l9_5336;
}
else
{
if ((int(sc_RenderAlphaToColor_tmp)!=0))
{
param_34=float4(param_34.w);
}
else
{
if ((int(sc_BlendMode_Custom_tmp)!=0))
{
float4 l9_5337=param_34;
float4 l9_5338=float4(0.0);
float4 l9_5339=float4(0.0);
if ((int(sc_FramebufferFetch_tmp)!=0))
{
float4 l9_5340=out.FragColor0;
float4 l9_5341=l9_5340;
if ((int(sc_UseFramebufferFetchMarker_tmp)!=0))
{
l9_5341.x+=(*sc_set0.UserUniforms)._sc_framebufferFetchMarker;
}
float4 l9_5342=l9_5341;
l9_5339=l9_5342;
}
else
{
float4 l9_5343=gl_FragCoord;
float2 l9_5344=l9_5343.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_5345=l9_5344;
float2 l9_5346=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_5347=1;
int l9_5348=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5348=0;
}
else
{
l9_5348=in.varStereoViewID;
}
int l9_5349=l9_5348;
int l9_5350=l9_5349;
float3 l9_5351=float3(l9_5345,0.0);
int l9_5352=l9_5347;
int l9_5353=l9_5350;
if (l9_5352==1)
{
l9_5351.y=((2.0*l9_5351.y)+float(l9_5353))-1.0;
}
float2 l9_5354=l9_5351.xy;
l9_5346=l9_5354;
}
else
{
l9_5346=l9_5345;
}
float2 l9_5355=l9_5346;
float2 l9_5356=l9_5355;
float2 l9_5357=l9_5356;
int l9_5358=0;
if ((int(sc_ScreenTextureHasSwappedViews_tmp)!=0))
{
int l9_5359=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5359=0;
}
else
{
l9_5359=in.varStereoViewID;
}
int l9_5360=l9_5359;
l9_5358=1-l9_5360;
}
else
{
int l9_5361=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_5361=0;
}
else
{
l9_5361=in.varStereoViewID;
}
int l9_5362=l9_5361;
l9_5358=l9_5362;
}
int l9_5363=l9_5358;
float2 l9_5364=l9_5357;
int l9_5365=l9_5363;
float2 l9_5366=l9_5364;
int l9_5367=l9_5365;
float l9_5368=0.0;
float4 l9_5369=float4(0.0);
float2 l9_5370=l9_5366;
int l9_5371=sc_ScreenTextureLayout_tmp;
int l9_5372=l9_5367;
float l9_5373=l9_5368;
float2 l9_5374=l9_5370;
int l9_5375=l9_5371;
int l9_5376=l9_5372;
float3 l9_5377=float3(0.0);
if (l9_5375==0)
{
l9_5377=float3(l9_5374,0.0);
}
else
{
if (l9_5375==1)
{
l9_5377=float3(l9_5374.x,(l9_5374.y*0.5)+(0.5-(float(l9_5376)*0.5)),0.0);
}
else
{
l9_5377=float3(l9_5374,float(l9_5376));
}
}
float3 l9_5378=l9_5377;
float3 l9_5379=l9_5378;
float2 l9_5380=l9_5379.xy;
float l9_5381=l9_5373;
float4 l9_5382=sc_set0.sc_ScreenTexture.sample(sc_set0.sc_ScreenTextureSmpSC,l9_5380,bias(l9_5381));
float4 l9_5383=l9_5382;
l9_5369=l9_5383;
float4 l9_5384=l9_5369;
float4 l9_5385=l9_5384;
float4 l9_5386=l9_5385;
l9_5339=l9_5386;
}
float4 l9_5387=l9_5339;
float4 l9_5388=l9_5387;
float3 l9_5389=l9_5388.xyz;
float3 l9_5390=l9_5389;
float3 l9_5391=l9_5337.xyz;
float3 l9_5392=definedBlend(l9_5390,l9_5391,in.varStereoViewID,(*sc_set0.UserUniforms),sc_set0.intensityTexture,sc_set0.intensityTextureSmpSC);
l9_5338=float4(l9_5392.x,l9_5392.y,l9_5392.z,l9_5338.w);
float3 l9_5393=mix(l9_5389,l9_5338.xyz,float3(l9_5337.w));
l9_5338=float4(l9_5393.x,l9_5393.y,l9_5393.z,l9_5338.w);
l9_5338.w=1.0;
float4 l9_5394=l9_5338;
param_34=l9_5394;
}
else
{
float4 l9_5395=param_34;
float4 l9_5396=float4(0.0);
if ((int(sc_BlendMode_MultiplyOriginal_tmp)!=0))
{
l9_5396=float4(mix(float3(1.0),l9_5395.xyz,float3(l9_5395.w)),l9_5395.w);
}
else
{
if ((int(sc_BlendMode_Screen_tmp)!=0)||(int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
float l9_5397=l9_5395.w;
if ((int(sc_BlendMode_PremultipliedAlphaAuto_tmp)!=0))
{
l9_5397=fast::clamp(l9_5397,0.0,1.0);
}
l9_5396=float4(l9_5395.xyz*l9_5397,l9_5397);
}
else
{
l9_5396=l9_5395;
}
}
float4 l9_5398=l9_5396;
param_34=l9_5398;
}
}
}
float4 l9_5399=param_34;
FinalColor=l9_5399;
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
float4 l9_5400=float4(0.0);
if ((int(sc_ShaderComplexityAnalyzer_tmp)!=0))
{
l9_5400=float4((*sc_set0.UserUniforms).shaderComplexityValue/255.0,0.0,0.0,1.0);
}
else
{
l9_5400=float4(0.0);
}
float4 l9_5401=l9_5400;
float4 Cost=l9_5401;
if (Cost.w>0.0)
{
FinalColor=Cost;
}
FinalColor=fast::max(FinalColor,float4(0.0));
float3 param_35=in.varPos;
float4 param_36=FinalColor;
FinalColor=outputMotionVectorsIfNeeded(param_35,param_36,in.varStereoViewID,(*sc_set0.UserUniforms));
float4 param_37=FinalColor;
float4 l9_5402=param_37;
if (sc_ShaderCacheConstant_tmp!=0)
{
l9_5402.x+=((*sc_set0.UserUniforms).sc_UniformConstants.x*float(sc_ShaderCacheConstant_tmp));
}
out.FragColor0=l9_5402;
return out;
}
} // FRAGMENT SHADER

namespace SNAP_RECV {
struct ssGlobals
{
float gTimeElapsed;
float gTimeDelta;
float gTimeElapsedShifted;
float3 BumpedNormal;
float3 ViewDirWS;
float3 PositionWS;
float4 VertexColor;
float2 Surface_UVCoord0;
float2 Surface_UVCoord1;
float2 gScreenCoord;
float3 VertexTangent_WorldSpace;
float3 VertexNormal_WorldSpace;
float3 VertexBinormal_WorldSpace;
float3 SurfacePosition_WorldSpace;
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
int receivesRayTracedReflections;
int isProxyMode;
int receivesRayTracedShadows;
int receivesRayTracedDiffuseIndirect;
int receivesRayTracedAo;
float4 sc_RayTracedReflectionTextureSize;
float4 sc_RayTracedReflectionTextureDims;
float4 sc_RayTracedReflectionTextureView;
float4 sc_RayTracedShadowTextureSize;
float4 sc_RayTracedShadowTextureDims;
float4 sc_RayTracedShadowTextureView;
float4 sc_RayTracedDiffIndTextureSize;
float4 sc_RayTracedDiffIndTextureDims;
float4 sc_RayTracedDiffIndTextureView;
float4 sc_RayTracedAoTextureSize;
float4 sc_RayTracedAoTextureDims;
float4 sc_RayTracedAoTextureView;
float receiver_mask;
float3 OriginNormalizationScale;
float3 OriginNormalizationScaleInv;
float3 OriginNormalizationOffset;
int receiverId;
int instance_id;
int lray_triangles_last;
int noEarlyZ;
int has_animated_pn;
int emitter_stride;
int proxy_offset_position;
int proxy_offset_normal;
int proxy_offset_tangent;
int proxy_offset_color;
int proxy_offset_texture0;
int proxy_offset_texture1;
int proxy_offset_texture2;
int proxy_offset_texture3;
int proxy_format_position;
int proxy_format_normal;
int proxy_format_tangent;
int proxy_format_color;
int proxy_format_texture0;
int proxy_format_texture1;
int proxy_format_texture2;
int proxy_format_texture3;
float4 z_rayDirectionsSize;
float4 z_rayDirectionsDims;
float4 z_rayDirectionsView;
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
float3 recolorRed;
float4 baseColor;
float4 baseTexSize;
float4 baseTexDims;
float4 baseTexView;
float3x3 baseTexTransform;
float4 baseTexUvMinMax;
float4 baseTexBorderColor;
float2 uv2Scale;
float2 uv2Offset;
float2 uv3Scale;
float2 uv3Offset;
float3 recolorGreen;
float3 recolorBlue;
float progress_value;
float4 normalTexSize;
float4 normalTexDims;
float4 normalTexView;
float3x3 normalTexTransform;
float4 normalTexUvMinMax;
float4 normalTexBorderColor;
float4 detailNormalTexSize;
float4 detailNormalTexDims;
float4 detailNormalTexView;
float3x3 detailNormalTexTransform;
float4 detailNormalTexUvMinMax;
float4 detailNormalTexBorderColor;
float4 emissiveTexSize;
float4 emissiveTexDims;
float4 emissiveTexView;
float3x3 emissiveTexTransform;
float4 emissiveTexUvMinMax;
float4 emissiveTexBorderColor;
float3 emissiveColor;
float emissiveIntensity;
float reflectionIntensity;
float4 reflectionTexSize;
float4 reflectionTexDims;
float4 reflectionTexView;
float3x3 reflectionTexTransform;
float4 reflectionTexUvMinMax;
float4 reflectionTexBorderColor;
float4 reflectionModulationTexSize;
float4 reflectionModulationTexDims;
float4 reflectionModulationTexView;
float3x3 reflectionModulationTexTransform;
float4 reflectionModulationTexUvMinMax;
float4 reflectionModulationTexBorderColor;
float3 rimColor;
float rimIntensity;
float4 rimColorTexSize;
float4 rimColorTexDims;
float4 rimColorTexView;
float3x3 rimColorTexTransform;
float4 rimColorTexUvMinMax;
float4 rimColorTexBorderColor;
float rimExponent;
float4 Port_Import_N042;
float Port_Input1_N044;
float Port_Import_N088;
float3 Port_Import_N089;
float4 Port_Import_N384;
float Port_Import_N307;
float Port_Import_N201;
float Port_Import_N010;
float Port_Import_N007;
float2 Port_Import_N008;
float2 Port_Import_N009;
float Port_Speed_N022;
float Port_Import_N012;
float2 Port_Import_N254;
float Port_Import_N055;
float Port_Import_N056;
float2 Port_Import_N000;
float2 Port_Import_N060;
float2 Port_Import_N061;
float Port_Speed_N063;
float Port_Import_N065;
float2 Port_Import_N255;
float4 Port_Default_N369;
float4 Port_Import_N092;
float3 Port_Import_N090;
float3 Port_Import_N091;
float3 Port_Import_N144;
float Port_Value2_N073;
float Port_Import_N336;
float Port_Import_N160;
float2 Port_Import_N167;
float2 Port_Import_N207;
float Port_Strength1_N200;
float Port_Import_N095;
float Port_Import_N108;
float3 Port_Default_N113;
float Port_Strength2_N200;
float Port_Import_N273;
float Port_Input1_N274;
float Port_Import_N131;
float Port_Import_N116;
float2 Port_Import_N120;
float2 Port_Import_N127;
float4 Port_Default_N132;
float3 Port_Import_N295;
float Port_Import_N296;
float Port_Import_N133;
float Port_Import_N231;
float3 Port_Import_N327;
float3 Port_Input1_N257;
float3 Port_Import_N259;
float Port_Input1_N264;
float Port_Input1_N268;
float Port_Input1_N270;
float Port_Import_N123;
float Port_Import_N025;
float2 Port_Import_N030;
float2 Port_Import_N031;
float3 Port_Default_N041;
float3 Port_Default_N134;
float3 Port_Import_N298;
float Port_Import_N172;
float3 Port_Import_N318;
float Port_Import_N319;
float Port_Import_N171;
float Port_Import_N135;
float2 Port_Import_N150;
float2 Port_Import_N152;
float3 Port_Default_N170;
float Port_Import_N339;
float3 Port_Import_N328;
float Port_Import_N340;
float3 Port_Default_N173;
float3 Port_Import_N306;
float3 Port_AO_N036;
float depthRef;
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
struct layoutIndices_obj
{
uint _Triangles[1];
};
struct layoutVertices_obj
{
float _Vertices[1];
};
struct layoutVerticesPN_obj
{
float _VerticesPN[1];
};
struct sc_Set0
{
const device layoutIndices_obj* layoutIndices [[id(0)]];
const device layoutVertices_obj* layoutVertices [[id(1)]];
const device layoutVerticesPN_obj* layoutVerticesPN [[id(2)]];
constant sc_Bones_obj* sc_BonesUBO [[id(3)]];
texture2d<float> baseTex [[id(4)]];
texture2d<float> detailNormalTex [[id(5)]];
texture2d<float> emissiveTex [[id(6)]];
texture2d<float> intensityTexture [[id(7)]];
texture2d<float> normalTex [[id(8)]];
texture2d<float> reflectionModulationTex [[id(9)]];
texture2d<float> reflectionTex [[id(10)]];
texture2d<float> rimColorTex [[id(11)]];
texture2d<float> sc_EnvmapDiffuse [[id(12)]];
texture2d<float> sc_EnvmapSpecular [[id(13)]];
texture2d<float> sc_RayTracedAoTexture [[id(22)]];
texture2d<float> sc_RayTracedDiffIndTexture [[id(23)]];
texture2d<float> sc_RayTracedShadowTexture [[id(25)]];
texture2d<float> sc_SSAOTexture [[id(26)]];
texture2d<float> sc_ScreenTexture [[id(27)]];
texture2d<float> sc_ShadowTexture [[id(28)]];
texture2d<uint> z_hitIdAndBarycentric [[id(30)]];
texture2d<float> z_rayDirections [[id(31)]];
sampler baseTexSmpSC [[id(32)]];
sampler detailNormalTexSmpSC [[id(33)]];
sampler emissiveTexSmpSC [[id(34)]];
sampler intensityTextureSmpSC [[id(35)]];
sampler normalTexSmpSC [[id(36)]];
sampler reflectionModulationTexSmpSC [[id(37)]];
sampler reflectionTexSmpSC [[id(38)]];
sampler rimColorTexSmpSC [[id(39)]];
sampler sc_EnvmapDiffuseSmpSC [[id(40)]];
sampler sc_EnvmapSpecularSmpSC [[id(41)]];
sampler sc_RayTracedAoTextureSmpSC [[id(43)]];
sampler sc_RayTracedDiffIndTextureSmpSC [[id(44)]];
sampler sc_RayTracedShadowTextureSmpSC [[id(46)]];
sampler sc_SSAOTextureSmpSC [[id(47)]];
sampler sc_ScreenTextureSmpSC [[id(48)]];
sampler sc_ShadowTextureSmpSC [[id(49)]];
sampler z_hitIdAndBarycentricSmp [[id(51)]];
sampler z_rayDirectionsSmpSC [[id(52)]];
constant userUniformsObj* UserUniforms [[id(53)]];
};
struct main_recv_out
{
uint4 position_and_mask [[color(0)]];
uint4 normal_and_more [[color(1)]];
};
struct main_recv_in
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
};
// Implementation of the GLSL mod() function,which is slightly different than Metal fmod()
template<typename Tx,typename Ty>
Tx mod(Tx x,Ty y)
{
return x-y*floor(x/y);
}
fragment main_recv_out main_recv(main_recv_in in [[stage_in]],constant sc_Set0& sc_set0 [[buffer(0)]],float4 gl_FragCoord [[position]])
{
main_recv_out out={};
if ((int(sc_DepthOnly_tmp)!=0))
{
return out;
}
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
Globals.BumpedNormal=float3(0.0);
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-in.varPos);
Globals.PositionWS=in.varPos;
Globals.VertexColor=in.varColor;
Globals.Surface_UVCoord0=in.varPackedTex.xy;
Globals.Surface_UVCoord1=in.varPackedTex.zw;
float4 l9_2=gl_FragCoord;
float2 l9_3=l9_2.xy*(*sc_set0.UserUniforms).sc_CurrentRenderTargetDims.zw;
float2 l9_4=l9_3;
float2 l9_5=float2(0.0);
if (sc_StereoRenderingMode_tmp==1)
{
int l9_6=1;
int l9_7=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_7=0;
}
else
{
l9_7=in.varStereoViewID;
}
int l9_8=l9_7;
int l9_9=l9_8;
float3 l9_10=float3(l9_4,0.0);
int l9_11=l9_6;
int l9_12=l9_9;
if (l9_11==1)
{
l9_10.y=((2.0*l9_10.y)+float(l9_12))-1.0;
}
float2 l9_13=l9_10.xy;
l9_5=l9_13;
}
else
{
l9_5=l9_4;
}
float2 l9_14=l9_5;
float2 l9_15=l9_14;
Globals.gScreenCoord=l9_15;
Globals.VertexTangent_WorldSpace=normalize(in.varTangent.xyz);
Globals.VertexNormal_WorldSpace=normalize(in.varNormal);
Globals.VertexBinormal_WorldSpace=cross(Globals.VertexNormal_WorldSpace,Globals.VertexTangent_WorldSpace)*in.varTangent.w;
Globals.SurfacePosition_WorldSpace=in.varPos;
Globals.ViewDirWS=normalize((*sc_set0.UserUniforms).sc_Camera.position-Globals.SurfacePosition_WorldSpace);
float4 Result_N363=float4(0.0);
float4 param=float4(0.0);
float4 param_1=float4(0.0);
ssGlobals param_3=Globals;
float4 param_2;
if (NODE_38_DROPLIST_ITEM_tmp==1)
{
float4 l9_16=float4(0.0);
l9_16=param_3.VertexColor;
float3 l9_17=float3(0.0);
float3 l9_18=float3(0.0);
float3 l9_19=float3(0.0);
ssGlobals l9_20=param_3;
float3 l9_21;
if ((int(Tweak_N37_tmp)!=0))
{
float3 l9_22=float3(0.0);
float3 l9_23=(*sc_set0.UserUniforms).recolorRed;
l9_22=l9_23;
float3 l9_24=float3(0.0);
l9_24=l9_22;
float4 l9_25=float4(0.0);
float4 l9_26=(*sc_set0.UserUniforms).baseColor;
l9_25=l9_26;
float4 l9_27=float4(0.0);
l9_27=l9_25;
float4 l9_28=float4(0.0);
float4 l9_29=float4(0.0);
float4 l9_30=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_31=l9_20;
float4 l9_32;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_33=float2(0.0);
float2 l9_34=float2(0.0);
float2 l9_35=float2(0.0);
float2 l9_36=float2(0.0);
float2 l9_37=float2(0.0);
float2 l9_38=float2(0.0);
ssGlobals l9_39=l9_31;
float2 l9_40;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_41=float2(0.0);
l9_41=l9_39.Surface_UVCoord0;
l9_34=l9_41;
l9_40=l9_34;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_42=float2(0.0);
l9_42=l9_39.Surface_UVCoord1;
l9_35=l9_42;
l9_40=l9_35;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_43=float2(0.0);
l9_43=l9_39.Surface_UVCoord0;
float2 l9_44=float2(0.0);
float2 l9_45=float2(0.0);
float2 l9_46=float2(0.0);
ssGlobals l9_47=l9_39;
float2 l9_48;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_49=float2(0.0);
float2 l9_50=float2(0.0);
float2 l9_51=float2(0.0);
float2 l9_52=float2(0.0);
float2 l9_53=float2(0.0);
ssGlobals l9_54=l9_47;
float2 l9_55;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_56=float2(0.0);
l9_56=l9_54.Surface_UVCoord0;
l9_50=l9_56;
l9_55=l9_50;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_57=float2(0.0);
l9_57=l9_54.Surface_UVCoord1;
l9_51=l9_57;
l9_55=l9_51;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_58=float2(0.0);
l9_58=l9_54.gScreenCoord;
l9_52=l9_58;
l9_55=l9_52;
}
else
{
float2 l9_59=float2(0.0);
l9_59=l9_54.Surface_UVCoord0;
l9_53=l9_59;
l9_55=l9_53;
}
}
}
l9_49=l9_55;
float2 l9_60=float2(0.0);
float2 l9_61=(*sc_set0.UserUniforms).uv2Scale;
l9_60=l9_61;
float2 l9_62=float2(0.0);
l9_62=l9_60;
float2 l9_63=float2(0.0);
float2 l9_64=(*sc_set0.UserUniforms).uv2Offset;
l9_63=l9_64;
float2 l9_65=float2(0.0);
l9_65=l9_63;
float2 l9_66=float2(0.0);
l9_66=(l9_49*l9_62)+l9_65;
float2 l9_67=float2(0.0);
l9_67=l9_66+(l9_65*(l9_47.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_45=l9_67;
l9_48=l9_45;
}
else
{
float2 l9_68=float2(0.0);
float2 l9_69=float2(0.0);
float2 l9_70=float2(0.0);
float2 l9_71=float2(0.0);
float2 l9_72=float2(0.0);
ssGlobals l9_73=l9_47;
float2 l9_74;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_75=float2(0.0);
l9_75=l9_73.Surface_UVCoord0;
l9_69=l9_75;
l9_74=l9_69;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_76=float2(0.0);
l9_76=l9_73.Surface_UVCoord1;
l9_70=l9_76;
l9_74=l9_70;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_77=float2(0.0);
l9_77=l9_73.gScreenCoord;
l9_71=l9_77;
l9_74=l9_71;
}
else
{
float2 l9_78=float2(0.0);
l9_78=l9_73.Surface_UVCoord0;
l9_72=l9_78;
l9_74=l9_72;
}
}
}
l9_68=l9_74;
float2 l9_79=float2(0.0);
float2 l9_80=(*sc_set0.UserUniforms).uv2Scale;
l9_79=l9_80;
float2 l9_81=float2(0.0);
l9_81=l9_79;
float2 l9_82=float2(0.0);
float2 l9_83=(*sc_set0.UserUniforms).uv2Offset;
l9_82=l9_83;
float2 l9_84=float2(0.0);
l9_84=l9_82;
float2 l9_85=float2(0.0);
l9_85=(l9_68*l9_81)+l9_84;
l9_46=l9_85;
l9_48=l9_46;
}
l9_44=l9_48;
float l9_86=0.0;
float l9_87;
if ((int(Tweak_N67_tmp)!=0))
{
l9_87=1.001;
}
else
{
l9_87=0.001;
}
l9_87-=0.001;
l9_86=l9_87;
float l9_88=0.0;
l9_88=l9_86;
float2 l9_89=float2(0.0);
l9_89=mix(l9_43,l9_44,float2(l9_88));
float2 l9_90=float2(0.0);
l9_90=l9_89;
float2 l9_91=float2(0.0);
l9_91=l9_90;
l9_36=l9_91;
l9_40=l9_36;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_92=float2(0.0);
l9_92=l9_39.Surface_UVCoord0;
float2 l9_93=float2(0.0);
float2 l9_94=float2(0.0);
float2 l9_95=float2(0.0);
ssGlobals l9_96=l9_39;
float2 l9_97;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_98=float2(0.0);
float2 l9_99=float2(0.0);
float2 l9_100=float2(0.0);
float2 l9_101=float2(0.0);
float2 l9_102=float2(0.0);
float2 l9_103=float2(0.0);
ssGlobals l9_104=l9_96;
float2 l9_105;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_106=float2(0.0);
l9_106=l9_104.Surface_UVCoord0;
l9_99=l9_106;
l9_105=l9_99;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_107=float2(0.0);
l9_107=l9_104.Surface_UVCoord1;
l9_100=l9_107;
l9_105=l9_100;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_108=float2(0.0);
l9_108=l9_104.gScreenCoord;
l9_101=l9_108;
l9_105=l9_101;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_109=float2(0.0);
l9_109=l9_104.Surface_UVCoord0;
float2 l9_110=float2(0.0);
float2 l9_111=float2(0.0);
float2 l9_112=float2(0.0);
ssGlobals l9_113=l9_104;
float2 l9_114;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_115=float2(0.0);
float2 l9_116=float2(0.0);
float2 l9_117=float2(0.0);
float2 l9_118=float2(0.0);
float2 l9_119=float2(0.0);
ssGlobals l9_120=l9_113;
float2 l9_121;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_122=float2(0.0);
l9_122=l9_120.Surface_UVCoord0;
l9_116=l9_122;
l9_121=l9_116;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_123=float2(0.0);
l9_123=l9_120.Surface_UVCoord1;
l9_117=l9_123;
l9_121=l9_117;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_124=float2(0.0);
l9_124=l9_120.gScreenCoord;
l9_118=l9_124;
l9_121=l9_118;
}
else
{
float2 l9_125=float2(0.0);
l9_125=l9_120.Surface_UVCoord0;
l9_119=l9_125;
l9_121=l9_119;
}
}
}
l9_115=l9_121;
float2 l9_126=float2(0.0);
float2 l9_127=(*sc_set0.UserUniforms).uv2Scale;
l9_126=l9_127;
float2 l9_128=float2(0.0);
l9_128=l9_126;
float2 l9_129=float2(0.0);
float2 l9_130=(*sc_set0.UserUniforms).uv2Offset;
l9_129=l9_130;
float2 l9_131=float2(0.0);
l9_131=l9_129;
float2 l9_132=float2(0.0);
l9_132=(l9_115*l9_128)+l9_131;
float2 l9_133=float2(0.0);
l9_133=l9_132+(l9_131*(l9_113.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_111=l9_133;
l9_114=l9_111;
}
else
{
float2 l9_134=float2(0.0);
float2 l9_135=float2(0.0);
float2 l9_136=float2(0.0);
float2 l9_137=float2(0.0);
float2 l9_138=float2(0.0);
ssGlobals l9_139=l9_113;
float2 l9_140;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_141=float2(0.0);
l9_141=l9_139.Surface_UVCoord0;
l9_135=l9_141;
l9_140=l9_135;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_142=float2(0.0);
l9_142=l9_139.Surface_UVCoord1;
l9_136=l9_142;
l9_140=l9_136;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_143=float2(0.0);
l9_143=l9_139.gScreenCoord;
l9_137=l9_143;
l9_140=l9_137;
}
else
{
float2 l9_144=float2(0.0);
l9_144=l9_139.Surface_UVCoord0;
l9_138=l9_144;
l9_140=l9_138;
}
}
}
l9_134=l9_140;
float2 l9_145=float2(0.0);
float2 l9_146=(*sc_set0.UserUniforms).uv2Scale;
l9_145=l9_146;
float2 l9_147=float2(0.0);
l9_147=l9_145;
float2 l9_148=float2(0.0);
float2 l9_149=(*sc_set0.UserUniforms).uv2Offset;
l9_148=l9_149;
float2 l9_150=float2(0.0);
l9_150=l9_148;
float2 l9_151=float2(0.0);
l9_151=(l9_134*l9_147)+l9_150;
l9_112=l9_151;
l9_114=l9_112;
}
l9_110=l9_114;
float l9_152=0.0;
float l9_153;
if ((int(Tweak_N67_tmp)!=0))
{
l9_153=1.001;
}
else
{
l9_153=0.001;
}
l9_153-=0.001;
l9_152=l9_153;
float l9_154=0.0;
l9_154=l9_152;
float2 l9_155=float2(0.0);
l9_155=mix(l9_109,l9_110,float2(l9_154));
float2 l9_156=float2(0.0);
l9_156=l9_155;
float2 l9_157=float2(0.0);
l9_157=l9_156;
l9_102=l9_157;
l9_105=l9_102;
}
else
{
float2 l9_158=float2(0.0);
l9_158=l9_104.Surface_UVCoord0;
l9_103=l9_158;
l9_105=l9_103;
}
}
}
}
l9_98=l9_105;
float2 l9_159=float2(0.0);
float2 l9_160=(*sc_set0.UserUniforms).uv3Scale;
l9_159=l9_160;
float2 l9_161=float2(0.0);
l9_161=l9_159;
float2 l9_162=float2(0.0);
float2 l9_163=(*sc_set0.UserUniforms).uv3Offset;
l9_162=l9_163;
float2 l9_164=float2(0.0);
l9_164=l9_162;
float2 l9_165=float2(0.0);
l9_165=(l9_98*l9_161)+l9_164;
float2 l9_166=float2(0.0);
l9_166=l9_165+(l9_164*(l9_96.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_94=l9_166;
l9_97=l9_94;
}
else
{
float2 l9_167=float2(0.0);
float2 l9_168=float2(0.0);
float2 l9_169=float2(0.0);
float2 l9_170=float2(0.0);
float2 l9_171=float2(0.0);
float2 l9_172=float2(0.0);
ssGlobals l9_173=l9_96;
float2 l9_174;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_175=float2(0.0);
l9_175=l9_173.Surface_UVCoord0;
l9_168=l9_175;
l9_174=l9_168;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_176=float2(0.0);
l9_176=l9_173.Surface_UVCoord1;
l9_169=l9_176;
l9_174=l9_169;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_177=float2(0.0);
l9_177=l9_173.gScreenCoord;
l9_170=l9_177;
l9_174=l9_170;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_178=float2(0.0);
l9_178=l9_173.Surface_UVCoord0;
float2 l9_179=float2(0.0);
float2 l9_180=float2(0.0);
float2 l9_181=float2(0.0);
ssGlobals l9_182=l9_173;
float2 l9_183;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_184=float2(0.0);
float2 l9_185=float2(0.0);
float2 l9_186=float2(0.0);
float2 l9_187=float2(0.0);
float2 l9_188=float2(0.0);
ssGlobals l9_189=l9_182;
float2 l9_190;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_191=float2(0.0);
l9_191=l9_189.Surface_UVCoord0;
l9_185=l9_191;
l9_190=l9_185;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_192=float2(0.0);
l9_192=l9_189.Surface_UVCoord1;
l9_186=l9_192;
l9_190=l9_186;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_193=float2(0.0);
l9_193=l9_189.gScreenCoord;
l9_187=l9_193;
l9_190=l9_187;
}
else
{
float2 l9_194=float2(0.0);
l9_194=l9_189.Surface_UVCoord0;
l9_188=l9_194;
l9_190=l9_188;
}
}
}
l9_184=l9_190;
float2 l9_195=float2(0.0);
float2 l9_196=(*sc_set0.UserUniforms).uv2Scale;
l9_195=l9_196;
float2 l9_197=float2(0.0);
l9_197=l9_195;
float2 l9_198=float2(0.0);
float2 l9_199=(*sc_set0.UserUniforms).uv2Offset;
l9_198=l9_199;
float2 l9_200=float2(0.0);
l9_200=l9_198;
float2 l9_201=float2(0.0);
l9_201=(l9_184*l9_197)+l9_200;
float2 l9_202=float2(0.0);
l9_202=l9_201+(l9_200*(l9_182.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_180=l9_202;
l9_183=l9_180;
}
else
{
float2 l9_203=float2(0.0);
float2 l9_204=float2(0.0);
float2 l9_205=float2(0.0);
float2 l9_206=float2(0.0);
float2 l9_207=float2(0.0);
ssGlobals l9_208=l9_182;
float2 l9_209;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_210=float2(0.0);
l9_210=l9_208.Surface_UVCoord0;
l9_204=l9_210;
l9_209=l9_204;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_211=float2(0.0);
l9_211=l9_208.Surface_UVCoord1;
l9_205=l9_211;
l9_209=l9_205;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_212=float2(0.0);
l9_212=l9_208.gScreenCoord;
l9_206=l9_212;
l9_209=l9_206;
}
else
{
float2 l9_213=float2(0.0);
l9_213=l9_208.Surface_UVCoord0;
l9_207=l9_213;
l9_209=l9_207;
}
}
}
l9_203=l9_209;
float2 l9_214=float2(0.0);
float2 l9_215=(*sc_set0.UserUniforms).uv2Scale;
l9_214=l9_215;
float2 l9_216=float2(0.0);
l9_216=l9_214;
float2 l9_217=float2(0.0);
float2 l9_218=(*sc_set0.UserUniforms).uv2Offset;
l9_217=l9_218;
float2 l9_219=float2(0.0);
l9_219=l9_217;
float2 l9_220=float2(0.0);
l9_220=(l9_203*l9_216)+l9_219;
l9_181=l9_220;
l9_183=l9_181;
}
l9_179=l9_183;
float l9_221=0.0;
float l9_222;
if ((int(Tweak_N67_tmp)!=0))
{
l9_222=1.001;
}
else
{
l9_222=0.001;
}
l9_222-=0.001;
l9_221=l9_222;
float l9_223=0.0;
l9_223=l9_221;
float2 l9_224=float2(0.0);
l9_224=mix(l9_178,l9_179,float2(l9_223));
float2 l9_225=float2(0.0);
l9_225=l9_224;
float2 l9_226=float2(0.0);
l9_226=l9_225;
l9_171=l9_226;
l9_174=l9_171;
}
else
{
float2 l9_227=float2(0.0);
l9_227=l9_173.Surface_UVCoord0;
l9_172=l9_227;
l9_174=l9_172;
}
}
}
}
l9_167=l9_174;
float2 l9_228=float2(0.0);
float2 l9_229=(*sc_set0.UserUniforms).uv3Scale;
l9_228=l9_229;
float2 l9_230=float2(0.0);
l9_230=l9_228;
float2 l9_231=float2(0.0);
float2 l9_232=(*sc_set0.UserUniforms).uv3Offset;
l9_231=l9_232;
float2 l9_233=float2(0.0);
l9_233=l9_231;
float2 l9_234=float2(0.0);
l9_234=(l9_167*l9_230)+l9_233;
l9_95=l9_234;
l9_97=l9_95;
}
l9_93=l9_97;
float l9_235=0.0;
float l9_236;
if ((int(Tweak_N11_tmp)!=0))
{
l9_236=1.001;
}
else
{
l9_236=0.001;
}
l9_236-=0.001;
l9_235=l9_236;
float l9_237=0.0;
l9_237=l9_235;
float2 l9_238=float2(0.0);
l9_238=mix(l9_92,l9_93,float2(l9_237));
float2 l9_239=float2(0.0);
l9_239=l9_238;
float2 l9_240=float2(0.0);
l9_240=l9_239;
l9_37=l9_240;
l9_40=l9_37;
}
else
{
float2 l9_241=float2(0.0);
l9_241=l9_39.Surface_UVCoord0;
l9_38=l9_241;
l9_40=l9_38;
}
}
}
}
l9_33=l9_40;
float4 l9_242=float4(0.0);
int l9_243=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_244=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_244=0;
}
else
{
l9_244=in.varStereoViewID;
}
int l9_245=l9_244;
l9_243=1-l9_245;
}
else
{
int l9_246=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_246=0;
}
else
{
l9_246=in.varStereoViewID;
}
int l9_247=l9_246;
l9_243=l9_247;
}
int l9_248=l9_243;
int l9_249=baseTexLayout_tmp;
int l9_250=l9_248;
float2 l9_251=l9_33;
bool l9_252=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_253=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_254=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_255=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_256=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_257=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_258=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_259=0.0;
bool l9_260=l9_257&&(!l9_255);
float l9_261=1.0;
float l9_262=l9_251.x;
int l9_263=l9_254.x;
if (l9_263==1)
{
l9_262=fract(l9_262);
}
else
{
if (l9_263==2)
{
float l9_264=fract(l9_262);
float l9_265=l9_262-l9_264;
float l9_266=step(0.25,fract(l9_265*0.5));
l9_262=mix(l9_264,1.0-l9_264,fast::clamp(l9_266,0.0,1.0));
}
}
l9_251.x=l9_262;
float l9_267=l9_251.y;
int l9_268=l9_254.y;
if (l9_268==1)
{
l9_267=fract(l9_267);
}
else
{
if (l9_268==2)
{
float l9_269=fract(l9_267);
float l9_270=l9_267-l9_269;
float l9_271=step(0.25,fract(l9_270*0.5));
l9_267=mix(l9_269,1.0-l9_269,fast::clamp(l9_271,0.0,1.0));
}
}
l9_251.y=l9_267;
if (l9_255)
{
bool l9_272=l9_257;
bool l9_273;
if (l9_272)
{
l9_273=l9_254.x==3;
}
else
{
l9_273=l9_272;
}
float l9_274=l9_251.x;
float l9_275=l9_256.x;
float l9_276=l9_256.z;
bool l9_277=l9_273;
float l9_278=l9_261;
float l9_279=fast::clamp(l9_274,l9_275,l9_276);
float l9_280=step(abs(l9_274-l9_279),9.9999997e-06);
l9_278*=(l9_280+((1.0-float(l9_277))*(1.0-l9_280)));
l9_274=l9_279;
l9_251.x=l9_274;
l9_261=l9_278;
bool l9_281=l9_257;
bool l9_282;
if (l9_281)
{
l9_282=l9_254.y==3;
}
else
{
l9_282=l9_281;
}
float l9_283=l9_251.y;
float l9_284=l9_256.y;
float l9_285=l9_256.w;
bool l9_286=l9_282;
float l9_287=l9_261;
float l9_288=fast::clamp(l9_283,l9_284,l9_285);
float l9_289=step(abs(l9_283-l9_288),9.9999997e-06);
l9_287*=(l9_289+((1.0-float(l9_286))*(1.0-l9_289)));
l9_283=l9_288;
l9_251.y=l9_283;
l9_261=l9_287;
}
float2 l9_290=l9_251;
bool l9_291=l9_252;
float3x3 l9_292=l9_253;
if (l9_291)
{
l9_290=float2((l9_292*float3(l9_290,1.0)).xy);
}
float2 l9_293=l9_290;
float2 l9_294=l9_293;
float2 l9_295=l9_294;
l9_251=l9_295;
float l9_296=l9_251.x;
int l9_297=l9_254.x;
bool l9_298=l9_260;
float l9_299=l9_261;
if ((l9_297==0)||(l9_297==3))
{
float l9_300=l9_296;
float l9_301=0.0;
float l9_302=1.0;
bool l9_303=l9_298;
float l9_304=l9_299;
float l9_305=fast::clamp(l9_300,l9_301,l9_302);
float l9_306=step(abs(l9_300-l9_305),9.9999997e-06);
l9_304*=(l9_306+((1.0-float(l9_303))*(1.0-l9_306)));
l9_300=l9_305;
l9_296=l9_300;
l9_299=l9_304;
}
l9_251.x=l9_296;
l9_261=l9_299;
float l9_307=l9_251.y;
int l9_308=l9_254.y;
bool l9_309=l9_260;
float l9_310=l9_261;
if ((l9_308==0)||(l9_308==3))
{
float l9_311=l9_307;
float l9_312=0.0;
float l9_313=1.0;
bool l9_314=l9_309;
float l9_315=l9_310;
float l9_316=fast::clamp(l9_311,l9_312,l9_313);
float l9_317=step(abs(l9_311-l9_316),9.9999997e-06);
l9_315*=(l9_317+((1.0-float(l9_314))*(1.0-l9_317)));
l9_311=l9_316;
l9_307=l9_311;
l9_310=l9_315;
}
l9_251.y=l9_307;
l9_261=l9_310;
float2 l9_318=l9_251;
int l9_319=l9_249;
int l9_320=l9_250;
float l9_321=l9_259;
float2 l9_322=l9_318;
int l9_323=l9_319;
int l9_324=l9_320;
float3 l9_325=float3(0.0);
if (l9_323==0)
{
l9_325=float3(l9_322,0.0);
}
else
{
if (l9_323==1)
{
l9_325=float3(l9_322.x,(l9_322.y*0.5)+(0.5-(float(l9_324)*0.5)),0.0);
}
else
{
l9_325=float3(l9_322,float(l9_324));
}
}
float3 l9_326=l9_325;
float3 l9_327=l9_326;
float2 l9_328=l9_327.xy;
float l9_329=l9_321;
float4 l9_330=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_328,bias(l9_329));
float4 l9_331=l9_330;
float4 l9_332=l9_331;
if (l9_257)
{
l9_332=mix(l9_258,l9_332,float4(l9_261));
}
float4 l9_333=l9_332;
l9_242=l9_333;
l9_29=l9_242;
l9_32=l9_29;
}
else
{
l9_32=l9_30;
}
l9_28=l9_32;
float4 l9_334=float4(0.0);
l9_334=l9_27*l9_28;
float4 l9_335=float4(0.0);
l9_335=l9_334;
float4 l9_336=float4(0.0);
l9_336=l9_335;
float l9_337=0.0;
float l9_338=0.0;
float l9_339=0.0;
float3 l9_340=l9_336.xyz;
float l9_341=l9_340.x;
float l9_342=l9_340.y;
float l9_343=l9_340.z;
l9_337=l9_341;
l9_338=l9_342;
l9_339=l9_343;
float3 l9_344=float3(0.0);
l9_344=l9_24*float3(l9_337);
float3 l9_345=float3(0.0);
float3 l9_346=(*sc_set0.UserUniforms).recolorGreen;
l9_345=l9_346;
float3 l9_347=float3(0.0);
l9_347=l9_345;
float3 l9_348=float3(0.0);
l9_348=l9_347*float3(l9_338);
float3 l9_349=float3(0.0);
float3 l9_350=(*sc_set0.UserUniforms).recolorBlue;
l9_349=l9_350;
float3 l9_351=float3(0.0);
l9_351=l9_349;
float3 l9_352=float3(0.0);
l9_352=l9_351*float3(l9_339);
float3 l9_353=float3(0.0);
l9_353=(l9_344+l9_348)+l9_352;
l9_18=l9_353;
l9_21=l9_18;
}
else
{
float4 l9_354=float4(0.0);
float4 l9_355=(*sc_set0.UserUniforms).baseColor;
l9_354=l9_355;
float4 l9_356=float4(0.0);
l9_356=l9_354;
float4 l9_357=float4(0.0);
float4 l9_358=float4(0.0);
float4 l9_359=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_360=l9_20;
float4 l9_361;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_362=float2(0.0);
float2 l9_363=float2(0.0);
float2 l9_364=float2(0.0);
float2 l9_365=float2(0.0);
float2 l9_366=float2(0.0);
float2 l9_367=float2(0.0);
ssGlobals l9_368=l9_360;
float2 l9_369;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_370=float2(0.0);
l9_370=l9_368.Surface_UVCoord0;
l9_363=l9_370;
l9_369=l9_363;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_371=float2(0.0);
l9_371=l9_368.Surface_UVCoord1;
l9_364=l9_371;
l9_369=l9_364;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_372=float2(0.0);
l9_372=l9_368.Surface_UVCoord0;
float2 l9_373=float2(0.0);
float2 l9_374=float2(0.0);
float2 l9_375=float2(0.0);
ssGlobals l9_376=l9_368;
float2 l9_377;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_378=float2(0.0);
float2 l9_379=float2(0.0);
float2 l9_380=float2(0.0);
float2 l9_381=float2(0.0);
float2 l9_382=float2(0.0);
ssGlobals l9_383=l9_376;
float2 l9_384;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_385=float2(0.0);
l9_385=l9_383.Surface_UVCoord0;
l9_379=l9_385;
l9_384=l9_379;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_386=float2(0.0);
l9_386=l9_383.Surface_UVCoord1;
l9_380=l9_386;
l9_384=l9_380;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_387=float2(0.0);
l9_387=l9_383.gScreenCoord;
l9_381=l9_387;
l9_384=l9_381;
}
else
{
float2 l9_388=float2(0.0);
l9_388=l9_383.Surface_UVCoord0;
l9_382=l9_388;
l9_384=l9_382;
}
}
}
l9_378=l9_384;
float2 l9_389=float2(0.0);
float2 l9_390=(*sc_set0.UserUniforms).uv2Scale;
l9_389=l9_390;
float2 l9_391=float2(0.0);
l9_391=l9_389;
float2 l9_392=float2(0.0);
float2 l9_393=(*sc_set0.UserUniforms).uv2Offset;
l9_392=l9_393;
float2 l9_394=float2(0.0);
l9_394=l9_392;
float2 l9_395=float2(0.0);
l9_395=(l9_378*l9_391)+l9_394;
float2 l9_396=float2(0.0);
l9_396=l9_395+(l9_394*(l9_376.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_374=l9_396;
l9_377=l9_374;
}
else
{
float2 l9_397=float2(0.0);
float2 l9_398=float2(0.0);
float2 l9_399=float2(0.0);
float2 l9_400=float2(0.0);
float2 l9_401=float2(0.0);
ssGlobals l9_402=l9_376;
float2 l9_403;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_404=float2(0.0);
l9_404=l9_402.Surface_UVCoord0;
l9_398=l9_404;
l9_403=l9_398;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_405=float2(0.0);
l9_405=l9_402.Surface_UVCoord1;
l9_399=l9_405;
l9_403=l9_399;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_406=float2(0.0);
l9_406=l9_402.gScreenCoord;
l9_400=l9_406;
l9_403=l9_400;
}
else
{
float2 l9_407=float2(0.0);
l9_407=l9_402.Surface_UVCoord0;
l9_401=l9_407;
l9_403=l9_401;
}
}
}
l9_397=l9_403;
float2 l9_408=float2(0.0);
float2 l9_409=(*sc_set0.UserUniforms).uv2Scale;
l9_408=l9_409;
float2 l9_410=float2(0.0);
l9_410=l9_408;
float2 l9_411=float2(0.0);
float2 l9_412=(*sc_set0.UserUniforms).uv2Offset;
l9_411=l9_412;
float2 l9_413=float2(0.0);
l9_413=l9_411;
float2 l9_414=float2(0.0);
l9_414=(l9_397*l9_410)+l9_413;
l9_375=l9_414;
l9_377=l9_375;
}
l9_373=l9_377;
float l9_415=0.0;
float l9_416;
if ((int(Tweak_N67_tmp)!=0))
{
l9_416=1.001;
}
else
{
l9_416=0.001;
}
l9_416-=0.001;
l9_415=l9_416;
float l9_417=0.0;
l9_417=l9_415;
float2 l9_418=float2(0.0);
l9_418=mix(l9_372,l9_373,float2(l9_417));
float2 l9_419=float2(0.0);
l9_419=l9_418;
float2 l9_420=float2(0.0);
l9_420=l9_419;
l9_365=l9_420;
l9_369=l9_365;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_421=float2(0.0);
l9_421=l9_368.Surface_UVCoord0;
float2 l9_422=float2(0.0);
float2 l9_423=float2(0.0);
float2 l9_424=float2(0.0);
ssGlobals l9_425=l9_368;
float2 l9_426;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_427=float2(0.0);
float2 l9_428=float2(0.0);
float2 l9_429=float2(0.0);
float2 l9_430=float2(0.0);
float2 l9_431=float2(0.0);
float2 l9_432=float2(0.0);
ssGlobals l9_433=l9_425;
float2 l9_434;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_435=float2(0.0);
l9_435=l9_433.Surface_UVCoord0;
l9_428=l9_435;
l9_434=l9_428;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_436=float2(0.0);
l9_436=l9_433.Surface_UVCoord1;
l9_429=l9_436;
l9_434=l9_429;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_437=float2(0.0);
l9_437=l9_433.gScreenCoord;
l9_430=l9_437;
l9_434=l9_430;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_438=float2(0.0);
l9_438=l9_433.Surface_UVCoord0;
float2 l9_439=float2(0.0);
float2 l9_440=float2(0.0);
float2 l9_441=float2(0.0);
ssGlobals l9_442=l9_433;
float2 l9_443;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_444=float2(0.0);
float2 l9_445=float2(0.0);
float2 l9_446=float2(0.0);
float2 l9_447=float2(0.0);
float2 l9_448=float2(0.0);
ssGlobals l9_449=l9_442;
float2 l9_450;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_451=float2(0.0);
l9_451=l9_449.Surface_UVCoord0;
l9_445=l9_451;
l9_450=l9_445;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_452=float2(0.0);
l9_452=l9_449.Surface_UVCoord1;
l9_446=l9_452;
l9_450=l9_446;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_453=float2(0.0);
l9_453=l9_449.gScreenCoord;
l9_447=l9_453;
l9_450=l9_447;
}
else
{
float2 l9_454=float2(0.0);
l9_454=l9_449.Surface_UVCoord0;
l9_448=l9_454;
l9_450=l9_448;
}
}
}
l9_444=l9_450;
float2 l9_455=float2(0.0);
float2 l9_456=(*sc_set0.UserUniforms).uv2Scale;
l9_455=l9_456;
float2 l9_457=float2(0.0);
l9_457=l9_455;
float2 l9_458=float2(0.0);
float2 l9_459=(*sc_set0.UserUniforms).uv2Offset;
l9_458=l9_459;
float2 l9_460=float2(0.0);
l9_460=l9_458;
float2 l9_461=float2(0.0);
l9_461=(l9_444*l9_457)+l9_460;
float2 l9_462=float2(0.0);
l9_462=l9_461+(l9_460*(l9_442.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_440=l9_462;
l9_443=l9_440;
}
else
{
float2 l9_463=float2(0.0);
float2 l9_464=float2(0.0);
float2 l9_465=float2(0.0);
float2 l9_466=float2(0.0);
float2 l9_467=float2(0.0);
ssGlobals l9_468=l9_442;
float2 l9_469;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_470=float2(0.0);
l9_470=l9_468.Surface_UVCoord0;
l9_464=l9_470;
l9_469=l9_464;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_471=float2(0.0);
l9_471=l9_468.Surface_UVCoord1;
l9_465=l9_471;
l9_469=l9_465;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_472=float2(0.0);
l9_472=l9_468.gScreenCoord;
l9_466=l9_472;
l9_469=l9_466;
}
else
{
float2 l9_473=float2(0.0);
l9_473=l9_468.Surface_UVCoord0;
l9_467=l9_473;
l9_469=l9_467;
}
}
}
l9_463=l9_469;
float2 l9_474=float2(0.0);
float2 l9_475=(*sc_set0.UserUniforms).uv2Scale;
l9_474=l9_475;
float2 l9_476=float2(0.0);
l9_476=l9_474;
float2 l9_477=float2(0.0);
float2 l9_478=(*sc_set0.UserUniforms).uv2Offset;
l9_477=l9_478;
float2 l9_479=float2(0.0);
l9_479=l9_477;
float2 l9_480=float2(0.0);
l9_480=(l9_463*l9_476)+l9_479;
l9_441=l9_480;
l9_443=l9_441;
}
l9_439=l9_443;
float l9_481=0.0;
float l9_482;
if ((int(Tweak_N67_tmp)!=0))
{
l9_482=1.001;
}
else
{
l9_482=0.001;
}
l9_482-=0.001;
l9_481=l9_482;
float l9_483=0.0;
l9_483=l9_481;
float2 l9_484=float2(0.0);
l9_484=mix(l9_438,l9_439,float2(l9_483));
float2 l9_485=float2(0.0);
l9_485=l9_484;
float2 l9_486=float2(0.0);
l9_486=l9_485;
l9_431=l9_486;
l9_434=l9_431;
}
else
{
float2 l9_487=float2(0.0);
l9_487=l9_433.Surface_UVCoord0;
l9_432=l9_487;
l9_434=l9_432;
}
}
}
}
l9_427=l9_434;
float2 l9_488=float2(0.0);
float2 l9_489=(*sc_set0.UserUniforms).uv3Scale;
l9_488=l9_489;
float2 l9_490=float2(0.0);
l9_490=l9_488;
float2 l9_491=float2(0.0);
float2 l9_492=(*sc_set0.UserUniforms).uv3Offset;
l9_491=l9_492;
float2 l9_493=float2(0.0);
l9_493=l9_491;
float2 l9_494=float2(0.0);
l9_494=(l9_427*l9_490)+l9_493;
float2 l9_495=float2(0.0);
l9_495=l9_494+(l9_493*(l9_425.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_423=l9_495;
l9_426=l9_423;
}
else
{
float2 l9_496=float2(0.0);
float2 l9_497=float2(0.0);
float2 l9_498=float2(0.0);
float2 l9_499=float2(0.0);
float2 l9_500=float2(0.0);
float2 l9_501=float2(0.0);
ssGlobals l9_502=l9_425;
float2 l9_503;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_504=float2(0.0);
l9_504=l9_502.Surface_UVCoord0;
l9_497=l9_504;
l9_503=l9_497;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_505=float2(0.0);
l9_505=l9_502.Surface_UVCoord1;
l9_498=l9_505;
l9_503=l9_498;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_506=float2(0.0);
l9_506=l9_502.gScreenCoord;
l9_499=l9_506;
l9_503=l9_499;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_507=float2(0.0);
l9_507=l9_502.Surface_UVCoord0;
float2 l9_508=float2(0.0);
float2 l9_509=float2(0.0);
float2 l9_510=float2(0.0);
ssGlobals l9_511=l9_502;
float2 l9_512;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_513=float2(0.0);
float2 l9_514=float2(0.0);
float2 l9_515=float2(0.0);
float2 l9_516=float2(0.0);
float2 l9_517=float2(0.0);
ssGlobals l9_518=l9_511;
float2 l9_519;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_520=float2(0.0);
l9_520=l9_518.Surface_UVCoord0;
l9_514=l9_520;
l9_519=l9_514;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_521=float2(0.0);
l9_521=l9_518.Surface_UVCoord1;
l9_515=l9_521;
l9_519=l9_515;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_522=float2(0.0);
l9_522=l9_518.gScreenCoord;
l9_516=l9_522;
l9_519=l9_516;
}
else
{
float2 l9_523=float2(0.0);
l9_523=l9_518.Surface_UVCoord0;
l9_517=l9_523;
l9_519=l9_517;
}
}
}
l9_513=l9_519;
float2 l9_524=float2(0.0);
float2 l9_525=(*sc_set0.UserUniforms).uv2Scale;
l9_524=l9_525;
float2 l9_526=float2(0.0);
l9_526=l9_524;
float2 l9_527=float2(0.0);
float2 l9_528=(*sc_set0.UserUniforms).uv2Offset;
l9_527=l9_528;
float2 l9_529=float2(0.0);
l9_529=l9_527;
float2 l9_530=float2(0.0);
l9_530=(l9_513*l9_526)+l9_529;
float2 l9_531=float2(0.0);
l9_531=l9_530+(l9_529*(l9_511.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_509=l9_531;
l9_512=l9_509;
}
else
{
float2 l9_532=float2(0.0);
float2 l9_533=float2(0.0);
float2 l9_534=float2(0.0);
float2 l9_535=float2(0.0);
float2 l9_536=float2(0.0);
ssGlobals l9_537=l9_511;
float2 l9_538;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_539=float2(0.0);
l9_539=l9_537.Surface_UVCoord0;
l9_533=l9_539;
l9_538=l9_533;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_540=float2(0.0);
l9_540=l9_537.Surface_UVCoord1;
l9_534=l9_540;
l9_538=l9_534;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_541=float2(0.0);
l9_541=l9_537.gScreenCoord;
l9_535=l9_541;
l9_538=l9_535;
}
else
{
float2 l9_542=float2(0.0);
l9_542=l9_537.Surface_UVCoord0;
l9_536=l9_542;
l9_538=l9_536;
}
}
}
l9_532=l9_538;
float2 l9_543=float2(0.0);
float2 l9_544=(*sc_set0.UserUniforms).uv2Scale;
l9_543=l9_544;
float2 l9_545=float2(0.0);
l9_545=l9_543;
float2 l9_546=float2(0.0);
float2 l9_547=(*sc_set0.UserUniforms).uv2Offset;
l9_546=l9_547;
float2 l9_548=float2(0.0);
l9_548=l9_546;
float2 l9_549=float2(0.0);
l9_549=(l9_532*l9_545)+l9_548;
l9_510=l9_549;
l9_512=l9_510;
}
l9_508=l9_512;
float l9_550=0.0;
float l9_551;
if ((int(Tweak_N67_tmp)!=0))
{
l9_551=1.001;
}
else
{
l9_551=0.001;
}
l9_551-=0.001;
l9_550=l9_551;
float l9_552=0.0;
l9_552=l9_550;
float2 l9_553=float2(0.0);
l9_553=mix(l9_507,l9_508,float2(l9_552));
float2 l9_554=float2(0.0);
l9_554=l9_553;
float2 l9_555=float2(0.0);
l9_555=l9_554;
l9_500=l9_555;
l9_503=l9_500;
}
else
{
float2 l9_556=float2(0.0);
l9_556=l9_502.Surface_UVCoord0;
l9_501=l9_556;
l9_503=l9_501;
}
}
}
}
l9_496=l9_503;
float2 l9_557=float2(0.0);
float2 l9_558=(*sc_set0.UserUniforms).uv3Scale;
l9_557=l9_558;
float2 l9_559=float2(0.0);
l9_559=l9_557;
float2 l9_560=float2(0.0);
float2 l9_561=(*sc_set0.UserUniforms).uv3Offset;
l9_560=l9_561;
float2 l9_562=float2(0.0);
l9_562=l9_560;
float2 l9_563=float2(0.0);
l9_563=(l9_496*l9_559)+l9_562;
l9_424=l9_563;
l9_426=l9_424;
}
l9_422=l9_426;
float l9_564=0.0;
float l9_565;
if ((int(Tweak_N11_tmp)!=0))
{
l9_565=1.001;
}
else
{
l9_565=0.001;
}
l9_565-=0.001;
l9_564=l9_565;
float l9_566=0.0;
l9_566=l9_564;
float2 l9_567=float2(0.0);
l9_567=mix(l9_421,l9_422,float2(l9_566));
float2 l9_568=float2(0.0);
l9_568=l9_567;
float2 l9_569=float2(0.0);
l9_569=l9_568;
l9_366=l9_569;
l9_369=l9_366;
}
else
{
float2 l9_570=float2(0.0);
l9_570=l9_368.Surface_UVCoord0;
l9_367=l9_570;
l9_369=l9_367;
}
}
}
}
l9_362=l9_369;
float4 l9_571=float4(0.0);
int l9_572=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_573=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_573=0;
}
else
{
l9_573=in.varStereoViewID;
}
int l9_574=l9_573;
l9_572=1-l9_574;
}
else
{
int l9_575=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_575=0;
}
else
{
l9_575=in.varStereoViewID;
}
int l9_576=l9_575;
l9_572=l9_576;
}
int l9_577=l9_572;
int l9_578=baseTexLayout_tmp;
int l9_579=l9_577;
float2 l9_580=l9_362;
bool l9_581=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_582=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_583=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_584=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_585=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_586=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_587=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_588=0.0;
bool l9_589=l9_586&&(!l9_584);
float l9_590=1.0;
float l9_591=l9_580.x;
int l9_592=l9_583.x;
if (l9_592==1)
{
l9_591=fract(l9_591);
}
else
{
if (l9_592==2)
{
float l9_593=fract(l9_591);
float l9_594=l9_591-l9_593;
float l9_595=step(0.25,fract(l9_594*0.5));
l9_591=mix(l9_593,1.0-l9_593,fast::clamp(l9_595,0.0,1.0));
}
}
l9_580.x=l9_591;
float l9_596=l9_580.y;
int l9_597=l9_583.y;
if (l9_597==1)
{
l9_596=fract(l9_596);
}
else
{
if (l9_597==2)
{
float l9_598=fract(l9_596);
float l9_599=l9_596-l9_598;
float l9_600=step(0.25,fract(l9_599*0.5));
l9_596=mix(l9_598,1.0-l9_598,fast::clamp(l9_600,0.0,1.0));
}
}
l9_580.y=l9_596;
if (l9_584)
{
bool l9_601=l9_586;
bool l9_602;
if (l9_601)
{
l9_602=l9_583.x==3;
}
else
{
l9_602=l9_601;
}
float l9_603=l9_580.x;
float l9_604=l9_585.x;
float l9_605=l9_585.z;
bool l9_606=l9_602;
float l9_607=l9_590;
float l9_608=fast::clamp(l9_603,l9_604,l9_605);
float l9_609=step(abs(l9_603-l9_608),9.9999997e-06);
l9_607*=(l9_609+((1.0-float(l9_606))*(1.0-l9_609)));
l9_603=l9_608;
l9_580.x=l9_603;
l9_590=l9_607;
bool l9_610=l9_586;
bool l9_611;
if (l9_610)
{
l9_611=l9_583.y==3;
}
else
{
l9_611=l9_610;
}
float l9_612=l9_580.y;
float l9_613=l9_585.y;
float l9_614=l9_585.w;
bool l9_615=l9_611;
float l9_616=l9_590;
float l9_617=fast::clamp(l9_612,l9_613,l9_614);
float l9_618=step(abs(l9_612-l9_617),9.9999997e-06);
l9_616*=(l9_618+((1.0-float(l9_615))*(1.0-l9_618)));
l9_612=l9_617;
l9_580.y=l9_612;
l9_590=l9_616;
}
float2 l9_619=l9_580;
bool l9_620=l9_581;
float3x3 l9_621=l9_582;
if (l9_620)
{
l9_619=float2((l9_621*float3(l9_619,1.0)).xy);
}
float2 l9_622=l9_619;
float2 l9_623=l9_622;
float2 l9_624=l9_623;
l9_580=l9_624;
float l9_625=l9_580.x;
int l9_626=l9_583.x;
bool l9_627=l9_589;
float l9_628=l9_590;
if ((l9_626==0)||(l9_626==3))
{
float l9_629=l9_625;
float l9_630=0.0;
float l9_631=1.0;
bool l9_632=l9_627;
float l9_633=l9_628;
float l9_634=fast::clamp(l9_629,l9_630,l9_631);
float l9_635=step(abs(l9_629-l9_634),9.9999997e-06);
l9_633*=(l9_635+((1.0-float(l9_632))*(1.0-l9_635)));
l9_629=l9_634;
l9_625=l9_629;
l9_628=l9_633;
}
l9_580.x=l9_625;
l9_590=l9_628;
float l9_636=l9_580.y;
int l9_637=l9_583.y;
bool l9_638=l9_589;
float l9_639=l9_590;
if ((l9_637==0)||(l9_637==3))
{
float l9_640=l9_636;
float l9_641=0.0;
float l9_642=1.0;
bool l9_643=l9_638;
float l9_644=l9_639;
float l9_645=fast::clamp(l9_640,l9_641,l9_642);
float l9_646=step(abs(l9_640-l9_645),9.9999997e-06);
l9_644*=(l9_646+((1.0-float(l9_643))*(1.0-l9_646)));
l9_640=l9_645;
l9_636=l9_640;
l9_639=l9_644;
}
l9_580.y=l9_636;
l9_590=l9_639;
float2 l9_647=l9_580;
int l9_648=l9_578;
int l9_649=l9_579;
float l9_650=l9_588;
float2 l9_651=l9_647;
int l9_652=l9_648;
int l9_653=l9_649;
float3 l9_654=float3(0.0);
if (l9_652==0)
{
l9_654=float3(l9_651,0.0);
}
else
{
if (l9_652==1)
{
l9_654=float3(l9_651.x,(l9_651.y*0.5)+(0.5-(float(l9_653)*0.5)),0.0);
}
else
{
l9_654=float3(l9_651,float(l9_653));
}
}
float3 l9_655=l9_654;
float3 l9_656=l9_655;
float2 l9_657=l9_656.xy;
float l9_658=l9_650;
float4 l9_659=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_657,bias(l9_658));
float4 l9_660=l9_659;
float4 l9_661=l9_660;
if (l9_586)
{
l9_661=mix(l9_587,l9_661,float4(l9_590));
}
float4 l9_662=l9_661;
l9_571=l9_662;
l9_358=l9_571;
l9_361=l9_358;
}
else
{
l9_361=l9_359;
}
l9_357=l9_361;
float4 l9_663=float4(0.0);
l9_663=l9_356*l9_357;
float4 l9_664=float4(0.0);
l9_664=l9_663;
float4 l9_665=float4(0.0);
l9_665=l9_664;
l9_19=l9_665.xyz;
l9_21=l9_19;
}
l9_17=l9_21;
float3 l9_666=float3(0.0);
l9_666=l9_17;
float3 l9_667=float3(0.0);
l9_667=l9_666;
float4 l9_668=float4(0.0);
l9_668=float4(l9_667.x,l9_667.y,l9_667.z,l9_668.w);
l9_668.w=(*sc_set0.UserUniforms).Port_Value2_N073;
float4 l9_669=float4(0.0);
l9_669=l9_16*l9_668;
param=l9_669;
param_2=param;
}
else
{
float3 l9_670=float3(0.0);
float3 l9_671=float3(0.0);
float3 l9_672=float3(0.0);
ssGlobals l9_673=param_3;
float3 l9_674;
if ((int(Tweak_N37_tmp)!=0))
{
float3 l9_675=float3(0.0);
float3 l9_676=(*sc_set0.UserUniforms).recolorRed;
l9_675=l9_676;
float3 l9_677=float3(0.0);
l9_677=l9_675;
float4 l9_678=float4(0.0);
float4 l9_679=(*sc_set0.UserUniforms).baseColor;
l9_678=l9_679;
float4 l9_680=float4(0.0);
l9_680=l9_678;
float4 l9_681=float4(0.0);
float4 l9_682=float4(0.0);
float4 l9_683=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_684=l9_673;
float4 l9_685;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_686=float2(0.0);
float2 l9_687=float2(0.0);
float2 l9_688=float2(0.0);
float2 l9_689=float2(0.0);
float2 l9_690=float2(0.0);
float2 l9_691=float2(0.0);
ssGlobals l9_692=l9_684;
float2 l9_693;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_694=float2(0.0);
l9_694=l9_692.Surface_UVCoord0;
l9_687=l9_694;
l9_693=l9_687;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_695=float2(0.0);
l9_695=l9_692.Surface_UVCoord1;
l9_688=l9_695;
l9_693=l9_688;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_696=float2(0.0);
l9_696=l9_692.Surface_UVCoord0;
float2 l9_697=float2(0.0);
float2 l9_698=float2(0.0);
float2 l9_699=float2(0.0);
ssGlobals l9_700=l9_692;
float2 l9_701;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_702=float2(0.0);
float2 l9_703=float2(0.0);
float2 l9_704=float2(0.0);
float2 l9_705=float2(0.0);
float2 l9_706=float2(0.0);
ssGlobals l9_707=l9_700;
float2 l9_708;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_709=float2(0.0);
l9_709=l9_707.Surface_UVCoord0;
l9_703=l9_709;
l9_708=l9_703;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_710=float2(0.0);
l9_710=l9_707.Surface_UVCoord1;
l9_704=l9_710;
l9_708=l9_704;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_711=float2(0.0);
l9_711=l9_707.gScreenCoord;
l9_705=l9_711;
l9_708=l9_705;
}
else
{
float2 l9_712=float2(0.0);
l9_712=l9_707.Surface_UVCoord0;
l9_706=l9_712;
l9_708=l9_706;
}
}
}
l9_702=l9_708;
float2 l9_713=float2(0.0);
float2 l9_714=(*sc_set0.UserUniforms).uv2Scale;
l9_713=l9_714;
float2 l9_715=float2(0.0);
l9_715=l9_713;
float2 l9_716=float2(0.0);
float2 l9_717=(*sc_set0.UserUniforms).uv2Offset;
l9_716=l9_717;
float2 l9_718=float2(0.0);
l9_718=l9_716;
float2 l9_719=float2(0.0);
l9_719=(l9_702*l9_715)+l9_718;
float2 l9_720=float2(0.0);
l9_720=l9_719+(l9_718*(l9_700.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_698=l9_720;
l9_701=l9_698;
}
else
{
float2 l9_721=float2(0.0);
float2 l9_722=float2(0.0);
float2 l9_723=float2(0.0);
float2 l9_724=float2(0.0);
float2 l9_725=float2(0.0);
ssGlobals l9_726=l9_700;
float2 l9_727;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_728=float2(0.0);
l9_728=l9_726.Surface_UVCoord0;
l9_722=l9_728;
l9_727=l9_722;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_729=float2(0.0);
l9_729=l9_726.Surface_UVCoord1;
l9_723=l9_729;
l9_727=l9_723;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_730=float2(0.0);
l9_730=l9_726.gScreenCoord;
l9_724=l9_730;
l9_727=l9_724;
}
else
{
float2 l9_731=float2(0.0);
l9_731=l9_726.Surface_UVCoord0;
l9_725=l9_731;
l9_727=l9_725;
}
}
}
l9_721=l9_727;
float2 l9_732=float2(0.0);
float2 l9_733=(*sc_set0.UserUniforms).uv2Scale;
l9_732=l9_733;
float2 l9_734=float2(0.0);
l9_734=l9_732;
float2 l9_735=float2(0.0);
float2 l9_736=(*sc_set0.UserUniforms).uv2Offset;
l9_735=l9_736;
float2 l9_737=float2(0.0);
l9_737=l9_735;
float2 l9_738=float2(0.0);
l9_738=(l9_721*l9_734)+l9_737;
l9_699=l9_738;
l9_701=l9_699;
}
l9_697=l9_701;
float l9_739=0.0;
float l9_740;
if ((int(Tweak_N67_tmp)!=0))
{
l9_740=1.001;
}
else
{
l9_740=0.001;
}
l9_740-=0.001;
l9_739=l9_740;
float l9_741=0.0;
l9_741=l9_739;
float2 l9_742=float2(0.0);
l9_742=mix(l9_696,l9_697,float2(l9_741));
float2 l9_743=float2(0.0);
l9_743=l9_742;
float2 l9_744=float2(0.0);
l9_744=l9_743;
l9_689=l9_744;
l9_693=l9_689;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_745=float2(0.0);
l9_745=l9_692.Surface_UVCoord0;
float2 l9_746=float2(0.0);
float2 l9_747=float2(0.0);
float2 l9_748=float2(0.0);
ssGlobals l9_749=l9_692;
float2 l9_750;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_751=float2(0.0);
float2 l9_752=float2(0.0);
float2 l9_753=float2(0.0);
float2 l9_754=float2(0.0);
float2 l9_755=float2(0.0);
float2 l9_756=float2(0.0);
ssGlobals l9_757=l9_749;
float2 l9_758;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_759=float2(0.0);
l9_759=l9_757.Surface_UVCoord0;
l9_752=l9_759;
l9_758=l9_752;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_760=float2(0.0);
l9_760=l9_757.Surface_UVCoord1;
l9_753=l9_760;
l9_758=l9_753;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_761=float2(0.0);
l9_761=l9_757.gScreenCoord;
l9_754=l9_761;
l9_758=l9_754;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_762=float2(0.0);
l9_762=l9_757.Surface_UVCoord0;
float2 l9_763=float2(0.0);
float2 l9_764=float2(0.0);
float2 l9_765=float2(0.0);
ssGlobals l9_766=l9_757;
float2 l9_767;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_768=float2(0.0);
float2 l9_769=float2(0.0);
float2 l9_770=float2(0.0);
float2 l9_771=float2(0.0);
float2 l9_772=float2(0.0);
ssGlobals l9_773=l9_766;
float2 l9_774;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_775=float2(0.0);
l9_775=l9_773.Surface_UVCoord0;
l9_769=l9_775;
l9_774=l9_769;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_776=float2(0.0);
l9_776=l9_773.Surface_UVCoord1;
l9_770=l9_776;
l9_774=l9_770;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_777=float2(0.0);
l9_777=l9_773.gScreenCoord;
l9_771=l9_777;
l9_774=l9_771;
}
else
{
float2 l9_778=float2(0.0);
l9_778=l9_773.Surface_UVCoord0;
l9_772=l9_778;
l9_774=l9_772;
}
}
}
l9_768=l9_774;
float2 l9_779=float2(0.0);
float2 l9_780=(*sc_set0.UserUniforms).uv2Scale;
l9_779=l9_780;
float2 l9_781=float2(0.0);
l9_781=l9_779;
float2 l9_782=float2(0.0);
float2 l9_783=(*sc_set0.UserUniforms).uv2Offset;
l9_782=l9_783;
float2 l9_784=float2(0.0);
l9_784=l9_782;
float2 l9_785=float2(0.0);
l9_785=(l9_768*l9_781)+l9_784;
float2 l9_786=float2(0.0);
l9_786=l9_785+(l9_784*(l9_766.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_764=l9_786;
l9_767=l9_764;
}
else
{
float2 l9_787=float2(0.0);
float2 l9_788=float2(0.0);
float2 l9_789=float2(0.0);
float2 l9_790=float2(0.0);
float2 l9_791=float2(0.0);
ssGlobals l9_792=l9_766;
float2 l9_793;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_794=float2(0.0);
l9_794=l9_792.Surface_UVCoord0;
l9_788=l9_794;
l9_793=l9_788;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_795=float2(0.0);
l9_795=l9_792.Surface_UVCoord1;
l9_789=l9_795;
l9_793=l9_789;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_796=float2(0.0);
l9_796=l9_792.gScreenCoord;
l9_790=l9_796;
l9_793=l9_790;
}
else
{
float2 l9_797=float2(0.0);
l9_797=l9_792.Surface_UVCoord0;
l9_791=l9_797;
l9_793=l9_791;
}
}
}
l9_787=l9_793;
float2 l9_798=float2(0.0);
float2 l9_799=(*sc_set0.UserUniforms).uv2Scale;
l9_798=l9_799;
float2 l9_800=float2(0.0);
l9_800=l9_798;
float2 l9_801=float2(0.0);
float2 l9_802=(*sc_set0.UserUniforms).uv2Offset;
l9_801=l9_802;
float2 l9_803=float2(0.0);
l9_803=l9_801;
float2 l9_804=float2(0.0);
l9_804=(l9_787*l9_800)+l9_803;
l9_765=l9_804;
l9_767=l9_765;
}
l9_763=l9_767;
float l9_805=0.0;
float l9_806;
if ((int(Tweak_N67_tmp)!=0))
{
l9_806=1.001;
}
else
{
l9_806=0.001;
}
l9_806-=0.001;
l9_805=l9_806;
float l9_807=0.0;
l9_807=l9_805;
float2 l9_808=float2(0.0);
l9_808=mix(l9_762,l9_763,float2(l9_807));
float2 l9_809=float2(0.0);
l9_809=l9_808;
float2 l9_810=float2(0.0);
l9_810=l9_809;
l9_755=l9_810;
l9_758=l9_755;
}
else
{
float2 l9_811=float2(0.0);
l9_811=l9_757.Surface_UVCoord0;
l9_756=l9_811;
l9_758=l9_756;
}
}
}
}
l9_751=l9_758;
float2 l9_812=float2(0.0);
float2 l9_813=(*sc_set0.UserUniforms).uv3Scale;
l9_812=l9_813;
float2 l9_814=float2(0.0);
l9_814=l9_812;
float2 l9_815=float2(0.0);
float2 l9_816=(*sc_set0.UserUniforms).uv3Offset;
l9_815=l9_816;
float2 l9_817=float2(0.0);
l9_817=l9_815;
float2 l9_818=float2(0.0);
l9_818=(l9_751*l9_814)+l9_817;
float2 l9_819=float2(0.0);
l9_819=l9_818+(l9_817*(l9_749.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_747=l9_819;
l9_750=l9_747;
}
else
{
float2 l9_820=float2(0.0);
float2 l9_821=float2(0.0);
float2 l9_822=float2(0.0);
float2 l9_823=float2(0.0);
float2 l9_824=float2(0.0);
float2 l9_825=float2(0.0);
ssGlobals l9_826=l9_749;
float2 l9_827;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_828=float2(0.0);
l9_828=l9_826.Surface_UVCoord0;
l9_821=l9_828;
l9_827=l9_821;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_829=float2(0.0);
l9_829=l9_826.Surface_UVCoord1;
l9_822=l9_829;
l9_827=l9_822;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_830=float2(0.0);
l9_830=l9_826.gScreenCoord;
l9_823=l9_830;
l9_827=l9_823;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_831=float2(0.0);
l9_831=l9_826.Surface_UVCoord0;
float2 l9_832=float2(0.0);
float2 l9_833=float2(0.0);
float2 l9_834=float2(0.0);
ssGlobals l9_835=l9_826;
float2 l9_836;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_837=float2(0.0);
float2 l9_838=float2(0.0);
float2 l9_839=float2(0.0);
float2 l9_840=float2(0.0);
float2 l9_841=float2(0.0);
ssGlobals l9_842=l9_835;
float2 l9_843;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_844=float2(0.0);
l9_844=l9_842.Surface_UVCoord0;
l9_838=l9_844;
l9_843=l9_838;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_845=float2(0.0);
l9_845=l9_842.Surface_UVCoord1;
l9_839=l9_845;
l9_843=l9_839;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_846=float2(0.0);
l9_846=l9_842.gScreenCoord;
l9_840=l9_846;
l9_843=l9_840;
}
else
{
float2 l9_847=float2(0.0);
l9_847=l9_842.Surface_UVCoord0;
l9_841=l9_847;
l9_843=l9_841;
}
}
}
l9_837=l9_843;
float2 l9_848=float2(0.0);
float2 l9_849=(*sc_set0.UserUniforms).uv2Scale;
l9_848=l9_849;
float2 l9_850=float2(0.0);
l9_850=l9_848;
float2 l9_851=float2(0.0);
float2 l9_852=(*sc_set0.UserUniforms).uv2Offset;
l9_851=l9_852;
float2 l9_853=float2(0.0);
l9_853=l9_851;
float2 l9_854=float2(0.0);
l9_854=(l9_837*l9_850)+l9_853;
float2 l9_855=float2(0.0);
l9_855=l9_854+(l9_853*(l9_835.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_833=l9_855;
l9_836=l9_833;
}
else
{
float2 l9_856=float2(0.0);
float2 l9_857=float2(0.0);
float2 l9_858=float2(0.0);
float2 l9_859=float2(0.0);
float2 l9_860=float2(0.0);
ssGlobals l9_861=l9_835;
float2 l9_862;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_863=float2(0.0);
l9_863=l9_861.Surface_UVCoord0;
l9_857=l9_863;
l9_862=l9_857;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_864=float2(0.0);
l9_864=l9_861.Surface_UVCoord1;
l9_858=l9_864;
l9_862=l9_858;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_865=float2(0.0);
l9_865=l9_861.gScreenCoord;
l9_859=l9_865;
l9_862=l9_859;
}
else
{
float2 l9_866=float2(0.0);
l9_866=l9_861.Surface_UVCoord0;
l9_860=l9_866;
l9_862=l9_860;
}
}
}
l9_856=l9_862;
float2 l9_867=float2(0.0);
float2 l9_868=(*sc_set0.UserUniforms).uv2Scale;
l9_867=l9_868;
float2 l9_869=float2(0.0);
l9_869=l9_867;
float2 l9_870=float2(0.0);
float2 l9_871=(*sc_set0.UserUniforms).uv2Offset;
l9_870=l9_871;
float2 l9_872=float2(0.0);
l9_872=l9_870;
float2 l9_873=float2(0.0);
l9_873=(l9_856*l9_869)+l9_872;
l9_834=l9_873;
l9_836=l9_834;
}
l9_832=l9_836;
float l9_874=0.0;
float l9_875;
if ((int(Tweak_N67_tmp)!=0))
{
l9_875=1.001;
}
else
{
l9_875=0.001;
}
l9_875-=0.001;
l9_874=l9_875;
float l9_876=0.0;
l9_876=l9_874;
float2 l9_877=float2(0.0);
l9_877=mix(l9_831,l9_832,float2(l9_876));
float2 l9_878=float2(0.0);
l9_878=l9_877;
float2 l9_879=float2(0.0);
l9_879=l9_878;
l9_824=l9_879;
l9_827=l9_824;
}
else
{
float2 l9_880=float2(0.0);
l9_880=l9_826.Surface_UVCoord0;
l9_825=l9_880;
l9_827=l9_825;
}
}
}
}
l9_820=l9_827;
float2 l9_881=float2(0.0);
float2 l9_882=(*sc_set0.UserUniforms).uv3Scale;
l9_881=l9_882;
float2 l9_883=float2(0.0);
l9_883=l9_881;
float2 l9_884=float2(0.0);
float2 l9_885=(*sc_set0.UserUniforms).uv3Offset;
l9_884=l9_885;
float2 l9_886=float2(0.0);
l9_886=l9_884;
float2 l9_887=float2(0.0);
l9_887=(l9_820*l9_883)+l9_886;
l9_748=l9_887;
l9_750=l9_748;
}
l9_746=l9_750;
float l9_888=0.0;
float l9_889;
if ((int(Tweak_N11_tmp)!=0))
{
l9_889=1.001;
}
else
{
l9_889=0.001;
}
l9_889-=0.001;
l9_888=l9_889;
float l9_890=0.0;
l9_890=l9_888;
float2 l9_891=float2(0.0);
l9_891=mix(l9_745,l9_746,float2(l9_890));
float2 l9_892=float2(0.0);
l9_892=l9_891;
float2 l9_893=float2(0.0);
l9_893=l9_892;
l9_690=l9_893;
l9_693=l9_690;
}
else
{
float2 l9_894=float2(0.0);
l9_894=l9_692.Surface_UVCoord0;
l9_691=l9_894;
l9_693=l9_691;
}
}
}
}
l9_686=l9_693;
float4 l9_895=float4(0.0);
int l9_896=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_897=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_897=0;
}
else
{
l9_897=in.varStereoViewID;
}
int l9_898=l9_897;
l9_896=1-l9_898;
}
else
{
int l9_899=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_899=0;
}
else
{
l9_899=in.varStereoViewID;
}
int l9_900=l9_899;
l9_896=l9_900;
}
int l9_901=l9_896;
int l9_902=baseTexLayout_tmp;
int l9_903=l9_901;
float2 l9_904=l9_686;
bool l9_905=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_906=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_907=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_908=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_909=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_910=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_911=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_912=0.0;
bool l9_913=l9_910&&(!l9_908);
float l9_914=1.0;
float l9_915=l9_904.x;
int l9_916=l9_907.x;
if (l9_916==1)
{
l9_915=fract(l9_915);
}
else
{
if (l9_916==2)
{
float l9_917=fract(l9_915);
float l9_918=l9_915-l9_917;
float l9_919=step(0.25,fract(l9_918*0.5));
l9_915=mix(l9_917,1.0-l9_917,fast::clamp(l9_919,0.0,1.0));
}
}
l9_904.x=l9_915;
float l9_920=l9_904.y;
int l9_921=l9_907.y;
if (l9_921==1)
{
l9_920=fract(l9_920);
}
else
{
if (l9_921==2)
{
float l9_922=fract(l9_920);
float l9_923=l9_920-l9_922;
float l9_924=step(0.25,fract(l9_923*0.5));
l9_920=mix(l9_922,1.0-l9_922,fast::clamp(l9_924,0.0,1.0));
}
}
l9_904.y=l9_920;
if (l9_908)
{
bool l9_925=l9_910;
bool l9_926;
if (l9_925)
{
l9_926=l9_907.x==3;
}
else
{
l9_926=l9_925;
}
float l9_927=l9_904.x;
float l9_928=l9_909.x;
float l9_929=l9_909.z;
bool l9_930=l9_926;
float l9_931=l9_914;
float l9_932=fast::clamp(l9_927,l9_928,l9_929);
float l9_933=step(abs(l9_927-l9_932),9.9999997e-06);
l9_931*=(l9_933+((1.0-float(l9_930))*(1.0-l9_933)));
l9_927=l9_932;
l9_904.x=l9_927;
l9_914=l9_931;
bool l9_934=l9_910;
bool l9_935;
if (l9_934)
{
l9_935=l9_907.y==3;
}
else
{
l9_935=l9_934;
}
float l9_936=l9_904.y;
float l9_937=l9_909.y;
float l9_938=l9_909.w;
bool l9_939=l9_935;
float l9_940=l9_914;
float l9_941=fast::clamp(l9_936,l9_937,l9_938);
float l9_942=step(abs(l9_936-l9_941),9.9999997e-06);
l9_940*=(l9_942+((1.0-float(l9_939))*(1.0-l9_942)));
l9_936=l9_941;
l9_904.y=l9_936;
l9_914=l9_940;
}
float2 l9_943=l9_904;
bool l9_944=l9_905;
float3x3 l9_945=l9_906;
if (l9_944)
{
l9_943=float2((l9_945*float3(l9_943,1.0)).xy);
}
float2 l9_946=l9_943;
float2 l9_947=l9_946;
float2 l9_948=l9_947;
l9_904=l9_948;
float l9_949=l9_904.x;
int l9_950=l9_907.x;
bool l9_951=l9_913;
float l9_952=l9_914;
if ((l9_950==0)||(l9_950==3))
{
float l9_953=l9_949;
float l9_954=0.0;
float l9_955=1.0;
bool l9_956=l9_951;
float l9_957=l9_952;
float l9_958=fast::clamp(l9_953,l9_954,l9_955);
float l9_959=step(abs(l9_953-l9_958),9.9999997e-06);
l9_957*=(l9_959+((1.0-float(l9_956))*(1.0-l9_959)));
l9_953=l9_958;
l9_949=l9_953;
l9_952=l9_957;
}
l9_904.x=l9_949;
l9_914=l9_952;
float l9_960=l9_904.y;
int l9_961=l9_907.y;
bool l9_962=l9_913;
float l9_963=l9_914;
if ((l9_961==0)||(l9_961==3))
{
float l9_964=l9_960;
float l9_965=0.0;
float l9_966=1.0;
bool l9_967=l9_962;
float l9_968=l9_963;
float l9_969=fast::clamp(l9_964,l9_965,l9_966);
float l9_970=step(abs(l9_964-l9_969),9.9999997e-06);
l9_968*=(l9_970+((1.0-float(l9_967))*(1.0-l9_970)));
l9_964=l9_969;
l9_960=l9_964;
l9_963=l9_968;
}
l9_904.y=l9_960;
l9_914=l9_963;
float2 l9_971=l9_904;
int l9_972=l9_902;
int l9_973=l9_903;
float l9_974=l9_912;
float2 l9_975=l9_971;
int l9_976=l9_972;
int l9_977=l9_973;
float3 l9_978=float3(0.0);
if (l9_976==0)
{
l9_978=float3(l9_975,0.0);
}
else
{
if (l9_976==1)
{
l9_978=float3(l9_975.x,(l9_975.y*0.5)+(0.5-(float(l9_977)*0.5)),0.0);
}
else
{
l9_978=float3(l9_975,float(l9_977));
}
}
float3 l9_979=l9_978;
float3 l9_980=l9_979;
float2 l9_981=l9_980.xy;
float l9_982=l9_974;
float4 l9_983=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_981,bias(l9_982));
float4 l9_984=l9_983;
float4 l9_985=l9_984;
if (l9_910)
{
l9_985=mix(l9_911,l9_985,float4(l9_914));
}
float4 l9_986=l9_985;
l9_895=l9_986;
l9_682=l9_895;
l9_685=l9_682;
}
else
{
l9_685=l9_683;
}
l9_681=l9_685;
float4 l9_987=float4(0.0);
l9_987=l9_680*l9_681;
float4 l9_988=float4(0.0);
l9_988=l9_987;
float4 l9_989=float4(0.0);
l9_989=l9_988;
float l9_990=0.0;
float l9_991=0.0;
float l9_992=0.0;
float3 l9_993=l9_989.xyz;
float l9_994=l9_993.x;
float l9_995=l9_993.y;
float l9_996=l9_993.z;
l9_990=l9_994;
l9_991=l9_995;
l9_992=l9_996;
float3 l9_997=float3(0.0);
l9_997=l9_677*float3(l9_990);
float3 l9_998=float3(0.0);
float3 l9_999=(*sc_set0.UserUniforms).recolorGreen;
l9_998=l9_999;
float3 l9_1000=float3(0.0);
l9_1000=l9_998;
float3 l9_1001=float3(0.0);
l9_1001=l9_1000*float3(l9_991);
float3 l9_1002=float3(0.0);
float3 l9_1003=(*sc_set0.UserUniforms).recolorBlue;
l9_1002=l9_1003;
float3 l9_1004=float3(0.0);
l9_1004=l9_1002;
float3 l9_1005=float3(0.0);
l9_1005=l9_1004*float3(l9_992);
float3 l9_1006=float3(0.0);
l9_1006=(l9_997+l9_1001)+l9_1005;
l9_671=l9_1006;
l9_674=l9_671;
}
else
{
float4 l9_1007=float4(0.0);
float4 l9_1008=(*sc_set0.UserUniforms).baseColor;
l9_1007=l9_1008;
float4 l9_1009=float4(0.0);
l9_1009=l9_1007;
float4 l9_1010=float4(0.0);
float4 l9_1011=float4(0.0);
float4 l9_1012=(*sc_set0.UserUniforms).Port_Default_N369;
ssGlobals l9_1013=l9_673;
float4 l9_1014;
if ((int(Tweak_N121_tmp)!=0))
{
float2 l9_1015=float2(0.0);
float2 l9_1016=float2(0.0);
float2 l9_1017=float2(0.0);
float2 l9_1018=float2(0.0);
float2 l9_1019=float2(0.0);
float2 l9_1020=float2(0.0);
ssGlobals l9_1021=l9_1013;
float2 l9_1022;
if (NODE_27_DROPLIST_ITEM_tmp==0)
{
float2 l9_1023=float2(0.0);
l9_1023=l9_1021.Surface_UVCoord0;
l9_1016=l9_1023;
l9_1022=l9_1016;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==1)
{
float2 l9_1024=float2(0.0);
l9_1024=l9_1021.Surface_UVCoord1;
l9_1017=l9_1024;
l9_1022=l9_1017;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==2)
{
float2 l9_1025=float2(0.0);
l9_1025=l9_1021.Surface_UVCoord0;
float2 l9_1026=float2(0.0);
float2 l9_1027=float2(0.0);
float2 l9_1028=float2(0.0);
ssGlobals l9_1029=l9_1021;
float2 l9_1030;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1031=float2(0.0);
float2 l9_1032=float2(0.0);
float2 l9_1033=float2(0.0);
float2 l9_1034=float2(0.0);
float2 l9_1035=float2(0.0);
ssGlobals l9_1036=l9_1029;
float2 l9_1037;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1038=float2(0.0);
l9_1038=l9_1036.Surface_UVCoord0;
l9_1032=l9_1038;
l9_1037=l9_1032;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1039=float2(0.0);
l9_1039=l9_1036.Surface_UVCoord1;
l9_1033=l9_1039;
l9_1037=l9_1033;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1040=float2(0.0);
l9_1040=l9_1036.gScreenCoord;
l9_1034=l9_1040;
l9_1037=l9_1034;
}
else
{
float2 l9_1041=float2(0.0);
l9_1041=l9_1036.Surface_UVCoord0;
l9_1035=l9_1041;
l9_1037=l9_1035;
}
}
}
l9_1031=l9_1037;
float2 l9_1042=float2(0.0);
float2 l9_1043=(*sc_set0.UserUniforms).uv2Scale;
l9_1042=l9_1043;
float2 l9_1044=float2(0.0);
l9_1044=l9_1042;
float2 l9_1045=float2(0.0);
float2 l9_1046=(*sc_set0.UserUniforms).uv2Offset;
l9_1045=l9_1046;
float2 l9_1047=float2(0.0);
l9_1047=l9_1045;
float2 l9_1048=float2(0.0);
l9_1048=(l9_1031*l9_1044)+l9_1047;
float2 l9_1049=float2(0.0);
l9_1049=l9_1048+(l9_1047*(l9_1029.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1027=l9_1049;
l9_1030=l9_1027;
}
else
{
float2 l9_1050=float2(0.0);
float2 l9_1051=float2(0.0);
float2 l9_1052=float2(0.0);
float2 l9_1053=float2(0.0);
float2 l9_1054=float2(0.0);
ssGlobals l9_1055=l9_1029;
float2 l9_1056;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1057=float2(0.0);
l9_1057=l9_1055.Surface_UVCoord0;
l9_1051=l9_1057;
l9_1056=l9_1051;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1058=float2(0.0);
l9_1058=l9_1055.Surface_UVCoord1;
l9_1052=l9_1058;
l9_1056=l9_1052;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1059=float2(0.0);
l9_1059=l9_1055.gScreenCoord;
l9_1053=l9_1059;
l9_1056=l9_1053;
}
else
{
float2 l9_1060=float2(0.0);
l9_1060=l9_1055.Surface_UVCoord0;
l9_1054=l9_1060;
l9_1056=l9_1054;
}
}
}
l9_1050=l9_1056;
float2 l9_1061=float2(0.0);
float2 l9_1062=(*sc_set0.UserUniforms).uv2Scale;
l9_1061=l9_1062;
float2 l9_1063=float2(0.0);
l9_1063=l9_1061;
float2 l9_1064=float2(0.0);
float2 l9_1065=(*sc_set0.UserUniforms).uv2Offset;
l9_1064=l9_1065;
float2 l9_1066=float2(0.0);
l9_1066=l9_1064;
float2 l9_1067=float2(0.0);
l9_1067=(l9_1050*l9_1063)+l9_1066;
l9_1028=l9_1067;
l9_1030=l9_1028;
}
l9_1026=l9_1030;
float l9_1068=0.0;
float l9_1069;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1069=1.001;
}
else
{
l9_1069=0.001;
}
l9_1069-=0.001;
l9_1068=l9_1069;
float l9_1070=0.0;
l9_1070=l9_1068;
float2 l9_1071=float2(0.0);
l9_1071=mix(l9_1025,l9_1026,float2(l9_1070));
float2 l9_1072=float2(0.0);
l9_1072=l9_1071;
float2 l9_1073=float2(0.0);
l9_1073=l9_1072;
l9_1018=l9_1073;
l9_1022=l9_1018;
}
else
{
if (NODE_27_DROPLIST_ITEM_tmp==3)
{
float2 l9_1074=float2(0.0);
l9_1074=l9_1021.Surface_UVCoord0;
float2 l9_1075=float2(0.0);
float2 l9_1076=float2(0.0);
float2 l9_1077=float2(0.0);
ssGlobals l9_1078=l9_1021;
float2 l9_1079;
if ((int(uv3EnableAnimation_tmp)!=0))
{
float2 l9_1080=float2(0.0);
float2 l9_1081=float2(0.0);
float2 l9_1082=float2(0.0);
float2 l9_1083=float2(0.0);
float2 l9_1084=float2(0.0);
float2 l9_1085=float2(0.0);
ssGlobals l9_1086=l9_1078;
float2 l9_1087;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1088=float2(0.0);
l9_1088=l9_1086.Surface_UVCoord0;
l9_1081=l9_1088;
l9_1087=l9_1081;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1089=float2(0.0);
l9_1089=l9_1086.Surface_UVCoord1;
l9_1082=l9_1089;
l9_1087=l9_1082;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1090=float2(0.0);
l9_1090=l9_1086.gScreenCoord;
l9_1083=l9_1090;
l9_1087=l9_1083;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1091=float2(0.0);
l9_1091=l9_1086.Surface_UVCoord0;
float2 l9_1092=float2(0.0);
float2 l9_1093=float2(0.0);
float2 l9_1094=float2(0.0);
ssGlobals l9_1095=l9_1086;
float2 l9_1096;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1097=float2(0.0);
float2 l9_1098=float2(0.0);
float2 l9_1099=float2(0.0);
float2 l9_1100=float2(0.0);
float2 l9_1101=float2(0.0);
ssGlobals l9_1102=l9_1095;
float2 l9_1103;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1104=float2(0.0);
l9_1104=l9_1102.Surface_UVCoord0;
l9_1098=l9_1104;
l9_1103=l9_1098;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1105=float2(0.0);
l9_1105=l9_1102.Surface_UVCoord1;
l9_1099=l9_1105;
l9_1103=l9_1099;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1106=float2(0.0);
l9_1106=l9_1102.gScreenCoord;
l9_1100=l9_1106;
l9_1103=l9_1100;
}
else
{
float2 l9_1107=float2(0.0);
l9_1107=l9_1102.Surface_UVCoord0;
l9_1101=l9_1107;
l9_1103=l9_1101;
}
}
}
l9_1097=l9_1103;
float2 l9_1108=float2(0.0);
float2 l9_1109=(*sc_set0.UserUniforms).uv2Scale;
l9_1108=l9_1109;
float2 l9_1110=float2(0.0);
l9_1110=l9_1108;
float2 l9_1111=float2(0.0);
float2 l9_1112=(*sc_set0.UserUniforms).uv2Offset;
l9_1111=l9_1112;
float2 l9_1113=float2(0.0);
l9_1113=l9_1111;
float2 l9_1114=float2(0.0);
l9_1114=(l9_1097*l9_1110)+l9_1113;
float2 l9_1115=float2(0.0);
l9_1115=l9_1114+(l9_1113*(l9_1095.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1093=l9_1115;
l9_1096=l9_1093;
}
else
{
float2 l9_1116=float2(0.0);
float2 l9_1117=float2(0.0);
float2 l9_1118=float2(0.0);
float2 l9_1119=float2(0.0);
float2 l9_1120=float2(0.0);
ssGlobals l9_1121=l9_1095;
float2 l9_1122;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1123=float2(0.0);
l9_1123=l9_1121.Surface_UVCoord0;
l9_1117=l9_1123;
l9_1122=l9_1117;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1124=float2(0.0);
l9_1124=l9_1121.Surface_UVCoord1;
l9_1118=l9_1124;
l9_1122=l9_1118;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1125=float2(0.0);
l9_1125=l9_1121.gScreenCoord;
l9_1119=l9_1125;
l9_1122=l9_1119;
}
else
{
float2 l9_1126=float2(0.0);
l9_1126=l9_1121.Surface_UVCoord0;
l9_1120=l9_1126;
l9_1122=l9_1120;
}
}
}
l9_1116=l9_1122;
float2 l9_1127=float2(0.0);
float2 l9_1128=(*sc_set0.UserUniforms).uv2Scale;
l9_1127=l9_1128;
float2 l9_1129=float2(0.0);
l9_1129=l9_1127;
float2 l9_1130=float2(0.0);
float2 l9_1131=(*sc_set0.UserUniforms).uv2Offset;
l9_1130=l9_1131;
float2 l9_1132=float2(0.0);
l9_1132=l9_1130;
float2 l9_1133=float2(0.0);
l9_1133=(l9_1116*l9_1129)+l9_1132;
l9_1094=l9_1133;
l9_1096=l9_1094;
}
l9_1092=l9_1096;
float l9_1134=0.0;
float l9_1135;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1135=1.001;
}
else
{
l9_1135=0.001;
}
l9_1135-=0.001;
l9_1134=l9_1135;
float l9_1136=0.0;
l9_1136=l9_1134;
float2 l9_1137=float2(0.0);
l9_1137=mix(l9_1091,l9_1092,float2(l9_1136));
float2 l9_1138=float2(0.0);
l9_1138=l9_1137;
float2 l9_1139=float2(0.0);
l9_1139=l9_1138;
l9_1084=l9_1139;
l9_1087=l9_1084;
}
else
{
float2 l9_1140=float2(0.0);
l9_1140=l9_1086.Surface_UVCoord0;
l9_1085=l9_1140;
l9_1087=l9_1085;
}
}
}
}
l9_1080=l9_1087;
float2 l9_1141=float2(0.0);
float2 l9_1142=(*sc_set0.UserUniforms).uv3Scale;
l9_1141=l9_1142;
float2 l9_1143=float2(0.0);
l9_1143=l9_1141;
float2 l9_1144=float2(0.0);
float2 l9_1145=(*sc_set0.UserUniforms).uv3Offset;
l9_1144=l9_1145;
float2 l9_1146=float2(0.0);
l9_1146=l9_1144;
float2 l9_1147=float2(0.0);
l9_1147=(l9_1080*l9_1143)+l9_1146;
float2 l9_1148=float2(0.0);
l9_1148=l9_1147+(l9_1146*(l9_1078.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N063));
l9_1076=l9_1148;
l9_1079=l9_1076;
}
else
{
float2 l9_1149=float2(0.0);
float2 l9_1150=float2(0.0);
float2 l9_1151=float2(0.0);
float2 l9_1152=float2(0.0);
float2 l9_1153=float2(0.0);
float2 l9_1154=float2(0.0);
ssGlobals l9_1155=l9_1078;
float2 l9_1156;
if (NODE_49_DROPLIST_ITEM_tmp==0)
{
float2 l9_1157=float2(0.0);
l9_1157=l9_1155.Surface_UVCoord0;
l9_1150=l9_1157;
l9_1156=l9_1150;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==1)
{
float2 l9_1158=float2(0.0);
l9_1158=l9_1155.Surface_UVCoord1;
l9_1151=l9_1158;
l9_1156=l9_1151;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==2)
{
float2 l9_1159=float2(0.0);
l9_1159=l9_1155.gScreenCoord;
l9_1152=l9_1159;
l9_1156=l9_1152;
}
else
{
if (NODE_49_DROPLIST_ITEM_tmp==3)
{
float2 l9_1160=float2(0.0);
l9_1160=l9_1155.Surface_UVCoord0;
float2 l9_1161=float2(0.0);
float2 l9_1162=float2(0.0);
float2 l9_1163=float2(0.0);
ssGlobals l9_1164=l9_1155;
float2 l9_1165;
if ((int(uv2EnableAnimation_tmp)!=0))
{
float2 l9_1166=float2(0.0);
float2 l9_1167=float2(0.0);
float2 l9_1168=float2(0.0);
float2 l9_1169=float2(0.0);
float2 l9_1170=float2(0.0);
ssGlobals l9_1171=l9_1164;
float2 l9_1172;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1173=float2(0.0);
l9_1173=l9_1171.Surface_UVCoord0;
l9_1167=l9_1173;
l9_1172=l9_1167;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1174=float2(0.0);
l9_1174=l9_1171.Surface_UVCoord1;
l9_1168=l9_1174;
l9_1172=l9_1168;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1175=float2(0.0);
l9_1175=l9_1171.gScreenCoord;
l9_1169=l9_1175;
l9_1172=l9_1169;
}
else
{
float2 l9_1176=float2(0.0);
l9_1176=l9_1171.Surface_UVCoord0;
l9_1170=l9_1176;
l9_1172=l9_1170;
}
}
}
l9_1166=l9_1172;
float2 l9_1177=float2(0.0);
float2 l9_1178=(*sc_set0.UserUniforms).uv2Scale;
l9_1177=l9_1178;
float2 l9_1179=float2(0.0);
l9_1179=l9_1177;
float2 l9_1180=float2(0.0);
float2 l9_1181=(*sc_set0.UserUniforms).uv2Offset;
l9_1180=l9_1181;
float2 l9_1182=float2(0.0);
l9_1182=l9_1180;
float2 l9_1183=float2(0.0);
l9_1183=(l9_1166*l9_1179)+l9_1182;
float2 l9_1184=float2(0.0);
l9_1184=l9_1183+(l9_1182*(l9_1164.gTimeElapsed*(*sc_set0.UserUniforms).Port_Speed_N022));
l9_1162=l9_1184;
l9_1165=l9_1162;
}
else
{
float2 l9_1185=float2(0.0);
float2 l9_1186=float2(0.0);
float2 l9_1187=float2(0.0);
float2 l9_1188=float2(0.0);
float2 l9_1189=float2(0.0);
ssGlobals l9_1190=l9_1164;
float2 l9_1191;
if (NODE_13_DROPLIST_ITEM_tmp==0)
{
float2 l9_1192=float2(0.0);
l9_1192=l9_1190.Surface_UVCoord0;
l9_1186=l9_1192;
l9_1191=l9_1186;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==1)
{
float2 l9_1193=float2(0.0);
l9_1193=l9_1190.Surface_UVCoord1;
l9_1187=l9_1193;
l9_1191=l9_1187;
}
else
{
if (NODE_13_DROPLIST_ITEM_tmp==2)
{
float2 l9_1194=float2(0.0);
l9_1194=l9_1190.gScreenCoord;
l9_1188=l9_1194;
l9_1191=l9_1188;
}
else
{
float2 l9_1195=float2(0.0);
l9_1195=l9_1190.Surface_UVCoord0;
l9_1189=l9_1195;
l9_1191=l9_1189;
}
}
}
l9_1185=l9_1191;
float2 l9_1196=float2(0.0);
float2 l9_1197=(*sc_set0.UserUniforms).uv2Scale;
l9_1196=l9_1197;
float2 l9_1198=float2(0.0);
l9_1198=l9_1196;
float2 l9_1199=float2(0.0);
float2 l9_1200=(*sc_set0.UserUniforms).uv2Offset;
l9_1199=l9_1200;
float2 l9_1201=float2(0.0);
l9_1201=l9_1199;
float2 l9_1202=float2(0.0);
l9_1202=(l9_1185*l9_1198)+l9_1201;
l9_1163=l9_1202;
l9_1165=l9_1163;
}
l9_1161=l9_1165;
float l9_1203=0.0;
float l9_1204;
if ((int(Tweak_N67_tmp)!=0))
{
l9_1204=1.001;
}
else
{
l9_1204=0.001;
}
l9_1204-=0.001;
l9_1203=l9_1204;
float l9_1205=0.0;
l9_1205=l9_1203;
float2 l9_1206=float2(0.0);
l9_1206=mix(l9_1160,l9_1161,float2(l9_1205));
float2 l9_1207=float2(0.0);
l9_1207=l9_1206;
float2 l9_1208=float2(0.0);
l9_1208=l9_1207;
l9_1153=l9_1208;
l9_1156=l9_1153;
}
else
{
float2 l9_1209=float2(0.0);
l9_1209=l9_1155.Surface_UVCoord0;
l9_1154=l9_1209;
l9_1156=l9_1154;
}
}
}
}
l9_1149=l9_1156;
float2 l9_1210=float2(0.0);
float2 l9_1211=(*sc_set0.UserUniforms).uv3Scale;
l9_1210=l9_1211;
float2 l9_1212=float2(0.0);
l9_1212=l9_1210;
float2 l9_1213=float2(0.0);
float2 l9_1214=(*sc_set0.UserUniforms).uv3Offset;
l9_1213=l9_1214;
float2 l9_1215=float2(0.0);
l9_1215=l9_1213;
float2 l9_1216=float2(0.0);
l9_1216=(l9_1149*l9_1212)+l9_1215;
l9_1077=l9_1216;
l9_1079=l9_1077;
}
l9_1075=l9_1079;
float l9_1217=0.0;
float l9_1218;
if ((int(Tweak_N11_tmp)!=0))
{
l9_1218=1.001;
}
else
{
l9_1218=0.001;
}
l9_1218-=0.001;
l9_1217=l9_1218;
float l9_1219=0.0;
l9_1219=l9_1217;
float2 l9_1220=float2(0.0);
l9_1220=mix(l9_1074,l9_1075,float2(l9_1219));
float2 l9_1221=float2(0.0);
l9_1221=l9_1220;
float2 l9_1222=float2(0.0);
l9_1222=l9_1221;
l9_1019=l9_1222;
l9_1022=l9_1019;
}
else
{
float2 l9_1223=float2(0.0);
l9_1223=l9_1021.Surface_UVCoord0;
l9_1020=l9_1223;
l9_1022=l9_1020;
}
}
}
}
l9_1015=l9_1022;
float4 l9_1224=float4(0.0);
int l9_1225=0;
if ((int(baseTexHasSwappedViews_tmp)!=0))
{
int l9_1226=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1226=0;
}
else
{
l9_1226=in.varStereoViewID;
}
int l9_1227=l9_1226;
l9_1225=1-l9_1227;
}
else
{
int l9_1228=0;
if (sc_StereoRenderingMode_tmp==0)
{
l9_1228=0;
}
else
{
l9_1228=in.varStereoViewID;
}
int l9_1229=l9_1228;
l9_1225=l9_1229;
}
int l9_1230=l9_1225;
int l9_1231=baseTexLayout_tmp;
int l9_1232=l9_1230;
float2 l9_1233=l9_1015;
bool l9_1234=(int(SC_USE_UV_TRANSFORM_baseTex_tmp)!=0);
float3x3 l9_1235=(*sc_set0.UserUniforms).baseTexTransform;
int2 l9_1236=int2(SC_SOFTWARE_WRAP_MODE_U_baseTex_tmp,SC_SOFTWARE_WRAP_MODE_V_baseTex_tmp);
bool l9_1237=(int(SC_USE_UV_MIN_MAX_baseTex_tmp)!=0);
float4 l9_1238=(*sc_set0.UserUniforms).baseTexUvMinMax;
bool l9_1239=(int(SC_USE_CLAMP_TO_BORDER_baseTex_tmp)!=0);
float4 l9_1240=(*sc_set0.UserUniforms).baseTexBorderColor;
float l9_1241=0.0;
bool l9_1242=l9_1239&&(!l9_1237);
float l9_1243=1.0;
float l9_1244=l9_1233.x;
int l9_1245=l9_1236.x;
if (l9_1245==1)
{
l9_1244=fract(l9_1244);
}
else
{
if (l9_1245==2)
{
float l9_1246=fract(l9_1244);
float l9_1247=l9_1244-l9_1246;
float l9_1248=step(0.25,fract(l9_1247*0.5));
l9_1244=mix(l9_1246,1.0-l9_1246,fast::clamp(l9_1248,0.0,1.0));
}
}
l9_1233.x=l9_1244;
float l9_1249=l9_1233.y;
int l9_1250=l9_1236.y;
if (l9_1250==1)
{
l9_1249=fract(l9_1249);
}
else
{
if (l9_1250==2)
{
float l9_1251=fract(l9_1249);
float l9_1252=l9_1249-l9_1251;
float l9_1253=step(0.25,fract(l9_1252*0.5));
l9_1249=mix(l9_1251,1.0-l9_1251,fast::clamp(l9_1253,0.0,1.0));
}
}
l9_1233.y=l9_1249;
if (l9_1237)
{
bool l9_1254=l9_1239;
bool l9_1255;
if (l9_1254)
{
l9_1255=l9_1236.x==3;
}
else
{
l9_1255=l9_1254;
}
float l9_1256=l9_1233.x;
float l9_1257=l9_1238.x;
float l9_1258=l9_1238.z;
bool l9_1259=l9_1255;
float l9_1260=l9_1243;
float l9_1261=fast::clamp(l9_1256,l9_1257,l9_1258);
float l9_1262=step(abs(l9_1256-l9_1261),9.9999997e-06);
l9_1260*=(l9_1262+((1.0-float(l9_1259))*(1.0-l9_1262)));
l9_1256=l9_1261;
l9_1233.x=l9_1256;
l9_1243=l9_1260;
bool l9_1263=l9_1239;
bool l9_1264;
if (l9_1263)
{
l9_1264=l9_1236.y==3;
}
else
{
l9_1264=l9_1263;
}
float l9_1265=l9_1233.y;
float l9_1266=l9_1238.y;
float l9_1267=l9_1238.w;
bool l9_1268=l9_1264;
float l9_1269=l9_1243;
float l9_1270=fast::clamp(l9_1265,l9_1266,l9_1267);
float l9_1271=step(abs(l9_1265-l9_1270),9.9999997e-06);
l9_1269*=(l9_1271+((1.0-float(l9_1268))*(1.0-l9_1271)));
l9_1265=l9_1270;
l9_1233.y=l9_1265;
l9_1243=l9_1269;
}
float2 l9_1272=l9_1233;
bool l9_1273=l9_1234;
float3x3 l9_1274=l9_1235;
if (l9_1273)
{
l9_1272=float2((l9_1274*float3(l9_1272,1.0)).xy);
}
float2 l9_1275=l9_1272;
float2 l9_1276=l9_1275;
float2 l9_1277=l9_1276;
l9_1233=l9_1277;
float l9_1278=l9_1233.x;
int l9_1279=l9_1236.x;
bool l9_1280=l9_1242;
float l9_1281=l9_1243;
if ((l9_1279==0)||(l9_1279==3))
{
float l9_1282=l9_1278;
float l9_1283=0.0;
float l9_1284=1.0;
bool l9_1285=l9_1280;
float l9_1286=l9_1281;
float l9_1287=fast::clamp(l9_1282,l9_1283,l9_1284);
float l9_1288=step(abs(l9_1282-l9_1287),9.9999997e-06);
l9_1286*=(l9_1288+((1.0-float(l9_1285))*(1.0-l9_1288)));
l9_1282=l9_1287;
l9_1278=l9_1282;
l9_1281=l9_1286;
}
l9_1233.x=l9_1278;
l9_1243=l9_1281;
float l9_1289=l9_1233.y;
int l9_1290=l9_1236.y;
bool l9_1291=l9_1242;
float l9_1292=l9_1243;
if ((l9_1290==0)||(l9_1290==3))
{
float l9_1293=l9_1289;
float l9_1294=0.0;
float l9_1295=1.0;
bool l9_1296=l9_1291;
float l9_1297=l9_1292;
float l9_1298=fast::clamp(l9_1293,l9_1294,l9_1295);
float l9_1299=step(abs(l9_1293-l9_1298),9.9999997e-06);
l9_1297*=(l9_1299+((1.0-float(l9_1296))*(1.0-l9_1299)));
l9_1293=l9_1298;
l9_1289=l9_1293;
l9_1292=l9_1297;
}
l9_1233.y=l9_1289;
l9_1243=l9_1292;
float2 l9_1300=l9_1233;
int l9_1301=l9_1231;
int l9_1302=l9_1232;
float l9_1303=l9_1241;
float2 l9_1304=l9_1300;
int l9_1305=l9_1301;
int l9_1306=l9_1302;
float3 l9_1307=float3(0.0);
if (l9_1305==0)
{
l9_1307=float3(l9_1304,0.0);
}
else
{
if (l9_1305==1)
{
l9_1307=float3(l9_1304.x,(l9_1304.y*0.5)+(0.5-(float(l9_1306)*0.5)),0.0);
}
else
{
l9_1307=float3(l9_1304,float(l9_1306));
}
}
float3 l9_1308=l9_1307;
float3 l9_1309=l9_1308;
float2 l9_1310=l9_1309.xy;
float l9_1311=l9_1303;
float4 l9_1312=sc_set0.baseTex.sample(sc_set0.baseTexSmpSC,l9_1310,bias(l9_1311));
float4 l9_1313=l9_1312;
float4 l9_1314=l9_1313;
if (l9_1239)
{
l9_1314=mix(l9_1240,l9_1314,float4(l9_1243));
}
float4 l9_1315=l9_1314;
l9_1224=l9_1315;
l9_1011=l9_1224;
l9_1014=l9_1011;
}
else
{
l9_1014=l9_1012;
}
l9_1010=l9_1014;
float4 l9_1316=float4(0.0);
l9_1316=l9_1009*l9_1010;
float4 l9_1317=float4(0.0);
l9_1317=l9_1316;
float4 l9_1318=float4(0.0);
l9_1318=l9_1317;
l9_672=l9_1318.xyz;
l9_674=l9_672;
}
l9_670=l9_674;
float3 l9_1319=float3(0.0);
l9_1319=l9_670;
float3 l9_1320=float3(0.0);
l9_1320=l9_1319;
float4 l9_1321=float4(0.0);
l9_1321=float4(l9_1320.x,l9_1320.y,l9_1320.z,l9_1321.w);
l9_1321.w=(*sc_set0.UserUniforms).Port_Value2_N073;
param_1=l9_1321;
param_2=param_1;
}
Result_N363=param_2;
float4 Export_N364=float4(0.0);
Export_N364=Result_N363;
float2 UVCoord_N1=float2(0.0);
UVCoord_N1=Globals.Surface_UVCoord0;
float Output_N78=0.0;
Output_N78=UVCoord_N1.y;
float Output_N79=0.0;
float param_4=(*sc_set0.UserUniforms).progress_value;
Output_N79=param_4;
float Output_N97=0.0;
Output_N97=step(Output_N78,Output_N79);
float4 Output_N104=float4(0.0);
Output_N104=Export_N364*float4(Output_N97);
float Output_N2=0.0;
Output_N2=Output_N104.w;
float param_5=Output_N2;
param_5=fast::clamp(param_5,0.0,1.0);
float l9_1322=param_5;
if ((int(sc_BlendMode_AlphaTest_tmp)!=0))
{
if (l9_1322<(*sc_set0.UserUniforms).alphaTestThreshold)
{
discard_fragment();
}
}
if ((int(ENABLE_STIPPLE_PATTERN_TEST_tmp)!=0))
{
float4 l9_1323=gl_FragCoord;
float2 l9_1324=floor(mod(l9_1323.xy,float2(4.0)));
float l9_1325=(mod(dot(l9_1324,float2(4.0,1.0))*9.0,16.0)+1.0)/17.0;
if (l9_1322<l9_1325)
{
discard_fragment();
}
}
return out;
}
} // RECEIVER MODE SHADER
