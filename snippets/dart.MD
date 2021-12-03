# VSCode User Snippets

User snippets for fast development.

```json
{
	"RRSizedBox": {
		"prefix": ["rrs",],
		"body": ["const SizedBox(height: $1),"],
		"description": "A default sized box used between widgets."
	},
	"RRPostFirebase":{
		"prefix": "rrp",
		"body": "await db.child('$1').update(<String, dynamic>{});",
		"description": "Basic update to firebase"
	},
	"RRQueryFirebase":{
		"prefix": "rrq",
		"body": "await db.child('$1');",
		"description": "Basic update to firebase"
	},
	"RRReportCrash":{
		"prefix": "rrc",
		"body": "Report.crash(title: '$1', error: e.toString());",
		"description": "Reports the crash."
	}  
}
```
