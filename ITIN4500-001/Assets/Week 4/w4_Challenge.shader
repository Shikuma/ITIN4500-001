Shader "Holistic/w4_Challenge" {
    Properties {
        _RimColor("Rim Color", Color) = (0, 0.5, 0.5, 0.0)
		_StripeColor1("Stripe Color 1", Color) = (1,1,1,1)
		_StripeColor2("Stripe Color 2", Color) = (1,1,1,1)
		_RimPower("Rim Power", Range(.5,8)) = 3.0
		_StripeSize("Stripe Size", Range(1,20)) = 5
		_DiffuseTex("Diffuse Texture", 2D) = "white" {}
    }
    SubShader {
      CGPROGRAM
        #pragma surface surf Lambert

		sampler2D _DiffuseTex;

        struct Input {
            float3 viewDir;
			float3 worldPos;
			float2 uv_DiffuseTex;
        };

		float4 _RimColor;
		float _RimPower;
		float _StripeSize;
		float4 _StripeColor1;
		float4 _StripeColor2;
        
        void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_DiffuseTex, IN.uv_DiffuseTex).rgb;
            half rim = 1-saturate(dot(normalize(IN.viewDir), o.Normal));
			o.Emission =  frac(IN.worldPos.y*_StripeSize) > 0.4 
							? _StripeColor1.rgb*rim 
							: _StripeColor2*rim;
	   }
      
      ENDCG
    }
    Fallback "Diffuse"
  }