using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HeartFX : MonoBehaviour {

	[Range(1f, 2.5f)]
	public float speed;
	public float amplitude;
	[Range(0, 1f)]
	public float maxDist;

	public Vector3[] start, end;

	bool switchDir = true;

	private void Start() {
		start = new Vector3[20];
		end = new Vector3[20];
		
		int i = 0;
		Vector3 centerPos = Vector3.zero;
		foreach (Transform child in transform) {
			if (i == 0) {
				centerPos = child.position;
				i++;
				continue;
			}
			Vector3 heading = child.position - centerPos;
			float distance = heading.magnitude;
			Vector3 direction = heading / distance;

			end[i - 1] = child.position +  direction.normalized * (maxDist + Random.Range(.1f,.3f));
			start[i - 1] = child.position + direction.normalized * .1f;
			child.transform.localScale *= .75f;
			//child.position = end[i-1];
			i++;
		}
	}

	private void Update() {
		int i = 0;
		foreach (Transform child in transform) {
			if (i == 0) { i++; continue; }
			child.position = Vector3.Lerp(start[i - 1], end[i - 1], Mathf.PingPong(Time.time, 1/speed));
			i++;
		}
	}
}
