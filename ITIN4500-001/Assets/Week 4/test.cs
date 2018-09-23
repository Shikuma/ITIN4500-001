using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class test : MonoBehaviour {

	// Use this for initialization
	void Start () {
		int x = 1;
		int y = x > .5 ? 1 
			: x < .2 ? 3 
			: 1;
	}
	
	// Update is called once per frame
	void Update () {
		
	}
}
