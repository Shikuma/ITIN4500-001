﻿Shader "Holistic/Cutoff" {
    Properties {
        _RimColor("Rim Color", Color) = (0, 0.5, 0.5, 0.0)
		_RimPower("Rim Power", Range(.5,8)) = 3.0
    }
    SubShader {
      CGPROGRAM
        #pragma surface surf Lambert

        struct Input {
            float3 viewDir;
			float3 worldPos;
			float2 uv_myTex;
        };

		float4 _RimColor;
		float _RimPower;
        
        void surf (Input IN, inout SurfaceOutput o) {
            half rim = 1-saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission =  frac(IN.worldPos.y*5) >0.4 ? float3(0,1,0)*rim: float3(1,0,0)*rim;
        }
      
      ENDCG
    }
    Fallback "Diffuse"
  }