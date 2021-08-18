# ColdBox Elastic APM Module

This module adds support for setting the ColdBox event name as the transaction name in Elastic APM.  This module will only work if your server has the Elastic APM Java agent installed.  If those classes are note loaded, the module will do nothing. 

This module will listen to the `preProcess` interceptiion point and set the transaction name to the current ColdBox event.

You can read more about how Elastic APM works here:
https://www.elastic.co/apm/

## Installation

Install the module like so:

```bash
install cbElasticAPM
```

It will kick in automatically.

## Compatiblity

This module currenlty only works on Lucee because Adobe still doesn't provide a way to dynamically load jars and I don't want to use javaloader.  
If you need this to work on Adobe, let me know and I'll think about it :) 