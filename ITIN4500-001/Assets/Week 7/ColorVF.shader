Shader "Holistic/ColorVF"
{
	SubShader
	{
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
				float4 color: COLOR;
			};
			
			//X and Z are in world space
			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				
				//o.color.r = (v.vertex.x+10)/10;
				//o.color.g = (v.vertex.z+10)/20;
				
				//This value being returned gets used in the below frag func (v2f i)
				return o;
			}
			//Rasterization here?
			//X and Y are positions in screen space, not world space
			fixed4 frag (v2f i) : SV_Target
			{
				fixed4 col;
				col.r = i.vertex.x/1000;
				col.g = i.vertex.y/1000;
				
				return col;
			}
			ENDCG
		}
	}
}
