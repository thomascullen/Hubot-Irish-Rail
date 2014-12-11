# A Hubot script for querying the Irish Rail API

### Install
Add the following dependencies to your pacakage.json
```
"xml2js" : "^0.4.4"
```
Put `irish_rail.coffee` into your scripts folder in hubot.

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
