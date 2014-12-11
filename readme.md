# A Hubot script for querying the Irish Rail API

### Install
add `hubot-irish-rail` to your `package.json`
```
"hubot-irish-rail": "~1.0.0"
```
Add `hubot-irish-rail` to your `external_scripts.json` and run `npm install`

### Commands

```
hubot list the dart stations
=> Malahide, Portmarnock, Clongriffin, Sutton, Bayside, Howth Junction, Howth, Kilbarrack, Raheny, Harmonstown, Killester, Clontarf Road, Dublin Connolly, Tara Street, Dublin Pearse, Grand Canal Dock, Lansdowne Road, Sandymount, Sydney Parade, Booterstown, Blackrock, Seapoint, Salthill, Dun Laoghaire, Sandycove, Glenageary, Dalkey, Killiney, Shankill, Bray, Greystones, Kilcoole,
```

```
hubot when is the next northbound dart due at bray
=> The next northbound dart due at bray is the Howth service, which is due in 2 minutes
```

```
hubot when is the next southbound dart due at Tara Street
=> The next southbound dart due at Tara Street is the Bray service, which is due in 2 minutes
```
