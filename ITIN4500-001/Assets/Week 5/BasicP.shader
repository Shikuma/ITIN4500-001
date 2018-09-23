Shader "Holistic/BlinnLighting" {
Properties{
		_Colour("Primary Color", Color) = (1,1,1,1)
		//_SpecColor is included in the Unity Shader library 
		//and does not need to be defined in the CG code
		_SpecColor("Secondary Color", Color) = (1,1,1,1)
		_Spec("Specular", Range(0,1)) = 0.5
		_Gloss("Gloss", Range(0,1)) = 0.5
	}
	SubShader{
		Tags{
			"Queue" = "Geometry"
		}
		CGPROGRAM
		#pragma surface surf BlinnPhong

		float4 _Colour;
		half _Spec;
		fixed _Gloss;

		struct Input {
			float2 uv_MainTex;
		};

		void surf(Input IN, inout SurfaceOutput o) {
			o.Albedo = _Colour.rgb;
			o.Specular = _Spec;
			o.Gloss = _Gloss;
		}
		ENDCG
	}
	FallBack "Diffuse"

}
