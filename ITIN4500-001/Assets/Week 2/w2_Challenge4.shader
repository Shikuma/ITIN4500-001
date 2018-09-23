Shader "Holistic/w2_Challenge3" 
{
    Properties {
        _myTex1 ("Diffuse Texture", 2D) = "white" {}
		_myTex2 ("Emissive Texture", 2D) = "black" {}
    }
    SubShader {

      CGPROGRAM
        #pragma surface surf Lambert
        
        sampler2D _myTex1;
		sampler2D _myTex2;

        struct Input {
            float2 uv_myTex1;
			float2 uv2_myTex2;
        };
        
        void surf (Input IN, inout SurfaceOutput o) {
            o.Albedo.rgb = tex2D(_myTex1, IN.uv_myTex1).rgb;
			o.Emission.rgb = tex2D(_myTex2, IN.uv2_myTex2).rgb;
        }
      
      ENDCG
    }
    Fallback "Diffuse"
  }
