Shader "Holistic/w5_Challenge1" {
Properties{
		_Color("Color", Color) = (1,1,1,1)
		_MetallicTex ("Metallic (R)", 2D) = "white" {}
		_Metallic("Metallic", Range(0.0, 2.0)) = 0.0
		_EmissionValue("Emission", Range(0,1)) = .25
	}
	SubShader{
		Tags{
			"Queue" = "Geometry"
		}
		CGPROGRAM
		#pragma surface surf Standard

		sampler2D _MetallicTex;
		half _Metallic;
		fixed4 _Color;
		half _EmissionValue;

		struct Input {
			float2 uv_MetallicTex;
		};

		void surf(Input IN, inout SurfaceOutputStandard o) {
			o.Albedo = _Color.rgb;
			o.Smoothness = tex2D (_MetallicTex, IN.uv_MetallicTex).r;
			o.Metallic = _Metallic;
			o.Emission = _Metallic * _EmissionValue;
		}
		ENDCG
	}
	FallBack "Diffuse"

}

