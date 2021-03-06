﻿Shader "Holistic/PackedPractice" {
  
  Properties {
       _myColor ("Example Color", Color) = (1,1,1,1)
  }
  
  SubShader {
    
    CGPROGRAM
      #pragma surface surf Lambert

      struct Input {
        float2 uvMainTex;
      };

      fixed4 _myColor;
      
      void surf (Input IN, inout SurfaceOutput o){
          o.Albedo = _myColor.rgb;
		  //o.albedo = _myColor.rbg;
		  //o.albedo.rg = _myColor.xy;
		  //o.albedo.r = _myColor.r;
      }
    
    ENDCG
  }
  
  FallBack "Diffuse"
}

