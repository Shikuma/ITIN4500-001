Shader "Custom/Blend" {
	Properties {
		_MainTex ("Texture", 2D) = "black" {}
    }
    SubShader {
		Tags{"Queue" = "Transparent"}
		//1:1 blend by adding the 2 colors being passed to the frame buffer
		//Blend One One
			
		//the color already in the frame buffer will replace any transparency being passed
		//Traditional blend for transparency
		//Blend SrcAlpha OneMinusSrcAlpha
			
		//(shader output * frame buffer) + (frame buffer * zero)
		//Soft additive blend
		Blend DstColor Zero
		
		Pass {			
			SetTexture [_MainTex] {combine texture }
		}
	}
}
