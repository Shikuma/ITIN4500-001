//ShaderLab language
Shader "Holistic/HelloShader"{
	//First define properties here
	Properties {
	     _myColour ("Example Color", Color) = (1,1,1,1)
		 _emissionColor("Example Emission", Color) = (1,1,1,1)
		 _myNormal("Normal Color", Color) = (1,1,1,1)
	}
	
	
	SubShader {
		//CG Start tag
		CGPROGRAM
			//compile a surface shader named "surf" 
			#pragma surface surf Lambert

			//Defined input data
			struct Input {
				float2 uvMainTex;
			};

			//Refers to the property above, creating variables locally to the CG wrapper
			fixed4 _myColour;
			fixed4 _emissionColor;
			fixed4 _myNormal;
			
			//output data
			void surf (Input IN, inout SurfaceOutput o){
				//Albedo is a diffuse color
			    o.Albedo = _myColour.rgb;
				//Emission emits light, combined with the above albedo
				o.Emission = _emissionColor.rgb;

				o.Normal = _myNormal.rgb;
			}
		//CG End tag
		ENDCG
	}
	//Fallback to a standard diffuse if the machine is unable to run the above code
	FallBack "Diffuse"
}